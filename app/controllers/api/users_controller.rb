class Api::UsersController < Api::ApiController

  def register
    user = User.new(user_params)
    validate_cf = User.checkConfirmPassword(params)
    if user.valid? && validate_cf == true
      user.save
      render json: generate_user_token(user.id)
    else
      errors = user.errors.to_a || []
      errors.push(validate_cf) if validate_cf.is_a? String
      render json: errors
    end
  end

  def login
    user = User.find_by_user_name(params[:user_name])
    if user && user.user.email_token != nil && user.authenticate(params[:password])
      render json: generate_user_token(user.id)
    else
      render json: {
          msg => "Tài khoản hoặc mật khẩu không đúng"
      }
    end
  end

  def test
    @test = 'ok ne vinh'
    render 'api/users/test'
  end

  def confirm_email

  end

  def reset_password

  end

  private

  def user_params
    params.permit(:user_name, :name, :email, :password, :password_confirmation)
  end

  def generate_user_token(user)
    jwt = Auth.issue(user.id)
    jwt
  end

end