class ErrorsController < ApplicationController
  def not_found
    render layout: "home", status: 404
  end

  def internal_server_error
    render layout: "home", status: 500
  end
end
