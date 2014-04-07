<%@ page language="java" contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
$(document).ready(function() {
	$("#grid").jqGrid({
		url : '/memListJson.do',
		datatype : 'json', // datatype : 데이터 타입을 지정한다.
		caption : 'Daum SNS Pic', // caption : 그리드의 제목을 지정한다.
		mtype : 'get', // mtype : 데이터 전송방식을 지정한다.
		height : '500px', // height : 그리드의 높이를 지정한다.
		pager : '#pager', // pager : 도구 모임이 될 div 태그를 지정한다.
		rowNum : 10, // rowNum : 한 화면에 표시할 행 개수를 지정한다.
		loadonce : true, // loadonce : rowNum 설정을 사용하기 위해서 true로 지정한다.
		rowList : [ 10,20,30 ], // rowList : rowNum을 선택할 수 있는 옵션을 지정한다.
		sortname: member_company,
		viewrecords:true,
		sorder:"desc",
		colNames : [ '병원명', '직함', '이름', '휴대폰 번호', 'E-mail', '아이디', '비밀번호' ],
		colModel : [
			{name : 'memCompany', index : 'memCompany',width : 40, align : 'center'},
			{name : 'memLank', index : 'memLank', width : 100, align : 'left'},
			{name : 'memNm', index : 'memNm', width : 100, align : 'left'},
			{name : 'memPhone', index : 'memPhone', width : 200, align : 'left'}
			],
		jsonReader : {
			repeatitems : false
		}
	});
	$("#grid").jqGrid('navGrid','#pager',{edit:false,add:false,del:false});
});
</script>
<title>jqGrid</title>
</head>
<body>
	<!--  jqGrid 플러그인을 사하기위한 table 태그와 div태그 사용 -->
	<table id="grid"></table>
	<div id="pager"></div>
</body>
</html>