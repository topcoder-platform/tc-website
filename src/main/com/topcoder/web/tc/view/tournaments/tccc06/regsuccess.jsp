<%@ page import="com.topcoder.web.tc.controller.request.tournament.tccc06.SubmitAlgoRegistration" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <jsp:include page="/script.jsp"/>

    <title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
    <c:set value="<%=SubmitAlgoRegistration.AOL_SURVEY%>" var="aolSurvey"/>
    <c:if test="${request[aolSurvey]}">
        <META HTTP-EQUIV="refresh" content="10;url=http://www.iion.com/surveytaker100/index.cfm?surveyID=1522&source=1">
    </c:if>
</head>

<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp">
    <jsp:param name="tabLev1" value="component"/>
    <jsp:param name="tabLev2" value="details"/>
    <jsp:param name="tabLev3" value="rules"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
    <!-- Body-->
    <tr valign=top>
        <td valign=top align=center>
            <div class=bodySpacer>
                <p class=bigTitle>Registration</p>

                <p align="left">
                    You have successfully registered for the 2006 TopCoder Collegiate Challenge.</p>
                <c:if test="${request[aolSurvey]}">
                    <p>
                        You have chosen to take part in AOL's survey. This page will automatically load the survey in 10
                        seconds.
                        If it does not, you make click
                        <a href="http://www.iion.com/surveytaker100/index.cfm?surveyID=1522&source=1">here</a> .
                    </p>
                </c:if>
            </div>
        </td>

        <!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="right.jsp">
                <jsp:param name="level1" value="all"/>
            </jsp:include>
        </td>

    </tr>

</table>


<jsp:include page="../../foot.jsp"/>

</body>

</html>
