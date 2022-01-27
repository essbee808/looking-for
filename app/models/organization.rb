class Organization < ApplicationRecord
    has_many :programs
    has_many :categories, through: :programs
end
