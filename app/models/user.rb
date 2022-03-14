class User < ActiveRecord::Base

  has_secure_password
  before_validation :downcase_email

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, :uniqueness => true
  validates :password, presence: true, length: { minimum: 4 }
  validates :password_confirmation, presence: true

  def downcase_email
    self.email.downcase! if email.present?
  end

  def self.authenticate_with_credentials(email, password)
    email.strip!
    email.downcase!

    user = self.find_by_email(email)

    if user.nil?
      return nil
    end

    if user.authenticate(password)
      return user
    end

    return nil
  end

end
