<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>WordPress Feed</title>
</head>
<body>
	<c:forEach items="${requestScope.articles}" var="eachEntry" varStatus="index">
        <div>
	         <h2>${eachEntry.title}</h2>
	         <div>
	         	<p>
	         		<c:out value="${eachEntry.contents[0].value}" escapeXml="false" />
	         	</p>
	         </div>
         </div> 
		
		<c:if test="${!index.last}">
			 <hr/>
		</c:if>
       </c:forEach>          	
</body>
</html>