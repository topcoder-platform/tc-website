<%@ page contentType="text/html;charset=utf-8" %>
<%@ page
        language="java"
        import="com.topcoder.web.codinginterface.longcontest.Constants"
        %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="codinginterface.tld" prefix="ci" %>
<% ResultSetContainer rounds = (ResultSetContainer) request.getAttribute("roundList");%>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<% int roundType = request.getAttribute(Constants.ROUND_TYPE_ID)==null?Constants.LONG_ROUND_TYPE_ID:((Integer)request.getAttribute(Constants.ROUND_TYPE_ID)).intValue();%>
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
        function submit(module, example) {
            document.adminForm.<%=Constants.MODULE%>.value=module;
            document.adminForm.<%=Constants.EXAMPLE_FLAG%>.value=example;
            document.adminForm.submit();
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


    <form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="GET" name="adminForm">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE%>"/>
        <tc-webtag:hiddenInput name="<%=Constants.EXAMPLE_FLAG%>"/>
        <p>
        Please select a contest:<br>
        <tc-webtag:rscSelect name="<%=Constants.ROUND_ID%>" list="<%=rounds%>" fieldText="name" fieldValue="round_id"/>
        </p>

        <p>
        What would you like to do with it?
        </p>

        <ul>
            <li><a href="javascript:submit('ViewAdminForceSubmit', 0);">Resubmit Competitor Code</a></li>
            <li><a href="javascript:submit('ViewAdminForceSubmit', 1);">Resubmit Example Competitor Code</a></li>
        </ul>


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