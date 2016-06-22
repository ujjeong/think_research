class Encounter < ActiveRecord::Base
 	belongs_to :patient
 	validates :visit_number, :admitted_at, :discharged_at, presence: true
	validates :bed, :room, numericality: { only_integer: true }
 	validate :checkAdmittBeforeDischarge

 	# Check date comparison with admitted_at and discharged_at
 	def checkAdmittBeforeDischarge
 		if admitted_at and discharged_at and admitted_at > discharged_at
	    	errors.add(:admitted_at, "must be before discharged time")
	    end
	end 
end
