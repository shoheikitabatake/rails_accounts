class LossGroupsController < ApplicationController
  before_action :set_loss_group, only: [:show, :edit, :update, :destroy]

  # GET /loss_groups
  # GET /loss_groups.json
  def index
    @loss_groups = LossGroup.where( user_id: current_user.id )
  end

  # GET /loss_groups/1
  # GET /loss_groups/1.json
  def show
  end

  # GET /loss_groups/new
  def new
    @loss_group = LossGroup.new
  end

  # GET /loss_groups/1/edit
  def edit
  end

  # POST /loss_groups
  # POST /loss_groups.json
  def create
    @loss_group = LossGroup.new(loss_group_params)

    respond_to do |format|
      if @loss_group.save
        format.html { redirect_to loss_groups_path, notice: '登録しました。' }
        format.json { render :show, status: :created, location: @loss_group }
      else
        format.html { render :new }
        format.json { render json: @loss_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loss_groups/1
  # PATCH/PUT /loss_groups/1.json
  def update
    respond_to do |format|
      if @loss_group.update(loss_group_params)
        format.html { redirect_to loss_groups_path, notice: '更新しました。' }
        format.json { render :show, status: :ok, location: @loss_group }
      else
        format.html { render :edit }
        format.json { render json: @loss_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loss_groups/1
  # DELETE /loss_groups/1.json
  def destroy
    @loss_group.destroy
    respond_to do |format|
      format.html { redirect_to loss_groups_url, notice: '削除しました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loss_group
      @loss_group = LossGroup.find(params[:id])

      # user_idが一致しているかチェック
      if is_invalid_user? ( @loss_group.user_id )
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loss_group_params
      params.require(:loss_group).permit(:user_id, :name)
    end
end
