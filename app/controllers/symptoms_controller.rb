class SymptomsController < ApplicationController
  def index
    @symptoms = Specie.find(params[:specie_id]).symptoms
  end

    def show
      @symptoms =Symptom.find(params[:id])
    end

end
