<%@ page import="com.topcoder.web.reg.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>TopCoder High School Competitions</title>
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
                <jsp:param name="node" value="m_hs_competitions"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">

                <jsp:include page="../page_title.jsp">
                    <jsp:param name="image" value="high_school"/>
                    <jsp:param name="title" value="Registration"/>
                </jsp:include>

    <form action="/tc" method="post" name="f">
    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="HSUnregister"/>
        <c:choose>
            <c:when test="${not active}">
                <p align="center">
                    You are not registered for TopCoder High School competitions.
                </p>
            </c:when>

            <c:otherwise>
                <p align="center">
                    Are you sure you want to <strong>unregister</strong> from TopCoder High School?
                </p>

                <p class="bigRed" align="center">
                    Registration removal is permanent and can not be undone.
                </p>
              
                <div align="center">
                    <div style="width: 160px;">
                        <a href="#" onclick="document.f.submit();return false;" class="button" style="width: 60px; float: left;">Yes</a>
                        <a href="/tc" class="button" style="width: 60px; float: right;">No</a>
                    </div>
                </div>            

            </c:otherwise>                    
        </c:choose>
</form>

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