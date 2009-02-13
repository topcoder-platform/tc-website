<%@ page import="com.topcoder.web.common.model.Event" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String eventType = (String) request.getAttribute("et");
  Event e = (Event) request.getAttribute("event");
  Boolean eligible = (Boolean) request.getAttribute("eligible"); %>
<html>
<head>
    <title>2007 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tccc07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="containAll">
    <div id="content">

        <jsp:include page="nav.jsp" >
        <jsp:param name="tabLev1" value="<%=eventType%>"/>
        <jsp:param name="tabLev2" value="register"/>
        <jsp:param name="tabLev3" value=""/>
        </jsp:include>

            <div id="pageBody">

                    <h1><span>
                    <%if (eligible.booleanValue()) {%>
                        Registration Successful
                    <%} else {%>
                        Registration Failed
                    <%}%>
                    </span></h1>


                    <div align="center" style="margin: 60px 40px 200px 40px;">
                        <%if (eligible.booleanValue()) {%>
                            You have successfully registered for the<br><strong><%=e.getDescription()%></strong>.
                        <%} else {%>
                            Sorry, you are ineligible for the <strong><%=e.getDescription()%></strong>.  If this is a mistake, contact <A href="mailto:service@topcoder.com">service@topcoder.com</A>.
                        <%}%>
                    </div>

            </div>
    </div>
    <jsp:include page="footer.jsp" />
    </div>
</div>
</body>
</html>
