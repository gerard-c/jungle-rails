class User < ActiveRecord::Base

  has_secure_password
  before_validation :downcase_email

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, :uniqueness => true
  validates :password, presence: true
  validates :password_confirmation, presence: true, length { minimum: 4 }

  def downcase_email
    self.email.downcase! if email.present?
  end

end
