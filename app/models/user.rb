class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :followers, :class_name => 'Following', :foreign_key => 'person_id'
  has_many :following, :class_name => 'Following', :foreign_key => 'follower_id'

  def follows?(other_user)
    self.following.find_by person_id: other_user.id
  end

  def get_feed
    Comment.where(
        author_id: self.following.map { |u| u.id }
    )
  end

end
