class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  AVATAR_SIZES = {
      micro: 16,
      thumb: 32,
      medium: 128,
      large: 512
  }

  def gravatar_url(size)
    size = avatar_size(size)
  end

  def avatar_size(size)
    AVATAR_SIZES[size]
  end
end
