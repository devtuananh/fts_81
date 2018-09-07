class User < ApplicationRecord
  enum role: [:trainee, :supervisor]
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
   :validatable
  scope :by_lastest, ->{order created_at: :desc}
  has_many :user_courses
  has_many :trainee_subjects
  has_many :trainee_tasks
  has_many :reports

  scope :members, ->{select(:id, :name, :email, :address, :phone).trainee}
end
