class SymptomsController < ApplicationController
  def index
    @symptoms = Symptom.all.where(specie: params[:specie_id])
  end

    def show
      @symptoms =Symptom.find(params[:id])
    end

end
