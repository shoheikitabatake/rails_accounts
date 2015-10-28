class BookController < ApplicationController
  def balance_sheet
    @property_groups = PropertyGroup.where( user_id: current_user.id )
    @debt_groups = DebtGroup.where( user_id: current_user.id )
  end

  def profit_loss_statement
    @year = params['y'] ? params['y'].to_i : Date.today.year
    @month = params['m'] ? params['m'].to_i : Date.today.month
    journals = Journal.where(
      user_id: current_user.id,
      trade_date: Date.new( @year, @month, 1 )..Date.new( @year, @month, -1 )
    ).order("trade_date DESC")

    @profit_groups = ProfitGroup.where( user_id: User.current.id )
    @loss_groups = LossGroup.where( user_id: User.current.id )

    @profit_journal_data = view_context.getProfitJournalData( journals )
    @loss_journal_data = view_context.getLossJournalData( journals )
  end
end
