# frozen_string_literal: true
require 'net/http'
require 'json'
class OpenFda
  def initialize
    @url = 'https://api.fda.gov/drug/event.json'
  end

  def getDrugEffects(drug_name)
    response = createRequest(drug_name)
    extractEffects(response)
  end

  def getDrugInfo(drug_name)
    response = createRequest(drug_name)
    extractInfo(drug_name, response)
  end

  private
  def createRequest(drug_name)
    url = URI(@url)
    params = {
      'search' => "patient.drug.medicinalproduct:#{drug_name}"
    }
    url.query = URI.encode_www_form(params)
    response = Net::HTTP.get_response(url)
    if response.code == '200'
      data = JSON.parse(response.body)
      data['results']
    else
      nil
    end
  end
  def extractEffects(results)
    effects = []
    results.each do |result|
      effects << result['patient']['reaction'][0]['reactionmeddrapt']
    end
    effects
  end

  def extractInfo(drug_name, results)
    drug_info = {}
    results.each do |result|
      if result['patient']
        result['patient']['drug'].each do |drug|
          if drug['medicinalproduct'].downcase == drug_name && drug['openfda']
            drug_info = {
             'name' => drug_name,
             'brands' => drug['openfda']['brand_name'],
             'manufacturers' => drug['openfda']['manufacturer_name'],
             'routes' => drug['openfda']['route']
           }
           break
         end
        end
      end
    end
    drug_info
  end

end
