<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.web.codinginterface.longcontest.Constants,
                com.topcoder.web.common.StringUtils"

        %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="codinginterface.tld" prefix="ci" %>
<%@ taglib prefix="mm" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%
    ResultSetContainer.ResultSetRow testRow = (ResultSetContainer.ResultSetRow) request.getAttribute("infoRow");
%>
<html>
<head>
    <title>TopCoder</title>
<jsp:include page="../script.jsp" />
<jsp:include page="../style.jsp">
<jsp:param name="key" value="tc_stats"/>
</jsp:include>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <%-- Left Column Begins--%>
        <td width="180">
         <jsp:include page="../includes/global_left.jsp">
            <jsp:param name="node" value="m_long_contests"/>
         </jsp:include>
        </td>
        <%-- Left Column Ends --%>

        <%-- Center Column Begins --%>
        <TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="<%=image%>"/>
                <jsp:param name="title" value="System Test"/>
            </jsp:include>

            <div style="float:right; padding: 0px 0px 0px 5px;">
               <ci:sponsorImage image="<%=Constants.SPONSOR_IMAGE%>" alt="Sponsor" border="0" ifNull="&#160;"/>
               <A href="/longcontest/stats/?<%=Constants.MODULE%>=ViewSystemTestResults&<%=Constants.ROUND_ID%>=<rsc:item name="round_id" row="<%=testRow%>"/>&<%=Constants.PROBLEM_ID%>=<rsc:item name="problem_id" row="<%=testRow%>"/>">back to results</A>
            </div>

            <span class="bigHandle">Contest: <mm:contestLink roundId="${infoRow.map['round_id']}" name="${infoRow.map['display_name']}" /></span><br/>                
            <span class="bodySubtitle">Problem: <mm:problemLink roundId="${infoRow.map['round_id']}" problemId="${infoRow.map['problem_id']}" problemName="${infoRow.map['problem_name']}" /> </span><br/>

            <p>

           Test Case:
                </p>
            <%-- this substring bullshit is because we're storing a string in the db serialized and pretty
            printer wraps strings in double quotes.  they are getting removed with this substring as they
            are not appropriate in this case.  the writer is responsible for all formatting --%>
            <pre><%=testRow.getStringItem("expected_result").substring(1, testRow.getStringItem("expected_result").length()-1)%></pre>


        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>