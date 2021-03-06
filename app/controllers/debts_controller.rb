class DebtsController < ApplicationController
  before_action :set_debt, only: [:show, :edit, :update, :destroy]
  before_action :set_property_group, only: [:new, :edit]
  before_action :validate_is_group, only: [:new, :edit]

  # GET /debts
  # GET /debts.json
  def index
    @debts = Debt.where( user_id: current_user.id ).order( :group_id )
  end

  # GET /debts/1
  # GET /debts/1.json
  def show
  end

  # GET /debts/new
  def new
    @debt = Debt.new
  end

  # GET /debts/1/edit
  def edit
  end

  # POST /debts
  # POST /debts.json
  def create
    @debt = Debt.new(debt_params)

    respond_to do |format|
      if @debt.save
        format.html { redirect_to debts_path, notice: '登録しました。' }
        format.json { render :show, status: :created, location: @debt }
      else
        format.html { render :new }
        format.json { render json: @debt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /debts/1
  # PATCH/PUT /debts/1.json
  def update
    respond_to do |format|
      if @debt.update(debt_params)
        format.html { redirect_to debts_path, notice: '更新しました。' }
        format.json { render :show, status: :ok, location: @debt }
      else
        format.html { render :edit }
        format.json { render json: @debt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /debts/1
  # DELETE /debts/1.json
  def destroy
    @debt.destroy
    respond_to do |format|
      format.html { redirect_to debts_url, notice: '削除しました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debt
      @debt = Debt.find(params[:id])

      # user_idが一致しているかチェック
      if is_invalid_user? ( @debt.user_id )
        redirect_to root_path
      end
    end

    def set_property_group
      @debt_group = DebtGroup.where( user_id: current_user.id )
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def debt_params
      params.require(:debt).permit(:user_id, :group_id, :name, :stock)
    end

    def validate_is_group
      # 費目未登録の場合
      redirect_to new_debt_group_path, notice: "費目の登録を行ってください。" if @debt_group.empty?
    end
end
