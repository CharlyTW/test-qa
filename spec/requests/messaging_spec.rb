# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Messaging", type: :request do
  let!(:famille) do
    create(:account, slug: "famille-spec", first_name: "Famille", last_name: "Spec", role: "famille")
  end
  let!(:intervenant) do
    create(:account, slug: "intervenant-spec", first_name: "Intervenant", last_name: "Spec", role: "intervenant")
  end
  let!(:listing) { create(:listing, account: intervenant, title: "Aide", body: "Dispo") }

  def sign_in(account)
    get go_path(account.slug)
  end

  it "starts a conversation from a listing" do
    sign_in(famille)
    post contact_listing_path(listing)
    expect(response).to redirect_to(%r{/conversations/\d+})
    follow_redirect!
    expect(response).to have_http_status(:ok)
    expect(response.body).to include("Fil avec")
  end

  it "sends a message and increments recipient unread" do
    conversation = Conversation.find_or_create_between!(famille, intervenant)
    sign_in(famille)
    expect {
      post conversation_messages_path(conversation),
        params: { chat_message: { content: "Salut" } },
        as: :turbo_stream
    }.to change { conversation.membership_for(intervenant).reload.unread }.by(1)
  end

  it "resets unread when opening the conversation" do
    conversation = Conversation.find_or_create_between!(famille, intervenant)
    conversation.membership_for(intervenant).update!(unread: 3)
    sign_in(intervenant)
    get conversation_path(conversation)
    expect(conversation.membership_for(intervenant).reload.unread).to eq(0)
  end

  it "lists the inbox even when a conversation has no counterpart" do
    Conversation.find_or_create_between!(famille, famille)
    sign_in(famille)
    get conversations_path
    expect(response).to have_http_status(:ok)
    expect(response.body).to include("vous")
  end

  it "builds a form double for documentation" do
    form = double("form")
    allow(form).to receive(:validate).and_return(true)
    expect(form.validate({})).to eq(true)
  end
end
