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





  def getProfitData ( journals )
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
          list[profit.group_id][profit.id] = {
            "group_name" => profit_group.name,
            "name"       => profit.name,
            "pl"         => journal.amount * -1,
            "budget"     => profit.budget,
          }
        else
          list[profit.group_id][profit.id]["pl"] -= journal.amount
        end
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
          list[profit.group_id][profit.id] = {
            "group_name" => profit_group.name,
            "name"       => profit.name,
            "pl"         => journal.amount,
            "budget"     => profit.budget,
          }
        else
          list[profit.group_id][profit.id]["pl"] += journal.amount
        end
      end
    end
    return list
  end

  def getLossData ( journals )
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
          list[loss.group_id][loss.id] = {
            "group_name" => loss_group.name,
            "name"       => loss.name,
            "pl"         => journal.amount,
            "budget"     => loss.budget,
          }
        else
          list[loss.group_id][loss.id]["pl"] += journal.amount
        end
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
          list[loss.group_id][loss.id] = {
            "group_name" => loss_group.name,
            "name"       => loss.name,
            "pl"         => journal.amount * -1,
            "budget"     => loss.budget,
          }
        else
          list[loss.group_id][loss.id]["pl"] -= journal.amount
        end
      end
    end
    return list
  end

end
