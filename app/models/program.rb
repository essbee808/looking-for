class Program < ApplicationRecord
    belongs_to :category
    belongs_to :creator, class_name: "User"
    has_many :user_programs
    has_many :users, through: :user_programs

    validates :description, length: { in: 50...10000 }
    validates :website, :category_id, :organization, presence: true
    validates :name, uniqueness: true, presence: true

    scope :ordered_by_name, -> { order(name: :asc) }
end
 