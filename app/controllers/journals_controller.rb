class JournalsController < ApplicationController
  before_action :set_journal, only: [:show, :edit, :update, :destroy]

  # GET /journals
  # GET /journals.json
  def index
    @year = params['y'] ? params['y'].to_i : Date.today.year
    @month = params['m'] ? params['m'].to_i : Date.today.month
    @journals = Journal.where(
      user_id: current_user.id,
      trade_date: Date.new( @year, @month, 1 )..Date.new( @year, @month, -1 )
    ).order("trade_date DESC")
  end

  # GET /journals/1
  # GET /journals/1.json
  def show
  end

  # GET /journals/new
  def new
    @journal = Journal.new
    @journal_type = params['t'].to_i
    @debit_type = @journal.getDebitType( @journal_type )
    @credit_type = @journal.getCreditType( @journal_type )
    @debits = @journal.getAccountByType( @debit_type )
    @credits = @journal.getAccountByType( @credit_type )

    # 科目未登録の場合
    redirect_to setting_index_path, notice: "まずは設定を行ってください。" if ( ! @debits || ! @credits )
  end

  # GET /journals/1/edit
  def edit
    @debit_type = @journal.debit_type
    @credit_type = @journal.credit_type
    @debits = @journal.getAccountByType( @debit_type )
    @credits = @journal.getAccountByType( @credit_type )
  end

  # POST /journals
  # POST /journals.json
  def create
    @journal = Journal.new(journal_params)
    respond_to do |format|
      if @journal.save
        # stockを増減させる
        @journal.moveByjournal

        format.html { redirect_to @journal, notice: 'Journal was successfully created.' }
        format.json { render :show, status: :created, location: @journal }
      else
        format.html { render :new }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /journals/1
  # PATCH/PUT /journals/1.json
  def update
    respond_to do |format|
      # 変更前の分を逆仕訳する
      @journal.moveByjournal( true )
      if @journal.update(journal_params)
        format.html { redirect_to @journal, notice: 'Journal was successfully updated.' }
        format.json { render :show, status: :ok, location: @journal }
      else
        format.html { render :edit }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
      end
      @journal.moveByjournal
    end
  end

  # DELETE /journals/1
  # DELETE /journals/1.json
  def destroy
    @journal.destroy
    respond_to do |format|
      format.html { redirect_to journals_url, notice: 'Journal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journal
      @journal = Journal.find(params[:id])

      # user_idが一致しているかチェック
      if is_invalid_user? ( @journal.user_id )
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def journal_params
      params['journal'].store('debit_id', params['debit_id'])
      params['journal'].store('credit_id', params['credit_id'])

      params
        .require(:journal)
        .permit(:user_id, :debit_type, :debit_id, :credit_type, :credit_id, :amount, :trade_date, :memo)
    end
end
