class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, 
  #        :validatable, authentication_keys: [:login]

  before_create :set_username

  has_many :books

  private
  def set_username
    self.username = self.email.split("@").first()
  end

  # attr_writer :login

  # def login
  #   @login || self.username || self.email
  # end
end
