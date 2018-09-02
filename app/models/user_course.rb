class UserCourse < ApplicationRecord
  belongs_to :monitoring_course, class_name: User.name, foreign_key: :user_id
  belongs_to :be_admin, class_name: Course.name, foreign_key: :course_id

  validates :user_id, presence: true
  validates :course_id, presence: true

  enum status: {admin: 0, trainee_start: 1, trainee_complete: 2}
end
