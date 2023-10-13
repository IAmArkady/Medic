Rails.application.routes.draw do

  get "/patients/:patient_id/recommendations", to: "patient#getRecommendations"
  post "/consultation_requests", to: "consultation#create"
  post "/consultation_requests/:request_id/recommendations", to: "recommendation#create"

end
