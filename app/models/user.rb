class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable, :omniauth_providers => [:twitter]

  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy
  attr_accessor :name
  validates :username, length: { minimum: 2 }, presence: true, uniqueness: { message: "should be unique" }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.password_confirmation = user.password
      user.username = auth.info.nickname
      user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    # raise
    super.tap do |user|
      if data = session["devise.twitter_data"]
        user.provider = data["provider"]
        user.uid = data["uid"]
        user.username = data["info"]["nickname"]
        user.email = data["email"] if user.email.blank?
        user.skip_confirmation!
      end
    end
  end

  def password_required?
    super && provider.blank?
  end
end

# devise :omniauthable, :omniauth_providers => [:facebook]
# def self.from_omniauth(auth)
#     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
#       user.provider = auth.provider
#       user.uid = auth.uid
#       user.email = auth.info.email
#       user.password = Devise.friendly_token[0,20]
#     end
#   end
