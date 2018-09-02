class Subject < ApplicationRecord
  has_many :trainee_subjects
  has_many :tasks
end
