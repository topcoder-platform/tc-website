<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.dataAccess.*,
                 com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.tc.Constants" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
  String nextpage = (String)request.getAttribute(BaseServlet.NEXT_PAGE_KEY);
  if(nextpage==null) nextpage = request.getParameter(BaseServlet.NEXT_PAGE_KEY);
  if(nextpage==null) nextpage = request.getHeader("Referer");
  if(nextpage==null) nextpage = "http://"+request.getServerName();
  ResultSetContainer rookieBoard = (ResultSetContainer) request.getAttribute(Constants.CODER_LIST_KEY);
  ResultSetContainer seasons = (ResultSetContainer) request.getAttribute(Constants.SEASON_LIST_KEY);
  String type = (String)request.getAttribute(Constants.TYPE_KEY);
%>

<html>
    <head>
        <title>Digital Run - Rookie Board</title>
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
                 document.rookieBoardForm.submit();
                 return false;
                } else return true;
              }
              function next() {
                var myForm = document.rookieBoardForm;
                myForm.<%=DataAccessConstants.START_RANK%>.value=parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value)+parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
                myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
                myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
                myForm.submit();
              }
              function previous() {
                var myForm = document.rookieBoardForm;
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
    <jsp:param name="title" value="Development Cup Series ROTY Leaderboard"/>
    </jsp:include>
<% } else { %>
    <jsp:include page="/page_title.jsp" >
    <jsp:param name="image" value="digital_run"/>
    <jsp:param name="title" value="Design Cup Series ROTY Leaderboard"/>
    </jsp:include>
<% } %>


<div style="float:right; text-align:left; whitespace: no-wrap;">
<A href="/stat?c=top_designers" class="bcLink">Top Ranked Designers</a><br>
<A href="/stat?c=top_developers" class="bcLink">Top Ranked Developers</a>
</div>
<A href="/tc?&ph=112&module=LeaderBoard" class="bcLink">Design Cup Series Leaderboard</a><br>
<A href="/tc?&ph=113&module=LeaderBoard" class="bcLink">Development Cup Series Leaderboard</a><br>
<% if(request.getParameter(Constants.PHASE_ID).equals("113")){ %>
<A href="/tc?module=RookieBoard&ph=112" class="bcLink">Design Cup Series ROTY Leaderboard</a><br>
Development Cup Series ROTY Leaderboard
<% } else { %>
Design Cup Series ROTY Leaderboard<br>
<A href="/tc?module=RookieBoard&ph=113" class="bcLink">Development Cup Series ROTY Leaderboard</a>
<% } %>

<br><br>

   <div align="center">
<form name="rookieBoardForm" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="get">
<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="RookieBoard"/>
<tc-webtag:hiddenInput name="<%=Constants.PHASE_ID%>"/>
<!--tc-webtag:hiddenInput name="<%=Constants.SEASON_ID%>"/-->
<tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
<tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>

Please select a <strong>season</strong><br>
<SELECT CLASS="dropdown" NAME="<%=Constants.SEASON_ID%>" onchange="document.rookieBoardForm.submit()">
<rsc:iterator list="<%=seasons%>" id="resultRow">
 <% if (String.valueOf(resultRow.getLongItem("season_id")).equals(request.getParameter(Constants.SEASON_ID))) { %>
   <OPTION value="<rsc:item name="season_id" row="<%=resultRow%>"/>" selected><rsc:item name="name" row="<%=resultRow%>"/></OPTION>
 <% } else { %>
   <OPTION value="<rsc:item name="season_id" row="<%=resultRow%>"/>"><rsc:item name="name" row="<%=resultRow%>"/></OPTION>
 <% } %>
</rsc:iterator>
</SELECT>

<% if(!rookieBoard.isEmpty()) { %>

<div class="pagingBox">
<%=(rookieBoard.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
| <%=(rookieBoard.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>
</div>

<table class="stat" cellpadding="0" cellspacing="0" width="500">
   <tr>
      <td class="title" colspan="3">
<% if(request.getParameter(Constants.PHASE_ID).equals("113")){ %>
Development Cup Series Rookie of the Year Leaderboard
<% } else { %>
Design Cup Series Rookie of the Year Leaderboard
<% } %>
      </td>
   </tr>
   <tr>
      <td class="headerC">
         <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="4" includeParams="true"/>">Rank</a>
      </td>
      <td class="header" width="100%">
         <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="2" includeParams="true"/>">Handle</a>
      </td>
      <td class="headerR">
         <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="0" includeParams="true"/>">Points</a>
      </td>
   </tr>
   <%boolean even = false;%>
   <rsc:iterator list="<%=rookieBoard%>" id="resultRow">
   <tr class="<%=even?"dark":"light"%>">
      <td class="valueC"><rsc:item name="rank" row="<%=resultRow%>"/></td>
      <td class="value" width="100%">
         <tc-webtag:handle coderId='<%=resultRow.getLongItem("user_id")%>' context='<%=type%>' />
         <%if (resultRow.getLongItem("confirmed_ind")== 0) {%>*<%}%></td>
      <td class="valueR"><rsc:item name="total_points" row="<%=resultRow%>"/></td>
   </tr>
   <%even=!even;%>
   </rsc:iterator>
</table>

<span class="small">* has not yet passed review enough times this season to qualify as a rookie</span>

<div class="pagingBox">
View &#160;
<tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
&#160;at a time starting with &#160;
<tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
<a href="javascript:document.rookieBoardForm.submit();" class="bcLink">&#160;[ submit ]</a>
</div>

<% } else { %>
<br><br>
The selected season is underway and results will start coming in soon.
<% } %>

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