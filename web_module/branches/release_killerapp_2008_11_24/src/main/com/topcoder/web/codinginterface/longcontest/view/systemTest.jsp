<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.web.codinginterface.longcontest.Constants"

        %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="codinginterface.tld" prefix="ci" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<jsp:useBean id="resultMap" type="java.util.Map" scope="request"/>
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
<%
    ResultSetContainer rsc = (ResultSetContainer) resultMap.get("long_contest_system_test_detail");
    ResultSetContainer.ResultSetRow testRow = null;
    if (rsc != null && !rsc.isEmpty())
        testRow = (ResultSetContainer.ResultSetRow) rsc.get(0);
%>
<html>
<head>
    <title>TopCoder</title>
<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_stats"/>
</jsp:include>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>

<body>

<jsp:include page="top.jsp">
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <%-- Left Column Begins--%>
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="<%=myNode%>"/>
         </jsp:include>
        </td>
        <%-- Left Column Ends --%>

        <%-- Center Column Begins --%>
        <TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

            <jsp:include page="page_title.jsp">
                <jsp:param name="image" value="<%=image%>"/>
                <jsp:param name="title" value="System Test"/>
            </jsp:include>

            <div style="float:right; padding: 0px 0px 0px 5px;">
               <ci:sponsorImage image="<%=Constants.SPONSOR_IMAGE%>" alt="Sponsor" border="0" ifNull="&#160;"/>
               <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewSystemTestResults&<%=Constants.ROUND_ID%>=<rsc:item name="round_id" row="<%=testRow%>"/>&<%=Constants.PROBLEM_ID%>=<rsc:item name="problem_id" row="<%=testRow%>"/>">back to results</A>
            </div>

            <span class="bigHandle">Contest: <A href="?module=ViewOverview&rd=<rsc:item name="round_id" row="<%=testRow%>"/>" class="bcLink"><rsc:item name="contest_name" row="<%=testRow%>"/> &gt; <rsc:item name="round_name" row="<%=testRow%>"/></A></span><br>
            <span class="bodySubtitle">Problem: <a class="bcLink" href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewProblemStatement&<%=Constants.ROUND_ID%>=<rsc:item name="round_id" row="<%=testRow%>"/>&<%=Constants.PROBLEM_ID%>=<rsc:item name="problem_id" row="<%=testRow%>"/>">
                <rsc:item name="problem_name" row="<%=testRow%>"/></a></span>

            <p>

           Test Case:
                </p>
            <%-- this substring bullshit is because we're storing a string in the db serialized and pretty
            printer wraps strings in double quotes.  they are getting removed with this substring as they
            are not appropriate in this case.  the writer is responsible for all formatting --%>
            <pre><%=testRow.getStringItem("expected_result").substring(1, testRow.getStringItem("expected_result").length()-1)%></pre>


        </td>

        <%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="public_right.jsp">
                <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
        </td>
        <%-- Right Column Ends --%>

        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
    </tr>
</table>

<jsp:include page="foot.jsp"/>
</body>
</html>
