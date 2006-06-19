<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.dataAccess.*,
                 com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.tc.Constants" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
  String nextpage = (String)request.getAttribute(BaseServlet.NEXT_PAGE_KEY);
  if(nextpage==null) nextpage = request.getParameter(BaseServlet.NEXT_PAGE_KEY);
  if(nextpage==null) nextpage = request.getHeader("Referer");
  if(nextpage==null) nextpage = "http://"+request.getServerName();
  String type = (String)request.getAttribute(Constants.TYPE_KEY);
  ResultSetContainer stages = (ResultSetContainer) request.getAttribute(Constants.STAGE_LIST_KEY);
%>

<html>
<head>
<TITLE>TopCoder Statistics</TITLE>
<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_stats"/>
</jsp:include>
<script type="text/javascript">
function submitEnter(e) {
    var keycode;
    if (window.event) keycode = window.event.keyCode;
    else if (e) keycode = e.which;
    else return true;
    if (keycode == 13) {
     document.leaderBoardForm.submit();
     return false;
    } else return true;
  }
  function next() {
    var myForm = document.leaderBoardForm;
    myForm.<%=DataAccessConstants.START_RANK%>.value=parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value)+parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
    myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
    myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
    myForm.submit();
  }
  function previous() {
    var myForm = document.leaderBoardForm;
    myForm.<%=DataAccessConstants.START_RANK%>.value=parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value)-parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
    myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
    myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
    myForm.submit();
  }
</script>
</head>
<body>

   <jsp:include page="/top.jsp" />
   <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
     <TR valign="top">
        <TD WIDTH="180">
<!-- Left nav begins -->
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="digital_run"/>
         </jsp:include>
<!-- Left nav ends -->
        </TD>

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">

<div class="fixedWidthBody">

<% if(request.getParameter(Constants.PHASE_ID).equals("113")){ %>
    <jsp:include page="/page_title.jsp" >
    <jsp:param name="image" value="digital_run"/>
    <jsp:param name="title" value="Development Cup Series Leaderboard"/>
    </jsp:include>
<% } else { %>
    <jsp:include page="/page_title.jsp" >
    <jsp:param name="image" value="digital_run"/>
    <jsp:param name="title" value="Design Cup Series Leaderboard"/>
    </jsp:include>
<% } %>


<div style="float:right; text-align:left; whitespace: no-wrap;">
<A href="/stat?c=top_designers" class="bcLink">Top Ranked Designers</a><br>
<A href="/stat?c=top_developers" class="bcLink">Top Ranked Developers</a>
</div>
<% if(request.getParameter(Constants.PHASE_ID).equals("113")){ %>
<A href="/tc?&ph=112&module=LeaderBoard" class="bcLink">Design Cup Series Leaderboard</a><br>
Development Cup Series Leaderboard</a><br>
<% } else { %>
Design Cup Series Leaderboard<br>
<A href="/tc?&ph=113&module=LeaderBoard" class="bcLink">Development Cup Series Leaderboard</a><br>
<% } %>
<A href="/tc?module=RookieBoard&ph=112" class="bcLink">Design Cup Series ROTY Leaderboard</a><br>
<A href="/tc?module=RookieBoard&ph=113" class="bcLink">Development Cup Series ROTY Leaderboard</a>

<br><br>

<div align="center">
        <form name="leaderBoardForm" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="get">
           <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="LeaderBoard"/>
           <tc-webtag:hiddenInput name="<%=Constants.PHASE_ID%>"/>
           <!--tc-webtag:hiddenInput name="<%=Constants.STAGE_ID%>"/-->
           <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
           <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>

           Please select a <strong>season</strong> and <strong>stage</strong><br>
           <SELECT CLASS="dropdown" NAME="<%=Constants.STAGE_ID%>" onchange="document.leaderBoardForm.submit()">
                <rsc:iterator list="<%=stages%>" id="resultRow">
                   <% if (String.valueOf(resultRow.getLongItem("stage_id")).equals(request.getParameter(Constants.STAGE_ID))) { %>
                     <OPTION value="<rsc:item name="stage_id" row="<%=resultRow%>"/>" selected><rsc:item name="season_name" row="<%=resultRow%>"/> &gt; <rsc:item name="stage_name" row="<%=resultRow%>"/></OPTION>
                   <% } else { %>
                     <OPTION value="<rsc:item name="stage_id" row="<%=resultRow%>"/>"><rsc:item name="season_name" row="<%=resultRow%>"/> &gt; <rsc:item name="stage_name" row="<%=resultRow%>"/></OPTION>
                   <% } %>
               </rsc:iterator>
           </SELECT>

<c:choose>
<c:when test="${fn:length(testList) > 0}">

<!-- crop -->
<div class="pagingBox" style="width:300px;">
	<c:choose>
	    <c:when test="${croppedDataBefore}">
			<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>
		</c:when>
		<c:otherwise>
			&lt;&lt; prev
		</c:otherwise>
	</c:choose>
	|
	<c:choose>
	    <c:when test="${croppedDataAfter}">
			<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>
		</c:when>
		<c:otherwise>
			next &gt;&gt;
		</c:otherwise>
	</c:choose>
</div>

<table class="stat" cellpadding="0" cellspacing="0" width="500">
   <tr>
      <td class="title" colspan="8">
<% if(request.getParameter(Constants.PHASE_ID).equals("113")){ %>
Development Cup Series Leaderboard
<% } else { %>
Design Cup Series Leaderboard
<% } %>
      </td>
   </tr>
   <tr>
      <td class="headerC">
         <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Rank</a>
      </td>
      <td class="header" width="100%">
         <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="2" includeParams="true"/>">Handle</a>
      </td>
      <td class="headerR">
         <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Points</a>
      </td>
      <td class="headerR"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Points prize</a></td>
      <td class="headerR"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Placement prize</a></td>
      <td class="headerR"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Total prize</a></td>
      <td class="headerR">Top</td>
      <td class="headerR">trip</td>
   </tr>

   <%boolean even = false;%>
   <c:forEach items="${testList}" var="boardRow">
	   <tr class="<%=even?"dark":"light"%>">
	      <td class="valueC">${boardRow.rank}</td>
	      <td class="value" width="100%"><tc-webtag:handle coderId='${boardRow.userId}' context='<%=type%>' /></td>
	      <td class="valueR">${boardRow.points}</td>
	      <td class="valueR"><c:if test="${boardRow.pointsPrize>0}"><fmt:formatNumber value="${boardRow.pointsPrize}" type="currency" currencySymbol="$"/></c:if></td>
	      <td class="valueR"><c:if test="${boardRow.placementPrize>0}"><fmt:formatNumber value="${boardRow.placementPrize}" type="currency" currencySymbol="$"/></c:if></td>
	      <td class="valueR"><c:if test="${boardRow.totalPrize>0}"><fmt:formatNumber value="${boardRow.totalPrize}" type="currency" currencySymbol="$"/></c:if></td>
	      <td class="valueR">
	      	<c:if test="${boardRow.topThird}">*</c:if>
	      </td>
	      <td class="valueR">
	      	<c:if test="${boardRow.winTrip}">*</c:if>
	      </td>
	   </tr>
	   <%even=!even;%>
   </c:forEach>
</table>

<div class="pagingBox" style="width:300px;">
View <tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
at a time starting with
<tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
<a href="javascript:document.leaderBoardForm.submit();" class="bcLink">[submit]</a>
</div>

 </c:when>
<c:otherwise>
<br><br>
The selected stage is underway and results will start coming in soon.
</c:otherwise>
</c:choose>
   </div>
</div>
       </TD>
       <td WIDTH="180" VALIGN="top">
         <jsp:include page="/public_right.jsp" >
             <jsp:param name="level1" value="profile"/>
         </jsp:include>
       </TD>
    <!-- Gutter -->
    <td WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" border="0"/></TD>
    <!-- Gutter Ends -->
     </tr>
   </TABLE>
   <jsp:include page="../foot.jsp" />
 </BODY>
</HTML>