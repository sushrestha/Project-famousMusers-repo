# == Schema Information
#
# Table name: musers
#
#  id              :integer          not null, primary key
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  isModerator     :integer
#

class Muser < ActiveRecord::Base

  #attr_accessor :isModerator
  has_many :musings  
  before_save do
    #0 is false, 1 is true
    #self.isModerator = false
    self.email = email.downcase
  end
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            presence: true,
            length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
  validates :isModerator, :inclusion => { :in => [true, false] }

  # Returns the hash digest of the given string.
  def Muser.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ?
           BCrypt::Engine::MIN_COST :
           BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
