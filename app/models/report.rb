class Report < ApplicationRecord
  belongs_to :user, foreign_key: :receiver_id
end
