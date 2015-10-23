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
end
