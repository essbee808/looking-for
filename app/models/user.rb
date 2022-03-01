class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2, :facebook]

  has_many :created_programs, foreign_key: "creator_id", class_name: "Program"
  has_many :user_programs
  has_many :programs, through: :user_programs

  scope :admin_list, -> { where(admin: true) }
  
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.github"] && session["devise.github_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
      if data = session["devise.google_oauth2"] && session["devise.google_oauth2_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
