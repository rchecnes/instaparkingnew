class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  devise :timeoutable, :timeout_in => 60.minutes
  
  has_many :favorites
  has_many :reservations
  has_many :places
  belongs_to :role
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  #validates :email, presence: true
  #validates :password, presence: true
  validates :password_confirmation, presence: true
  
  before_create :assign_default_role
  
  def assign_default_role
    @users = User.all.size
    
    if @users > 0
      self.role = Role.find(2)
    else
      self.role = Role.find(1)
    end
  end
  
end
