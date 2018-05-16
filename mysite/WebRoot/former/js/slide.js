$(function(){
	var c=0;

	function run (){
		c++;
		c = (c==5)?0:c;
		$(".lunbo img").eq(c).stop().fadeIn(500).siblings("img").stop().fadeOut();
		$(".lunbo ul li").eq(c).css({'background':'#A10000'}).siblings('li').css({'background':'black'});
	}
	var timer = setInterval(run,2000);

	$(".lunbo ul li").mouseenter(function(){
		var t = $(this)
		clearInterval(timer);
		x = setTimeout(function(){
			c = t.index()
			$(".lunbo img").eq(c).stop().fadeIn(500).siblings("img").stop().fadeOut();
			$(".lunbo ul li").eq(c).css({'background':'#A10000'}).siblings('li').css({'background':'black'});			
		},200);		
	});

	$(".lunbo ul li").mouseleave(function(){
		clearTimeout(x);
		timer = setInterval(run,2000);
	});

	$(".box .left").click(function(){
		clearInterval(timer);
		$(".lunbo .left").index()
		c--;
		c = (c==-1)?4:c;
		$(".lunbo img").eq(c).stop().fadeIn(500).siblings("img").stop().fadeOut();
		$(".lunbo ul li").eq(c).css({'background':'#A10000'}).siblings('li').css({'background':'black'});		
		timer = setInterval(run,2000);	
	});

	$(".box .right").click(function(){
		clearInterval(timer);
		$(".lunbo .right").index()
		c++;
		c = (c==5)?0:c;
		$(".lunbo img").eq(c).stop().fadeIn(500).siblings("img").stop().fadeOut();
		$(".lunbo ul li").eq(c).css({'background':'#A10000'}).siblings('li').css({'background':'black'});
		timer = setInterval(run,2000);		
	});	

	$(".box").mouseenter(function(){
		$(".box .left").show();
		$(".box .right").show();
	});
	
	$(".box").mouseleave(function(){
		$(".box .left").hide();
		$(".box .right").hide();
	});	
})
