<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page errorPage="/errorPage.jsp"
         import="com.topcoder.web.screening.common.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<html>
<head>
<title>Topcoder | Testing Application Management Tool</title>

<jsp:include page="/script.jsp" />

<script type="text/javascript" language="Javascript">
<!--
function getProblemDetail(id) {
    var width = screen.availWidth * 2 / 3;
    var height = screen.availHeight / 2;
    var left = (screen.availWidth - width) / 2;
    var top = 0;
    var cmd = "toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=yes,top=" + top + ",left=" + left + ",width=" + width + ",height=" + height + ",status=0";
    var name="problemDetail";
    <% String url = Constants.CONTROLLER_URL + "?" + Constants.REQUEST_PROCESSOR + "=PopulateProblemDetail"; %>
    window.open('<screen:rewrite page="<%=url%>" />&<%=Constants.ROUND_PROBLEM_ID%>='+id,name,cmd);
    return;
  }
// -->
</script>

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
            <table border="0" cellspacing="0" cellpadding="0" width="10%">
                <tr valign="top">
                    <td class="bodyText">
                        <h1 class="testHead">Test Profile List</h1>
                    </td>
                </tr>
            </table>

            <jsp:useBean id="profileList" type="java.util.List" scope="request" />

            <screen:nestedListIterator id="profile" list="<%= profileList %>">
            <%
                boolean even = true;
                ResultSetContainer.ResultSetRow first = (ResultSetContainer.ResultSetRow)profile.get(0);
            %>

            <table cellspacing="1" cellpadding="0" width="100%">
                <tr><td class="testHeadSmall"><screen:resultSetItem row="<%=first%>" name="session_profile_desc" /></td></tr>
            </table>

            <table cellspacing="1" cellpadding="3" width="100%" class="testFrame">
                <tr>
                    <td colspan="2" class="testTableTitle">&#160;</td>
                    <td colspan="4" align="center" class="testTableTitle" align="center">Candidates</td>
                </tr>
                
                <tr>
                   <td colspan="2" align="center" class="testFormHeader">Problem Set</td>               
                   <td colspan="2" align="center" class="testFormHeader">Total</td>        
                   <td colspan="2" align="center" class="testFormHeader">Complete</td>                          
                </tr>
           
                <tr>
                    <td colspan="2" align="center" class="testTableEven"><screen:resultSetItem row="<%=first%>" name="round_name" /></td>               
                    <td colspan="2" align="center" class="testTableEven"><screen:resultSetItem row="<%=first%>" name="num_sessions" /></td>    
                    <td colspan="2" align="center" class="testTableEven"><screen:resultSetItem row="<%=first%>" name="num_complete" /></td>                                             
                </tr>                                    

                <tr><td colspan="6"><img src="/i/clear.gif" width="1" height="1" alt="" border="0"></td></tr>

                <tr>
                   <td colspan="2" align="center" class="testHeadSmall">&#160;</td>               
                   <td align="center" class="testHeadSmall">&#160;</td>        
                   <td align="center" class="testHeadSmall">PROBLEMS</td>        
                   <td colspan="2" align="center" class="testHeadSmall">&#160;</td>                          
                </tr>
           
                <tr>
                   <td align="center" class="testHeadSmall">Candidate</td>               
                   <td align="center" class="testHeadSmall">Status</td>        
                   <td align="center" class="testTableEven">Presented</td>        
                   <td align="center" class="testTableEven">Submitted</td>        
                   <td align="center" class="testTableEven">Passed</td>        
                   <td align="center" class="testHeadSmall">&#160;</td>                          
                </tr>
           
                <screen:resultSetRowIterator id='row' list='<%= profile %>'>
                
                <%-- Do a table body row --%>
                <% if(row.getItem("num_sessions").toString().equals("0")){ %>
                <tr><td colspan="6" align="center" class="bodyText" bgcolor="#EEEEEE">No sessions scheduled for this profile.</td></tr>
                
                <% } else { %>
                <%
                    String cparam = Constants.CANDIDATE_ID + '=' + row.getItem("user_id");
                    String sparam = Constants.SESSION_ID + '=' + row.getItem("session_id");

                    String color = (even) ? "bgcolor='#EEEEEE'" : "";
                %>
                <tr>
                    <td width="20%" class="bodyText" <%=color%>><screen:servletLink processor="PopulateCandidate" param="<%=cparam%>" styleClass="bodyText"><screen:resultSetItem row="<%=row%>" name="user_name" /></screen:servletLink></td>
                    <td width="16%" align="center" class="bodyText" <%=color%>><screen:resultSetItem row="<%=row%>" name="status" /></td>               
                    <td width="16%" align="center" class="bodyText" <%=color%>><%=String.valueOf(((Long)row.getItem("set_a_count").getResultData()).longValue()+((Long)row.getItem("set_b_count").getResultData()).longValue())%></td>
                    <td width="16%" align="center" class="bodyText" <%=color%>><screen:resultSetItem row="<%=row%>" name="submitted" /></td>
                    <td width="16%" align="center" class="bodyText" <%=color%>><screen:resultSetItem row="<%=row%>" name="passed" /></td>               
                    <td width="16%" align="center" class="bodyText" <%=color%>><screen:servletLink processor="TestResults" param="<%=sparam%>"><screen:resultSetItem row="<%=row%>" name="results_label" /></screen:servletLink></td>               
                </tr>
                <% } %>
                <% even = !even; %>
                </screen:resultSetRowIterator>
            </table>                
            <p><br></p>
            </screen:nestedListIterator>

            <% if(profileList.isEmpty()){ %>
                No test profiles found.
            <% } %>
         
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
