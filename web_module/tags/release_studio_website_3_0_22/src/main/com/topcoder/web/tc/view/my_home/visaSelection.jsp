<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<c:set var="events" value="${requestScope.events}"/>
<html>
<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
    <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>
<body>

<jsp:include page="../top.jsp" >
<jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="my_topcoder"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">
            
                <jsp:include page="/page_title.jsp">
                    <jsp:param name="image" value="visa"/>
                    <jsp:param name="title" value="&nbsp;"/>
                </jsp:include>

<c:choose>
	<c:when test="${empty events}">
       <div align="center" style="margin: 20px;">
           You have no pending Visa letter requests.
       </div>
	</c:when>	
	<c:otherwise>
        <h2 align="center">Current Visa letter requests:</h2>
        <p align="center">
        <c:forEach items="${events }" var="event">
        	<A href="/tc?module=VisaLetterRequestStatus&eid=${event.id}"><c:out value="${event.name}"></c:out> </A><br>
	    </c:forEach>
		</p>
        
	</c:otherwise>
</c:choose>



            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
    </tbody>
</table>

<jsp:include page="../foot.jsp" />
</body>
</html>