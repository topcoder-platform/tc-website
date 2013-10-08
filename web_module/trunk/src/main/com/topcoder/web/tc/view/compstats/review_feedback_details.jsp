<%@  page language="java"
    import="com.topcoder.shared.dataAccess.resultSet.*, com.topcoder.web.tc.Constants,
          java.util.*"%>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>
  <jsp:include page="../script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<%
    ResultSetContainer review_feedback = (ResultSetContainer) request.getAttribute(Constants.REVIEW_FEEDBACK_KEY);
%>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="competition_home" />
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Review Feedback"/>
</jsp:include>


<% if (review_feedback.isEmpty()) { %>
    <b>The review feedback is not available for this contest yet.</b>
<% } else { %>
    <b>Contest:</b> <a href='/tc?module=ProjectDetail&pj=<rsc:item name="project_id" set="<%=review_feedback%>"/>&tab=results' class="statLink"><rsc:item set="<%=review_feedback%>" name="project_name"/></a>
    <br>
    <b>Feedback author:</b> <tc-webtag:handle coderId='<%= review_feedback.getStringItem(0, "create_user") %>'/>
    <br>
    <b>Feedback date:</b> <rsc:item name="create_date" set="<%=review_feedback%>" format="MM.dd.yy hh:mm z"/>
    <% if (review_feedback.getTimestampItem(0, "create_date").getTime() != review_feedback.getTimestampItem(0, "modify_date").getTime()) { %>
    <br>
    <b>Modification author:</b> <tc-webtag:handle coderId='<%= review_feedback.getStringItem(0, "modify_user") %>'/>
    <br>
    <b>Modification date:</b> <rsc:item name="modify_date" set="<%=review_feedback%>" format="MM.dd.yy hh:mm z"/>
    <% } %>
    <br><br>

    <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
       <tr>
          <td>
             <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">

                 <% if (review_feedback.getStringItem(0, "comment") != null) { %>
                   <tr>
                     <td class="tableHeader" style="border-top: 1px solid #999999;">The review feedback is not available for this contest for the reason stated below.</td>
                   </tr>
                   <tr>
                     <td class="statLt" style="border-top: 1px solid #999999;"><rsc:item name="comment" set="<%=review_feedback%>" escapeHtml="true" /></td>
                   </tr>
                 <% } else { %>
                   <tr>
                     <td class="tableHeader" width="5%" style="border-top: 1px solid #999999;">Reviewer</td>
                     <td class="tableHeader" align="center" width="100" style="border-top: 1px solid #999999;">Score</td>
                     <td class="tableHeader" style="border-top: 1px solid #999999;">Feedback</td>
                   </tr>
                   <rsc:iterator list="<%=review_feedback%>" id="resultRow">
                     <tr>
                       <td class="statLt" style="border-top: 1px solid #999999;"><tc-webtag:handle coderId='<%= resultRow.getIntItem("reviewer_user_id") %>'/></td>
                       <td class="statLt" align="center" style="border-top: 1px solid #999999;"><b><rsc:item name="score" row="<%=resultRow%>" escapeHtml="true" ifNull=""/></b></td>
                       <td class="statLt" style="border-top: 1px solid #999999;"><rsc:item name="feedback_text" row="<%=resultRow%>" escapeHtml="true" ifNull=""/></td>
                     </tr>
                   </rsc:iterator>
                 <% } %>
             </table>
          </td>
       </tr>
    </table>

    <br/>
    Have a question about review feedback for this contest?
    <a href='https://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/review/actions/ContactManager.do?method=contactManager&amp;pid=<rsc:item name="project_id" set="<%=review_feedback%>"/>'>Contact the contest managers</a>

<% } %>



      </td>

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>

</table>


<jsp:include page="../foot.jsp" />

</body>

</html>
