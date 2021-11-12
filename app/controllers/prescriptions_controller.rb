class PrescriptionsController < ApplicationController
    before_action :set_animal, only: [:show, :edit]

    def index
      @prescriptions = Prescription.all
    end

    def new
       if is_veterinarian = true
        consulation = Consultation.find(params[:consultation_id])
        @prescription = Prescription.new
        #@consultations = Consultation.all
       end
    end

    def create
        if is_veterinarian = true
            @prescription = Prescription.new(prescription_params)
            #@animal.user = current_user
            # @animal.specie = Specie.find_by(id:animal_params [:specie_id])
            if @prescription.save
                redirect_to prescription_path(@prescription)
            else
                render :new
            end
        end
    end

    def show
      
    end

    private

    def set_prescription
        @prescription = Prescription.find(params[:id])
    end

    def prescription_params
        params.require(:prescription).permit(:date, :content, :consultation_id ) 
    end











end
