class Program < ApplicationRecord
    belongs_to :category
    belongs_to :creator, class_name: "User"
    has_many :user_programs
    has_many :users, through: :user_programs

    validates :description, :website, presence: true
    validates :name, uniqueness: true, presence: true

    def category_name=(name)
       self.category = Category.find_or_create_by(name: name)
    end

    def category_name
       self.category ? self.category.name : nil
    end
end
