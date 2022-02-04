class Program < ApplicationRecord
    belongs_to :category
    belongs_to :creator, class_name: "User"
    has_many :user_programs
    has_many :users, through: :user_programs

    accepts_nested_attributes_for :category

    validates :name, :description, :website, presence: true
    validates :name, uniqueness: true
end
