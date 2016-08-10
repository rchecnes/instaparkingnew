class ReservationType < ActiveRecord::Base
    has_many :reservations
    validates :name, presence: true
end
