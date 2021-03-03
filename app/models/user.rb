class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
          validates :last_name, format: { with: /\A[^ -~｡-ﾟ]+\z/, message: 'Full-width characters' }
          validates :first_name, format: { with: /\A[^ -~｡-ﾟ]+\z/, message: 'Full-width characters' }
          validates :nickname
        end
        PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
        validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
end
