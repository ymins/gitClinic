<%@ page session="false" contentType="text/html; charset=utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> <!-- 타일즈태그삽입 -->
<html>
<head>
 <title>Board</title>
</head>
<body>
<h1>
 Hello Board!  
</h1>
 <br>
<table border="1"> <!-- 테이블 사이즈 -->
  <colgroup width="300">
   <col width="30" />
   <col width="100" />
   <col />
  </colgroup>
  <!-- for문 boardList 반복 -->
  <c:forEach var="row" items="${boardlist}">
   <tr>
    <td>${row.clinicCode}</td>
    <td><a href="/view.do?seq=${row.seq}">${row.clinicNm}</a></td> 
    <td>${row.clinicArea}</td>
   </tr>
  </c:forEach>
 </table>
 <br />
 <input name="write" type="button" value="새글쓰기" class="inputb" onclick="javascript:location.href='/writeForm.do';" />
</body>
</html>

