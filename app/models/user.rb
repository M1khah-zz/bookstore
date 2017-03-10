class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates :firstname, :lastname, presence: true, length: { in: 2..50 }
  has_many :orders, dependent: :destroy
  has_many :ratings, dependent: :destroy

  VALID_EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, uniqueness: { case_sensitive: false },
                      format: { with: VALID_EMAIL_REGEXP },
                      length: { maximum: 63 },
                      presence: true
    validates :password, length: { minimum: 8 },
                         format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}\z/ },
                         confirmation: true,
                         presence: true, if: :password_required?

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
