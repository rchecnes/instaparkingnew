class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  belongs_to :reservation_type
end
