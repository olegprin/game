class User < ActiveRecord::Base
  
  after_create :user_first
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
    def user_first
    unless User.first.present?
      self.admin=true
      self.role="admin"
    end
  end
  
end
