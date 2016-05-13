<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Corporate Services</title>

<jsp:include page="../includes/css.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>

</head>

<body>

<!-- Top begins -->
<jsp:include page="../includes/top.jsp" >
    <jsp:param name="level1" value="sponsorship"/>
</jsp:include>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
            <jsp:include page="../includes/left.jsp">
                <jsp:param name="level1" value="private_label"/>
                <jsp:param name="level2" value="index"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
        <td valign="top" width="7"><img src="/i/corp/title_brackets.gif" width="7" height="47" alt="[ ]" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top"><td id="corpTitle" width="100%" colspan="3"><img src="/i/corp/header_event_sponsorship.gif" alt="" width="546" height="41" border="0"></td></tr>

                <tr valign="top">
                    <td class="bodyText" width="99%">
                        <img src="/i/corp/clear.gif" width="1" height="10" alt="" border="0"><br>

                        <h2 class="corpHead">Private Label Competitions</h2>

                        <p>TopCoder can develop and administer customized developer competitions for your company.  These competitions are
                        designed to allow your developers to establish bragging rights, build morale, and identify top/hidden talent internally
                        within your organization.</p>

                        <p>TopCoder will open a practice room one week prior to each competition where only your developers will be
                        allowed to hone their skills using problems from previous competitions.  TopCoder staff will be available to
                        answer any questions during this time. This will allow your developers to become familiar with the competition arena
                        and you to promote the event in advance.</p>

                        <p>TopCoder's technical team will coordinate setting up the competition prior to the event. They will also be
                        available during each competition to answer any questions, and resolve any technical issues immediately, should
                        they arise.</p>

                        <p>The advantage of running a competition using this program is the ability to focus on your business goals
                        rather than the logistical hurdles of putting on such an event.</p>

                        <p><br/></p>
                    </td>

<!-- Gutter -->
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column begins -->
                    <jsp:include page="/right.jsp">
                        <jsp:param name="level1" value="private_label"/>
                        <jsp:param name="level2" value="index"/>
                    </jsp:include>
<!-- Right Column ends -->

                </tr>
            </table>
        </td>
<!-- Center Column ends -->
    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="/foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
