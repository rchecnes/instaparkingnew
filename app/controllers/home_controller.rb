class HomeController < ApplicationController
  layout "reservation"
  def index
    #if user_signed_in?
    #  redirect_to controller: :reservations , action: :new
    #end
    @places = Place.where('state=1 AND state_list=1')
    
    @count_place = Place.where('state=1 AND state_list=1').size
    
    @districts = District.all
    
  end
  
  
  def listplace
    
    @conditions='state=1 AND state_list=1';
    
    if params[:address] != ''
      @conditions += " AND address like '%"+params[:address]+"%'"
    end
    
    if params[:started_at] != ''
      @conditions += " AND started_at='"+params[:started_at]+"'"
    end
    
    if params[:ended_at] != ''
      @conditions += " AND ended_at='"+params[:ended_at]+"'"
    end
    
    if params[:district] != ''
      @conditions += " AND district_id="+params[:district]
    end
    
    @places = Place.where(@conditions)
    
    respond_to do |format|
      format.html 
      format.json {render json: @places.to_json(include: :district)}
    end
    
  end
  
  def show
    @places = Place.where(id: params[:id_place])
    
    respond_to do |format|
      format.html 
      format.json {render json: @places.to_json(:include=>[:district, :reservation_type, :user])}
    end
  end
  

end
