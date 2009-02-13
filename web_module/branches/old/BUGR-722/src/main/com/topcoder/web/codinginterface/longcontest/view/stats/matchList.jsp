<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="com.topcoder.web.common.BaseProcessor" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.WebConstants" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page language="java"%>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="mm" tagdir="/WEB-INF/tags" %>

<c:set value="<%=BaseProcessor.DEFAULTS_KEY%>" var="defaults"/>
<c:set value="<%=DataAccessConstants.START_RANK%>" var="startRank"/>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

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
    function submitEnter(e) {
        var keycode;
        if (window.event) keycode = window.event.keyCode;
        else if (e) keycode = e.which;
        else return true;
        if (keycode == 13) {
            document.matchListForm.submit();
            return false;
        } else return true;
    }
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
                <jsp:param name="node" value="long_match_archive"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">

                <jsp:include page="../page_title.jsp" >
                    <jsp:param name="image" value="statistics_w"/>
                    <jsp:param name="title" value="Match Archive"/>
                </jsp:include>

                <form name="matchListForm" action='<jsp:getProperty name="sessionInfo" property="servletPath"/>' method="get">

                <tc-webtag:hiddenInput name="<%=WebConstants.MODULE_KEY%>" value="MatchList"/>
                <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
                <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>

                <center>
                <div class="pagingBox" style="width:300px;">
                    <tc-webtag:prevPage servletPath="${sessionInfo.servletPath}" list="${matches}" styleClass="bcLink" /> |
                    <tc-webtag:nextPage servletPath="${sessionInfo.servletPath}" list="${matches}" styleClass="bcLink" />
                </div>
                </center>

            <table class="stat" cellpadding="0" cellspacing="0" width="100%" border="0">
               <tr><td class="title" colspan="7">Marathon Match Archive</td></tr>
               <tr>
                  <td class="header" width="10%"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="${columnMap['date']}" includeParams="true" excludeParams="sr" />">Date</a></td>
                  <td class="header" width="33%"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="${columnMap['display_name']}" includeParams="true" excludeParams="sr" />">Match</a></td>
                  <td class="header" width="33%"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="${columnMap['problem_name']}" includeParams="true" excludeParams="sr" />">Problem</a></td>
                  <td class="headerC" nowrap="nowrap"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="${columnMap['num_competitors']}" includeParams="true" excludeParams="sr" />">Competitors</a></td>
                  <td class="headerC" nowrap="nowrap"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="${columnMap['num_submissions']}" includeParams="true" excludeParams="sr" />">Total Submissions</a></td>
                  <td class="headerC" nowrap="nowrap"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="${columnMap['avg_submissions']}" includeParams="true" excludeParams="sr" />">Avg. Submissions</a></td>
                  <td class="headerC" width="33%">&#160;</td>
               </tr>
               <c:forEach items="${matches}" var="row" varStatus="status">
                   <tr class='${status.index % 2 == 1? "dark" : "light" }'>
                        <td class="value"><tc-webtag:format object="${row.map['date']}" format="MM.dd.yyyy" /></td>
                        <td class="value" nowrap="nowrap">
                            <a href="/longcontest/stats/?module=ViewOverview&amp;rd=${row.map['round_id']}">${row.map['display_name']}</a>                                                    
                        </td>
                        <td class="value">
                           <mm:problemLink roundId="${row.map['round_id']}" problemId="${row.map['problem_id']}" problemName="${row.map['problem_name']}" />
                        </td>
                        <td class="valueR">${row.map['num_competitors']}</td>
                        <td class="valueR">${row.map['num_submissions']}</td>
                        <td class="valueR"><fmt:formatNumber value="${row.map['avg_submissions']}"  minFractionDigits="2" maxFractionDigits="2"/></td>      
                        <td class="valueC"><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&amp;forumID=${row.map['forum_id']}" class="statLink">discuss</a></td>
                    </tr>   
               </c:forEach>   
            </table>

        <div align="center">
        <div class="pagingBox" style="width:300px;">
                    <tc-webtag:prevPage servletPath="${sessionInfo.servletPath}" list="${matches}" styleClass="bcLink" /> |
                    <tc-webtag:nextPage servletPath="${sessionInfo.servletPath}" list="${matches}" styleClass="bcLink" />
        </div>

                        View &#160;
                        <tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
                        &#160;at a time starting with &#160;
                        <tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
                        <a href="javascript:document.matchListForm.submit();" class="bcLink">&#160;[ submit ]</a>
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