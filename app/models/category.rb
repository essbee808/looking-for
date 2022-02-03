class Category < ApplicationRecord
    has_many :programs

    validates :name, presence: true, uniqueness: true
end
