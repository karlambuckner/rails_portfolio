class Project < ApplicationRecord
  belongs_to :user

  validates :name, :presence => true
  validates :description, :presence => true
  validates :link, :presence => true
end
