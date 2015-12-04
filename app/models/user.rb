class User < ActiveRecord::Base
  ratyrate_rater
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  has_many :followers, :class_name => 'Following', :foreign_key => 'person_id'
  has_many :following, :class_name => 'Following', :foreign_key => 'follower_id'
  has_many :shelves, :class_name => 'Shelf', :foreign_key => 'shelf_owner'
  has_many :quotes, dependent: :destroy
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://icons.iconarchive.com/icons/hopstarter/face-avatars/256/Male-Face-J3-icon.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def follows?(other_user)
    self.following.find_by person_id: other_user.id
  end

  # def get_feed
  #   Comment.where(
  #     author_id: self.following.map { |u| u.person_id }
  #     ) + Comment.where(
  #     book_id: Book.where(
  #       id: OnShelf.where(
  #         shelf_id: self.shelves.map { |s| s.id }
  #         ).map { |os| os.book_id }
  #       ).map { |b| b.id }
  #     ).uniq.sort { |a, b| a.created_at <=> b.created_at }
  #   end
  # end


  def self.random
    User.offset(rand(User.count)).first
  end
end