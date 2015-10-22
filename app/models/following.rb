class Following < ActiveRecord::Base
  belongs_to :person
  belongs_to :follower, :class_name => 'Person'
end
