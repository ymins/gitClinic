<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 

<html>

<head>
<%@ include file="include.jsp"%>
<title><tiles:insertAttribute name="title" ignore="true"/></title>
</head>

<body>
	<div id="wrapper">
 		<div id="headerwrap"><tiles:insertAttribute name="header"/></div>
 		<div id="leftliquid"><tiles:insertAttribute name="left"/></div>
  	<div id="contentliquid"><tiles:insertAttribute name="body"/></div>
 		<div id="footerwrap"><tiles:insertAttribute name="footer"/></div>
	</div>
</body>
</html>

