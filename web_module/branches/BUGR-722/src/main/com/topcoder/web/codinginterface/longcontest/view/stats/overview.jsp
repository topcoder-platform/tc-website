<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
<%@ taglib prefix="mm" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<html>
<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <script type="text/javascript">
    <!--
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
    function goTo(selection) {
        sel = selection.options[selection.selectedIndex].value;
        if (sel && sel != '#') {
            window.location = '${sessionInfo.servletPath}?<%=Constants.MODULE%>=ViewOverview&<%=Constants.ROUND_ID%>=' + sel;
        }
    }
    // -->
    </script>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="long_match_overview"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="left" class="bodyColumn">

<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="long_comps_topcoder"/>
</jsp:include>

<form name="f" action='${sessionInfo.servletPath}' method="get">

<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="ViewOverview"/>
<tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
<tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>

<div style="float:right; padding: 0px 0px 0px 5px;">
    <ci:sponsorImage image="<%=Constants.SPONSOR_IMAGE%>" alt="Sponsor" border="0" ifNull="&nbsp;"/>
</div>

Please select a contest:<br />
<tc-webtag:rscSelect name="<%=Constants.ROUND_ID%>" list="${rounds}" fieldText="display_name" fieldValue="round_id"  onChange="goTo(this)" useTopValue="false"/>
<br /><br />

<span class="bigHandle">Contest: ${infoRow.map['display_name'] }</span>
<br />
<span class="bodySubtitle">Problem: <mm:problemLink roundId="${infoRow.map['round_id']}" problemId="${infoRow.map['problem_id']}" problemName="${infoRow.map['problem_name']}" /> </span><br/>
                
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

<br />
Competitors: ${infoRow.map['num_competitors']}<br />
Avg. Submissions: <fmt:formatNumber value="${infoRow.map['avg_submissions']}"  minFractionDigits="2" maxFractionDigits="2"/></span><br />
<c:set var="forumId" value="<%= request.getAttribute(Constants.FORUM_ID) %>" />
<c:if test="${not empty forumId}">
    <tc-webtag:forumLink forumID="${forumId}" message="Discuss this contest"/>
</c:if>

            <center>
                <div class="pagingBox" style="width:300px;">
                    <tc-webtag:prevPage servletPath="${sessionInfo.servletPath}" list="${competitors}" styleClass="bcLink" /> |
                    <tc-webtag:nextPage servletPath="${sessionInfo.servletPath}" list="${competitors}" styleClass="bcLink" />
                </div>
            </center>

            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="stat">
            <tbody>
                <tr>
                    <td class="title" colspan="9">Contest Overview</td>
                </tr>
                <tr>
                    <td class="headerC">
                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="${columnMap['placed']}" includeParams="true" excludeParams="sr" />">Rank</a>
                    </td>
                    <td class="header">
                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="${columnMap['handle']}" includeParams="true" excludeParams="sr" />">Handle</a>
                    </td>
                    <td class="headerC">
                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="${columnMap['provisional_placed']}" includeParams="true" excludeParams="sr" />">Provisional Rank</a>
                    </td>
                    <td class="headerR">
                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="${columnMap['point_total']}" includeParams="true" excludeParams="sr" />">Provisional Score</a>
                    </td>
                    <td class="headerR">
                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="${columnMap['system_point_total']}" includeParams="true" excludeParams="sr" />">Final Score</a>
                    </td>
                    <td class="headerC">
                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="${columnMap['language_name']}" includeParams="true" excludeParams="sr" />">Language</a>
                    </td>
                    <td class="headerC">&nbsp;</td>
                    <td class="headerC">&nbsp;</td>
                    <td class="headerC">&nbsp;</td>
                </tr>
                <c:forEach items="${competitors}" var="row" varStatus="status">
                    <tr class='${status.index % 2 == 1? "dark" : "light" }'>
                        <td class="valueC">${row.map['placed']}</td>
                        <td class="value"><tc-webtag:handle context='marathon_match' coderId="${row.map['coder_id']}"/></td>                                                
                        <td class="valueC">${row.map['provisional_placed']}</td>
                        <td class="valueR"><fmt:formatNumber value="${row.map['point_total']}"  minFractionDigits="2" maxFractionDigits="2"/></td>                           
                        <td class="valueR"><fmt:formatNumber value="${row.map['system_point_total']}"  minFractionDigits="2" maxFractionDigits="2"/></td>
                        <td class="valueC">${row.map['language_name']}</td>
                        <td class="valueC" nowrap="nowrap"><a href="/longcontest/stats/?<%=Constants.MODULE%>=ViewSystemTestResults&amp;<%=Constants.ROUND_ID%>=${roundId}&amp;<%=Constants.PROBLEM_ID%>=${row.map['problem_id']}&amp;<%=Constants.CODER_ID%>=${row.map['coder_id']}">
                            results</a></td>
                        <td class="valueC" nowrap="nowrap"><a href="/longcontest/?<%=Constants.MODULE%>=ViewSubmissionHistory&amp;<%=Constants.ROUND_ID%>=${roundId}&amp;<%=Constants.PROBLEM_ID%>=${row.map['problem_id']}&amp;<%=Constants.CODER_ID%>=${row.map['coder_id']}">
                            submission history</a></td>
                        <td class="valueC" nowrap="nowrap"><a href="/longcontest/?<%=Constants.MODULE%>=ViewExampleHistory&amp;<%=Constants.ROUND_ID%>=${roundId}&amp;<%=Constants.PROBLEM_ID%>=${row.map['problem_id']}&amp;<%=Constants.CODER_ID%>=${row.map['coder_id']}">
                            example history</a></td>
                    </tr>
                 </c:forEach>
            </tbody>
            </table>

<div align="center">
        <div class="pagingBox" style="width:300px;">
            <tc-webtag:prevPage servletPath="${sessionInfo.servletPath}" list="${competitors}" styleClass="bcLink" /> |
            <tc-webtag:nextPage servletPath="${sessionInfo.servletPath}" list="${competitors}" styleClass="bcLink" />
        </div>

          View &nbsp;
          <tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
          &nbsp;at a time starting with &nbsp;
          <tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
          <a href="javascript:document.f.submit();" class="bcLink">&nbsp;[ submit ]</a>
</div>

</form>

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