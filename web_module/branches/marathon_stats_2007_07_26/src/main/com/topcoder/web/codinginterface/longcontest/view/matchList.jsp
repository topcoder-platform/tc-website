<%@  page language="java"
    import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*, com.topcoder.web.tc.Constants,
          java.util.Map"%>
          
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
</script>


</head>

<body>

        <jsp:include page="top.jsp" >
            <jsp:param name="level1" value=""/>
        </jsp:include>
     

        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr valign="top">
                <!-- Left Column Begins-->
                <td width="180">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="long_match_archive"/>
                    </jsp:include>
                </td>
                <!-- Left Column Ends -->

                <!-- Center Column Begins -->
                <TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

                <jsp:include page="page_title.jsp" >
                    <jsp:param name="image" value="statistics_w"/>
                    <jsp:param name="title" value="Match Archive"/>
                </jsp:include>

                <form name="matchListForm" action='<jsp:getProperty name="sessionInfo" property="servletPath"/>' method="get">

                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="MatchList"/>
                <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
                <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>

				<center>
				<div class="pagingBox" style="width:300px;">
					<tc-webtag:prevPage servletPath="${sessionInfo.servletPath}" list="${matches}" styleClass="bcLink" /> |
					<tc-webtag:nextPage servletPath="${sessionInfo.servletPath}" list="${matches}" styleClass="bcLink" />
				</div>
				</center>

			<table class="stat" cellpadding="0" cellspacing="0" width="100%" border="0">
			   <tr><td class="title" colspan="6">Marathon Match Archive</td></tr>
			   <tr>
			      <td class="header" width="33%"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="${columnMap['name']}" includeParams="true" excludeParams="sr" />">Match</a></td>
			      <td class="headerC" width="33%"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="${columnMap['date']}" includeParams="true" excludeParams="sr" />">Date</a></td>
			      <td class="headerC" nowrap="nowrap"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="${columnMap['num_competitors']}" includeParams="true" excludeParams="sr" />">Competitors</a></td>
			      <td class="headerC" nowrap="nowrap"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="${columnMap['num_submissions']}" includeParams="true" excludeParams="sr" />">Total Submissions</a></td>
			      <td class="headerC" nowrap="nowrap"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="${columnMap['avg_submissions']}" includeParams="true" excludeParams="sr" />">Avg. Submissions</a></td>
			      <td class="headerC" width="33%">&#160;</td>
			   </tr>
			   <c:forEach items="${matches}" var="row" varStatus="status">
			       <tr class='${status.index % 2 == 1? "dark" : "light" }'>
						<td class="value" nowrap="nowrap">
							<a href="/longcontest/?module=ViewOverview&rd=${row.map['round_id']}"/>${row.map['name']}</a>		
							displayName: ${row.map['display_name']}					
						</td>
						<td class="valueC"><tc-webtag:format object="${row.map['date']}" format="MM.dd.yyyy" /></td>
						<td class="valueR">${row.map['num_competitors']}</td>
						<td class="valueR">${row.map['num_submissions']}</td>
						<td class="valueR"><fmt:formatNumber value="${row.map['avg_submissions']}"  minFractionDigits="2" maxFractionDigits="2"/></td>		
						<td class="valueC"><A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=${row.map['forum_id']}" class="statLink">discuss</a></td>
					</tr>   
			   </c:forEach>   
			</table>

		<center>
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
		</center>        
 
                    </form>
                </td>


         <td width="170">
            <jsp:include page="public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>

                <!-- Gutter -->
                <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
                <!-- Gutter Ends -->
            </tr>
        </table>

        <jsp:include page="foot.jsp" />

    </body>

</html>