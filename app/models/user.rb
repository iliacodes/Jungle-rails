class User < ActiveRecord::Base
  has_secure_password

  before_save  :normalize_email

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true, length: {minimum: 2}
  validates :last_name, presence: true, length: {minimum: 2}
  validates :password, confirmation: true, presence: true, length: { minimum: 6}
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by_email(email.strip)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end

  private
  
  def normalize_email
    self.email = email.downcase.strip
  end
end
