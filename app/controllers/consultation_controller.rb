class ConsultationController < BaseController
  def create
    patient_id = params.require(:patient_id)
    text = params.require(:text)
    consultation = Consultation::create(patient: Patient.find(patient_id), text: text)
    if consultation.save
      render json: {success: 'Successfully created'}, status: :created
    else
      render json: {error: 'Error create'}, status: :bad_request
    end
  end

end
