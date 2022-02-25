class Category < ApplicationRecord
    has_many :programs, dependent: :destroy

    validates :name, presence: true, uniqueness: true

    def programs_in_order(programs)
      self.programs.sort_by {|obj| obj.name }
    end

end
