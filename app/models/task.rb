class Task < ApplicationRecord
  enum status: { todo: 0, doing: 1, done: 2 }
  enum priority: { low: 0, middle: 1, high: 2 }

  validates :title, presence: true, length: { maximum: 50 }
end
