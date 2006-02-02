<%@ page contentType="text/html;charset=utf-8" %>
<%@ page
        language="java"
        import="com.topcoder.web.codinginterface.longcontest.Constants"
        %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>
<%@ taglib uri="codinginterface.tld" prefix="ci" %>
<% ResultSetContainer submissions = (ResultSetContainer) request.getAttribute("submissions");%>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<% int roundType = request.getAttribute(Constants.ROUND_TYPE_ID)==null?Constants.LONG_ROUND_TYPE_ID:((Integer)request.getAttribute(Constants.ROUND_TYPE_ID)).intValue();%>
<% String level2 = "topcoder";
    String image = "long_comps_topcoder";
     if (roundType==Constants.LONG_PRACTICE_ROUND_TYPE_ID) {
         level2="topcoder_practice";
     } else if (roundType ==Constants.INTEL_LONG_PRACTICE_ROUND_TYPE_ID) {
         level2="intel_practice";
         image = "long_comps_intel";
     } else if (roundType ==Constants.INTEL_LONG_ROUND_TYPE_ID) {
         level2="intel";
         image = "long_comps_intel";
     }
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder</title>
    <jsp:include page="../script.jsp" />
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <SCRIPT type="text/javascript">
        function submit(module) {
            document.adminForm.<%=Constants.MODULE%>=module;
            document.adminForm.submit();
        }
        function checkAll(check) {
            var elements = document.thislist.elements;
            for (i=0; i<document.thislist.elements.length; i++) {
              if (document.thislist.elements[i].type=="checkbox") {
                document.thislist.elements[i].checked = (check==true);
              }
            }
        }
    </SCRIPT>
</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<%-- Left Column Begins--%>
<td width="180">
    <%-- value of level2 is 'topcoder' or 'intel_active_contests' --%>
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="level1" value="long_contests"/>
        <jsp:param name="level2" value="<%=level2%>"/>
    </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

    <%-- value of image is 'long_comps_topcoder' or 'long_comps_intel' --%>
    <jsp:include page="../page_title.jsp">
        <jsp:param name="image" value="<%=image%>"/>
        <jsp:param name="title" value="Admin Home"/>
    </jsp:include>

    <form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="POST" name="adminForm">
        <tc:webtag:hiddenInput name="<%=Constants.MODULE%>" value="AdminForceSubmit"/>
        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
                        <tr><td class="statLt" colspan="6"><a href="javascript:checkall(true);">check all</a> | <a href="javascript:checkall(false);">uncheck all</a></td></tr>
                        <tr>
                            <td class="tableHeader" width="25%"></td>
                            <td class="tableHeader" width="25%"><A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewAdminForceSubmit<tc-webtag:sort column="<%=submissions.getColumnIndex("handle_lower")%>" includeParams="true"/>">Handle</A></td>
                            <td class="tableHeader" width="25%"><A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewAdminForceSubmit<tc-webtag:sort column="<%=submissions.getColumnIndex("language_name")%>" includeParams="true"/>">Language</A></td>
                            <td class="tableHeader" width="25%"><A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewAdminForceSubmit<tc-webtag:sort column="<%=submissions.getColumnIndex("submission_number")%>" includeParams="true" />">Submission Number</A></td>
                            <td class="tableHeader" width="25%"><A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewAdminForceSubmit<tc-webtag:sort column="<%=submissions.getColumnIndex("submission_points")%>" includeParams="true"/>">Points</A></td>
                            <td class="tableHeader" width="25%"><A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewAdminForceSubmit<tc-webtag:sort column="<%=submissions.getColumnIndex("status_desc")%>" includeParams="true"/>">Status</A></td>
                        </tr>
                    <%boolean even = true;%>

                        <rsc:iterator list="<%=submissions%>" id="resultRow">
            <%
                                StringBuffer name = new StringBuffer(20);
                                name.append(Constants.SUBMISSION_PREFIX);
                                name.append(resultRow.getLongItem("coder_id"));
                                name.append(",");
                                name.append(resultRow.getLongItem("component_id"));
                                name.append(",");
                                name.append(resultRow.getLongItem("round_id"));
                                name.append(",");
                                name.append(resultRow.getLongItem("contest_id"));
                                name.append(",");
                                name.append(resultRow.getLongItem("language_id"));
                                name.append(",");
                                name.append(resultRow.getLongItem("submission_number"));
            %>
                        <tr>
                            <td class="<%=even?"statLt":"statDk"%>">
                                <tc-webtag:chkBox name="<%=name.toString()%>"/>
                            </td>
                            <td class="<%=even?"statLt":"statDk"%>">
                                <tc-webtag:handle coderId='<%=resultRow.getLongItem("coder_id")%>'/>
                            </td>
                            <td class="<%=even?"statLt":"statDk"%>">
                                <rsc:item row="<%=resultRow%>" name="language_name"/>
                            </td>
                            <td class="<%=even?"statLt":"statDk"%>">
                                <rsc:item row="<%=resultRow%>" name="submission_number"/>
                            </td>
                            <td class="<%=even?"statLt":"statDk"%>">
                                <rsc:item row="<%=resultRow%>" name="submission_points"/>
                            </td>
                            <td class="<%=even?"statLt":"statDk"%>">
                                <rsc:item row="<%=resultRow%>" name="status_desc"/>
                            </td>
                        </tr>
                        <%even = !even;%>
                        </rsc:iterator>

                    </table>
                </TD>
            </tr>
        </table>

</form>


   <br>
   <br><br>
</td>

<%-- Right Column Begins --%>
<td width="170">
    <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="privatelabel"/>
    </jsp:include>
</td>
<%-- Right Column Ends --%>

<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
</tr>
</table>

<jsp:include page="../foot.jsp"/>
</body>
</html>