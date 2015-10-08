class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /properties
  # GET /properties.json
  def index
#    @properties = Property.all
    @properties = Property.where( user_id: current_user.id )
    @property_group = PropertyGroup.where( user_id: current_user.id )
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    if is_invalid_user? ( @property.user_id )
      redirect_to root_path
    end
    @property_group = PropertyGroup.find( @property.group_id )
  end

  # GET /properties/new
  def new
    @property = Property.new
    @property_group = PropertyGroup.where( user_id: current_user.id )
  end

  # GET /properties/1/edit
  def edit
    if is_invalid_user? ( @property.user_id )
      redirect_to root_path
    end
    @property_group = PropertyGroup.where( user_id: current_user.id )
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    if is_invalid_user? ( @property.user_id )
      redirect_to root_path
    end

    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    if is_invalid_user? ( @property.user_id )
      redirect_to root_path
    end

    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:user_id, :group_id, :name, :stock)
    end
end
