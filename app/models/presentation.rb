class Presentation < ActiveRecord::Base
  validates :title, :presented_on, presence: true

  scope :past, -> { where("presented_on < ?", Date.current) }
  scope :future, -> { where("presented_on >= ?", Date.current) }
end
