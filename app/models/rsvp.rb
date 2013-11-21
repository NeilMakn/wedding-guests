class Rsvp < ActiveRecord::Base
  validates :name, :lastname, :partysize, presence: true
  validates :partysize, numericality: {greater_than_or_equal_to: 1 }

  belongs_to :guest

  # before_save :only_one


end
