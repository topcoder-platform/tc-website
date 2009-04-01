<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="java.util.Date" %>
<%@ page isErrorPage="true" %>
<% if (exception == null) exception = (Throwable) request.getAttribute("exception");
    if (exception != null) exception.printStackTrace();
    String message = (String) request.getAttribute(BaseServlet.MESSAGE_KEY);
    String url = (String) request.getAttribute(BaseServlet.URL_KEY);
%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <title>Ribbit - $100,000 Killer App Challenge - Error  :: Powered by TopCoder</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_aolicq"/>
    </jsp:include>
</head>

<body>

 

<jsp:include page="topNav.jsp">
	<jsp:param name="active_page" value="home"/>
</jsp:include>
   <div id="wrapper">
<jsp:include page="aolicqTop.jsp"/>
        <div class="secondary-body" id="forums">
   
                        <div class="siteBoxFull">

                <h3>Error</h3>
                <div align="center">
                    <div style="width:500px; padding: 50px 0px 100px 0px;">
                        <p><%=message == null ? "An error has occurred when attempting to process your request." : "<b>" + message + "</b>"%>
                     </p>
                     
                     <p>   You may click <a href="javascript:history.back();">here</a> to return to the last page you were
                        viewing.</p>
                  
                      <p>  If you have a question or comment, please email
                        <a href="service@topcoder.com?subject=TopCoder Aolicq Error">service@topcoder.com</a>
                                                 and be sure to include this timestamp: <%=new Date().toString()%>.</p>
                    </div>
                    <%=new Date().toString()%>
                </div>

        </div>
</div>
<jsp:include page="tcFoot.jsp"/>

</body>
</html>