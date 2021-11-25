class SymptomsController < ApplicationController


    def show
      @symptoms =Symptom.find(params[:id])
    end

end
