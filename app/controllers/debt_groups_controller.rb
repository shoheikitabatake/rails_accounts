class DebtGroupsController < ApplicationController
  before_action :set_debt_group, only: [:show, :edit, :update, :destroy]

  # GET /debt_groups
  # GET /debt_groups.json
  def index
    @debt_groups = DebtGroup.all
  end

  # GET /debt_groups/1
  # GET /debt_groups/1.json
  def show
  end

  # GET /debt_groups/new
  def new
    @debt_group = DebtGroup.new
  end

  # GET /debt_groups/1/edit
  def edit
  end

  # POST /debt_groups
  # POST /debt_groups.json
  def create
    @debt_group = DebtGroup.new(debt_group_params)

    respond_to do |format|
      if @debt_group.save
        format.html { redirect_to @debt_group, notice: 'Debt group was successfully created.' }
        format.json { render :show, status: :created, location: @debt_group }
      else
        format.html { render :new }
        format.json { render json: @debt_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /debt_groups/1
  # PATCH/PUT /debt_groups/1.json
  def update
    respond_to do |format|
      if @debt_group.update(debt_group_params)
        format.html { redirect_to @debt_group, notice: 'Debt group was successfully updated.' }
        format.json { render :show, status: :ok, location: @debt_group }
      else
        format.html { render :edit }
        format.json { render json: @debt_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /debt_groups/1
  # DELETE /debt_groups/1.json
  def destroy
    @debt_group.destroy
    respond_to do |format|
      format.html { redirect_to debt_groups_url, notice: 'Debt group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debt_group
      @debt_group = DebtGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def debt_group_params
      params.require(:debt_group).permit(:user_id, :name)
    end
end