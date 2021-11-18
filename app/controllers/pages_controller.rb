class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @animals = Animal.all
    @consultation.animal = Animal.find(consultation_params[:animal_id])
    @prescription.animal = Animal.find(prescription_params[:animal_id])
  end
end
