<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page contentType="text/html; charset=utf-8" %>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel="shortcut icon" href="<c:url value='../favicon.ico' />" > 
<link href="<c:url value='/resources/css/login.css' />" rel="stylesheet" type="text/css"/>
<title>ASK 경영연구소 입니다.</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function () {   
	$(".showpassword").each(function(index,input) {
	  var $input = $(input);
	  $("<p class='opt'/>").append(
			$("<input type='checkbox' class='showpasswordcheckbox' id='showPassword' />").click(function() {
				var change = $(this).is(":checked") ? "text" : "password";
				var rep = $("<input placeholder='Password' type='" + change + "' />")
									.attr("id", $input.attr("id"))
	              	.attr("name", $input.attr("name"))
	              	.attr('class', $input.attr('class'))
	              	.val($input.val())
	              	.insertBefore($input);
					$input.remove();
					$input = rep;
			})
	  ).append($("<label for='showPassword'/>").text("Show password")).insertAfter($input.parent());
	});

	$('#showPassword').click(function(){
		if($("#showPassword").is(":checked")) {
			$('.icon-lock').addClass('icon-unlock');
			$('.icon-unlock').removeClass('icon-lock');    
		} else {
			$('.icon-unlock').addClass('icon-lock');
			$('.icon-lock').removeClass('icon-unlock');
		}
	});	
	
	$("#memPw").keyup(function(event) {
		if(event.keyCode == "13") {
			$("#loginBtn").click();
		}
	});
	
	$("#loginBtn").unbind("click").bind("click", function() {
		
		var memId = $("#memId").val();
		var memPw = $("#memPw").val();
		
		if (!memId ) {
			alert("아이디를 입력해주세요.");
			return;
		} 
		if (!memPw) {
			alert("비밀번호를 입력해주세요.");
			return;
		} 
		if ($("#loginCheck").is(":checked")) {
			var expireDate;
      var cookieId = memId;
      expireDate = new Date;
      expireDate.setMonth(expireDate.getMonth()+6); // 6개월간 쿠키 저장하기 
      cookieId = memId;
      document.cookie = "memId="+cookieId+";expires=" + expireDate.toGMTString();    
		} else {
			var expireDate;
      var cookieId = memId;
      expireDate = new Date;
      expireDate.setMonth(expireDate.getMonth()-1); // 쿠키삭제
      cookieId = memId;
      document.cookie = "memId=;expires=" + expireDate.toGMTString();  
		}
		
		$("#frmLogin").attr("action", "../login/goLogin.do");
		$("#frmLogin").submit();
	});
});
</script>
</head>
<body>
	<div class="container">
		<section class="main">
			<form class="form-2" name="frmLogin" id="frmLogin" method="post">
				<div id="topInfo">
		    	<div class="welcomeLine">
			     	<font class="pointFontBL">A</font><font class="annoFont">ttitude,</font> 
			     	<font class="pointFontBL">S</font><font class="annoFont">kill,</font>
			     	<font class="pointFontBL">k</font><font class="annoFont">nowledge</font>
			     </div>
		    </div>
				<h1><span class="log-in">Log in</span></h1>
				<p class="float">
					<label for="login"><i class="icon-user"></i>User ID</label>
					<input type="text" name="memId" id="memId" placeholder="User ID">
				</p>
				<p class="float">
					<label for="password"><i class="icon-lock"></i>Password</label>
					<input type="password" name="memPw" id="memPw" placeholder="Password" class="showpassword">
				</p>
				<p class="clearfix"> 
					<input type='checkbox' class='loginCheck' id='loginCheck' />
					<a name="submit" class="submit" id="loginBtn">Log in</a>
				</p>
			</form>
		</section>
	</div>
</body>
</html>
 
