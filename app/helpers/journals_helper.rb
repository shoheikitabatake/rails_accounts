module JournalsHelper

  # 現在年から+-2年分の年を表示
  # ex 2013 | 2014 | 2015 | 2016 | 2017
  def setYears ( selected_year )
    now_year = Date.today.year

    html = ""

    ( -2..2 ).each do | add_years |
      tmp_year = now_year + add_years
      btn_class = ( selected_year == tmp_year ) ? "btn btn-primary btn-xs" : "";

      html += link_to tmp_year, journals_path( y: tmp_year ), :class => btn_class

      if ( -2..2 ).last != add_years
        html += " | "
      end
    end

    html.html_safe
  end

  # 全月数を表示
  def setMonths ( selected_year, selected_month )
    html = ""


    ( 1..12 ).each do | tmp_month |
      btn_class = ( selected_month == tmp_month ) ? "btn btn-primary btn-xs" : "";

      html += link_to tmp_month, journals_path( y: selected_year, m: tmp_month ), :class => btn_class

      if ( 1..12 ).last != tmp_month
        html += " | "
      end
    end

    html.html_safe
  end

end
