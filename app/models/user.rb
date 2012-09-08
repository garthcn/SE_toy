class User < ActiveRecord::Base
  attr_accessible :email, :name, :program
  has_and_belongs_to_many :courses, :join_table => :users_courses
end
