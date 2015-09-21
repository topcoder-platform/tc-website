<%@ page import="com.topcoder.web.tc.controller.request.tournament.tccc06.SubmitAlgoRegistration" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <jsp:include page="/script.jsp"/>

    <title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
    <c:set value="<%=SubmitAlgoRegistration.AOL_SURVEY%>" var="aolSurvey"/>
    <c:if test="${requestScope[aolSurvey]}">
        <META HTTP-EQUIV="refresh" content="10;url=<tc-webtag:linkTracking link="http://www.iion.com/surveytaker100/index.cfm?surveyID=1522&source=1" refer="reg"/>">
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
                <c:if test="${requestScope[aolSurvey]}">
                    <p>
                        You have chosen to take part in AOL's survey. This page will automatically load the survey in 10
                        seconds.
                        If it does not, you may click
                        <a href="<tc-webtag:linkTracking link="http://www.iion.com/surveytaker100/index.cfm?surveyID=1522&source=1" refer="reg"/>">here</a>
                        .
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
