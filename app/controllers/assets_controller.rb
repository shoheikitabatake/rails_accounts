class AssetsController < ApplicationController
  before_action :set_asset, only: [:show, :edit, :update, :destroy]

  # GET /assets
  # GET /assets.json
  def index
#    @assets = Asset.all
    @assets = Asset.where( user_id: current_user.id )
  end

  # GET /assets/1
  # GET /assets/1.json
  def show
    if is_invalid_user? ( @asset.user_id )
      redirect_to root_path
    end
  end

  # GET /assets/new
  def new
    @asset = Asset.new
    @asset_group = AssetGroup.where( user_id: current_user.id )
  end

  # GET /assets/1/edit
  def edit
    if is_invalid_user? ( @asset.user_id )
      redirect_to root_path
    end
  end

  # POST /assets
  # POST /assets.json
  def create
    @asset = Asset.new(asset_params)

    respond_to do |format|
      if @asset.save
        format.html { redirect_to @asset, notice: 'Asset was successfully created.' }
        format.json { render :show, status: :created, location: @asset }
      else
        format.html { render :new }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assets/1
  # PATCH/PUT /assets/1.json
  def update
    if is_invalid_user? ( @asset.user_id )
      redirect_to root_path
    end

    respond_to do |format|
      if @asset.update(asset_params)
        format.html { redirect_to @asset, notice: 'Asset was successfully updated.' }
        format.json { render :show, status: :ok, location: @asset }
      else
        format.html { render :edit }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assets/1
  # DELETE /assets/1.json
  def destroy
    if is_invalid_user? ( @asset.user_id )
      redirect_to root_path
    end

    @asset.destroy
    respond_to do |format|
      format.html { redirect_to assets_url, notice: 'Asset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset
      @asset = Asset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asset_params
      params.require(:asset).permit(:user_id, :group_id, :name, :stock)
    end
end
