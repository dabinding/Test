class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable,
  # :recoverable
  devise :database_authenticatable, :rememberable,
         :trackable, :validatable
end
