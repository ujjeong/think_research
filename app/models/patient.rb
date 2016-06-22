class Patient < ActiveRecord::Base
	has_many :encounters, dependent: :destroy  # Multiple Encounters, should be able to destroy all dependent rows
	accepts_nested_attributes_for :encounters, allow_destroy: true
	validates_associated :encounters
	validates :first_name, :middle_name, :mrn, presence: true
	validates :weight, :numericality => true, :allow_nil => true
	validates :height, :numericality => true, :allow_nil => true
	validates_associated :encounters
end
