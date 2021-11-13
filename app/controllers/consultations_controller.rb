class ConsultationsController < ApplicationController
 # index.html.erb
 def index
    # @consultations = policy_scope(Consultation).order(created_at: :desc) 
    @consultations = Consultation.all
  end

  def new
    @consultation = Consultation.new
  #   # authorize @consultation
  #   # @proposal = Proposal.find(params[:proposal_id])
  #   # @slots = @proposal.slots
  end

  def create
    @consultation = Consultation.new
    @consultation.user = current_user
    @consultaion.proposal = Proposal.find(params[:proposal_id])
    @booking.start_time = params[:booking][:start_time]
    authorize @booking
    if @booking.save!
      flash[:notice] = "Consultation done !"
      redirect_to dashboards_path(resa: true)
    else
      render :new
    end
  end

  def show
    @consultation = Consultation.find(params[:animal_id])
    authorize @consultation
    @token = generate_token(@consultation)
  end

#   def destroy
#     @consultation = Consultation.find(params[:id])
#     authorize @consultation
#     @booking.destroy
#     redirect_to dashboards_path(resa: true)
#   end

  private
  def consultation_params
    params.require(:consultation).permit(:date, :user_id, :animal_id)
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