class Patient < ActiveRecord::Base
	has_many :encounters, dependent: :destroy  # Multiple Encounters, should be able to destroy all dependent rows
	accepts_nested_attributes_for :encounters, allow_destroy: true
	validates :first_name, :middle_name, :mrn, presence: true
	validates :weight, :height, numericality: { only_integer: true }
end
