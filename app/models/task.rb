class Task < ApplicationRecord
  enum status: { todo: 0, doing: 1, done: 2 }
  enum priority: { low: 0, medium: 1, high: 2 }

  validates :title, presence: true, length: { maximum: 50 }

   SORT_ORDERS = {
    "due_on_asc" => { due_on: :asc, created_at: :desc },
    "priority_desc" => { priority: :desc, created_at: :desc },
    "created_at_desc" => { created_at: :desc }
  }.freeze

scope :with_status, ->(status) {
  return all if status.blank? || !statuses.key?(status)
  where(status: status)
}

scope :sorted, ->(sort_key) {
  order(SORT_ORDERS.fetch(sort_key, SORT_ORDERS["created_at_desc"]))
}
end
