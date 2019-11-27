class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

#  has_many :posts, :class_name => "Post", :foreign_key => "user_posted_id"
#  has_secure_password

  #validates :name, presence: true
  #validates :email, presence: true, uniqueness: true
  has_many :posts
  #has_many :classmates, :class_name => "Classmate", :foreign_key => "user_classmate_id"

end
