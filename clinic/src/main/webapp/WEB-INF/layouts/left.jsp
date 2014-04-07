<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">

var map={"M_SALES":true, "M_COST":true, "M_REPORT":true, "M_DATA":true, "M_STATS":true};

	function leftMenuOnOff() {
		$("#M_SALES").unbind("click").bind("click", function () {
			slide_menu ('M_SALES', 'SALES');
		});
		$("#M_COST").unbind("click").bind("click", function () {
			slide_menu ('M_COST', 'COST');
		});
		$("#M_REPORT").unbind("click").bind("click", function () {
			slide_menu ('M_REPORT', 'REPORT');
		});
		$("#M_DATA").unbind("click").bind("click", function () {
			slide_menu ('M_DATA', 'DATA');
		});
		$("#M_STATS").unbind("click").bind("click", function () {
			slide_menu ('M_STATS', 'STATS');
		});
	}; 
	
	function slide_menu (title_nm, menu_nm) {
		if(map[title_nm] == false) {
		 	$("#S_"+menu_nm+"").show("blind", { direction: "vertical" }, 300);
		 	$("#TOGGLE_"+menu_nm+"").removeClass('ui-icon-triangle-1-e').addClass('ui-icon-triangle-1-s');
		 	map[title_nm] = true;
		} else {
	    $("#S_"+menu_nm+"").hide("blind", { direction: "vertical" }, 300);
	    $("#TOGGLE_"+menu_nm+"").removeClass('ui-icon-triangle-1-s').addClass('ui-icon-triangle-1-e');
	    map[title_nm] = false;
		}
	}
	
	function menuOnclick (main, sub) {
		window.location.href= main+"/"+sub+".do";
	}
	
	$(document).ready(function () {
		leftMenuOnOff();
	});
</script>
</head>

<body>
<!-- Left 영역 [include : include/Left.jsp] -->
<div id="leftwrap">
	<div id="leftInfo">
	 	<div class="ciLine">
	  	<font class="pointFontBL"><%=session.getAttribute("sessionCompany")%></font><br/><br/>
	  	<font class="annoFontBL"><%=session.getAttribute("sessionNm")%></font>님 반갑습니다.
	  </div>
	</div>
	<nav id="left">
		<div class="nav">
			<div class="menuDiv">
				<p class="menuP" id="M_ISSUE"><span class="ui-icon ui-icon-triangle-1-e"></span><a href="/notice/notice.do">TODAY ISSUE</a></p>
				<c:if test="${sessionScope.sessionAuth == 'AUTH0001'}">
				<p class="menuP" id="M_ADMIN"><span class="ui-icon ui-icon-triangle-1-e"></span><a href="/clinic/clinicList.do">병원관리</a></p>
				<div id="S_ADMIN" class="subDiv">
					<a class="subA" href="/clinic/clinicList.do">· 병원관리</a>
	        <a class="subA" href="/member/memberList.do">· 회원관리</a>
				</div>
				</c:if>
				<p class="menuP" id="M_CUSTOMER"><span class="ui-icon ui-icon-triangle-1-e"></span><a href="javascript:;">고객관리</a></p>
				<p class="menuP" id="M_SALES"><span id="TOGGLE_SALES" class="ui-icon ui-icon-triangle-1-s"></span><a href="/sales/salesList.do">매출관리</a></p>
				<div id="S_SALES" class="subDiv">
					<a class="subA" href="/sales/salesList.do">· 결제유형별 매출관리</a>
					<a class="subA" href="/sales/salesList.do">· 진료유형별 매출관리</a>
	        <a class="subA" href="javascript:;">· 미수금 관리</a>
	        <a class="subA" href="javascript:;">· 매출 보고서</a>
        	<div class="detailDiv">
        		<a class="detailA" href="javascript:;">- 일일 보고서</a>
        		<a class="detailA" href="javascript:;">- 주간 보고서</a>
        		<a class="detailA" href="javascript:;">- 월간 보고서</a>
        		<a class="detailA" href="javascript:;">- 연간 보고서</a>
        	</div>
				</div>
				<p class="menuP" id="M_COST"><span id="TOGGLE_COST" class="ui-icon ui-icon-triangle-1-s"></span>경비관리</p>
				<div id="S_COST" class="subDiv">
					<a class="subA" href="javascript:;">· 전체</a>
					<a class="subA" href="javascript:;">· 인건비 관리</a>
	        <a class="subA" href="javascript:;">· 매입관리</a>
	        <a class="subA" href="javascript:;">· 경비 보고서</a>
        	<div class="detailDiv">
        		<a class="detailA" href="javascript:;">- 월간 보고서</a>
        		<a class="detailA" href="javascript:;">- 연간 보고서</a>
        	</div>
				</div>
				<p class="menuP" id="M_REPORT"><span id="TOGGLE_REPORT" class="ui-icon ui-icon-triangle-1-s"></span>신고관리</p>
				<div id="S_REPORT" class="subDiv">
					<a class="subA" href="javascript:;">· 손익계산서 외</a>
					<a class="subA" href="javascript:;">· 사업장현황신고 외</a>
        	<div class="detailDiv">
        		<a class="detailA" href="javascript:;">- 사업장현황신고</a>
        		<a class="detailA" href="javascript:;">- 수입금액검토표</a>
        		<a class="detailA" href="javascript:;">- 수입금액검토부표</a>
        	</div>
				</div>
				<p class="menuP" id="M_DATA"><span id="TOGGLE_DATA" class="ui-icon ui-icon-triangle-1-s"></span>데이터관리</p>
				<div id="S_DATA" class="subDiv">
					<a class="subA" href="javascript:;">· 결제유형별</a>
					<a class="subA" href="javascript:;">· 진료유형별</a>
				</div>
				<p class="menuP" id="M_STATS"><span id="TOGGLE_STATS" class="ui-icon ui-icon-triangle-1-s"></span>통계</p>
				<div id="S_STATS" class="subDiv">
					<a class="subA" href="javascript:;">· 매출 통계</a>
				</div>
				<p class="menuP" id="M_SETTNG"><span class="ui-icon ui-icon-triangle-1-e"></span>환경설정</p>
			</div>
		</div>
	</nav>
</div>
<!-- Left 영역 [include : include/Left.jsp] -->
</body>
</html>
