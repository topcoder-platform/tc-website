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

                <p align="center">
                    <strong>You are no longer registered for TopCoder High School Competitions.</strong>
                </p>

			<c:if test="${not hasReg}">			
                <p align="center" style="margin-top:40px;">
                    <strong>Uh-oh.</strong> Now that you've removed TopCoder High School registration from your account, you have no TopCoder registrations.
                    Many members start competing in standard TopCoder competitions after leaving high school.
                </p>
                <p align="center">
                    <strong>Would you like to register for TopCoder competitions?</strong>
                </p>
                <p align="center">
                    <a href="/reg/?nrg=false" class="button" style="width: 60px;">Register</a>
                </p>
                <p align="center">
                    Just check off all the registrations you'd like to add to your account.
                </p>
                </c:if>
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