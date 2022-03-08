class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :program

  def format_date
    self.date_saved.strftime("%b %d, %Y")
  end
end
