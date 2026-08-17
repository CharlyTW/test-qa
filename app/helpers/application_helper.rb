# frozen_string_literal: true

module ApplicationHelper
  def format_message_time(time)
    return "" if time.blank?

    if time.to_date == Date.current
      time.strftime("%H:%M")
    elsif time.year == Date.current.year
      time.strftime("%d/%m %H:%M")
    else
      time.strftime("%d/%m/%Y %H:%M")
    end
  end

  def preview_text(text, length: 80)
    truncate(text.to_s.squish, length: length)
  end

  # Name first; role as secondary label (listings, inbox, thread).
  def account_heading(account, vous: false)
    return "inconnu" if account.blank?

    name = account.full_name
    name = "#{name} (vous)" if vous
    "#{name} · #{account.role_label}"
  end
end
