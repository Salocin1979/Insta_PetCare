class ConsultationsController < ApplicationController
  def index
    @consultations = Consultation.all
  end

  def new
    @consultation = Consultation.new
    @user = current_user
    @animals = Animal.find(:all)
  end

  def create
    @consultation = Consultation.create(params[:consultation])
    if @consultation.save
      redirect_to consultations_path
    else
      render :new
    end
  end


  # def show
  #   @consultation = Consultation.find(params[:animal_id])
  #   authorize @consultation
  #   @token = generate_token(@consultation)
  # end
  
    

  private

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