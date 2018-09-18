class Course < ApplicationRecord
  has_many :subjects, dependent: :destroy
  has_many :user_courses
  has_many :users, through: :user_courses
  has_many :having_user, through: :user_courses, source: :user
  validates_datetime :end_time, after: :start_time, message: I18n.t(".validate_time")

  enum status: {init: 0, start: 1, finish: 2}

  accepts_nested_attributes_for :subjects, allow_destroy: true
  scope :all_courses, ->{select(:id, :name, :status, :start_time, :end_time).order created_at: :desc}

  def assign_user user
    user_courses.create user_id: user.id
  end

  def remove_user user
    having_user.delete user
  end
end
