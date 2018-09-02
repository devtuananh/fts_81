class User < ApplicationRecord
  has_many :trainee_subjects
  has_many :trainee_tasks
  has_many :reports
  has_many :active_admin_courses, class_name: UserCourse.name,
           foreign_key: :user_id, dependent: :destroy
  has_many :monitoring_courses, through: :active_admin_courses,
           source: :monitoring_course

  enum role: [:trainee, :supervisor]
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
   :validatable

  scope :by_lastest, ->{order created_at: :desc}
  scope :accounts, ->{select(:id, :name, :email, :address, :phone)}
  scope :members, ->{accounts.trainee}
end
