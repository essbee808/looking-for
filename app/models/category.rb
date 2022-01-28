class Category < ApplicationRecord
    has_many :programs

    validates :name, uniqueness: true
end
