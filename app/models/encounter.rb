class Encounter < ActiveRecord::Base
 	belongs_to :patient
 	validates :visit_number, :admitted_at, :discharged_at, presence: true
 	validate :checkAdmittBeforeDischarge

 	def checkAdmittBeforeDischarge
	    errors.add(:admitted_at, "admitted time must be before discharged time") unless admitted_at > discharged_at
	end 
end
