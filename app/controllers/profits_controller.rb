class ProfitsController < ApplicationController
  before_action :set_profit, only: [:show, :edit, :update, :destroy]
  before_action :set_property_group, only: [:new, :edit]
  before_action :validate_is_group, only: [:new, :edit]

  # GET /profits
  # GET /profits.json
  def index
    @profits = Profit.where( user_id: current_user.id ).order( :group_id )
  end

  # GET /profits/1
  # GET /profits/1.json
  def show
  end

  # GET /profits/new
  def new
    @profit = Profit.new
  end

  # GET /profits/1/edit
  def edit
  end

  # POST /profits
  # POST /profits.json
  def create
    @profit = Profit.new(profit_params)

    respond_to do |format|
      if @profit.save
        format.html { redirect_to profits_path, notice: '登録しました。' }
        format.json { render :show, status: :created, location: @profit }
      else
        format.html { render :new }
        format.json { render json: @profit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profits/1
  # PATCH/PUT /profits/1.json
  def update
    respond_to do |format|
      if @profit.update(profit_params)
        format.html { redirect_to profits_path, notice: '更新しました。' }
        format.json { render :show, status: :ok, location: @profit }
      else
        format.html { render :edit }
        format.json { render json: @profit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profits/1
  # DELETE /profits/1.json
  def destroy
    @profit.destroy
    respond_to do |format|
      format.html { redirect_to profits_url, notice: '削除しました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profit
      @profit = Profit.find(params[:id])

      # user_idが一致しているかチェック
      if is_invalid_user? ( @profit.user_id )
        redirect_to root_path
      end
    end

    def set_property_group
      @profit_group = ProfitGroup.where( user_id: current_user.id )
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profit_params
      params.require(:profit).permit(:user_id, :group_id, :name, :budget, :stock)
    end

    def validate_is_group
      # 費目未登録の場合
      redirect_to new_profit_group_path, notice: "費目の登録を行ってください。" if @profit_group.empty?
    end
end
