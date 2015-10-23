class BookController < ApplicationController
  def balance_sheet
    @properties = Property.where( user_id: current_user.id )
    @debts = Debt.where( user_id: current_user.id )
  end

  def profit_loss_statement
  end
end
