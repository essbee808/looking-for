class Program < ApplicationRecord
    belongs_to :creator, class_name: "User"
    belongs_to :category
    has_many :user_programs
    has_many :users, through: :user_programs

    validates :name, :description, :website, presence: true
    validates :name, uniqueness: true
end
