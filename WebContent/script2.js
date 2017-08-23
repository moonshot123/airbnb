

var isCheck=false;
var use; 
var isChange = false;

$(function(){
	
	$("input[name='h_id']").keydown(function() {
    	isChange = true;
    	use="";
    	$('#idmessage').css("display","none");
    	var isCheck=false;
	});
});
                                                  

function check_reg() {//회원가입 유효성검사
	

	if($("input[name='h_name']").val()==""){
		alert("이름을 입력해주세요");
		return false;
	}
	
	if($('input[name="h_id"]').val()==""){
		alert("아이디를 입력하세요.");
		$('input[name="h_id"]').focus();
		isChange = false;
		return false;
	}
	if(use=="impossible"){
		alert("이미 사용중인 아이디입니다.");
		return false;
	}
	
	if(isCheck==false || isChange == true){
		alert("중복체크 하세요.");
		return false;
	}
	
	if($("input[name='password']").val()==""){
		alert("비밀번호를 입력해주세요");
		return false;
	}
	if($("input[name='password_ch']").val()==""){
		alert("비밀번호확인을 입력해주세요");
		return false;
	}
	
	if($("input[name='h_email']").val()==""){
		alert("이메일을 입력하세요");
		return false;
	}
	
}//check_reg()


function duplicate() {//중복체크
	
	alert("id_check");
	isCheck=true;
	alert($("input[name=h_id]").val()); //여기까지는 값이간다.
	
	
	
	
	$.ajax({
     url: "id_check_proc2.jsp", //아이디 중복체크할 페이지 지정
     
     data : ({
     	 h_id: $("input[name='h_id']").val() 
     }),
     success: function (data){ //data=NO YES
       if ($('input[name="h_id"]').val()==""){
     	   $('#idmessage').html("<font color=red>id 입력 누락</font>");
           $('#idmessage').show();
           alert("id 입력 누락");
       }
       else if (jQuery.trim(data)=='YES'){ 
          $('#idmessage').html("<font color=red>사용 가능합니다.</font>");
          $('#idmessage').show(); 
          use = "possible";
          isChange = false;
          alert("id 사용 가능합니다");
        }else{
        	$('#idmessage').html("<font color=red>이미 사용중인 아이디입니다.</font>");
        	$('#idmessage').show();                
        	use = "impossible";
        }
       } // success의 끝
    });//ajax()의 끝
	
	
}//duplicate()



function passwd_keyup(){
	if($("input[name=h_password]").val() == $("input[name=h_password_check]").val()){
		$('#pwmessage').html("<font color=red>비번 일치</font>");
		$('#pwmessage').show();
		$('input[name=xxx]').val("YES");
	}
	else{
		$('#pwmessage').html("<font color=red>비번 불일치</font>");
		$('#pwmessage').show();
		$('input[name=xxx]').val("NO");
	}
}//login_check()




function ch_date(){//예약
	
	if($("input[id='h_id']").val() == "null" ){
		alert("로그인을 먼저 해주세요.");
		return false;
	}
	//디테일 파일에서 세션에 h_id로 저장할때 String 파일로 저장되면서 문자 그대로 null로 저장된것같다. 
	//그래서 이건 그냥 null이 아니고 문자로 null이라는 뜻이 되버린것 같다.
	
	if($("input[name=checkin_date]").val() == "" ){
		alert("체크인 날자를 지정해주세요");
		return false;
	}
	
	if( $("input[name=checkout_date]").val() == ""){
		alert("체크아웃날자를 지정해주세요");
		return false;
	}
	
	
	
}//ch_date()




function post(){
	
	if($("input[name='h_post']").val()==""){
		alert("후기를 입력해주세요");
		return false;
	}
	
}//post()






function initMap() {//구글맵api 
	
  var i=0;
  
  var a1 = {lat: 37.5000, lng: 126.986};  //강남
  var b1 = {lat: 37.5320, lng: 127.0775}; //건대
  var c1 = {lat: 37.5594793, lng: 126.9435837999999}; //신촌
  var d1 = {lat: 37.5729503, lng: 126.979357899999}; //종로
  var e1 = {lat: 37.5000, lng: 127.04732580000007}; //강남
  var f1 = {lat: 37.6541917, lng: 127.05679299};  //노원
  var g1 = {lat: 37.5594, lng: 126.943583};  //신촌
  var h1 = {lat: 37.543, lng: 127.06826};	//건대 
  var i1 = {lat: 37.65, lng: 127.056792};	//노원
  var j1 = {lat: 37.5729503, lng: 126.97935789999997};	//종로
  
  var a2 = {lat: 37.5000, lng: 126.986};
  var b2 = {lat: 37.5594793, lng: 126.9435837999999};
  var c2 = {lat: 37.5594793, lng: 126.943583799999};
  var d2 = {lat: 37.5729503, lng: 126.979357899999};
  var e2 = {lat: 37.5000, lng: 127.04732580000007};
  var f2 = {lat: 37.6541917, lng: 127.05679299};
  var g2 = {lat: 37.5594, lng: 126.943583};
  var h2 = {lat: 37.543, lng: 127.06826};
  var i2 = {lat: 37.65, lng: 127.056792};
  var j2 = {lat: 37.5, lng: 126.9793};
  
  var a3 = {lat: 37.5000, lng: 126.986};  
  var b3 = {lat: 37.5320, lng: 127.0775}; 
  var c3 = {lat: 37.5594793, lng: 126.9435837999999}; 
  var d3 = {lat: 37.5729503, lng: 126.979357899999}; 
  var e3 = {lat: 37.5000, lng: 127.04732580000007}; 
  var f3 = {lat: 37.6541917, lng: 127.05679299};  
  var g3 = {lat: 37.5594, lng: 126.943583};  
  var h3 = {lat: 37.543, lng: 127.06826};	
  var i3 = {lat: 37.65, lng: 127.056792};	
  var j3 = {lat: 37.5729503, lng: 126.97935789999997};	
  
  var a4 = {lat: 37.5000, lng: 126.980};
  var b4 = {lat: 37.5320, lng: 127.0475};
  var c4 = {lat: 37.5594793, lng: 126.9435837999999};
  var d4 = {lat: 37.5729503, lng: 126.979357899999};
  var e4 = {lat: 37.5000, lng: 127.04732580000007};
  var f4 = {lat: 37.6541917, lng: 127.05679299};
  var g4 = {lat: 37.5594, lng: 126.943583};
  var h4 = {lat: 37.543, lng: 127.06826};
  var i4 = {lat: 37.5000, lng: 127.04732580001007};
  var j4 = {lat: 37.5, lng: 126.9793};
  
  var a5 = {lat: 37.5000, lng: 126.986};  
  var b5 = {lat: 37.5320, lng: 127.0775}; 
  var c5 = {lat: 37.5594793, lng: 126.9435837999999}; 
  var d5 = {lat: 37.5729503, lng: 126.979357899999}; 
  var e5 = {lat: 37.5000, lng: 127.04732580000007}; 
  var f5 = {lat: 37.5000, lng: 126.986};  
  var g5 = {lat: 37.5594, lng: 126.943583};  
  var h5 = {lat: 37.543, lng: 127.06826};	
  var i5 = {lat: 37.65, lng: 127.056792};	
  var j5 = {lat: 37.5729503, lng: 126.97935789999997};	
  
  
  if($("input[name='s_id']").val()=="a1"){
	  suk = a1;
	  
  }else if($("input[name='s_id']").val()=="b1"){
	  suk = b1;
	  
  }else if($("input[name='s_id']").val()=="c1"){
	  suk = c1;
	  
  }else if($("input[name='s_id']").val()=="d1"){
	  suk = d1;
	  
  }else if($("input[name='s_id']").val()=="e1"){
	  suk = e1;
	  
  }else if($("input[name='s_id']").val()=="f1"){
	  suk = f1;
  }else if($("input[name='s_id']").val()=="g1"){
	  suk = g1;
	  
  }else if($("input[name='s_id']").val()=="h1"){
	  suk = h1;
	  
  }else if($("input[name='s_id']").val()=="i1"){
	  suk = i1;
	  
  }else if($("input[name='s_id']").val()=="j1"){
	  suk = j1;
	  
  }
  
  else if($("input[name='s_id']").val()=="a2"){
	  suk = a2;
	  
  }else if($("input[name='s_id']").val()=="b2"){
	  suk = b2;
	  
  }else if($("input[name='s_id']").val()=="c2"){
	  suk = c2;
	  
  }else if($("input[name='s_id']").val()=="d2"){
	  suk = d2;
	  
  }else if($("input[name='s_id']").val()=="e2"){
	  suk = e2;
  }else if($("input[name='s_id']").val()=="f2"){
	  suk = f2;
	  
  }else if($("input[name='s_id']").val()=="g2"){
	  suk = g2;
	  
  }else if($("input[name='s_id']").val()=="h2"){
	  suk = h2;
	  
  }else if($("input[name='s_id']").val()=="i2"){
	  suk = i2;
	  
  }else if($("input[name='s_id']").val()=="j2"){
	  suk = j2;
	  
  }
  
  else if($("input[name='s_id']").val()=="a3"){
	  suk = a3;
	  
  }else if($("input[name='s_id']").val()=="b3"){
	  suk = b3;
	  
  }else if($("input[name='s_id']").val()=="c3"){
	  suk = c3;
	  
  }else if($("input[name='s_id']").val()=="d3"){
	  suk = d3;
	  
  }else if($("input[name='s_id']").val()=="e3"){
	  suk = e3;
	  
  }else if($("input[name='s_id']").val()=="f3"){
	  suk = f3;
	  
  }else if($("input[name='s_id']").val()=="g3"){
	  suk = g3;
	  
  }else if($("input[name='s_id']").val()=="h3"){
	  suk = h3;
	  
  }else if($("input[name='s_id']").val()=="i3"){
	  suk = i3;
	  
  }else if($("input[name='s_id']").val()=="j3"){
	  suk = j3;
	  
  }
  
  else if($("input[name='s_id']").val()=="a4"){
	  suk = a4;
	  
  }else if($("input[name='s_id']").val()=="b4"){
	  suk = b4;
	  
  }else if($("input[name='s_id']").val()=="c4"){
	  suk = c4;
	  
  }else if($("input[name='s_id']").val()=="d4"){
	  suk = d4;
	  
  }else if($("input[name='s_id']").val()=="e4"){
	  suk = e4;
	  
  }else if($("input[name='s_id']").val()=="f4"){
	  suk = f4;
	  
  }else if($("input[name='s_id']").val()=="g4"){
	  suk = g4;
	  
  }else if($("input[name='s_id']").val()=="h4"){
	  suk = h4;
	  
  }else if($("input[name='s_id']").val()=="i4"){
	  suk = i4;
	  
  }else if($("input[name='s_id']").val()=="j4"){
	  suk = j4;
	  
  }
  
  else if($("input[name='s_id']").val()=="a5"){
	  suk = a5;
	  
  }else if($("input[name='s_id']").val()=="b5"){
	  suk = b5;
	  
  }else if($("input[name='s_id']").val()=="c5"){
	  suk = c5;
	  
  }else if($("input[name='s_id']").val()=="d5"){
	  suk = d5;
	  
  }else if($("input[name='s_id']").val()=="e5"){
	  suk = e5;
	  
  }else if($("input[name='s_id']").val()=="f5"){
	  suk = f5;
	  
  }else if($("input[name='s_id']").val()=="g5"){
	  suk = g5;
	  
  }else if($("input[name='s_id']").val()=="h5"){
	  suk = h5;
	  
  }else if($("input[name='s_id']").val()=="i5"){
	  suk = i5;
	  
  }else if($("input[name='s_id']").val()=="j5"){
	  suk = j5;
  }
  
  
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 14,
    center: suk
  });
  
  var marker = new google.maps.Marker({
		    position: suk,
		    map: map
  });
 
 
}//initMap()



