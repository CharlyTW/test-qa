# ApplicationController is the base for all controllers.
class ApplicationController < ActionController::Base
  allow_browser versions: :modern
end
