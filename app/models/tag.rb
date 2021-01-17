class Tag < ApplicationRecord
    has_many :tag_tasks
    has_many :tasks, through: :tag_tasks, dependent: :destroy
end
