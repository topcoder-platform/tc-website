<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="com.topcoder.web.common.BaseProcessor" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.WebConstants" %>
<%@ page import="com.topcoder.web.codinginterface.longcontest.controller.request.stats.MatchWinners" %>

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@  page language="java"%>
          
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="mm" tagdir="/WEB-INF/tags" %>
  
<c:set value="<%=com.topcoder.web.common.BaseProcessor.DEFAULTS_KEY%>" var="defaults"/>
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

    <script language="JavaScript" type="text/javascript" src="/js/main.js"></script>

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
    </script>

    <style type="text/css">
    div.shortList {
        display: block;
        white-space: nowrap;
    }

    div.fullList {
        display: none;
        white-space: nowrap;
    }
    </style>
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
                <jsp:param name="node" value="long_match_winners"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">

                <jsp:include page="../page_title.jsp" >
                    <jsp:param name="image" value="statistics_w"/>
                    <jsp:param name="title" value="Match Winners"/>
                </jsp:include>

                <form name="matchWinnersForm" action='<jsp:getProperty name="sessionInfo" property="servletPath"/>' method="get">

                <tc-webtag:hiddenInput name="<%=WebConstants.MODULE_KEY%>" value="MatchWinners"/>
                <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
                <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>

                <center>
                
                <div class="pagingBox" style="width:300px;">
                    <tc-webtag:prevPage servletPath="${sessionInfo.servletPath}" list="${list}" styleClass="bcLink" /> |
                    <tc-webtag:nextPage servletPath="${sessionInfo.servletPath}" list="${list}" styleClass="bcLink" />
                </div>
                </center>

            <table class="stat" cellpadding="0" cellspacing="0" width="100%" border="0">
            <tbody>
               <tr><td class="title" colspan="7">Marathon Match Winners</td></tr>
               <tr>
                  <td class="header"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="<%= MatchWinners.DATE_COLUMN %>" includeParams="true" excludeParams="sr" />">Date</a></td>
                  <td class="header" ><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="<%= MatchWinners.NAME_COLUMN %>" includeParams="true" excludeParams="sr" />">Match</a></td>
                  <td class="header" ><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="<%= MatchWinners.PROBLEM_COLUMN %>" includeParams="true" excludeParams="sr" />">Problem</a></td>
                  <td class="header" ><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="<%= MatchWinners.HANDLE_COLUMN %>" includeParams="true" excludeParams="sr" />">
                                Winner<c:if test="${not ungrouped }">(s)</c:if>
                          </a></td>
                  <td class="header" ><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="<%= MatchWinners.NUM_WINS_COLUMN %>" includeParams="true" excludeParams="sr" />">Wins</a>*</td>
               </tr>
               <c:forEach items="${list}" var="row" varStatus="status">
                    <c:set var="roundId" value="r${row.map['round_id']}" />
                   <tr class='${status.index % 2 == 1? "dark" : "light" }'>
                        <td class="value"><tc-webtag:format object="${row.map['date']}" format="MM.dd.yyyy" /></td>
                        <td class="value" nowrap="nowrap">
                            <a href="/longcontest/stats/?module=ViewOverview&amp;rd=${row.map['round_id']}">${row.map['display_name']}</a>
                        </td>
                        <td class="value">
                           <mm:problemLink roundId="${row.map['round_id']}" problemId="${row.map['problem_id']}" problemName="${row.map['problem_name']}" />
                        </td>
                        
                        <c:choose>
                            <c:when test="${ungrouped }">
                                <td class="value"><tc-webtag:handle coderId="${row.map['coder_id']}" context="marathon_match"/>
                                </td>
                                <td class="valueR">${row.map['num_wins']}
                                </td>
                            </c:when>
                            <c:when test="${fn:length(winnersMap[roundId]) > 3}">
                                <td class="value">
                                    <div id="winnersShort${roundId}" class="shortList">
                                        <a href="javascript: hide('winnersShort${roundId}'); showBlock('winnersFull${roundId}'); showBlock('winsFull${roundId}');" onfocus="this.blur();">
                                            [${fn:length(winnersMap[roundId])} winners]</a>
                                    </div>
                                    <div id="winnersFull${roundId}" class="fullList">
                                            <c:forEach items="${winnersMap[roundId]}" var="winner">
                                                <tc-webtag:handle coderId="${winner.coderId}" context="marathon_match"/> <br /> 
                                            </c:forEach>
                                        <a href="javascript: hide('winnersFull${roundId}'); hide('winsFull${roundId}'); showBlock('winnersShort${roundId}');" onfocus="this.blur();">close</a>
                                    </div>
                                </td>
                                <td class="valueR">
                                    <div id="winsFull${roundId}" class="fullList">
                                    <c:forEach items="${winnersMap[roundId]}" var="winner">
                                        ${winner.numWins} <br /> 
                                    </c:forEach>
                                    </div>
                                    &nbsp;
                                </td>

                            </c:when>
                            <c:otherwise>
                                <td class="value">
                                    <c:forEach items="${winnersMap[roundId]}" var="winner">
                                        <tc-webtag:handle coderId="${winner.coderId}" context="marathon_match"/> <br /> 
                                    </c:forEach>
                                </td>
                                <td class="valueR">
                                    <c:forEach items="${winnersMap[roundId]}" var="winner">
                                        ${winner.numWins} <br /> 
                                    </c:forEach>
                                </td>                           
                            </c:otherwise>
                        </c:choose>
                    </tr>   
               </c:forEach>   
            </tbody>
            </table>

         <p class="small" align="left">* the number of wins the competitor had as a result of that match</p>

        <div align="center">
                <div class="pagingBox" style="width:300px;">
                    <tc-webtag:prevPage servletPath="${sessionInfo.servletPath}" list="${list}" styleClass="bcLink" /> |
                    <tc-webtag:nextPage servletPath="${sessionInfo.servletPath}" list="${list}" styleClass="bcLink" />
                </div>

                        View &nbsp;
                        <tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
                        &nbsp;at a time starting with &nbsp;
                        <tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
                        <a href="javascript:document.matchWinnersForm.submit();" class="bcLink">&nbsp;[ submit ]</a>
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