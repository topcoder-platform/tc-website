<%@  page language="java"
    import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*, com.topcoder.web.tc.Constants,
          java.util.Map"%>
          
<%@ page import="com.topcoder.web.common.tag.HandleTag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set value="<%=com.topcoder.web.common.BaseProcessor.DEFAULTS_KEY%>" var="defaults"/>
<c:set value="<%=DataAccessConstants.START_RANK%>" var="startRank"/>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="/script.jsp" />
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
function next() {
var myForm = document.matchListForm;
myForm.<%=DataAccessConstants.START_RANK%>.value=<c:out value="${requestScope[defaults][startRank]}"/>+parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
myForm.submit();
}
function previous() {
var myForm = document.matchListForm;
myForm.<%=DataAccessConstants.START_RANK%>.value=<c:out value="${requestScope[defaults][startRank]}"/>-parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';

myForm.submit();
}
</script>


</head>

<body>

        <jsp:include page="../top.jsp" >
            <jsp:param name="level1" value=""/>
        </jsp:include>


        <%
        ResultSetContainer list = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("match_list");
        %>

        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr valign="top">
                <!-- Left Column Begins-->
                <td width="180">
                    <jsp:include page="../includes/global_left.jsp">
                        <jsp:param name="node" value="algo_match_archive"/>
                    </jsp:include>
                </td>
                <!-- Left Column Ends -->

                <!-- Center Column Begins -->
                <TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

                <jsp:include page="../page_title.jsp" >
                    <jsp:param name="image" value="statistics_w"/>
                    <jsp:param name="title" value="Match Archive"/>
                </jsp:include>

                <form name="matchListForm" action='<jsp:getProperty name="sessionInfo" property="servletPath"/>' method="get">

                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="MatchList"/>
                <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
                <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>

                <div class="pagingBox">
                    <%=(list.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                    | <%=(list.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>
                </div>
* resubmissions do not increase submission totals or averages
<table class="stat" cellpadding="0" cellspacing="0" width="100%" border="0">
   <tr><td class="title" colspan="14">Algorithm Match Archive</td></tr>
   <tr>
      <td colspan="5" class="header">&#160;</td>
      <td colspan="4" class="headerC">Division I</td>
      <td colspan="4" class="headerC">Division II</td>
      <td class="header">&#160;</td>
   </tr>
   <tr>
      <td colspan="2" class="header">&#160;</td>
      <td colspan="3" class="headerC">&#160;<br />Competitors</td>
      <td colspan="2" class="headerC">Solutions<br />Submitted*</td>
      <td colspan="2" class="headerC">Solutions<br />Challenged</td>
      <td colspan="2" class="headerC">Solutions<br />Submitted*</td>
      <td colspan="2" class="headerC">Solutions<br />Challenged</td>
      <td class="header">&#160;</td>
   </tr>
   <tr>
      <td class="header" width="33%"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=list.getColumnIndex("name")%>" includeParams="true" excludeParams="sr" />">Match</a></td>
      <td class="headerC" width="33%"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=list.getColumnIndex("start_date")%>" includeParams="true" excludeParams="sr" />">Date</a></td>
      <td class="headerC" nowrap="nowrap"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=list.getColumnIndex("numcompetitors")%>" includeParams="true" excludeParams="sr" />">Total</a></td>
      <td class="headerC" nowrap="nowrap"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=list.getColumnIndex("numcompetitors1")%>" includeParams="true" excludeParams="sr" />">DivI</a></td>
      <td class="headerC" nowrap="nowrap"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=list.getColumnIndex("numcompetitors2")%>" includeParams="true" excludeParams="sr" />">DivII</a></td>
      <td class="headerC"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=list.getColumnIndex("submitted1")%>" includeParams="true" excludeParams="sr" />">Total</a></td>
      <td class="headerC" nowrap="nowrap"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=list.getColumnIndex("avgsubmitted1")%>" includeParams="true" excludeParams="sr" />">Avg</a></td>
      <td class="headerC"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=list.getColumnIndex("challengessuccessful1")%>" includeParams="true" excludeParams="sr" />">Total</a></td>
      <td class="headerC" nowrap="nowrap"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=list.getColumnIndex("avgchallengessuccessful1")%>" includeParams="true" excludeParams="sr" />">Avg</a></td>
      <td class="headerC"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=list.getColumnIndex("submitted2")%>" includeParams="true" excludeParams="sr" />">Total</a></td>
      <td class="headerC" nowrap="nowrap"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=list.getColumnIndex("avgsubmitted2")%>" includeParams="true" excludeParams="sr" />">Avg</a></td>
      <td class="headerC"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=list.getColumnIndex("challengessuccessful2")%>" includeParams="true" excludeParams="sr" />">Total</a></td>
      <td class="headerC" nowrap="nowrap"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=list.getColumnIndex("avgchallengessuccessful2")%>" includeParams="true" excludeParams="sr" />">Avg</a></td>
      <td class="headerC" width="33%">&#160;</td>
   </tr>
   <% boolean even = false; %>
   <rsc:iterator list="<%=list%>" id="resultRow">
   <tr class="<%=even?"dark":"light"%>">
<td class="value" nowrap="nowrap"><a href="/stat?c=round_overview&er=5&rd=<rsc:item name="round_id" row="<%=resultRow%>"/>"><rsc:item name="name" row="<%=resultRow%>"/></a></td>
<td class="valueC"><rsc:item name="start_date" row="<%=resultRow%>" format="MM.dd.yyyy"/></td>
<td class="valueR"><rsc:item name="numcompetitors" row="<%=resultRow%>"/></td>
<td class="valueR"><rsc:item name="numcompetitors1" row="<%=resultRow%>"/></td>
<td class="valueR"><rsc:item name="numcompetitors2" row="<%=resultRow%>"/></td>
<td class="valueR"><rsc:item name="submitted1" row="<%=resultRow%>"/></td>
<td class="valueR"><rsc:item name="avgsubmitted1" row="<%=resultRow%>" format="0.00"/></td>
<td class="valueR"><rsc:item name="challengessuccessful1" row="<%=resultRow%>"/></td>
<td class="valueR"><rsc:item name="avgchallengessuccessful1" row="<%=resultRow%>" format="0.00"/></td>
<td class="valueR"><rsc:item name="submitted2" row="<%=resultRow%>"/></td>
<td class="valueR"><rsc:item name="avgsubmitted2" row="<%=resultRow%>" format="0.00"/></td>
<td class="valueR"><rsc:item name="challengessuccessful2" row="<%=resultRow%>"/></td>
<td class="valueR"><rsc:item name="avgchallengessuccessful2" row="<%=resultRow%>" format="0.00"/></td>
<td class="valueC"><A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=<rsc:item name="forum_id" row="<%=resultRow%>"/>" CLASS="statLink">discuss</a></td>
</TR>
<% even = !even;%>
</rsc:iterator>
</table>

                    <div class="pagingBox">
                        <%=(list.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                        | <%=(list.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>

                        <br>

                        View &#160;
                        <tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
                        &#160;at a time starting with &#160;
                        <tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
                        <a href="javascript:document.matchListForm.submit();" class="bcLink">&#160;[ submit ]</a>
                    </div>

                    </form>
                </td>


         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>

                <!-- Gutter -->
                <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
                <!-- Gutter Ends -->
            </tr>
        </table>

        <jsp:include page="../foot.jsp" />

    </body>

</html>