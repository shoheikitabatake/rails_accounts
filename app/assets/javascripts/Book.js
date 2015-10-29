// doughnutグラフを描画
// eventhandlerの設定 TODO できれば別関数にしたいけどreadyで二つ呼ぶのしんどい
// @params [array] data chart用のデータ配列。複数コール可
function initCanvasDoughnut() {
  var option = {
    showTooltips: true,
    onAnimationComplete: function(){ this.showTooltip(this.segments, true); },
  };

  // Canvasに描画 * 要素のidをcanvas+数値(インクリメント)とすること・・・
  for ( var i=1; i <= arguments.length; i++ ) {
    new Chart( document.getElementById("canvas"+i).getContext( "2d" ) ).Doughnut( arguments[i-1], option );
  }

  // アコーディオンの設定
  $( ".accordion-parent" ).click(function () {
    $( this ).attr( 'data-href' );
  });
}

