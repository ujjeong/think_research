class EncountersController < ApplicationController
	def new
		# If missing patient_id param
		if(!params[:patient_id])
			redirect_to root_path
		end

		@patient = Patient.find(params[:patient_id])
		@encounter = @patient.encounters.build

		# If inifilizing fails, redirect them to the root page
		if(!defined? @patient or !defined? @encounter)
			redirect_to root_path
		end
	end

	def show
		# If missing patient_id or id params
		if(!params[:patient_id] or !params[:id])
			redirect_to root_path
		end

		@patient = Patient.find(params[:patient_id])
		@encounter = Encounter.find(params[:id])

		# If inifilizing fails, redirect them to the root page
		if(!defined? @patient or !defined? @encounter)
			redirect_to root_path
		end
	end

	def edit
		# If missing patient_id or id params
		if(!params[:patient_id] or !params[:id])
			redirect_to root_path
		end

		@encounter = Encounter.find(params[:id])

		# If inifilizing fails, redirect them to the root page
		if(!defined? @encounter)
			redirect_to root_path
		end
	end

	def update
		# If missing patient_id or id params
		if(!params[:patient_id] or !params[:id])
			redirect_to root_path
		end

		@encounter = Encounter.find(params[:id])

		# If inifilizing fails, redirect them to the root page
		if(!defined? @encounter)
			redirect_to root_path
		end

		# If update is successful, go back to patient show page
		# If fails, return to edit page along with objects
		if @encounter.update(encounter_params)
	    	redirect_to patient_encounter_path(params[:patient_id], @encounter)
		else
			render 'edit'
	    end
	end

	def create
		# If missing patient_id or id params
		if(!params[:patient_id])
			redirect_to root_path
		end

	    @patient = Patient.find(params[:patient_id])
	    @encounter = @patient.encounters.create(encounter_params) # Creating encounter object

	    # If inifilizing fails, redirect them to the root page
		if(!defined? @patient or !defined? @encounter)
			redirect_to root_path
		end
	    
	    # Validate if successfully saved params
  		if @patient.save
  			# @patient object is not passed
	    	redirect_to @patient
	  	else
	  		# Use render to pass the current @patient object as well
	    	render 'new'
  		end
  	end

  	def destroy
  		# If missing patient_id or id params
		if(!params[:id])
			redirect_to root_path
		end

		@encounter = Encounter.find(params[:id])

		# If inifilizing fails, redirect them to the root page
		if(!defined? @encounter)
			redirect_to root_path
		else
			@encounter.destroy
			redirect_to patient_path(params[:patient_id])
		end
  	end
 
	private
	    def encounter_params
	    	params.require(:encounter).permit(:visit_number, :admitted_at, :discharged_at, :location, :room, :bed)
	    end
end
