class CreateUsersCoursesJoinTable < ActiveRecord::Migration
  def self.up
    create_table :users_courses, :id => false do |t|
      t.integer :user_id
      t.integer :course_id
    end
  end

  def self.down
    drop_table :users_courses
  end
end
