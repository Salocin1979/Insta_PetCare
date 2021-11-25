class SymptomsController < ApplicationController
  def index
    @symptoms = Symptom.all.where(specie: params[:specie_id])
  end

    def show
      @symptoms =Symptom.find(symptom_params[:specie_id])
    end

    private

    def symptom_params
      params.require(:symptom).permit(:suggestion, :description, :specie_id)
    end
    
end