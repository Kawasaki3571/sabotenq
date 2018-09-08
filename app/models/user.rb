class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :answears, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :replies, dependent: :destroy
  validates :user_name, presence: true

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      if auth.provider == "twitter"
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        user_name:  auth.info.name,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
      else
        user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        user_name:  "No name(Please edit.)",
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
      end
    end

    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
