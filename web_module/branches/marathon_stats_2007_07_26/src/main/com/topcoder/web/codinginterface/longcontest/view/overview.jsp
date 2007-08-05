<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page
        language="java"
        import="com.topcoder.web.codinginterface.longcontest.Constants,
				com.topcoder.shared.dataAccess.DataAccessConstants"
                %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="codinginterface.tld" prefix="ci" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>


<% 
   int roundType = request.getAttribute(Constants.ROUND_TYPE_ID) == null ? Constants.LONG_ROUND_TYPE_ID : ((Integer) request.getAttribute(Constants.ROUND_TYPE_ID)).intValue();
   String myNode = "long_compete";
    String image = "long_comps_topcoder";
    if (roundType == Constants.LONG_PRACTICE_ROUND_TYPE_ID) {
        myNode = "long_practice";
    } else if (roundType == Constants.INTEL_LONG_PRACTICE_ROUND_TYPE_ID) {
        myNode = "long_intelmtcs_practice";
        image = "long_comps_intel";
    } else if (roundType == Constants.INTEL_LONG_ROUND_TYPE_ID) {
        myNode = "long_intelmtcs_compete";
        image = "long_comps_intel";
    }
%>

<html>
<head>
    <title>TopCoder</title>
    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
<script type="text/javascript">
function submitEnter(e) {
var keycode;
if (window.event) keycode = window.event.keyCode;
else if (e) keycode = e.which;
else return true;
if (keycode == 13) {
document.f.submit();
return false;
} else return true;
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
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="<%=myNode%>"/>
    </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

<jsp:include page="page_title.jsp">
    <jsp:param name="image" value="<%=image%>"/>
    <jsp:param name="title" value="Contest Overview"/>
</jsp:include>

<form name="f" action='${sessionInfo.servletPath}' method="get">

<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="ViewOverview"/>
<tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
<tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>

<div style="float:right; padding: 0px 0px 0px 5px;">
    <ci:sponsorImage image="<%=Constants.SPONSOR_IMAGE%>" alt="Sponsor" border="0" ifNull="&#160;"/>
</div>

<script language="JavaScript">
    <!--
    function goTo(selection) {
        sel = selection.options[selection.selectedIndex].value;
        if (sel && sel != '#') {
            window.location = '${sessionInfo.servletPath}?<%=Constants.MODULE%>=ViewOverview&<%=Constants.ROUND_ID%>=' + sel;
        }
    }
    // -->
</script>
Please select a contest:<br>
<tc-webtag:rscSelect name="<%=Constants.ROUND_ID%>" list="${rounds}" fieldText="name" fieldValue="round_id"  onChange="goTo(this)" useTopValue="false"/>
<br><br>


<span class="bigHandle">Contest: ${infoRow.map['contest_name']} &gt; ${infoRow.map['ROUND_name']}</span>
<br>
<span class="bodySubtitle">Categories:
<c:choose>
	<c:when test="${empty categories}">None</c:when>
	<c:otherwise>
		<c:forEach var="category" items="${categories}" varStatus="status">
			<c:if test="${not status.first}">, </c:if>
			${category.map['problem_category_desc'] }
		</c:forEach>
	</c:otherwise>
</c:choose>

<br>
Competitors: ${infoRow.map['num_competitors']}<br>
Avg. Submissions: <fmt:formatNumber value="${infoRow.map['avg_submissions']}"  minFractionDigits="2" maxFractionDigits="2"/></span><br>
<A href="${sessionInfo.servletPath}?<%=Constants.MODULE%>=ViewProblemStatement&<%=Constants.ROUND_ID%>=${infoRow.map['round_id']}&<%=Constants.PROBLEM_ID%>=${infoRow.map['problem_id']}" class="bcLink">Problem
    Statement</A><br>

<c:set var="forumId" value="<%= request.getAttribute(Constants.FORUM_ID) %>" />
<c:if test="${not empty forumId}">
	<tc-webtag:forumLink forumID="${forumId}" message="Discuss this contest"/>
</c:if>

			<center>
				<div class="pagingBox" style="width:300px;">
					<tc-webtag:prevPage servletPath="${sessionInfo.servletPath}" container="${competitors}" styleClass="bcLink" /> |
					<tc-webtag:nextPage servletPath="${sessionInfo.servletPath}" container="${competitors}" styleClass="bcLink" />
				</div>
			</center>
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
    <tr>
        <td>
            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="stat">

                <tr>
                    <td class="tableTitle" colspan="9">Contest Overview</td>
                </tr>
                <tr>
                    <td class="header" width="5%" align="right">
                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="${columnMap['placed']}" includeParams="true" excludeParams="sr" />">Rank</a></td>
                    <td class="header" width="15%">
                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="${columnMap['handle']}" includeParams="true" excludeParams="sr" />">Handle</a></td>
                    </td>
                    <td class="header" width="15%" align="right">
                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="${columnMap['provisional_placed']}" includeParams="true" excludeParams="sr" />">Provisional Rank</a></td>
                    <td class="header" width="15%" align="right">
                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="${columnMap['point_total']}" includeParams="true" excludeParams="sr" />">Provisional Score</a></td>
                    <td class="header" width="15%" align="right">
                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="${columnMap['system_point_total']}" includeParams="true" excludeParams="sr" />">Final Score</a></td>
                    <td class="header" width="10%" align="center">
                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="${columnMap['language_name']}" includeParams="true" excludeParams="sr" />">Language</a></td>
                    <td class="headerC" width="10%">&#160;</td>
                    <td class="headerC" width="15%">&#160;</td>
                    <td class="headerC" width="15%">&#160;</td>
                </tr>
				<c:forEach items="${competitors}" var="row" varStatus="status">
				    <tr class='${status.index % 2 == 1? "dark" : "light" }'>
                        <td class="valueR">${row.map['placed']}</td>
                        <td class="value"><tc-webtag:handle context='marathon_match' coderId="${row.map['coder_id']}"/></td>                                                
                        <td class="valueR">${row.map['provisional_placed']}</td>
                        <td class="valueR"><fmt:formatNumber value="${row.map['point_total']}"  minFractionDigits="2" maxFractionDigits="2"/></td>                           
                        <td class="valueR"><fmt:formatNumber value="${row.map['system_point_total']}"  minFractionDigits="2" maxFractionDigits="2"/></td>
                        <td class="valueC">${row.map['language_name']}</td>
                        <td class="valueC" nowrap="nowrap"><A href="${sessionInfo.servletPath}?<%=Constants.MODULE%>=ViewSystemTestResults&<%=Constants.ROUND_ID%>=${roundId}&<%=Constants.PROBLEM_ID%>=${row.map['problem_id']}&<%=Constants.CODER_ID%>=${row.map['coder_id']}">
                        	results</A></td>
                        <td class="valueC" nowrap="nowrap"><A href="${sessionInfo.servletPath}?<%=Constants.MODULE%>=ViewSubmissionHistory&<%=Constants.ROUND_ID%>=${roundId}&<%=Constants.PROBLEM_ID%>=${row.map['problem_id']}&<%=Constants.CODER_ID%>=${row.map['coder_id']}">
                        	submission history</A></td>
                        <td class="valueC" nowrap="nowrap"><A href="${sessionInfo.servletPath}?<%=Constants.MODULE%>=ViewExampleHistory&<%=Constants.ROUND_ID%>=${roundId}&<%=Constants.PROBLEM_ID%>=${row.map['problem_id']}&<%=Constants.CODER_ID%>=${row.map['coder_id']}">
                        	example history</A></td>
                    </tr>
                 </c:forEach>
            </TABLE>
        </TD>
    </tr>
</TABLE>

<center>
		<div class="pagingBox" style="width:300px;">
			<tc-webtag:prevPage servletPath="${sessionInfo.servletPath}" container="${competitors}" styleClass="bcLink" /> |
			<tc-webtag:nextPage servletPath="${sessionInfo.servletPath}" container="${competitors}" styleClass="bcLink" />
		</div>

          View &#160;
          <tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
          &#160;at a time starting with &#160;
          <tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
          <a href="javascript:document.f.submit();" class="bcLink">&#160;[ submit ]</a>
      </div>
      	</center>
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