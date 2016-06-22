require '../test_helper'

class PatientsControllerTest < ActionController::TestCase
	test "should be able to get index" do
		get :index
		assert_template :index
		assert_response 200
	end

	test "should not save patient without any parameters" do
		@patients = Patient.new
		assert_not @patients.save
	end

	test "should save patient with missing optional parameter" do
		@patients = Patient.create(first_name: "eugene", middle_name: "jin", mrn: "mrn200")
		assert @patients.save
	end

	test "routing action" do
		assert_routing '/patients', controller: "patients", action: "index"
		assert_routing '/patients/1', controller: "patients", action: "show", id: "1"
	end
end
