<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>

<title>图书馆信息</title>
</head>
<body>
	图书馆的信息
	
<form action="" method="POST">
	<input type="hidden" name="_method" value="DELETE">
</form>


<c:if test="${empty  requestScope.infos}">
	没有任何信息
</c:if>
<c:if test="${ !empty  requestScope.infos }">





<c:forEach items="${requestScope.infos}" var="inf">
	<tr>
	    <td>${inf.id}</td>
		<td>${inf.libraryName}</td>
		<td>${inf.masterName}</td>
		<td>${inf.bulidTime}</td>
		<td>${inf.contactEmail}</td>
		<td>${inf.contactAddress}</td>
		<td>${inf.contactPhone}</td>
		<td>${inf.contactWeb}</td>
		
	</tr>
</c:forEach>

</c:if>

</body>
</html>