<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="com.topcoder.web.corp.common.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.corp.model.TestSessionInfo,
                 java.util.Date" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<html>
<head>
<title>Topcoder | Testing Application Management Tool</title>

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
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText">
                        <h1 class="testHead">Test Profile List</h1>
                    </td>
                </tr>
            </table>

            <jsp:useBean id="profileList" type="java.util.List" scope="request" />

            <table cellspacing="1" cellpadding="3" width="70%" class="testFrame">
                <tr>
                    <td class="testTableTitleSmall">&#160;</td>
                    <td colspan="2" align="center" class="testTableTitleSmall">Candidates</td>
                    <td class="testTableTitleSmall">&#160;</td>

                </tr>

                <tr>
                   <td align="center" class="testFormHeader">Test Profile</td>
                   <td align="center" class="testFormHeader">Total</td>
                   <td align="center" class="testFormHeader">Complete</td>
                   <td align="center" class="testFormHeader">Create Date</td>
                </tr>
                <% if(profileList.isEmpty()){ %>
                    <tr>
                       <td colspan="4" align="center" class="testTableOdd">No test profiles have been created.</td>
                    </tr>
                <% } else { %>
                    <% int i = 0;
                        String cparam = null;
                    %>

                    <screen:resultSetRowIterator id='row' list='<%= profileList %>'>
                    <% i++;
                       cparam = Constants.PROFILE_ID + '=' + row.getItem("session_profile_id");
                    %>
                    <tr>
                        <td width="20%" class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><screen:servletLink processor="ProfileDetail" param="<%=cparam%>" styleClass="bodyText"><screen:resultSetItem row="<%=row%>" name="session_profile_desc" /></screen:servletLink></td>
                        <td align="center" class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><screen:resultSetItem row="<%=row%>" name="num_sessions" /></td>
                        <td align="center" class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><screen:resultSetItem row="<%=row%>" name="num_complete" /></td>
                        <td align="center" class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><screen:resultSetItem row="<%=row%>" name="create_date" format='MM/dd/yyyy hh:mm a'/></td>
                    </tr>
                    </screen:resultSetRowIterator>
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
