class User < ActiveRecord::Base
  has_secure_password
  has_many :ratings
  has_many :locations, through: :ratings, as: :rated_locations

  before_validation :ensure_auth_token

  validates_presence_of :email, :username, :password_digest
  validates_uniqueness_of :email, :username
  validates_length_of :username, within: 4..20, too_long: 'pick a shorter username', too_short: 'pick a longer username'
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  def ensure_auth_token
    if self.auth_token.blank?
      self.auth_token = User.generate_token
    end
  end

  def self.generate_token
    token = SecureRandom.hex
    while User.exists?(auth_token: token)
      token = SecureRandom.hex
    end
    token
  end
end
