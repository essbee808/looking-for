class Program < ApplicationRecord
    belongs_to :category
    belongs_to :creator, class_name: "User"
    has_many :user_programs
    has_many :users, through: :user_programs

    validates :description, :website, :category_id, presence: true
    validates :name, uniqueness: true, presence: true

    scope :ordered_by_name, -> { order(name: :asc) }

end
