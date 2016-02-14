class User < ActiveRecord::Base

  has_secure_password

  has_many :questions
  has_many :answers

  # validates :uid, presence: true, uniqueness: true

  def self.sign_in_from_omniauth(auth)
    find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)

  end

  def self.create_user_from_omniauth(auth)
    create(
        provider: auth['provider'],
        uid: auth['uid'],
        name: auth['info']['name'],
        password: "1234"
      )
  end

end
