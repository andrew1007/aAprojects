class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, inclusion: {in: %w(PENDING APPROVED DENIED)}

  
end
