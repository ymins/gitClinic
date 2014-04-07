<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">

$(document).ready(function(){     
/*
	$("#testGrid").jqGrid({   
		url:"clinic.do?m=cliniList",    
    datatype: "json",  
    jsonReader : {  // 이부분 추가 하셔야 json 쓰시기 편리 합니다. 
			page: "page", 
			total: "total", 
			root: "user", 
			records: function(obj){return obj.length;},
			repeatitems: false, 
			id: "id"
		}, // 여기 까지 

    colNames:['id','Date', 'Client', 'Amount','Tax','Total','Notes'],
	 		colModel:[
	 		{name:'id',index:'id', width:60 },
	 		{name:'invdate',index:'invdate', width:90 },
	 		{name:'name',index:'name', width:100},
	 		{name:'amount',index:'amount', width:80, align:"right"},
	 		{name:'tax',index:'tax', width:80, align:"right"},		
	 		{name:'total',index:'total', width:80,align:"right"},		
	 		{name:'note',index:'note', width:150, sortable:false}		
		],
		rowNum:20, // 한 화면에 보여줄 갯수
		rowList:[20,50,100],  
		pager: '#pager',  
		viewrecords: true,	
		loadonce: true,
		caption:"JSON Example" // 챠트 제목
	});  
	*/
});
</script>
</head>

<body>
메시지 : ${message}<br />
 
<a href="#" onclick="fnCmdNew()">[신규]</a>
 
<form:form id="clinicVo" name="clinicVo" method="post">
    <input type="hidden" name="clinicCode" />
 
    <table border="1">
        <thead>
            <tr>
                <th>Sample No</th>
                <th>Title</th>
                <th>Description</th>
                <th>수정</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="result" items="${list}" varStatus="status">
                <tr>
                    <td>${result.clinicCode}</td>
                    <td>${result.cliniNm}</td>
                    <td>${result.clinicArea}</td>
                    <td><a href="#" onclick="fnCmdEdit('${result.clinicCode}')">수정</a></td>
                    <td><a href="#" onclick="fnCmdDelete('${result.clinicCode}')">삭제</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</form:form>
</body>
</html>
