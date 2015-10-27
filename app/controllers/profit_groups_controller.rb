class ProfitGroupsController < ApplicationController
  before_action :set_profit_group, only: [:show, :edit, :update, :destroy]

  # GET /profit_groups
  # GET /profit_groups.json
  def index
    @profit_groups = ProfitGroup.where( user_id: current_user.id )
  end

  # GET /profit_groups/1
  # GET /profit_groups/1.json
  def show
  end

  # GET /profit_groups/new
  def new
    @profit_group = ProfitGroup.new
  end

  # GET /profit_groups/1/edit
  def edit
  end

  # POST /profit_groups
  # POST /profit_groups.json
  def create
    @profit_group = ProfitGroup.new(profit_group_params)

    respond_to do |format|
      if @profit_group.save
        format.html { redirect_to profit_groups_path, notice: '登録しました。' }
        format.json { render :show, status: :created, location: @profit_group }
      else
        format.html { render :new }
        format.json { render json: @profit_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profit_groups/1
  # PATCH/PUT /profit_groups/1.json
  def update
    respond_to do |format|
      if @profit_group.update(profit_group_params)
        format.html { redirect_to profit_groups_path, notice: '更新しました。' }
        format.json { render :show, status: :ok, location: @profit_group }
      else
        format.html { render :edit }
        format.json { render json: @profit_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profit_groups/1
  # DELETE /profit_groups/1.json
  def destroy
    @profit_group.destroy
    respond_to do |format|
      format.html { redirect_to profit_groups_url, notice: '削除しました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profit_group
      @profit_group = ProfitGroup.find(params[:id])

      # user_idが一致しているかチェック
      if is_invalid_user? ( @profit_group.user_id )
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profit_group_params
      params.require(:profit_group).permit(:user_id, :name)
    end
end
