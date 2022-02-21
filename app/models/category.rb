class Category < ApplicationRecord
    has_many :programs, dependent: :destroy

    validates :name, presence: true, uniqueness: true

    def sort_by_abc_order(programs)
      self.programs.sort_by {|obj| obj.name }
    end
end
