<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="screening.tld" prefix="screen" %>
<html>
<head>
<title>Topcoder | Technical Assessment Application Management Tool</title>

<jsp:include page="../includes/script.jsp" />

</head>

<jsp:useBean id="emailInfo" type="com.topcoder.web.corp.model.EmailInfo" scope="request"/>

<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">
    <tr><td colspan="3" class="globalNavSmall"><img src="/i/corp/clear.gif" width="1" height="15" border="0"/></td></tr>

    <tr>
        <td width="15"><a name="top"></a><img src="/i/corp/clear.gif" width="15" height="1" alt="" border="0"></td>
        <td width="206"><img src="/i/corp/logo_testing.gif" width="206" height="49" border="0" alt="TopCoder Technical Assessment Application" vspace="13"></TD>
        <td width="100%"><img src="/i/corp/clear.gif" width="1" height="1" alt="" border="0"></td>
    </tr>

    <tr><td colspan="3" class="testTop"><img src="/i/corp/clear.gif" width="1" height="18" border="0"/></td></tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- gutter begins -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- gutter ends -->

<!-- Middle column begins -->
        <td width="50%" align="center"><img src="/i/corp/clear.gif" width="400" height="11" alt="" border="0"><br>
            <table border="0" cellspacing="0" cellpadding="0" width="50%">
                <tr valign="top">
                    <td class="bodyText">
                        <h1 class="testHead">Create a New Session - <font color="#000000">E-mail Preview</font></h1>
                        <p>Below is the content of the email that the candidate will receive.</p><br>
                    </td>
                </tr>
            </table>

             <table border="0" cellspacing="0" cellpadding="0" width="50%">
                <tr><form>
                <% if(emailInfo.getSessionInfo() != null && (emailInfo.getSessionInfo().useCandidateEmail() || emailInfo.getSessionInfo().useRepEmail())) {%>
                    <td width="100%" class="bodyText"><img src="/i/corp/clear.gif" width="400" height="1" alt="" border="0"><br>
                        <strong>Subject:</strong> <jsp:getProperty name="emailInfo" property="subject" /><br><br>
                        <jsp:getProperty name="emailInfo" property="HTMLMsgText" />
                    </td>
                <% } else { %>
                    <td width="100%" class="bodyText">No email to be sent</td>
                <% } %>
           </form></tr>
        </table>
            <p><br></p>
        </td>
<!-- Middle Column ends -->

<!-- Gutter -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

  <jsp:include page="/foot.jsp" />

</body>
</html>
