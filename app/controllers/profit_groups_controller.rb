class ProfitGroupsController < ApplicationController
  before_action :set_profit_group, only: [:show, :edit, :update, :destroy]

  # GET /profit_groups
  # GET /profit_groups.json
  def index
    @profit_groups = ProfitGroup.all
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
        format.html { redirect_to @profit_group, notice: 'Profit group was successfully created.' }
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
        format.html { redirect_to @profit_group, notice: 'Profit group was successfully updated.' }
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
      format.html { redirect_to profit_groups_url, notice: 'Profit group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profit_group
      @profit_group = ProfitGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profit_group_params
      params.require(:profit_group).permit(:user_id, :name)
    end
end
