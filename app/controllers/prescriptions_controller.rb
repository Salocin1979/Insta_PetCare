class PrescriptionsController < ApplicationController
    before_action :set_prescription, only: [:show, :edit]

    def index
       @prescriptions = Prescription.all.where(consultation_id: params[:consultation_id])
    end

    def new
       @user = current_user
       if is_veterinarian = true
          @consultation =  Consultation.find(params[:consultation_id])
         @prescription = Prescription.new
       #@consultations = Consultation.all
       end
    end

    def create
        @user = current_user
        if is_veterinarian = true
            @prescription = Prescription.new(prescription_params)
            @consultation = Consultation.find(params[:consultation_id])
            @prescription.consultation = @consultation
            if @prescription.save
                flash[:alert] = "Prescription successfully created"
                redirect_to consultation_prescriptions_path
            else
                redirect_to new_consultation_prescription_path(@consultation)
            end
        end
    end

    def show
      respond_to do |format|
        format.html
          format.pdf do
          render pdf: "file_name", template: "prescriptions/show.html.erb"  # Excluding ".pdf" extension.
        end
      end
    end

    private

    def set_prescription
        @prescription = Prescription.find(params[:id])
    end

    def prescription_params
        params.require(:prescription).permit(:date, :content) 
    end
end
