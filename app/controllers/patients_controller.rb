class PatientsController < ApplicationController
	def index
		@patient = Patient.all

		# If inifilizing fails, redirect them to the root page
		if(!defined? @patient)
			redirect_to root_path
		end
	end

	def edit
	    @patient = Patient.find(params[:id])

	    # If inifilizing fails, redirect them to the root page
		if(!defined? @patient)
			redirect_to root_path
		end
	end

	def show
		@patient = Patient.find(params[:id])

		# If inifilizing fails, redirect them to the root page
		if(!defined? @patient)
			redirect_to root_path
		end
	end

	def new
		@patient = Patient.new

		# If inifilizing fails, redirect them to the root page
		if(!defined? @patient)
			redirect_to root_path
		end
	end

	def update
		@patient = Patient.find(params[:id])

		# If inifilizing fails, redirect them to the root page
		if(!defined? @patient)
			redirect_to root_path
		end
		 
		if @patient.update(patient_params)
	    	redirect_to @patient
		else
			render 'edit'
	    end
	end

	def create
		# Initializing Patient object
  		@patient = Patient.new(patient_params) 

  		# If inifilizing fails, redirect them to the root page
		if(!defined? @patient)
			redirect_to root_path
		end

  		# Validate if successfully saved params
  		if @patient.save
  			# @patient object is not passed
	    	redirect_to patients_path 
	  	else
	  		# Use render to pass the current @patient object as well
	    	render 'new' 
  		end
  	end

  	def destroy
  		@patient = Patient.find(params[:id])

  		# If inifilizing fails, redirect them to the root page
		if(!defined? @patient)
			redirect_to root_path
		else
			@patient.destroy
			redirect_to patients_path
		end
  	end

  	private
  		def patient_params
  			params.require(:patient).permit(:first_name, :middle_name, :last_name, :weight, :height, :mrn)
  		end
end
