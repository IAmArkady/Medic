class PatientController < BaseController
   def getRecommendations
    patient_id = params.require(:patient_id)
    patient = Patient.find(patient_id)
    recommendations = patient.consultations.includes(:recommendation).where.not(recommendations: { id: nil }).map(&:recommendation)
    if recommendations
      render json: recommendations
    else
      head :not_found
    end
   end

end
