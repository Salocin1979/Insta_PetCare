class SymptomsController < ApplicationController

  def index
      @symptoms = Symptom.all
    end

    def show
      @symptoms =Symptom.find (params[id])

    end
end
