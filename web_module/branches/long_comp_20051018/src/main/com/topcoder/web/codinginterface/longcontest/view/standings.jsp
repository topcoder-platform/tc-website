<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>
<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.web.codinginterface.longcontest.*,
          com.topcoder.shared.dataAccess.resultSet.*"

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder</title>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
</head>
<body>

<jsp:include page="top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="level1" value=""/>
                <jsp:param name="level2" value=""/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

<jsp:include page="page_title.jsp" >
<jsp:param name="image" value="long_competitions"/>
<jsp:param name="title" value="Standings"/>
</jsp:include>

<span class="bigHandle">Contest: <%=request.getAttribute(Constants.CONTEST_NAME_KEY)%></span><br>
<span class="bodySubtitle">Registrants: <%=request.getAttribute(Constants.NUM_REGISTRANTS_KEY)%></span><br>

<div class="pagingBox">
	<logic:equal name="<%=Constants.PREV_IDX_KEY%>" value="-1">
      &lt;&lt; previous
    </logic:equal>
	<logic:notEqual name="<%=Constants.PREV_IDX_KEY%>" value="-1">      
		<a href=".<%=Constants.MAIN_SERVLET%>?<%=Constants.MODULE%>=<%=Constants.RP_VIEW_STANDINGS%>&<%=Constants.ROUND_ID%>=<%=request.getAttribute(Constants.ROUND_ID)%>&<%=Constants.START_ROW%>=<%=request.getAttribute(Constants.PREV_IDX_KEY)%>" class="bcLink">&lt;&lt; previous</a>
    </logic:notEqual>
    
      &nbsp;|&nbsp;

	<logic:equal name="<%=Constants.NEXT_IDX_KEY%>" value="-1">
		next &gt;&gt;
    </logic:equal>
	<logic:notEqual name="<%=Constants.NEXT_IDX_KEY%>" value="-1">
		<a href=".<%=Constants.MAIN_SERVLET%>?<%=Constants.MODULE%>=<%=Constants.RP_VIEW_STANDINGS%>&<%=Constants.ROUND_ID%>=<%=request.getAttribute(Constants.ROUND_ID)%>&<%=Constants.START_ROW%>=<%=request.getAttribute(Constants.NEXT_IDX_KEY)%>" class="bcLink">next &gt;&gt;</a>
    </logic:notEqual>
</div>

<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
   <tr>
      <td>               
      <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">

<tr>
   <td class="tableTitle" colspan="6">Standings</td>
</tr>
<tr>
   <td class="tableHeader" width="25%"><A href="sort">Handle</A></td>
   <td class="tableHeader" width="25%" align="right" nowrap="nowrap"><A href=".<%=Constants.MAIN_SERVLET%>?<%=Constants.MODULE%>=<%=Constants.RP_VIEW_STANDINGS%>&<%=Constants.ROUND_ID%>=<%=request.getAttribute(Constants.ROUND_ID)%>&<%=Constants.START_ROW%>=<%=request.getAttribute(Constants.START_ROW)%>&<%=Constants.PRIMARY_COLUMN%>=<%=Constants.SCORE_COL%><%=(request.getAttribute(Constants.PRIMARY_COLUMN).equals(Constants.SCORE_COL) ? ("&" + Constants.SORT_ORDER + "=" + (request.getAttribute(Constants.SORT_ORDER).equals("asc")?"desc":"asc")) : "")%>">Score</A></td>
   <td class="tableHeader" width="25%" align="right" nowrap="nowrap"><A href="sort">Rank</A></td>
   <td class="tableHeader" width="25%" align="right" nowrap="nowrap"><A href="sort">Submissions</A></td>
</tr>
<%-- ITERATOR --%>
<logic:iterate name="<%=Constants.ROUND_STANDINGS_LIST_KEY%>" id="standing">
<%boolean even = true;%>
<tr>
   <td class="<%=even?"statLt":"statDk"%>"><tc-webtag:beanWrite name="standing" property="handle"/></td>
   <td class="<%=even?"statLt":"statDk"%>" align="right" style="padding-right: 7px;"><tc-webtag:beanWrite name="standing" property="points"/></td>
   <td class="<%=even?"statLt":"statDk"%>" align="right" style="padding-right: 15px;"><tc-webtag:beanWrite name="standing" property="rank"/></td>
   <td class="<%=even?"statLt":"statDk"%>" align="right" style="padding-right: 40px;"><A href="submission history page" class="statLink"><tc-webtag:beanWrite name="standing" property="submissionNumber"/></A></td>
</tr>
<%even=!even;%>
</logic:iterate>
<%-- END ITERATOR --%>
      </TABLE>
      </TD>
   </tr>
</TABLE>

<div class="pagingBox">
	<logic:equal name="<%=Constants.PREV_IDX_KEY%>" value="-1">
      &lt;&lt; previous
    </logic:equal>
	<logic:notEqual name="<%=Constants.PREV_IDX_KEY%>" value="-1">      
		<a href=".<%=Constants.MAIN_SERVLET%>?<%=Constants.MODULE%>=<%=Constants.RP_VIEW_STANDINGS%>&<%=Constants.ROUND_ID%>=<%=request.getAttribute(Constants.ROUND_ID)%>&<%=Constants.START_ROW%>=<%=request.getAttribute(Constants.PREV_IDX_KEY)%>" class="bcLink">&lt;&lt; previous</a>
    </logic:notEqual>
    
      &nbsp;|&nbsp;

	<logic:equal name="<%=Constants.NEXT_IDX_KEY%>" value="-1">
		next &gt;&gt;
    </logic:equal>
	<logic:notEqual name="<%=Constants.NEXT_IDX_KEY%>" value="-1">
		<a href=".<%=Constants.MAIN_SERVLET%>?<%=Constants.MODULE%>=<%=Constants.RP_VIEW_STANDINGS%>&<%=Constants.ROUND_ID%>=<%=request.getAttribute(Constants.ROUND_ID)%>&<%=Constants.START_ROW%>=<%=request.getAttribute(Constants.NEXT_IDX_KEY)%>" class="bcLink">next &gt;&gt;</a>
    </logic:notEqual>
</div>

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

<jsp:include page="foot.jsp" />
</body>
</html>