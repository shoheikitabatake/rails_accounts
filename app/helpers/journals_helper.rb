module JournalsHelper

  # 現在年から+-2年分の年を表示
  # ex 2013 | 2014 | 2015 | 2016 | 2017
  def setYears
    now_year = Date.today.year

    html = ""

    ( -2..2 ).each do | add_years |
      tmp_year = now_year + add_years

      html += link_to tmp_year, journals_path( y: tmp_year )

      if ( -2..2 ).last != add_years
        html += " | "
      end
    end

    html.html_safe
  end

  # 全月数を表示
  def setMonths ( now_year )
    html = ""

    ( 1..12 ).each do | tmp_month |
      html += link_to tmp_month, journals_path( y: now_year, m: tmp_month )

      if ( 1..12 ).last != tmp_month
        html += " | "
      end
    end

    html.html_safe
  end

end
