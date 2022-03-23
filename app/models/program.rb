class Program < ApplicationRecord
    belongs_to :category
    belongs_to :creator, class_name: "User", foreign_key: "creator_id"
    has_many :bookmarks, dependent: :destroy
    has_many :users, through: :bookmarks

    validates :description, length: { in: 50...10000 }
    validates :website, :category_id, :organization, presence: true
    validates :name, uniqueness: true, presence: true

    scope :ordered_asc, -> { order(name: :asc) }
    scope :ordered_desc, -> { order(name: :desc) }
    scope :most_recent, -> { order(created_at: :desc) }

    def format_update
       self.updated_at.strftime("%b %d, %Y")
    end

    def format_create_date
        self.created_at.strftime("%b %d, %Y")
     end

end
 