<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>
<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.web.codinginterface.longcontest.*,
          com.topcoder.shared.dataAccess.resultSet.*,
          com.topcoder.web.codinginterface.longcontest.model.*"

%>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder</title>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
</head>
<body>

<jsp:include page="top.jsp" >
    <jsp:param name="level1" value="long"/>
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

<%if(request.getAttribute(Constants.MESSAGE) != null) {%>
<span class="errorText"><%=request.getAttribute(Constants.MESSAGE)%></span><br>
<%}%>
<span class="bigHandle">Contest: <%=request.getAttribute(Constants.CONTEST_NAME_KEY)%></span><br>
<span class="bodySubtitle">Registrants: <A href="registrans page"><%=request.getAttribute(Constants.NUM_REGISTRANTS_KEY)%></A></span><br>

<div class="pagingBox">
	<logic:equal name="<%=Constants.PREV_IDX_KEY%>" value="-1">
      &lt;&lt; previous
    </logic:equal>
	<logic:notEqual name="<%=Constants.PREV_IDX_KEY%>" value="-1">
		<a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=<%=Constants.RP_VIEW_STANDINGS%>&<%=Constants.ROUND_ID%>=<%=request.getAttribute(Constants.ROUND_ID)%>&<%=Constants.START_ROW%>=<%=request.getAttribute(Constants.PREV_IDX_KEY)%>&<%=Constants.PRIMARY_COLUMN%>=<%=request.getAttribute(Constants.PRIMARY_COLUMN)%>&<%=Constants.SORT_ORDER%>=<%=request.getAttribute(Constants.SORT_ORDER)%>" class="bcLink">&lt;&lt; previous</a>
    </logic:notEqual>

      &nbsp;|&nbsp;

	<logic:equal name="<%=Constants.NEXT_IDX_KEY%>" value="-1">
		next &gt;&gt;
    </logic:equal>
	<logic:notEqual name="<%=Constants.NEXT_IDX_KEY%>" value="-1">
		<a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=<%=Constants.RP_VIEW_STANDINGS%>&<%=Constants.ROUND_ID%>=<%=request.getAttribute(Constants.ROUND_ID)%>&<%=Constants.START_ROW%>=<%=request.getAttribute(Constants.NEXT_IDX_KEY)%>&<%=Constants.PRIMARY_COLUMN%>=<%=request.getAttribute(Constants.PRIMARY_COLUMN)%>&<%=Constants.SORT_ORDER%>=<%=request.getAttribute(Constants.SORT_ORDER)%>" class="bcLink">next &gt;&gt;</a>
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
   <td class="tableHeader" width="25%"><A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=<%=Constants.RP_VIEW_STANDINGS%>&<%=Constants.ROUND_ID%>=<%=request.getAttribute(Constants.ROUND_ID)%>&<%=Constants.START_ROW%>=<%=request.getAttribute(Constants.START_ROW)%>&<%=Constants.PRIMARY_COLUMN%>=<%=Constants.HANDLE_COL%><%=(request.getAttribute(Constants.PRIMARY_COLUMN).equals(Constants.HANDLE_COL) ? ("&" + Constants.SORT_ORDER + "=" + (request.getAttribute(Constants.SORT_ORDER).equals("asc")?"desc":"asc")) : "")%>">Handle</A></td>
   <td class="tableHeader" width="25%" align="right" nowrap="nowrap"><A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=<%=Constants.RP_VIEW_STANDINGS%>&<%=Constants.ROUND_ID%>=<%=request.getAttribute(Constants.ROUND_ID)%>&<%=Constants.START_ROW%>=<%=request.getAttribute(Constants.START_ROW)%>&<%=Constants.PRIMARY_COLUMN%>=<%=Constants.SCORE_COL%><%=(request.getAttribute(Constants.PRIMARY_COLUMN).equals(Constants.SCORE_COL) ? ("&" + Constants.SORT_ORDER + "=" + (request.getAttribute(Constants.SORT_ORDER).equals("asc")?"desc":"asc")) : "")%>">Score</A></td>
   <td class="tableHeader" width="25%" align="right" nowrap="nowrap"><A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=<%=Constants.RP_VIEW_STANDINGS%>&<%=Constants.ROUND_ID%>=<%=request.getAttribute(Constants.ROUND_ID)%>&<%=Constants.START_ROW%>=<%=request.getAttribute(Constants.START_ROW)%>&<%=Constants.PRIMARY_COLUMN%>=<%=Constants.RANK_COL%><%=(request.getAttribute(Constants.PRIMARY_COLUMN).equals(Constants.RANK_COL) ? ("&" + Constants.SORT_ORDER + "=" + (request.getAttribute(Constants.SORT_ORDER).equals("asc")?"desc":"asc")) : "")%>">Rank</A></td>
   <td class="tableHeader" width="25%" align="right" nowrap="nowrap"><A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=<%=Constants.RP_VIEW_STANDINGS%>&<%=Constants.ROUND_ID%>=<%=request.getAttribute(Constants.ROUND_ID)%>&<%=Constants.START_ROW%>=<%=request.getAttribute(Constants.START_ROW)%>&<%=Constants.PRIMARY_COLUMN%>=<%=Constants.SUBMISSION_COL%><%=(request.getAttribute(Constants.PRIMARY_COLUMN).equals(Constants.SUBMISSION_COL) ? ("&" + Constants.SORT_ORDER + "=" + (request.getAttribute(Constants.SORT_ORDER).equals("asc")?"desc":"asc")) : "")%>">Submissions</A></td>
</tr>
<%-- ITERATOR --%>
<logic:iterate name="<%=Constants.ROUND_STANDINGS_LIST_KEY%>" id="standing">
<%boolean even = true;%>
<tr>
   <td class="<%=even?"statLt":"statDk"%>"><tc-webtag:handle coderId="<%=((StandingModel)standing).getCoderID()%>"/></td>
   <td class="<%=even?"statLt":"statDk"%>" align="right" style="padding-right: 7px;"><tc-webtag:beanWrite name="standing" property="points" format="0.00"/></td>
   <td class="<%=even?"statLt":"statDk"%>" align="right" style="padding-right: 15px;"><tc-webtag:beanWrite name="standing" property="rank"/></td>
   <td class="<%=even?"statLt":"statDk"%>" align="right" style="padding-right: 40px;"><A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=<%=Constants.RP_SUBMISSION_HISTORY%>&<%=Constants.CODER_ID%>=<tc-webtag:beanWrite name="standing" property="coderID"/>&<%=Constants.ROUND_ID%>=<%=request.getAttribute(Constants.ROUND_ID)%>&<%=Constants.COMPONENT_ID%>=<tc-webtag:beanWrite name="standing" property="componentID"/>" class="statLink"><tc-webtag:beanWrite name="standing" property="submissionNumber"/></A></td>
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
		<a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=<%=Constants.RP_VIEW_STANDINGS%>&<%=Constants.ROUND_ID%>=<%=request.getAttribute(Constants.ROUND_ID)%>&<%=Constants.START_ROW%>=<%=request.getAttribute(Constants.PREV_IDX_KEY)%>&<%=Constants.PRIMARY_COLUMN%>=<%=request.getAttribute(Constants.PRIMARY_COLUMN)%>&<%=Constants.SORT_ORDER%>=<%=request.getAttribute(Constants.SORT_ORDER)%>" class="bcLink">&lt;&lt; previous</a>
    </logic:notEqual>

      &nbsp;|&nbsp;

	<logic:equal name="<%=Constants.NEXT_IDX_KEY%>" value="-1">
		next &gt;&gt;
    </logic:equal>
	<logic:notEqual name="<%=Constants.NEXT_IDX_KEY%>" value="-1">
		<a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=<%=Constants.RP_VIEW_STANDINGS%>&<%=Constants.ROUND_ID%>=<%=request.getAttribute(Constants.ROUND_ID)%>&<%=Constants.START_ROW%>=<%=request.getAttribute(Constants.NEXT_IDX_KEY)%>&<%=Constants.PRIMARY_COLUMN%>=<%=request.getAttribute(Constants.PRIMARY_COLUMN)%>&<%=Constants.SORT_ORDER%>=<%=request.getAttribute(Constants.SORT_ORDER)%>" class="bcLink">next &gt;&gt;</a>
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