class Consultation < ApplicationRecord
  belongs_to :patient
  has_one :recommendation
end
