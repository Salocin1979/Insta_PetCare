class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]


  def home
    @animals = Animal.all
    @prescriptions = Prescription.all

    def read?
      if @prescription.read = false
        flash.now[:notice] = "prescription for #{@animals.name} is available."
      end
    end
  end
end
