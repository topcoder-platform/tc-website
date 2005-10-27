<%@ page import="javax.naming.*" %>
<%@ page import="javax.ejb.CreateException" %>
<%@ page import="java.io.*" %>
<%@ page import="java.rmi.*" %>
<%@ page import="javax.rmi.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.reflect.*" %>

<%@ include file="/includes/util.jsp" %>
<%@ include file="/includes/session.jsp" %>

<%
    // STANDARD PAGE VARIABLES
    String page_name = "forgot_password.jsp";
    String action = request.getParameter("a");
%>

<%
    String strError = "";
    String txtHandle = request.getParameter("txtHandle");
    if (txtHandle == null) {
        txtHandle = "";
    }

    if (action != null) {
        action = action.trim();

        if (action.equalsIgnoreCase("Get Password")) {
            if ("".equals(txtHandle)) {
                strError = "You must enter a valid user name.";
            } else {

                try {
                    //Send the email
                    USER_MANAGER.sendPasswordEmail(txtHandle);
                    response.sendRedirect("sent_password.jsp");
                    return;
                } catch (com.topcoder.dde.user.NoSuchUserException nsue) {
                    strError = "Invalid username";
                }
            }
        }
    }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>I forgot my account password for TopCoder Software</title>
    <link rel="stylesheet" type="text/css" href="/includes/tcs_style.css" />
    <script language="JavaScript" type="text/javascript" src="/scripts/javascript.js"></script>
</head>


<body class="body" marginheight="0" marginwidth="0" onLoad="frmLogin.txtHandle.focus()">

<!-- Header begins -->
<jsp:include page="/includes/top.jsp"/>
<jsp:include page="/includes/menu.jsp" >
    <jsp:param name="isSoftwarePage" value="true"/>
</jsp:include>
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" class="middle">
    <tr valign="top">

<!-- Left Column begins -->
        <td width="180" class="leftColumn">
        <jsp:include page="/includes/left.jsp" >
            <jsp:param name="level1" value="index"/>
        </jsp:include>
        </td>
<!-- Left Column ends -->

<!-- Gutter 1 begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 1 ends -->

<!-- Center Column begins -->
        <td width="99%"><img src="/images/clear.gif" width="400" height="15" alt="" border="0"><br>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                <tr><td class="subhead">I forgot my password</td></tr>
            </table>

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
               <tr valign="top">
                    <td class="bodyText" width="100%">
                        <img src="/images/clear.gif" alt="" width="380" height="1" border="0"/><br/>
                        <p>Enter your User Name below and we will send your password to you by Email.</p>
                    </td>
                </tr>

                <tr valign="middle">
                    <form name="frmLogin" action="<%=page_name%>" method="post">
                    <td align="center">
                        <table border="0" cellpadding="3" cellspacing="0">
                           <tr><td colspan="3"><img src="/images/clear.gif" width="10" height="3" alt="" border="0"></td></tr>

<!-- User Name Error Text -->
                            <tr valign="top">
                                <td class="registerError" colspan="3"><%=strError%></td>
                            </tr>

<!-- User Name -->
                            <tr valign="middle">
                                <td nowrap class="bodyText" align="right">User Name:</td>
                                <td align="left"><input type="text" name="txtHandle" value ="<%=txtHandle%>" size="15" maxlength="30"></td>
                                <td align="left"><input class="registerButton" type="submit" name="a" value="Get Password"></input></td>
                            </tr>

                           <tr><td colspan="3"><img src="/images/clear.gif" width="10" height="3" alt="" border="0"></td></tr>
                        </table>

                        <p><br/></p>

                    </td>
                    </form>
                </tr>
            </table>

            <p><br></p>
            <p><br></p>

            </div>
        </td>
<!-- Center Column ends -->

<!-- Gutter 1 begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 1 ends -->

<!-- Gutter begins -->
        <td width="180"><img src="/images/clear.gif" alt="" width="180" height="10" border="0" /></td>
<!-- Gutter ends -->

    </tr>
</table>

<!-- Footer begins -->
<jsp:include page="/includes/foot.jsp" flush="true" />
<!-- Footer ends -->

</body>
</html>
