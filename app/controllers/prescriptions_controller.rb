class PrescriptionsController < ApplicationController
    before_action :set_prescription, only: [:show, :edit]

    def index
      @prescriptions = Prescription.all
    end

    def new
       if is_veterinarian = true
        @consultation =  Consultation.find(params[:consultation_id])
       @prescription = Prescription.new
       #@consultations = Consultation.all
       end
    end

    def create
        if is_veterinarian = true
            @consultation = Consultation.find(params[:consultation_id])
            @prescription = Prescription.new(prescription_params)
            @prescription.consultation = @consultation
            if @prescription.save
                redirect_to consultation_prescription_path(@consultation)
            else
                redirect_to new_consultation_prescription_path(@consultation)
            end
        end
    end

    def show
        @prescription.consultation = @consultation
    end

    private

    def set_prescription
        @prescription = Prescription.find(params[:id])
    end

    def prescription_params
        params.require(:prescription).permit(:date, :content, :consultation_id) 
    end











end
