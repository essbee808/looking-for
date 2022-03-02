class Category < ApplicationRecord
    has_many :programs, dependent: :destroy

    validates :name, presence: true, uniqueness: true
    scope :ordered_by_name, -> { order(name: :asc)}
    
end
