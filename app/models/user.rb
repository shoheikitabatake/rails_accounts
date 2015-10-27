class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # modelからもuserとれるように
  def self.current
    Thread.current[:user]
  end

  def self.current=( user )
    Thread.current[:user] = user
  end

end
