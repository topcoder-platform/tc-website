<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.web.codinginterface.longcontest.Constants"

        %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib prefix="mm" tagdir="/WEB-INF/tags" %>


<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<jsp:useBean id="resultMap" type="java.util.Map" scope="request"/>
<%
    ResultSetContainer rsc = (ResultSetContainer) resultMap.get("long_contest_example_results");
%>
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

<html>
<head>
    <title>TopCoder</title>
<jsp:include page="script.jsp" />
<jsp:include page="style.jsp">
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
         <jsp:include page="includes/global_left.jsp">
            <jsp:param name="node" value="m_long_contests"/>
         </jsp:include>
        </td>
        <%-- Left Column Ends --%>

        <%-- Center Column Begins --%>
        <td class="statTableSpacer" width="100%" valign="top">

            <jsp:include page="page_title.jsp">
                <jsp:param name="image" value="<%=image%>"/>
                <jsp:param name="title" value="Example Results"/>
            </jsp:include>

            <span class="bigHandle">Contest: <mm:contestLink roundId="${infoRow.map['round_id']}" name="${infoRow.map['display_name']}" /></span><br/>                
            <span class="bodySubtitle">Problem: <mm:problemLink roundId="${infoRow.map['round_id']}" problemId="${infoRow.map['problem_id']}" problemName="${infoRow.map['problem_name']}" /> </span><br/>
            <span class="bodySubtitle">Coder: <tc-webtag:handle context='marathon_match' coderId='<%=(String)request.getAttribute(Constants.CODER_ID)%>'/></span><br/>

            <%-- this substring bullshit is because we're storing a string in the db serialized and pretty
            printer wraps strings in double quotes.  they are getting removed with this substring as they
            are not appropriate in this case.  the writer is responsible for all formatting --%>
            <% int i=0;%>
            <rsc:iterator list="<%=rsc%>" id="resultRow">
                <h2><%=i%>) Score: <rsc:item name="score" row="<%=resultRow%>"/>
                    <% if (resultRow.getItem("processing_time").getResultData()!=null) { %>
                    Run Time: <rsc:item name="processing_time" row="<%=resultRow%>"/> ms
                    <% } %>
                </h2>
                <p>
                    <span class="bodySubtitle">Example Case: </span><br />
                    <pre><%=resultRow.getStringItem("expected_result").substring(1, resultRow.getStringItem("expected_result").length()-1)%></pre>
                </p>
                <p>
                    <span class="bodySubtitle">Fatal Errors: </span><br />
                    <pre><rsc:item name="fatal_errors" row="<%=resultRow%>"/></pre>
                </p>
                <p>
                    <span class="bodySubtitle">Standard Out: </span><br />
                    <pre><rsc:item name="stdout" row="<%=resultRow%>"/></pre>
                </p>
                <p>
                    <span class="bodySubtitle">Standard Error: </span><br />
                    <pre><rsc:item name="stderr" row="<%=resultRow%>"/></pre>
                </p>
                <hr />
                <% i++;%>
            </rsc:iterator>


        </td>

        <%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="public_right.jsp">
                <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
        </td>
        <%-- Right Column Ends --%>

        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0" alt="" /></td>
    </tr>
</table>

<jsp:include page="foot.jsp"/>
</body>
</html>