class BaseController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do
    render json: { error: 'Record not found' }, status: :not_found
  end

  rescue_from ActiveRecord::RecordNotUnique do
    render json: { error: 'Record already exist' }, status: :bad_request
  end

  rescue_from ActionController::ParameterMissing do |exc|
    render json: { error: "Not found parameter: #{exc.param}" }, status: :bad_request
  end
end
