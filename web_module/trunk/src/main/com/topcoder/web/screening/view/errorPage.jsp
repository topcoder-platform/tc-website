<%@ page language="java" isErrorPage="true" %>
<%@ page import="com.topcoder.web.screening.common.Constants"%>
<%@ taglib uri="/WEB-INF/screening.tld" prefix="screen" %>
<% if(request.getAttribute("Exception") != null)
   {
       exception = (Throwable)request.getAttribute("Exception");
   }
   String message = (String)request.getAttribute("message");
 %>
<html>
<head>
<title>Topcoder | Testing Application Management Tool</title>

<jsp:include page="/script.jsp"/> 

</head>

<body>

<!-- Header begins -->
<jsp:include page="/includes/top.jsp" />
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- gutter begins -->
        <td width="25"><img src="/i/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- gutter ends -->

<!-- Middle column begins -->
        <td width="100%" align="center"><img src="/i/clear.gif" width="400" height="11" alt="" border="0"><br>
            <table border="0" cellspacing="0" cellpadding="0" width="70%">
                <tr valign="top">
                    <td class="bodyText">
                        <h1 class="testHead">ERROR</h1>
                        <p>Please try your request again.  If the error persists, please contact the administrator.</p><br>
                    </td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" width="70%">
                <tr>
                    <td width="100%" class="bodyText"><br>
                        <% if(exception != null && Constants.DEBUG.equals("true")) {
                            exception.printStackTrace(new java.io.PrintWriter(out));
                        }
                             exception.printStackTrace();
                        %>
                        <div class="header"><%=message==null?"Navigation Error":message%></div>
                    </td>
                </tr>
            </table>
            <p><br></p>
        </td>
<!-- Middle Column ends -->

<!-- Gutter -->
        <td width="25"><img src="/i/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

  <jsp:include page="/includes/foot.jsp" />

</body>
</html>
