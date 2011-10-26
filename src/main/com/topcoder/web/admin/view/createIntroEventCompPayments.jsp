<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>                 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder Admin</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    
<script language="javascript" type="text/javascript">
 </script>  
 
  
</head>

<body>
<jsp:include page="top.jsp"/>
<table>
    <tr valign="top">
        <td width="200">
            <jsp:include page="left.jsp"/>
        </td>
        <td>

<h2>Component Payments for ${event.description }</h2>

<br>
<br>
<table>
	<c:forEach items="${completeContests}" var="contest">  
       <tr>
       		<td>
           		${contest.name}
           	</td>
        </tr>
   </c:forEach>
</table>       

<br>
<br>
Contests that are not yet completed:<br>
<table>
	<c:forEach items="${incompleteContests}" var="contest">  
       <tr>
       		<td>
           		${contest.name} (${contest.activeProjects } active projects <c:if test="${not contest.timeOver}">, time not over</c:if>)
           	</td>
        </tr>
   </c:forEach>
</table>       

        </td>
    </tr>
</table>
</body>
</html>
