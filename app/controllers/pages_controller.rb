class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @animals = Animal.all
    @animal.user = current_user
    
    @prescriptions = Prescription.all
    raise

    
  end
end
