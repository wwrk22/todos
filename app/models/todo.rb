class Todo < ApplicationRecord
  scope :all_for_user, ->(email) { where("todos.email = ?", email) }
end
