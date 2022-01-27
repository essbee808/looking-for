class Program < ApplicationRecord
    belongs_to :user
    belongs_to :organization
    belongs_to :category

    validates :name, :description, :website, presence: true
    validates :name, uniqueness: true
end
