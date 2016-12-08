
class Cat < ActiveRecord::Base

  COLORS = %w(red green blue )

  validates :birth_date, :name, :sex, presence: true
  validates :color, inclusion: {in: COLORS}
  validates :sex, inclusion: {in: %w(M F)}



  def age
    curr_time = Time.now.to_date
    #debugger
    bday = self.birth_date #TODO select specific cat birthdate
    @age = ((curr_time - bday)/365).to_i
  end
end
