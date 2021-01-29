class Task < ApplicationRecord
    belongs_to :user
    has_many :tag_tasks
    has_many :tags, through: :tag_tasks, dependent: :destroy
end
