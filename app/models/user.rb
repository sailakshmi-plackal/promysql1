class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  has_many :apps
  
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
         validates :username,
         presence: true,
         uniqueness: {case_sensitive: false},
         format: {with: /\w+/}
         
         def to_param
             self.username
         end
         
         end
