require '../test_helper'

class EncountersControllerTest < ActionController::TestCase
  	test "should not save encounters without parameters" do
  		encounters = Encounter.new
  		assert_not encounters.save
  	end

  	test "should save encounters with missing optional parameters" do
  		encounters = Encounter.new(admitted_at: "1992-05-27", discharged_at: "1992-06-20", visit_number: "MN002")
  		assert encounters.save
  	end

  	test "encounters show routing action" do
		assert_routing '/patients/1/encounters/1', controller: "encounters", action: "show", patient_id: "1", id: "1"
	end
end
