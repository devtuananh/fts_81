class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
   :validatable

  has_many :user_courses
  has_many :trainee_subjects
  has_many :trainee_tasks
  has_many :reports
end
