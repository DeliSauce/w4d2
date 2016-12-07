class Cat < ActiveRecord::Base
  validates :name, :birth_date, :color, :sex, presence: true
  validates :color, inclusion: {in: %w(White Black Brown)}
  validates :sex, inclusion: {in: %w(M F)}


  #NEED TO REFACTOR THIS!!!!!!!!!!!!!
  def age
    # current = "2016-12-01"
    # birthdate = @cat.birth_date.to_s
    20000
  end

  has_many :rental_requests,
  class_name: :CatRentalRequest,
  dependent: :destroy

end
