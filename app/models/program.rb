class Program < ApplicationRecord
    belongs_to :category
    belongs_to :creator, class_name: "User"
    has_many :bookmarks, dependent: :destroy
    has_many :users, through: :bookmarks

    validates :description, length: { in: 50...10000 }
    validates :website, :category_id, :organization, presence: true
    validates :name, uniqueness: true, presence: true

    scope :ordered_by_name, -> { order(name: :asc) }

    def format_date
        self.created_at.strftime("%b %d, %Y")
    end

end
 