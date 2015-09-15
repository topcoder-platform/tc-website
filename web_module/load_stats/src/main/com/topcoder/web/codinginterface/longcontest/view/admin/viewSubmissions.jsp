<%@ page contentType="text/html;charset=utf-8" %>
<%@ page
        language="java"
        import="com.topcoder.web.codinginterface.longcontest.Constants"
        %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="codinginterface.tld" prefix="ci" %>
<% ResultSetContainer submissions = (ResultSetContainer) request.getAttribute("submissions");%>
<% String example = (String) request.getAttribute(Constants.EXAMPLE_FLAG);%>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<% int roundType = request.getAttribute(Constants.ROUND_TYPE_ID) == null ? Constants.LONG_ROUND_TYPE_ID : ((Integer) request.getAttribute(Constants.ROUND_TYPE_ID)).intValue();%>
<% String myNode = "long_compete";
    String image = "long_comps_topcoder";
     if (roundType==Constants.LONG_PRACTICE_ROUND_TYPE_ID || roundType==Constants.AMD_LONG_PRACTICE_ROUND_TYPE_ID) {
         myNode="long_practice";
     } else if (roundType ==Constants.INTEL_LONG_PRACTICE_ROUND_TYPE_ID) {
         myNode="long_intelmtcs_practice";
         image = "long_comps_intel";
     } else if (roundType ==Constants.INTEL_LONG_ROUND_TYPE_ID) {
         myNode="long_intelmtcs_compete";
         image = "long_comps_intel";
     }
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder</title>
<jsp:include page="../script.jsp" />
<jsp:include page="../style.jsp">
<jsp:param name="key" value="tc_stats"/>
</jsp:include>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <SCRIPT type="text/javascript">
        function submit(module) {
            document.adminForm.<%=Constants.MODULE%> = module;
            document.adminForm.submit();
        }
        function checkall(check) {
            for (i = 0; i < document.adminForm.elements.length; i++) {
                if (document.adminForm.elements[i].type == "checkbox") {
                    document.adminForm.elements[i].checked = (check == true);
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
         <jsp:include page="../includes/global_left.jsp">
            <jsp:param name="node" value="<%=myNode%>"/>
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
        <tc-webtag:hiddenInput name="<%=Constants.MODULE%>" value="AdminForceSubmit"/>
        <%if (!submissions.isEmpty()) { %>
            <tc-webtag:hiddenInput name="<%=Constants.ROUND_ID%>" value="<%=submissions.getStringItem(0, "round_id")%>"/>
        <% } %>
        <tc-webtag:hiddenInput name="<%=Constants.EXAMPLE_FLAG%>"/>
        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">

            <tr><td><a href="?<%=Constants.MODULE%>=AdminHome">Back to the Long Contest Admin Home</a></td></tr>

            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
                        <tr><td class="statLt" colspan="6"><a href="javascript:checkall(true);">check all</a> |
                            <a href="javascript:checkall(false);">uncheck all</a> |
                            <a href="javascript:document.adminForm.submit();">submit</a></td></tr>
                        <tr>
                            <td class="tableHeader" width="5%"></td>
                            <td class="tableHeader" width="15%">
                                <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewAdminForceSubmit<tc-webtag:sort column="<%=submissions.getColumnIndex("handle_lower")%>" includeParams="true" excludeParams="<%=Constants.MODULE%>"/>">Handle</A>
                            </td>
                            <td class="tableHeader" width="10%">
                                <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewAdminForceSubmit<tc-webtag:sort column="<%=submissions.getColumnIndex("language_name")%>" includeParams="true" excludeParams="<%=Constants.MODULE%>"/>">Language</A>
                            </td>
                            <td class="tableHeader" width="10%">
                                <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewAdminForceSubmit<tc-webtag:sort column="<%=submissions.getColumnIndex("submission_number")%>" includeParams="true" excludeParams="<%=Constants.MODULE%>"/>">Submission
                                    Number</A></td>
                            <td class="tableHeader" width="25%">
                                <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewAdminForceSubmit<tc-webtag:sort column="<%=submissions.getColumnIndex("submission_points")%>" includeParams="true" excludeParams="<%=Constants.MODULE%>"/>">Points</A>
                            </td>
                            <td class="tableHeader" width="35%">
                                <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewAdminForceSubmit<tc-webtag:sort column="<%=submissions.getColumnIndex("status_desc")%>" includeParams="true" excludeParams="<%=Constants.MODULE%>"/>">Status</A>
                            </td>
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
                                    <tc-webtag:handle context='marathon_match' coderId='<%=resultRow.getLongItem("coder_id")%>'/>
                                </td>
                                <td class="<%=even?"statLt":"statDk"%>">
                                    <rsc:item row="<%=resultRow%>" name="language_name"/>
                                </td>
                                <td class="<%=even?"statLt":"statDk"%>">
                                    <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewProblemSolution&<%=Constants.PROBLEM_ID%>=<rsc:item name="problem_id" row="<%=resultRow%>"/>&<%=Constants.ROUND_ID%>=<rsc:item name="round_id" row="<%=resultRow%>"/>&<%=Constants.CODER_ID%>=<rsc:item name="coder_id" row="<%=resultRow%>"/>&<%=Constants.SUBMISSION_NUMBER%>=<rsc:item name="submission_number" row="<%=resultRow%>"/>&<%=Constants.EXAMPLE_FLAG%>=<%=example%>" class="statLink">
                                        <rsc:item row="<%=resultRow%>" name="submission_number"/>
                                    </A>
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
                        <tr><td class="statLt" colspan="6"><a href="javascript:checkall(true);">check all</a> |
                            <a href="javascript:checkall(false);">uncheck all</a> |
                            <a href="javascript:document.adminForm.submit();">submit</a></td></tr>

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