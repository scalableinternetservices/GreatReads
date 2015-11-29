class Book < ActiveRecord::Base
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://placehold.it/300x200"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

	include PublicActivity::Model
	tracked owner: Proc.new{ |controller, model| controller.current_user }

  def self.random
    Book.offset(rand(Book.count)).first
  end
end
