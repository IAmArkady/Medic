require 'rails_helper'
RSpec.describe "API", type: :request do
  it "Возвращает список рекомендация пацента" do
    patient_id = 1
    get "/patients/#{patient_id}/recommendations"
    expect(response).to have_http_status(200)
  end

  it "Создает новый запрос на консультацию" do
    patient_id = 1
    text = "New dsfd"
    params = { patient_id: patient_id, text: text }
    post "/consultation_requests", params: params
    expect(response).to have_http_status(201)
  end

end

RSpec.describe OpenFda do
  let(:fda) { OpenFda.new }
  describe "#getDrugEffects" do
    it "Получает эффект лекарства" do
      drug_name = "aspirin"
      result = fda.getDrugEffects(drug_name)
      expect(result).not_to eq({})
    end
  end

  describe "#getDrugIngo" do
    it "Получает информацию о лекарстве" do
      drug_name = "aspirin"
      result = fda.getDrugInfo(drug_name)
      expect(result).not_to eq({})
    end
  end
end