class LossesController < ApplicationController
  before_action :set_loss, only: [:show, :edit, :update, :destroy]
  before_action :set_property_group, only: [:new, :edit]

  # GET /losses
  # GET /losses.json
  def index
    @losses = Loss.where( user_id: current_user.id ).order( :group_id )
  end

  # GET /losses/1
  # GET /losses/1.json
  def show
  end

  # GET /losses/new
  def new
    @loss = Loss.new
  end

  # GET /losses/1/edit
  def edit
  end

  # POST /losses
  # POST /losses.json
  def create
    @loss = Loss.new(loss_params)

    respond_to do |format|
      if @loss.save
        format.html { redirect_to @loss, notice: 'Loss was successfully created.' }
        format.json { render :show, status: :created, location: @loss }
      else
        format.html { render :new }
        format.json { render json: @loss.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /losses/1
  # PATCH/PUT /losses/1.json
  def update
    respond_to do |format|
      if @loss.update(loss_params)
        format.html { redirect_to @loss, notice: 'Loss was successfully updated.' }
        format.json { render :show, status: :ok, location: @loss }
      else
        format.html { render :edit }
        format.json { render json: @loss.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /losses/1
  # DELETE /losses/1.json
  def destroy
    @loss.destroy
    respond_to do |format|
      format.html { redirect_to losses_url, notice: 'Loss was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loss
      @loss = Loss.find(params[:id])

      # user_idが一致しているかチェック
      if is_invalid_user? ( @loss.user_id )
        redirect_to root_path
      end
    end

    def set_property_group
      @loss_group = LossGroup.where( user_id: current_user.id )
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loss_params
      params.require(:loss).permit(:user_id, :group_id, :name, :budget, :stock)
    end
end
