<%@ page import="com.topcoder.web.common.model.Event" %>
<%@ page import="com.topcoder.web.common.model.EventType" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%String eventType = (String) request.getAttribute("et");%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The 2008 TopCoder&reg; Open - Get ready for the Ultimate TopCoder Event!</title>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<link type="text/css" rel="stylesheet" href="/css/tournaments/tco08.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
<script language="JavaScript" type="text/javascript" src="/js/arena.js"></script>
</head>
<body id="page_sub">

<div id="wrapper">

        <jsp:include page="nav.jsp" >
        <jsp:param name="tabLev1" value="<%=eventType%>"/>
        <jsp:param name="tabLev2" value="register"/>
        <jsp:param name="tabLev3" value=""/>
        </jsp:include>


                    <h2><span>
                        <c:choose>
                            <c:when test="${eligible}">
                                Registration Successful
                            </c:when>
                            <c:otherwise>
                                Registration Failed
                            </c:otherwise>
                        </c:choose>
                    </span></h2>


                <c:set value="<%=EventType.ALGORITHM_TOURNAMENT_ID%>" var="algoEvent"/>
                    <div align="center" style="margin: 60px 40px 200px 40px;">
                        <c:choose>
                            <c:when test="${eligible}">
                                You have successfully registered for the<br /><strong>${event.description}</strong>.
                            </c:when>
                            <c:otherwise>
                                Sorry, you are ineligible for the <strong>${event.description}</strong>.
                                If you feel this is a mistake, please contact <a href="mailto:service@topcoder.com">service@topcoder.com</a>.
                            </c:otherwise>
                        </c:choose>
                    </div>

    </div><%-- #content --%>

<jsp:include page="footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
