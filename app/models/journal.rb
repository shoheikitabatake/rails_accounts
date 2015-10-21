class Journal < ActiveRecord::Base

  JOURNAL_TYPE_PAY    = 1 # 支払
  JOURNAL_TYPE_INCOME = 2 # 収入
  JOURNAL_TYPE_LOAN   = 3 # 借入
  JOURNAL_TYPE_REPAY  = 4 # 返済
  JOURNAL_TYPE_MOVE   = 5 # 資産の移動
  JOURNAL_TYPE_PAYLOAN = 6 # 負債からの支払 TODO 支払と一緒にしたい

  ACCOUNT_TYPE_PROPERTY = 1 # 資産
  ACCOUNT_TYPE_DEBT     = 2 # 負債
  ACCOUNT_TYPE_PROFIT   = 3 # 収入
  ACCOUNT_TYPE_LOSS     = 4 # 支出


  JOURNAL_TYPES = [
  # 支払
    # 借方 : 費用+
    # 貸方 : 資産-
  JOURNAL_TYPE_PAY,

  # 収入
    # 借方 : 資産+
    # 貸方 : 収入+
  JOURNAL_TYPE_INCOME,

  # 借入
    # 借方 : 資産+
    # 貸方 : 負債+
  JOURNAL_TYPE_LOAN,

  # 返済
    # 借方 : 負債-
    # 貸方 : 資産-
  JOURNAL_TYPE_REPAY,

  # 資産の移動
    # 借方 : 資産+
    # 貸方 : 資産-
  JOURNAL_TYPE_MOVE,

  # 負債からの支払
    # 借方 : 費用+
    # 貸方 : 負債+
  JOURNAL_TYPE_PAYLOAN
  ]

  def getJournalTypeName ( journal_type )
    case journal_type
    when JOURNAL_TYPE_PAY
      return t('helpers.titles.pay')
    when JOURNAL_TYPE_INCOME
      return t('helpers.titles.income')
    when JOURNAL_TYPE_LOAN
      return t('helpers.titles.loan')
    when JOURNAL_TYPE_REPAY
      return t('helpers.titles.repay')
    when JOURNAL_TYPE_MOVE
      return t('helpers.titles.move')
    when JOURNAL_TYPE_PAYLOAN
      return t('helpers.titles.payloan')
    else
      return nil
    end
  end

  # 借方項目のタイプを取得
  def getDebitType ( journal_type )
    case journal_type
    when JOURNAL_TYPE_INCOME, JOURNAL_TYPE_LOAN, JOURNAL_TYPE_MOVE # 資産
      return ACCOUNT_TYPE_PROPERTY
    when JOURNAL_TYPE_REPAY # 負債
      return ACCOUNT_TYPE_DEBT
    when JOURNAL_TYPE_PAY, JOURNAL_TYPE_PAYLOAN # 費用
      return ACCOUNT_TYPE_LOSS
    else
      return nil
    end
  end

  # 貸方項目のタイプを取得
  def getCreditType ( journal_type )
    case journal_type
    when JOURNAL_TYPE_PAY, JOURNAL_TYPE_REPAY, JOURNAL_TYPE_MOVE # 資産
      return ACCOUNT_TYPE_PROPERTY
    when JOURNAL_TYPE_LOAN, JOURNAL_TYPE_PAYLOAN # 負債
      return ACCOUNT_TYPE_DEBT
    when JOURNAL_TYPE_INCOME # 収入
      return ACCOUNT_TYPE_PROFIT
    else
      return nil
    end
  end

  def getAccountByType ( account_type )
    case account_type
    when ACCOUNT_TYPE_PROPERTY # 資産
      account = Property
      group = PropertyGroup
    when ACCOUNT_TYPE_DEBT # 負債
      account = Debt
      group = DebtGroup
    when ACCOUNT_TYPE_PROFIT # 収入
      account = Profit
      group = ProfitGroup
    when ACCOUNT_TYPE_LOSS # 支出
      account = Loss
      group = LossGroup
    else
      return nil
    end

    return getAccountFormData( group, account )
  end

  def getAccountFormData ( group, account )
    list = Array.new

    account.all.each do |f|
      if ! list[ f.group_id ]
        # グループidが最初に見つかったレコードの場合は初期化
        list[ f.group_id ] = [ group.find( f.group_id ).name, [] ]
      end

      # select-form用にidとnameを取得
      list[ f.group_id ][1].push [ f.name, f.id ]
    end

    return list.compact!
  end

  def getAccountType ( account_type, account_id )
    case account_type
    when ACCOUNT_TYPE_PROPERTY # 資産
      return Property.find( account_id ).name
    when ACCOUNT_TYPE_DEBT # 負債
      return Debt.find( account_id ).name
    when ACCOUNT_TYPE_PROFIT # 収入
      return Profit.find( account_id ).name
    when ACCOUNT_TYPE_LOSS # 支出
      return Loss.find( account_id ).name
    else
      return nil
    end
  end

end
