module ApplicationHelper

  # path_type
  PATH_TYPE_JOURNAL = 1 # 取引履歴
  PATH_TYPE_PL      = 2 # 収支

  # 現在年から+-2年分の年を表示
  # @params [integer] selected_year 選択中の年数
  # @params [integer] path_type 取引履歴か収支か
  # ex 2013 | 2014 | 2015 | 2016 | 2017
  def setYears ( selected_year, path_type )
    now_year = Date.today.year

    html = ""

    ( -2..2 ).each do | add_years |
      tmp_year = now_year + add_years
      btn_class = ( selected_year == tmp_year ) ? "btn btn-primary btn-xs" : "";

      if path_type == ApplicationHelper::PATH_TYPE_JOURNAL
        html += link_to tmp_year, journals_path( y: tmp_year ), :class => btn_class
      elsif path_type == ApplicationHelper::PATH_TYPE_PL
        html += link_to tmp_year, book_profit_loss_statement_path( y: tmp_year ), :class => btn_class
      end

      if ( -2..2 ).last != add_years
        html += " | "
      end
    end

    html.html_safe
  end

  # 全月数を表示
  # @params [integer] selected_year 選択中の年数
  # @params [integer] selected_month 選択中の月数
  # @params [integer] path_type 取引履歴か収支か
  def setMonths ( selected_year, selected_month, path_type )
    html = ""

    ( 1..12 ).each do | tmp_month |
      btn_class = ( selected_month == tmp_month ) ? "btn btn-primary btn-xs" : "";

      if path_type == ApplicationHelper::PATH_TYPE_JOURNAL
        html += link_to tmp_month, journals_path( y: selected_year, m: tmp_month ), :class => btn_class
      elsif path_type == ApplicationHelper::PATH_TYPE_PL
        html += link_to tmp_month, book_profit_loss_statement_path( y: selected_year, m: tmp_month ), :class => btn_class
      end

      if ( 1..12 ).last != tmp_month
        html += " | "
      end
    end

    html.html_safe
  end

end
