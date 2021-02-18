class Api::ApiController < ApplicationController


  def get_current_user
    @current_user = User.find_by_email request.headers["X-Bf-Email"]
  end

end
