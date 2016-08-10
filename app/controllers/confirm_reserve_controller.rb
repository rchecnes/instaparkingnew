class ConfirmReserveController < ApplicationController
  def index
    @reservations = Reservation.joins(:place).where('places.user_id='+(current_user.id).to_s)
    
    @reservation = Reservation.new
  end

  def confirm
    @reservation = Reservation.find_by(id: params[:reservation_id])
    
    @reservation.state = 'Confirmado'
    @reservation.save
    
    redirect_to confirm_reserve_index_path, :flash => { :success => "Se confirmó la reserva" }
  end
  
  def cancel
    @reservation = Reservation.find_by(id: params[:reservation_id])
    
    @place_id = @reservation.place
    
    @reservation.state = 'Cancelado'
    @reservation.save
    
    #anulamos activamos el place
    @place = Place.find_by(id: @place_id)
    @place.state=1
    @place.save
    
    redirect_to confirm_reserve_index_path, :flash => { :success => "Se anuló la reserva" }
  end
end
