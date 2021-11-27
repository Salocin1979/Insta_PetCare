class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]


  def home
    @animals = Animal.all
    if user_signed_in?
      consultation_ids = Consultation.where(animal_id: current_user.animals.ids).ids
      prescriptions = Prescription.where(consultation_id: consultation_ids)
        prescriptions.each do |prescription|
          flash[:notice] = "Check the new Prescription for #{prescription.consultation.animal.name} from the vet!" unless prescription.read 
          prescription.update(read: true)
        end
    end
  end
end
