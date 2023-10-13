class RecommendationController < BaseController
  def create
    cons_id = params.require(:request_id)
    text = params.require(:text)
    consultation = Consultation.find(cons_id)
    new_recommendation = Recommendation::create(consultation: consultation, text: text)
    if new_recommendation.save
      render json: {success: 'Successfully created'}, status: :created
    else
      render json: {error: 'Error create'}, status: :not_modified
    end
  end

end
