class Program < ApplicationRecord
    belongs_to :user

    validates :name, :description, :website, presence: true
    validates :name, uniqueness: true
end
