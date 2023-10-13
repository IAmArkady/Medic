class ApplicationController < ActionController::API

  def createRecommendation
    cons_id = params[:request_id]
    text = params[:text]
    if not cons_id or not text
      render json: {error: 'Not found parameters'}, status: :not_found
      return
    end

    begin
      consultation = Consultation.find(cons_id)
    rescue ActiveRecord::RecordNotFound
      render json: {error: 'Not found consultation'}, status: :not_found
      return
    end

    cons = Recommendation::create(consultation: consultation, text: text)
    if cons.save
      render json: {success: 'Successfully created'}, status: :not_found
    else
      render json: {error: 'Error create'}, status: :not_found
    end

  end

end
