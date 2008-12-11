<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String assignedRegion = (String) request.getAttribute("assignedRegion"); 
   Boolean eligible = (Boolean) request.getAttribute("eligible"); %>
<html> 
<head> 
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/coders.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/tchs07.css"/>
    <title>TopCoder High School 2007</title> 
</head>
<body>

<div align="center" style="background: transparent;">
    <div class="content">
        <img src="/i/tournament/tchs07/contentN.png" alt="contentN" style="display: block;" />

        <jsp:include page="links.jsp" >
        <jsp:param name="tabLev1" value="register"/>
        <jsp:param name="tabLev2" value=""/>
        <jsp:param name="tabLev3" value=""/>
        </jsp:include>

        <div class="contentSpacer">
          <h2>Registration</h2>

        <div align="center" style="margin:40px;">
        <%if (eligible.booleanValue()) {%>
            You have successfully registered for the 2007 TopCoder&#174; High School Tournament.
            <br><br>
            You have been assigned to the <strong><%=assignedRegion%> Region</strong>.
            <br><br>
            If you have any concerns regarding your assigned region, please email <A href="mailto:service@topcoder.com">service@topcoder.com</A>.
        <%} else {%>
            Sorry, you are ineligible for the TCHS07.  If this is a mistake, contact <A href="mailto:service@topcoder.com">service@topcoder.com</A>.
            <br><br>
        <%}%>
        </div>


        </div>
        <div class="footer">
            Copyright &#169; 2000-2006, TopCoder, Inc. All rights reserved.
        </div>
        <img src="/i/tournament/tchs07/contentS.png" alt="contentS" style="display: block;"/>
    </div>
</div>

</body> 
</html>

