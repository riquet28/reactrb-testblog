class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  unless RUBY_ENGINE=='opal'
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable
  end

  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy

end
