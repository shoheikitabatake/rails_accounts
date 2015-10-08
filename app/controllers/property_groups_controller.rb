class PropertyGroupsController < ApplicationController
  before_action :set_property_group, only: [:show, :edit, :update, :destroy]

  # GET /property_groups
  # GET /property_groups.json
  def index
#    @property_groups = PropertyGroup.all
    @property_groups = PropertyGroup.where( user_id: current_user.id )
  end

  # GET /property_groups/1
  # GET /property_groups/1.json
  def show
    if is_invalid_user? ( @property_group.user_id )
      redirect_to root_path
    end
  end

  # GET /property_groups/new
  def new
    @property_group = PropertyGroup.new
  end

  # GET /property_groups/1/edit
  def edit
    if is_invalid_user? ( @property_group.user_id )
      redirect_to root_path
    end
  end

  # POST /property_groups
  # POST /property_groups.json
  def create
    @property_group = PropertyGroup.new(property_group_params)

    respond_to do |format|
      if @property_group.save
        format.html { redirect_to @property_group, notice: 'Property group was successfully created.' }
        format.json { render :show, status: :created, location: @property_group }
      else
        format.html { render :new }
        format.json { render json: @property_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /property_groups/1
  # PATCH/PUT /property_groups/1.json
  def update
    if is_invalid_user? ( @property_group.user_id )
      redirect_to root_path
    end

    respond_to do |format|
      if @property_group.update(property_group_params)
        format.html { redirect_to @property_group, notice: 'Property group was successfully updated.' }
        format.json { render :show, status: :ok, location: @property_group }
      else
        format.html { render :edit }
        format.json { render json: @property_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /property_groups/1
  # DELETE /property_groups/1.json
  def destroy
    if is_invalid_user? ( @property_group.user_id )
      redirect_to root_path
    end

    @property_group.destroy
    respond_to do |format|
      format.html { redirect_to property_groups_url, notice: 'Property group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property_group
      @property_group = PropertyGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_group_params
      params.require(:property_group).permit(:user_id, :name)
    end
end
