class ReserveController < ApplicationController
  layout "reservation"
  
  before_action :authenticate_user!
  
  # GET /places/new
  def new
    @reservation = Reservation.new
    
    @reservation_types = ReservationType.all
  end

  def reserve
    
    @reservation = Reservation.new
    
    @count_reservation = Reservation.all.size
    @code_reservation = @count_reservation+1
    
    @reservation.started_at = params[:started_at]
    @reservation.ended_at = params[:ended_at]
    @reservation.started_time = params[:started_time]
    @reservation.ended_time = params[:ended_time]
    @reservation.reservation_type_id = params[:reservation_type]
    @reservation.place_id = params[:place_id]
    @reservation.user_id = current_user.id
    @reservation.code = 'RESERVATION0000'+@code_reservation.to_s
    @reservation.state = 'Emitido'
    @reservation.save
    
    #Cambioamos de estado al parking
    @place = Place.find_by(id:params[:place_id])
    @place.state = 0
    @place.save
    
    #gravamos faavorito
    if params[:add_favorite]
      
      @favorite = Favorite.new
      
      @count_favorite = Favorite.where(user_id:current_user.id).size
      @number_favorite = @count_favorite+1
      
      @favorite.name = 'Mi Favorito '+@number_favorite.to_s
      @favorite.user_id = current_user.id
      @favorite.place_id = params[:place_id]
      @favorite.save
    end
    
    
    redirect_to root_path, :flash => { :success => "Su reserva se realizó con éxito; su código de reserva es: RESERVATION0000"+@code_reservation.to_s }
  end
  
end
