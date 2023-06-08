/**
 * 
 */



	$(function(){
		
		//초기이미지
		$("#myimg").attr("src","../image/03.png");
		
		//이벤트
		$("#myimg").hover(function(){
			$(this).attr("src","../image/04.png");
		},function(){
			$(this).attr("src","../image/11.png");
		});
		
	});