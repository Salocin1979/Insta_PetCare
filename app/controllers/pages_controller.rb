class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @animals = Animal.all
   if user_signed_in?
    consultation_ids = Consultation.where(user_id: current_user.id).ids
    prescriptions = Prescription.where(consultation_id: consultation_ids)
  
      prescriptions.each do |prescription|
        flash[:notice] = "a new Prescription has been created"
      end
   end

  end
end
