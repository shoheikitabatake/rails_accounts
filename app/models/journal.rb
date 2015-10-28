class Journal < ActiveRecord::Base

  # 仕訳タイプ
  JOURNAL_TYPE_PAY    = 1 # 支払
  JOURNAL_TYPE_INCOME = 2 # 収入
  JOURNAL_TYPE_LOAN   = 3 # 借入
  JOURNAL_TYPE_REPAY  = 4 # 返済
  JOURNAL_TYPE_MOVE   = 5 # 資産の移動
  JOURNAL_TYPE_PAYLOAN = 6 # 負債からの支払 TODO 支払と一緒にしたい

  # 勘定科目タイプ
  ACCOUNT_TYPE_PROPERTY = 1 # 資産
  ACCOUNT_TYPE_DEBT     = 2 # 負債
  ACCOUNT_TYPE_PROFIT   = 3 # 収入
  ACCOUNT_TYPE_LOSS     = 4 # 支出


  # 仕訳タイプ一覧
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

  # 仕訳タイプ名を取得
  # @param [integer] journal_type 仕訳タイプ(支払/借入/収入/返済)
  # @return [string] 仕訳タイプ名
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
  # @param [integer] journal_type 仕訳タイプ(支払/借入/収入/返済)
  # @return [integer] 勘定科目タイプ(資産/負債/収入/支出)
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
  # @param [integer] journal_type 仕訳タイプ(支払/借入/収入/返済)
  # @return [integer] 勘定科目タイプ(資産/負債/収入/支出)
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

  # 勘定科目テーブルを取得する
  # @param [integer] account_type 勘定科目タイプ(資産/負債/収入/支出)
  # @param [integer] account_id 勘定科目テーブルのid
  # @return [class] (資産/負債/収入/支出)クラス
  def getAccount ( account_type, account_id )
    case account_type
    when ACCOUNT_TYPE_PROPERTY # 資産
      return Property.find( account_id )
    when ACCOUNT_TYPE_DEBT # 負債
      return Debt.find( account_id )
    when ACCOUNT_TYPE_PROFIT # 収入
      return Profit.find( account_id )
    when ACCOUNT_TYPE_LOSS # 支出
      return Loss.find( account_id )
    else
      return nil
    end
  end

  # 勘定科目テーブルのstockの移動を行う
  # @param [boolean] is_cancel 取り消し仕訳かどうか
  def moveByjournal ( is_cancel = false )
   # 科目クラスを取得
    debit = getAccount( self.debit_type, self.debit_id )
    credit = getAccount( self.credit_type, self.credit_id )

    # 残高の変動値を計算
    debit_value = debit.isIncrease( true ) ? self.amount : self.amount * -1
    credit_value = credit.isIncrease( false ) ? self.amount : self.amount * -1

    # 逆仕訳
    if is_cancel
      debit_value *= -1
      credit_value *= -1
    end

    # 保存
    debit.stock += debit_value
    credit.stock += credit_value
    debit.save!
    credit.save!
  end

end
