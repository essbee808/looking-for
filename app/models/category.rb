class Category < ApplicationRecord
    has_many :programs
    has_many :organizations, through: :programs
end
