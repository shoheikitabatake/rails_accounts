class AssetGroupsController < ApplicationController
  before_action :set_asset_group, only: [:show, :edit, :update, :destroy]

  # GET /asset_groups
  # GET /asset_groups.json
  def index
    @asset_groups = AssetGroup.all
  end

  # GET /asset_groups/1
  # GET /asset_groups/1.json
  def show
  end

  # GET /asset_groups/new
  def new
    @asset_group = AssetGroup.new
  end

  # GET /asset_groups/1/edit
  def edit
  end

  # POST /asset_groups
  # POST /asset_groups.json
  def create
    @asset_group = AssetGroup.new(asset_group_params)

    respond_to do |format|
      if @asset_group.save
        format.html { redirect_to @asset_group, notice: 'Asset group was successfully created.' }
        format.json { render :show, status: :created, location: @asset_group }
      else
        format.html { render :new }
        format.json { render json: @asset_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asset_groups/1
  # PATCH/PUT /asset_groups/1.json
  def update
    respond_to do |format|
      if @asset_group.update(asset_group_params)
        format.html { redirect_to @asset_group, notice: 'Asset group was successfully updated.' }
        format.json { render :show, status: :ok, location: @asset_group }
      else
        format.html { render :edit }
        format.json { render json: @asset_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asset_groups/1
  # DELETE /asset_groups/1.json
  def destroy
    @asset_group.destroy
    respond_to do |format|
      format.html { redirect_to asset_groups_url, notice: 'Asset group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset_group
      @asset_group = AssetGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asset_group_params
      params.require(:asset_group).permit(:user_id, :name)
    end
end
