class User < ApplicationRecord
  enum role: {trainee: 0, supervisor: 1}
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
   :validatable
  has_many :trainee_subjects
  has_many :trainee_tasks
  has_many :reports
  has_many :user_courses
  has_many :courses, through: :user_courses

  scope :by_lastest, ->{order created_at: :desc}
  scope :by_fields, ->{select :id, :name, :email, :address, :phone, :avatar, :role}
end
