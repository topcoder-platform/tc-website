<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.web.codinginterface.longcontest.*,
          com.topcoder.shared.dataAccess.resultSet.*"

%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>

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
                <jsp:param name="level1" value="home"/>
                <jsp:param name="level2" value=""/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

<jsp:include page="page_title.jsp" >
<jsp:param name="image" value="long_competitions"/>
<jsp:param name="title" value="Active Contests"/>
</jsp:include>

<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
   <tr>
      <td>               
      <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">

<tr>
   <td class="tableTitle" colspan="6">Active Long Competitions</td>
</tr>
<tr>
   <td class="tableHeader">Contest</td>
   <td class="tableHeader" colspan="3" nowrap="nowrap">Problem Name</td>
   <td class="tableHeader" align="center" nowrap="nowrap">Start time</td>
   <td class="tableHeader" align="center" nowrap="nowrap">End time</td>
</tr>

<%boolean even = true;%>
<logic:iterate name="<%=Constants.CONTEST_LIST_KEY%>" id="contest">
<tr>
<td class="<%=even?"statLt":"statDk"%>"><b><tc-webtag:beanWrite name="contest" property="roundName"/></b></td>
<td class="<%=even?"statLt":"statDk"%>"><A href="longcontest?module=ViewProblem&<%=Constants.COMPONENT_ID%>=<tc-webtag:beanWrite name="contest" property="componentID"/>&<%=Constants.ROUND_ID%>=<tc-webtag:beanWrite name="contest" property="roundID"/>" class="statLink">
<tc-webtag:beanWrite name="contest" property="problemName"/></A>
</td>
<td class="<%=even?"statLt":"statDk"%>"><logic:equal name="contest" property="passed" value="false">
<A href="longcontest?module=Submit&<%=Constants.COMPONENT_ID%>=<tc-webtag:beanWrite name="contest" property="componentID"/>&<%=Constants.ROUND_ID%>=<tc-webtag:beanWrite name="contest" property="roundID"/>&<%=Constants.CONTEST_ID%>=<tc-webtag:beanWrite name="contest" property="contestID"/>" class="statLink">
submit</a>
</logic:equal>
</td>
<td class="<%=even?"statLt":"statDk"%>"><A href="longcontest?module=ViewStandings&<%=Constants.COMPONENT_ID%>=<tc-webtag:beanWrite name="contest" property="componentID"/>&<%=Constants.ROUND_ID%>=<tc-webtag:beanWrite name="contest" property="roundID"/>" class="statLink">
standings</a>
</td>
<td class="<%=even?"statLt":"statDk"%>" align="center" nowrap="nowrap"><tc-webtag:beanWrite name="contest" property="startTime"/></td>
<td class="<%=even?"statLt":"statDk"%>" align="center" nowrap="nowrap"><tc-webtag:beanWrite name="contest" property="endTime"/></td>
</tr>
<%even=!even;%>
</logic:iterate>

      </TABLE>
      </TD>
   </tr>
</TABLE>

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