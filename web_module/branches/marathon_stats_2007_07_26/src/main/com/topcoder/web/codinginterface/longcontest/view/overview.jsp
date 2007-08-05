<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.web.codinginterface.longcontest.Constants,
				com.topcoder.shared.dataAccess.DataAccessConstants"
                
        %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="codinginterface.tld" prefix="ci" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<jsp:useBean id="resultMap" type="java.util.Map" scope="request"/>
<jsp:useBean id="sortLinkBase" class="java.lang.String" scope="request"/>
<jsp:useBean id="prevPageLink" class="java.lang.String" scope="request"/>
<jsp:useBean id="nextPageLink" class="java.lang.String" scope="request"/>
<%    
    ResultSetContainer categories = (ResultSetContainer) resultMap.get("long_contest_round_categories");
    ResultSetContainer rsc = (ResultSetContainer) resultMap.get("long_contest_overview_info");
    ResultSetContainer.ResultSetRow infoRow = (ResultSetContainer.ResultSetRow) rsc.get(0);
%>
<% int roundType = request.getAttribute(Constants.ROUND_TYPE_ID) == null ? Constants.LONG_ROUND_TYPE_ID : ((Integer) request.getAttribute(Constants.ROUND_TYPE_ID)).intValue();%>
<% String myNode = "long_compete";
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
document.matchWinnersForm.submit();
return false;
} else return true;
}
function next() {
var myForm = document.f;
myForm.<%=DataAccessConstants.START_RANK%>.value=<c:out value="${requestScope[defaults][startRank]}"/>+parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
myForm.submit();
}
function previous() {
var myForm = document.matchWinnersForm;
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

<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="MatchWinners"/>

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
<tc-webtag:rscSelect name="<%=Constants.ROUND_ID%>" list="${rounds}" fieldText="name" fieldValue="round_id"  onChange="goTo(this)"/>
<br><br>


<span class="bigHandle">Contest: <rsc:item name="contest_name" row="<%=infoRow%>"/> &gt; <rsc:item name="round_name" row="<%=infoRow%>"/></span>
<br>
<span class="bodySubtitle">Categories:
<% if (categories.isEmpty()) { %> None <% } %>
<%boolean first = true;%>
<rsc:iterator list="<%=categories%>" id="resultRow">
    <% if (!first) { %>, <% } %><rsc:item name="problem_category_desc" row="<%=resultRow%>"/>
    <% first = false; %>
</rsc:iterator>
<br>
Competitors: <rsc:item name="num_competitors" row="<%=infoRow%>"/><br>
Avg. Submissions: <rsc:item name="avg_submissions" row="<%=infoRow%>" format="#.##" ifNull="N/A"/></span><br>
<A href="${sessionInfo.servletPath}?<%=Constants.MODULE%>=ViewProblemStatement&<%=Constants.ROUND_ID%>=<rsc:item name="round_id" row="<%=infoRow%>"/>&<%=Constants.PROBLEM_ID%>=<rsc:item name="problem_id" row="<%=infoRow%>"/>" class="bcLink">Problem
    Statement</A><br>

<% if (request.getAttribute(Constants.FORUM_ID) != null) { %>
<tc-webtag:forumLink forumID="<%=((Long)request.getAttribute(Constants.FORUM_ID)).longValue()%>" message="Discuss this contest"/>
<% } %>
<c:set var="forumId" value="<%= request.getAttribute(Constants.FORUM_ID) %>" />
<c:if test="${not empty forumId}">
	<tc-webtag:forumLink forumID="${forumId}" message="Discuss this contest"/>
</c:if>

				<div class="pagingBox" style="width:300px;">
				    <c:choose>
				        <c:when test="${croppedDataBefore}">
				            <a href="Javascript:previous()" class="bcLink">&lt;&lt; prev</a>
				        </c:when>
				        <c:otherwise>
				            &lt;&lt; prev
				        </c:otherwise>
				    </c:choose>
				    |
				    <c:choose>
				        <c:when test="${croppedDataAfter}">
				            <a href="Javascript:next()" class="bcLink">next &gt;&gt;</a>
				        </c:when>
				        <c:otherwise>
				            next &gt;&gt;
				        </c:otherwise>
				    </c:choose>
				</div>

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
					<c:set var="params" value="<%=Constants.ROUND_ID%>=${roundId}&<%=Constants.PROBLEM_ID%>=${row.map['problem_id']}&<%=Constants.CODER_ID%>=${row.map['coder_id']}" />
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

	<div class="pagingBox" style="width:300px;">
	    <c:choose>
	        <c:when test="${croppedDataBefore}">
	            <a href="Javascript:previous()" class="bcLink">&lt;&lt; prev</a>
	        </c:when>
	        <c:otherwise>
	            &lt;&lt; prev
	        </c:otherwise>
	    </c:choose>
	    |
	    <c:choose>
	        <c:when test="${croppedDataAfter}">
	            <a href="Javascript:next()" class="bcLink">next &gt;&gt;</a>
	        </c:when>
	        <c:otherwise>
	            next &gt;&gt;
	        </c:otherwise>
	    </c:choose>
	</div>

          View &#160;
          <tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
          &#160;at a time starting with &#160;
          <tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
          <a href="javascript:document.matchWinnersForm.submit();" class="bcLink">&#160;[ submit ]</a>
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