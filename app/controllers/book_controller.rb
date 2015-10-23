class BookController < ApplicationController
  def balance_sheet
    @property_groups = PropertyGroup.where( user_id: current_user.id )
    @debt_groups = DebtGroup.where( user_id: current_user.id )
  end

  def profit_loss_statement
  end
end
