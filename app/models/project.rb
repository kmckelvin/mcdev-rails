class Project < ActiveRecord::Base
  validates :title, uniqueness: true
  validates :title, :language, :github_url, :description, presence: true
end
