<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>                 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        	<table>
        		<tr class="header">
        			<td>Project name</td>
        			<td>Associated contests</td>
        		</tr>
        	
        	<c:forEach items="${projects}" var="project" varStatus="i">
        		<c:if test="${project.eligibilityOpen}">
	        		<tr class="${i.index % 2 == 0? "even" : "odd" }>
	        			<td>${project.projectName }</td>
	        			<td>
	        				<c:forEach items="${project.contests }" var="contest">
	        					${contest.name }
	        				</c:forEach>
	        			</td>
	        		</tr>
        		</c:if>
        	</c:forEach>
        	</table>


        </td>
    </tr>
</table>
</body>
</html>
