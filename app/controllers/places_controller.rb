class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /places
  # GET /places.json
  def index
    @places = Place.where(user_id:current_user.id)
  end

  # GET /places/1
  # GET /places/1.json
  def show
  end

  # GET /places/new
  def new
    @place = Place.new
    
    @districts = District.all
    
    @reservation_types = ReservationType.all
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  # POST /places.json
  def create
    

    @place = Place.new
    
    @place.address = params[:address]
    @place.price = params[:price]
    @place.started_at = params[:started_at]
    @place.ended_at = params[:ended_at]
    @place.started_time = params[:started_time]
    @place.ended_time = params[:ended_time]
    @place.state = 1
    @place.state_list = 1
    @place.price = params[:price]
    @place.district_id = params[:district]
    @place.reservation_type_id = params[:reservation_type]
    @place.user_id = current_user.id
    @place.description = params[:description]
    @place.info = params[:info]
    
    #Archivo subido por el usuario.
    imagen = params[:url_image]
    #Nombre original del archivo.
    nombre = imagen.original_filename
    #directorio
    directorio = "public/images"
    
    #Ruta del archivo.
    path = File.join(directorio, nombre);
    #Crear en el archivo en el directorio. Guardamos el resultado en una variable, será true si el archivo se ha guardado correctamente.
    resultado = File.open(path, "wb") { |f| f.write(imagen.read) };
    #Verifica si el archivo se subió correctamente.
    if resultado
      subir_archivo = "ok";
    else
      subir_archivo = "error";
    end
         
    @place.url_image = nombre
    

    respond_to do |format|
      if @place.save
        format.html { redirect_to action: 'index', notice: 'Place was successfully created.' }
        #format.json { render :new, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    #deshabilitamos
    
    @place = Place.find_by(id: params[:id])
    
    if @place.state_list === false
      @new_id = 1
      @msj = 'Enable'
    else
      @new_id = 0
      @msj = 'Disabled'
    end
    
    @place.state_list = @new_id
    @place.save
    
    #@place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully '+@msj }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:address, :price, :url_image, :state, :started_at, :ended_at, :started_time, :ended_time, :description, :users_id, :districts_id, :reservation_types_id)
    end
end
