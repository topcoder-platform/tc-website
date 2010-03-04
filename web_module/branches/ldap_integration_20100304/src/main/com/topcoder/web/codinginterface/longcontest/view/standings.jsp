<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="codinginterface.tld" prefix="ci" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mm" tagdir="/WEB-INF/tags" %>

<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"
        %>

<%@ page import="com.topcoder.web.codinginterface.longcontest.Constants" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="java.util.Date"%>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<% ResultSetContainer standings = (ResultSetContainer) request.getAttribute(Constants.ROUND_STANDINGS_LIST_KEY); %>
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

<c:set value="<%=com.topcoder.web.common.BaseProcessor.DEFAULTS_KEY%>" var="defaults"/>
<c:set value="<%=DataAccessConstants.START_RANK%>" var="startRank"/>

<html>
<head>
    <title>TopCoder</title>
<jsp:include page="script.jsp" />
<jsp:include page="style.jsp">
<jsp:param name="key" value="tc_stats"/>
</jsp:include>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript">
        function next() {
            var myForm = document.standingsForm;
            myForm.<%=DataAccessConstants.START_RANK%>.value=<c:out value="${requestScope[defaults][startRank]}"/>+parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
            myForm.submit();
        }
        function previous() {
            var myForm = document.standingsForm;
            myForm.<%=DataAccessConstants.START_RANK%>.value=<c:out value="${requestScope[defaults][startRank]}"/>-parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
            myForm.submit();
        }
    </script>
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
            <jsp:param name="node" value="<%=myNode%>"/>
         </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td class="statTableSpacer" width="100%" valign="top">

<jsp:include page="page_title.jsp">
    <jsp:param name="image" value="<%=image%>"/>
    <jsp:param name="title" value="Standings"/>
</jsp:include>

<div style="float:right; padding: 0px 0px 0px 5px;">
   <ci:sponsorImage image="<%=Constants.SPONSOR_IMAGE%>" alt="Sponsor" border="0" ifNull="&#160;"/>
</div>
<%if (request.getAttribute(Constants.MESSAGE) != null) {%>
<span class="errorText"><%=request.getAttribute(Constants.MESSAGE)%></span><br>
<%}%>
<span class="bigHandle">Contest: ${infoRow.map['display_name']}</span><br/>                
<span class="bodySubtitle">Problem: <mm:problemLink roundId="${infoRow.map['round_id']}" problemId="${infoRow.map['problem_id']}" problemName="${infoRow.map['problem_name']}" /> </span><br/>
    
    <c:if test="${not isIntel}">
        <span class="bodySubtitle">Registrants: <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewRegistrants&amp;<%=Constants.ROUND_ID%>=${infoRow.map['round_id']}" class="bcLink">

               ${infoRow.map['num_registrants']}</a></span>
            <br/>
            </c:if>
<span class="bodySubtitle">Competitors:  ${infoRow.map['num_competitors']}</span>
<br>
<form name="standingsForm" action='<jsp:getProperty name="sessionInfo" property="servletPath"/>' method="get">
    <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
    <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>
    <tc-webtag:hiddenInput name="<%=DataAccessConstants.NUMBER_RECORDS%>"/>
    <tc-webtag:hiddenInput name="<%=DataAccessConstants.START_RANK%>"/>
    <tc-webtag:hiddenInput name="<%=Constants.ROUND_ID%>"/>
    <tc-webtag:hiddenInput name="<%=Constants.MODULE%>" value="ViewStandings"/>


<div style="clear: both;" align="center">
   <div class="pagingBox">
   <%=(standings.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
       | <%=(standings.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>
   </div>
</div>

<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
    <tr>
        <td>
            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">

                <tr>
                    <td class="tableTitle" colspan="7">Standings</td>
                </tr>
                <tr>
                    <td class="tableHeader" width="20">
                        <A href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=standings.getColumnIndex("handle_lower")%>" includeParams="true" excludeParams="sr;nr"/>">Handle</A>
                    </td>
                    <td class="tableHeader" width="20%" align="right" nowrap="nowrap">
                        <A href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=standings.getColumnIndex("points")%>" includeParams="true" excludeParams="sr;nr"/>">Score</A>
                    </td>
                    <td class="tableHeader" width="20%" align="center" nowrap="nowrap">
                        <A href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=standings.getColumnIndex("points")%>" includeParams="true" excludeParams="sr;nr"/>">Rank</A>
                    </td>
                    <td class="tableHeader" width="20%" align="center" nowrap="nowrap">
                        <A href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=standings.getColumnIndex("submit_time")%>" includeParams="true" excludeParams="sr;nr"/>">Last Submission Time</A>
                    </td>
                    <td class="tableHeader" width="20%" align="center" nowrap="nowrap">
                        <A href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=standings.getColumnIndex("language_name")%>" includeParams="true" excludeParams="sr;nr"/>">Language</A>
                    </td>
                    <td class="tableHeader" width="20%" align="center" nowrap="nowrap">
                        <A href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=standings.getColumnIndex("test_number")%>" includeParams="true" excludeParams="sr;nr"/>">Example Tests</A>
                    </td>
                    <td class="tableHeader" width="20%" align="center" nowrap="nowrap">
                        <A href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=standings.getColumnIndex("submission_number")%>" includeParams="true" excludeParams="sr;nr"/>">Submissions</A>
                    </td>
                </tr>
                <%-- ITERATOR --%>
                <%boolean even = true;%>
                <%--control whitespace to reduce html size --%>
                <rsc:iterator list="<%=standings%>" id="resultRow"><tr>
<td class="<%=even?"statLt":"statDk"%>">
<%=resultRow.getIntItem("status_id")==130?"*":""%><tc-webtag:handle context='marathon_match' coderId="<%=resultRow.getLongItem("coder_id")%>"/></td>
<td class="<%=even?"statLt":"statDk"%>" align="right" style="padding-right: 7px;">
<rsc:item name="points" row="<%=resultRow%>" format="0.00"/></td>
<td class="<%=even?"statLt":"statDk"%>" align="center">
<% if (resultRow.getItem("points").getResultData()!=null){ %><rsc:item name="rank" row="<%=resultRow%>"/><% } %></td>
<td class="<%=even?"statLt":"statDk"%>" align="center"><%if (resultRow.getItem("submit_time").getResultData()!=null) { %>
<tc-webtag:format object="<%=new Date(resultRow.getLongItem("submit_time"))%>" format="MM.dd.yyyy HH:mm:ss"/><% } %></td>
<td class="<%=even?"statLt":"statDk"%>" align="center">
<tc-webtag:format object="<%=resultRow.getStringItem("language_name")%>"/></td></td>
<td class="<%=even?"statLt":"statDk"%>" align="center">
<% if (resultRow.getIntItem("test_number")>0) { %>
<A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=<%=Constants.RP_EXAMPLE_HISTORY%>&<%=Constants.CODER_ID%>=<rsc:item name="coder_id" row="<%=resultRow%>"/>&<%=Constants.ROUND_ID%>=<%=request.getAttribute(Constants.ROUND_ID)%>&<%=Constants.COMPONENT_ID%>=<rsc:item name="component_id" row="<%=resultRow%>"/>" class="statLink">
<rsc:item name="test_number" row="<%=resultRow%>"/>
</A>
<% } else { %>
<rsc:item name="test_number" row="<%=resultRow%>"/>
<% } %>
</td>
<td class="<%=even?"statLt":"statDk"%>" align="center">
<% if (resultRow.getIntItem("submission_number")>0) { %>
<A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=<%=Constants.RP_SUBMISSION_HISTORY%>&<%=Constants.CODER_ID%>=<rsc:item name="coder_id" row="<%=resultRow%>"/>&<%=Constants.ROUND_ID%>=<%=request.getAttribute(Constants.ROUND_ID)%>&<%=Constants.COMPONENT_ID%>=<rsc:item name="component_id" row="<%=resultRow%>"/>" class="statLink">
<rsc:item name="submission_number" row="<%=resultRow%>"/>
</A>
<% } else { %>
<rsc:item name="submission_number" row="<%=resultRow%>"/>
<% } %>
</td>
</tr><%even = !even;%></rsc:iterator>
                <%-- END ITERATOR --%>
            </table>
        </td>
    </tr>
</table>
    <p>* Indicates that this competitor's most recent test or submission has not yet been processed</p>

<div class="pagingBox">
<%=(standings.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
    | <%=(standings.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>
</div>
</form>

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