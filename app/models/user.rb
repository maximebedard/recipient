class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google]

  has_many :recipes

  def self.find_for_google(access_token, signed_in_resource=nil)
   data = access_token.info
   user = User.where(:email => data['email']).first

   # Create user if not stored in db
   unless user
     user = User.create(
     email: data['email'],
     password: Devise.friendly_token[0,20])
   end

   user
  end
end
