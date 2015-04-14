# == Schema Information
#
# Table name: musers
#
#  id              :integer          not null, primary key
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  isModerator     :boolean          default("f"), not null
#  name            :string
#

class Muser < ActiveRecord::Base

  has_many :musings, :class_name => "Musing", :foreign_key => 'muser_id', dependent: :destroy 
  has_one :rate, :class_name => "Rating", :foreign_key => 'muser_id', dependent: :destroy 

  has_one :sender, :class_name => "Message", :foreign_key => 'author_id'
  has_one :receiver, :class_name => "Message", :foreign_key => 'recipient_id'
  
  before_save do
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
  validates :name, presence: true
  validates :isModerator, :inclusion => { :in => [true, false] }

  # Returns the hash digest of the given string.
  def Muser.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ?
           BCrypt::Engine::MIN_COST :
           BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
