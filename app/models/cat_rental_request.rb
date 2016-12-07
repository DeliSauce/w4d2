
class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: {in: %w(PENDING APPROVED DENIED)}
  validate :overlapping_approved_requests

  def overlapping_requests
    matched_cat_records = CatRentalRequest
    .where.not(id: self.id)
    .where("cat_id = #{self.cat_id}")
    .where("(start_date BETWEEN #{self.start_date} AND #{self.end_date}) OR
            (end_date BETWEEN #{self.start_date} AND #{self.end_date})")
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end

  def not_double_booked
    overlapping = overlapping_approved_requests
    if overlapping.empty?
      return
    else
      error[:status] << "Cat is already booked"
    end
  end


  belongs_to :cat,
  foreign_key: :cat_id,
  class_name: :Cat

end


# where(<<-SQL, start_date: start_date, end_date: end_date)
#          NOT( (start_date > :end_date) OR (end_date < :start_date) )
#       SQL
