class ConsultationsController < ApplicationController
  def index
    @consultations = Consultation.all
  end

  def new
    @consultation = Consultation.new
    # @animal = Animal.find(:animal_id)
  end

  def create
    @consultation = Consultation.new(consultation_params)
    @consultation.user = current_user
    @consultation.animal = Animal.find(consultation_params[:animal_id])
    if @consultation.save
      redirect_to consultations_path
    else
      render :new
    end
  end


  def show
    @consultation = Consultation.find(consultation_params[:animal_id])
    @token = generate_token(@consultation)
  end
  
    

  private
  
  def consultation_params
    params.require(:consultation).permit(:date, :animal_id)

  end

  def generate_token(consultation)
    # Create an Access Token
    token = Twilio::JWT::AccessToken.new ENV['ACCOUNT_SID'], ENV['KEY_ID'], ENV['AUTH_TOKEN'], [],
        ttl: 14400,
        identity: current_user.email
    # Grant access to Video
    grant = Twilio::JWT::AccessToken::VideoGrant.new
    grant.room = consultation.url_room
    token.add_grant grant
    # Serialize the token as a JWT
    token.to_jwt
  end

end