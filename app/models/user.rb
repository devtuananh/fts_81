class User < ApplicationRecord
  has_many :user_courses
  has_many :trainee_subjects
  has_many :trainee_tasks
  has_many :reports
end
