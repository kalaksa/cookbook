class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy
  attr_accessor :name
  validates :username, presence: true
end
