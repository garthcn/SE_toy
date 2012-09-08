class Course < ActiveRecord::Base
  attr_accessible :name, :note
  has_and_belongs_to_many :users, :join_table => :users_courses
end
