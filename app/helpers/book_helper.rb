module BookHelper
  # color, hightlightのパターンを取得
  # @params [integer] order 何番目か
  # @return [array]
  def getColorPattern ( order )
    patterns = {
      1 => {# 赤
        "color" => "#C7243A",
        "highlight" => "#ECACB5",
      },
      2 => {# 黄色
        "color" => "#F3C759",
        "highlight" => "#F9E3AA",
      },
      3 => {# 黄緑
        "color" => "#A4C520",
        "highlight" => "#DFECAA",
      },
      4 => {# 緑
        "color" => "#009250",
        "highlight" => "#91DBB9",
      },
      5 => {# 青
        "color" => "#0086AB",
        "highlight" => "#97D3E3",
      },
      6 => {# 紺
        "color" => "#3261AB",
        "highlight" => "#D5E0F1",
      },
      7 => {# 紫
        "color" => "#5D639E",
        "highlight" => "#BFC2DF",
      },
    }

    if patterns.has_key?( order )
      return patterns[order]
    else
      return patterns[patterns.length]
    end
  end

  # 取引履歴から収益項目の指定グループIDの取引額合計を取得する
  # @params [Integer] group_id
  # @return [Integer]
  def getSumProfitAmount ( group_id )
    sum = 0
    return sum if ! @profit_journal_data.has_key?( group_id )

    @profit_journal_data[group_id].each do | key, profit_amount |
      sum += profit_amount
    end

    return sum
  end

  # 取引履歴から収益項目の指定IDの取引額を取得する
  # @params [Integer] group_id
  # @return [Integer]
  def getProfitAmount ( group_id, profit_id )
    return 0 if ( ! @profit_journal_data.has_key?( group_id ) || ! @profit_journal_data[group_id].has_key?( profit_id ) )
    return @profit_journal_data[group_id][profit_id]
  end

  # 取引履歴から支出項目の指定グループIDの取引額合計を取得する
  # @params [Integer] group_id
  # @return [Integer]
  def getSumLossAmount ( group_id )
    sum = 0
    return sum if ! @loss_journal_data.has_key?( group_id )

    @loss_journal_data[group_id].each do | key, loss_amount |
      sum += loss_amount
    end

    return sum
  end

  # 取引履歴から支出項目の指定IDの取引額を取得する
  # @params [Integer] group_id
  # @return [Integer]
  def getLossAmount ( group_id, loss_id )
    return 0 if ( ! @loss_journal_data.has_key?( group_id ) || ! @loss_journal_data[group_id].has_key?( loss_id ) )
    return @loss_journal_data[group_id][loss_id]
  end

  # 取引履歴の収益項目を[費目][科目]の形で整形
  # @params [ActiveRecord] journals
  # @return [Hash] [費目name][科目id] = journal.amount
  def getProfitJournalData ( journals )
    list = Hash.new { |h,k| h[k] = {} }

    journals.each do | journal |
      # 借方の処理
      if journal.debit_type == Journal::ACCOUNT_TYPE_PROFIT
        # 収入
        profit = Profit.find( journal.debit_id )
        profit_group = ProfitGroup.find( profit.group_id )

        if ! list[profit.group_id]
          list[profit.group_id] = {
            profit.id => {}
          }
        end

        if ! list[profit.group_id][profit.id]
          list[profit.group_id][profit.id] = 0
        end

        list[profit.group_id][profit.id] -= journal.amount
      end

      # 貸方の処理
      if journal.credit_type == Journal::ACCOUNT_TYPE_PROFIT
        # 収入
        profit = Profit.find( journal.credit_id )
        profit_group = ProfitGroup.find( profit.group_id )

        if ! list[profit.group_id]
          list[profit.group_id] = {
            profit.id => {}
          }
        end

        if ! list[profit.group_id][profit.id]
          list[profit.group_id][profit.id] = 0
        end
        list[profit.group_id][profit.id] += journal.amount
      end
    end
    return list
  end

  # 取引履歴の費用項目を[費目][科目]の形で整形
  # @params [ActiveRecord] journals
  # @return [Hash] [費目name][科目id] = journal.amount
  def getLossJournalData ( journals )
    list = Hash.new { |h,k| h[k] = {} }

    journals.each do | journal |
      # 借方の処理
      if journal.debit_type == Journal::ACCOUNT_TYPE_LOSS
        # 支出
        loss = Loss.find( journal.debit_id )
        loss_group = LossGroup.find( loss.group_id )

        if ! list[loss.group_id]
          list[loss.group_id] = {
            loss.id => {}
          }
        end

        if ! list[loss.group_id][loss.id]
          list[loss.group_id][loss.id] = 0
        end

        list[loss.group_id][loss.id] += journal.amount
      end

      # 貸方の処理
      if journal.credit_type == Journal::ACCOUNT_TYPE_LOSS
        # 支出
        loss = Loss.find( journal.credit_id )
        loss_group = LossGroup.find( loss.group_id )

        if ! list[loss.group_id]
          list[loss.group_id] = {
            loss.id => {}
          }
        end

        if ! list[loss.group_id][loss.id]
          list[loss.group_id][loss.id] = 0
        end

        list[loss.group_id][loss.id] -= journal.amount
      end
    end
    return list
  end

end
