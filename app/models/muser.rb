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
  has_many :active_subscribes, :class_name => "Subscribe", :foreign_key => 'follower_id', dependent: :destroy
  has_many :passive_subscribes, :class_name=> "Subscribe", :foreign_key=> "followed_id", dependent: :destroy
  has_many :following, through: :active_subscribes, source: :followed
  has_many :followers, through: :passive_subscribes, source: :follower
  has_one :rate, :class_name => "Rating", :foreign_key => 'muser_id', dependent: :destroy
  has_one :flagged, :class_name => "FlaggedMusing", :foreign_key => 'muser_id'

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

  # Follows a user.
  def follow(other_muser)
    active_subscribes.create(followed_id: other_muser.id)
  end

  # Unfollows a user.
  def unfollow(other_muser)
    active_subscribes.find_by(followed_id: other_muser.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_muser)
    following.include?(other_muser)
  end

end
