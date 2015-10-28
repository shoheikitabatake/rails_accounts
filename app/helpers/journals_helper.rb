module JournalsHelper

  # 仕訳タイプ(資産/負債/収入/支出)からgetAccountFormDataを取得
  # @param [integer] account_type 勘定科目タイプ(資産/負債/収入/支出)
  # @return [array] view表示用のデータ
  def getAccountByType ( account_type )
    case account_type
    when Journal::ACCOUNT_TYPE_PROPERTY # 資産
      account = Property
      group = PropertyGroup
    when Journal::ACCOUNT_TYPE_DEBT # 負債
      account = Debt
      group = DebtGroup
    when Journal::ACCOUNT_TYPE_PROFIT # 収入
      account = Profit
      group = ProfitGroup
    when Journal::ACCOUNT_TYPE_LOSS # 支出
      account = Loss
      group = LossGroup
    else
      return nil
    end

    return getAccountFormData( group, account )
  end

  # view表示用のデータ整形
  # @param [class] group 勘定科目グループクラス
  # @param [class] account 勘定科目クラス
  # @return [array] view表示用のデータ
  def getAccountFormData ( group, account )
    list = Array.new

    account.where( user_id: User.current.id ).each do |f|
      if ! list[ f.group_id ]
        # グループidが最初に見つかったレコードの場合は初期化
        list[ f.group_id ] = [ group.find( f.group_id ).name, [] ]
      end

      # select-form用にidとnameを取得
      list[ f.group_id ][1].push [ f.name, f.id ]
    end

    return list.compact!
  end

end
