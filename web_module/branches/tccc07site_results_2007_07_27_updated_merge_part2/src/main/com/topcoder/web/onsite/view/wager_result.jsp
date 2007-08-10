<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.onsite.Constants" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
  String nextpage = (String)request.getAttribute(BaseServlet.NEXT_PAGE_KEY);
  if(nextpage==null) nextpage = request.getParameter(BaseServlet.NEXT_PAGE_KEY);
  if(nextpage==null) nextpage = request.getHeader("Referer");
  if(nextpage==null) nextpage = "http://"+request.getServerName();
  String message = (String)request.getAttribute("message");
  if(message==null) message = "";
%>

<html>
<head>
<title>2007 TopCoder Open - Computer Programming Tournament</title>
<link type="image/x-icon" rel="shortcut icon" href="http://<%=ApplicationServer.SERVER_NAME%>/i/favicon.ico"/>
<style TYPE="text/css">
html{ 
margin:0px;
padding:0px;
font-family: Arial, Verdana, Helvetica, sans-serif;
}

body{ 
font-family: Arial, Verdana, Helvetica, sans-serif;
line-height: normal;
font-size: 12px;
color: #666666;
background: #FFA500;
margin:0px;
padding:0px;
}

img{
border: none;
display: block;
}

h1{
color: #333333;
font-style: italic;
font-size: 125%;
}

p{
padding: 0px;
margin: 0px 0px 10px 0px;
}

td, th{ 
line-height: normal;
font-size: 12px;
}

#content{
width: 700px;
margin: 20px;
background: #FFFFFF;
border: 4px solid #cc6600;
}
</style>
<link type="text/css" rel="stylesheet" href="http://<%=ApplicationServer.SERVER_NAME%>/css/coders.css"/>
</head>

<body>

<div align="center" style="background: transparent;">
    <div id="content">
        <div style="margin: 20px;" align="left">


<div style="float:right;">
<a href="http://<%=ApplicationServer.SERVER_NAME%>/"><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco07/topcoderlogo.png" border=0/></a>
</div>
<A href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=tournaments&d2=tco07&d3=about"><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco07/wagerLogo.png" border=0/></A>

    <div style="float:right;">
        <% if (sessionInfo.isAnonymous()) { %>
            <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=Login&nextpage=<jsp:getProperty name="sessionInfo" property="servletPath"/>">Login</a>
        <% } else { %>
            Logged in as <tc-webtag:handle coderId='<%=sessionInfo.getUserId()%>' darkBG="true"/>
            | <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=Logout&nextpage=<jsp:getProperty name="sessionInfo" property="servletPath"/>">Logout</a>
        <% } %>
    </div>

      <h1>Component Competition Wager System</h1>

    <div align="center" style="margin: 40px 0px 80px 0px;">
      <strong>Wager result:</strong><br>
      <%= message %>
      <br><br>
      <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewCompetitions">Back to Competitions<a/>
    </div>

        </div>
    </div>
</div>

</body>
</html>