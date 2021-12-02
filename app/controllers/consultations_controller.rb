class ConsultationsController < ApplicationController
  def index
    @consultations = Consultation.all 
    @user = current_user
  end

  def new
    @consultation = Consultation.new
    @veterinarians = User.where(is_veterinarian: true)
    @animals = current_user.animals
  end

  def create
    @consultation = Consultation.new(consultation_params)
    # @user = User.where(is_veterinarian)
    @consultation.date = Date.today
    @consultation.animal = Animal.find(consultation_params[:animal_id])
    if @consultation.save
      redirect_to consultation_path(@consultation)
    else
      render :new
    end
  end

  def show
    @consultation = Consultation.find(params[:id])
    @token = generate_token(@consultation)
  end

  def destroy
    @consultation.destroy
    redirect_to consultations_path
  end

    private
  
  def consultation_params
    params.permit(:animal_id, :user_id)

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