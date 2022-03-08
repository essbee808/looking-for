class Category < ApplicationRecord
    has_many :programs, dependent: :destroy
    accepts_nested_attributes_for :programs, allow_destroy: true

    validates :name, presence: true, uniqueness: true
    scope :ordered_by_name, -> { order(name: :asc)}
   
end
