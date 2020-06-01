$(function(){
  //예약 확인/취소 버튼 클릭 이벤트
  $(".tapBtn button").click(function(){
    $(".tapBtn button").removeClass("selected");
    $(this).addClass("selected");
    return false;
  });

  //월 선택 버튼 클릭 이벤트
  $(".monthBtn li").click(function(){
    $(".monthBtn li").removeClass("on");
    $(this).addClass("on");
    return false;
  });

  //moveTopBtn 클릭 이벤트
  var moveTop = $(".moveTopBtn");
  moveTop.click(function(){
    $('html, body').animate({
  		scrollTop : 0
  	}, 400);
  	return false;
  });

  //스크롤 이동 시 moveTopBtn 생성
  $(window).scroll(function() {
  	var scroll = $(this).scrollTop();
  	if (scroll > 300) {
      moveTop.addClass("on");
    }else{
      moveTop.removeClass("on");
    }
  });

  //상단배너 이벤트
  var visual = $('.itemBox>.item');
  var visualBtn = $(".thumbBox>.thumbNail");
  var count=0;

  function showVisual(index){
    if(index==visual.size()){index=0;}
    if(index<0){index=visual.size()-1;}
    if(count==visual.size()){count=0;}
    if(count<0){count=visual.size()-1;}
    visual.removeClass("on");
    visualBtn.removeClass("on");
    visual.eq(index).addClass("on");
    visualBtn.eq(index).addClass("on");

    bgColorChange(index);

    count=index;
  }

  if(!visual.eq(0).hasClass("on")){
    showVisual(0);
  }
  var setShowVisual;
  function auto_show_visual(){
    setShowVisual=setInterval(function(){
      count++;
      showVisual(count);
    }, 5000);
  }
  auto_show_visual();

  visual.on({
    mouseover:function(){
			clearInterval(setShowVisual);
		},mouseout:function(){
			auto_show_visual();
		}
  });

  $(".bannerBtm").on({
    mouseover:function(){
			clearInterval(setShowVisual);
		},mouseout:function(){
			auto_show_visual();
		}
  });

  function bgColorChange(index){
    var color="#"+visual.eq(index).attr("bg-color");
    $("#main #section01").css("background-color", color);
    if(color=="#000"){
      visual.eq(index).find('p').addClass("white");
    }
  }

  //배너 하단 이벤트
  visualBtn.click(function(){
    var index = $(this).index();
    showVisual(index);
    
    return false;
  });

  //화살표 이벤트
  $(".preBtn").click(function(){
    count--;
    showVisual(count);
    return false;
  });

  $(".nextBtn").click(function(){
    count++;
    showVisual(count);
    return false;
  });

  //검색 버튼 이벤트
  $(".searchBtn").click(function(){
    $(".searchBox").css("display", "block");
    return false;
  });

  $(".noShowBtn").click(function(){
    $(".searchBox").css("display", "none");
    return false;
  });
  
  //랭킹 버튼 이벤트
  $(".rankTab > a").click(function(){
       $(".rankTab > a").removeClass("on");
       $(this).addClass('on');
       return false;
  });
});
