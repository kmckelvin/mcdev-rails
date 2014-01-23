class Presentation < ActiveRecord::Base
  validates :title, :presented_on, presence: true

  scope :past, -> { where("presented_on < ?", Date.current).by_presentation_date }
  scope :future, -> { where("presented_on >= ?", Date.current).by_presentation_date(:asc) }
  scope :by_presentation_date, ->(direction = :desc) { order(presented_on: direction) }
end
