class User < ApplicationRecord
  has_secure_password(options={validations:false})
  validates :user_name, length: {in: 6..12, message: "Tài khoản bắt buộc có 6 đến 12 ký tự"}
  validates :name, length: {minimum: 4, message: "Họ tên bắt buộc tối thiểu có 4 ký tự"}
  validates :email, format: { with: /\A\w+[\+\.\w-]*@([\w-]+\.)*\w+[\w-]*\.([a-z]{2,4}|\d+)\z/i, message: "Định dạng mail không đúng" }
  validates :password ,format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}\z/i, message: "Mật khẩu có độ dài 8-16, ký tự thường, hoa và ký tự đặc biệt" }
  def self.checkConfirmPassword(user_param)
    msg = "Mật khẩu không trùng khớp!"
    user_param[:password] === user_param[:password_confirmation] || msg
  end
end