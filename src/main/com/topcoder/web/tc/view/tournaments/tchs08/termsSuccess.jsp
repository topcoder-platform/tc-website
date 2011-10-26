<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% String assignedRegion = (String) request.getAttribute("assignedRegion"); 
   Boolean eligible = (Boolean) request.getAttribute("eligible"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>TopCoder High School 2008</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tchs08.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<div id="wrapper">

    <jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="registrants"/>
    <jsp:param name="tabLev2" value=""/>
    <jsp:param name="tabLev3" value=""/>
    </jsp:include>
    
    
    
        <div id="title">
            <h2>Registration</h2>
        </div><%-- #title --%>
        
        <div id="content">
            <div align="center" style="margin:40px;">
            <%if (eligible.booleanValue()) {%>
                You have successfully registered for the 2008 TopCoder&#174; High School Tournament.
                <br><br>
<%--
                You have been assigned to the <strong><%=assignedRegion%> Region</strong>.
                <br><br>
                If you have any concerns regarding your assigned region, please email <A href="mailto:service@topcoder.com">service@topcoder.com</A>.
--%>
            <%} else {%>
                Sorry, you are ineligible for the TCHS08.  If this is a mistake, contact <A href="mailto:service@topcoder.com">service@topcoder.com</A>.
                <br><br>
            <%}%>
            </div>
            
        </div><%-- #content --%>
        
        <jsp:include page="footer.jsp" />


</div><%-- #wrapper --%>

</body>
</html>