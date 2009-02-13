<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="com.topcoder.web.corp.common.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.corp.model.TestSessionInfo,
                 java.util.Date" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<html>
<head>
<title>Topcoder | Technical Assessment Application Management Tool</title>

<jsp:include page="../includes/script.jsp" />

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<script type="text/javascript" language="Javascript">
<!--
function getProblemDetail(id) {
    var width = screen.availWidth * 2 / 3;
    var height = screen.availHeight / 2;
    var left = (screen.availWidth - width) / 2;
    var top = 0;
    var cmd = "toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=yes,top=" + top + ",left=" + left + ",width=" + width + ",height=" + height + ",status=0";
    var name="problemDetail";
    <% String url = sessionInfo.getServletPath() + "?" + Constants.MODULE_KEY + "=PopulateProblemDetail"; %>
    window.open('<%=url%>&<%=Constants.ROUND_PROBLEM_ID%>='+id,name,cmd);
    return;
  }
// -->
</script>

</head>

<body>

<!-- Header begins -->
<jsp:include page="../includes/top.jsp" />
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- gutter begins -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- gutter ends -->

<!-- Middle column begins -->
        <td width="100%" align="center"><img src="/i/corp/clear.gif" width="400" height="11" alt="" border="0"><br>
            <table cellspacing="0" cellpadding="0" width="700" class="screeningFrameNB">
                <tr valign="top">
                    <td class="bodyText">
                        <p class="testHead">Test Profile List</p>
                    </td>
                </tr>
            </table>

            <jsp:useBean id="profileList" type="java.util.List" scope="request" />

            <table cellspacing="0" cellpadding="0" width="700" class="screeningFrame">
                <tr>
                   <td width="25%" align="left" class="screeningHeader">Test Profile</td>
                   <td width="25%" align="center" class="screeningHeader">Total</td>
                   <td width="25%" align="center" class="screeningHeader">Complete</td>
                   <td width="25%" align="right" class="screeningHeader">Create Date</td>
                </tr>
                <% if(profileList.isEmpty()){ %>
                    <tr>
                       <td colspan="4" align="center" class="screeningCellOdd">No test profiles have been created.</td>
                    </tr>
                <% } else { %>
                    <% int i = 0;
                        String cparam = null;
                    %>

                    <rsc:iterator id='row' list='<%= profileList %>'>
                    <% i++;
                       cparam = Constants.PROFILE_ID + '=' + row.getItem("session_profile_id");
                    %>
                    <tr>
                        <td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><screen:servletLink processor="ProfileDetail" param="<%=cparam%>" styleClass="bodyText"><rsc:item row="<%=row%>" name="session_profile_desc" /></screen:servletLink></td>
                        <td align="center" class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><rsc:item row="<%=row%>" name="num_sessions" /></td>
                        <td align="center" class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><rsc:item row="<%=row%>" name="num_complete" /></td>
                        <td align="right" class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><rsc:item row="<%=row%>" name="create_date" format='MM/dd/yyyy z' timezone="timezone_desc"/></td>
                    </tr>
                    </rsc:iterator>
                <% } %>
            </table>
            <p><br></p>


            <p><br></p>
        </td>
<!-- Middle Column ends -->

<!-- Gutter -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

  <jsp:include page="../../foot.jsp" />

</body>
</html>
