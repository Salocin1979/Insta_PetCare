class SymptomsController < ApplicationController

  def index
      @symptoms = Symptom.all
    end

    def show

    end
end
