<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<body>

<!-- Tab barlinks-->
<jsp:include page="spon_links.jsp" >
<jsp:param name="tabLev2" value="advancers"/>
<jsp:param name="tabLev3" value="qualification"/>
</jsp:include>

<% ResultSetContainer rsc = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("tco05_spon_qual"); %>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>

<span class="bigTitle">Advancers - Qualification</span>
<br><br>
<table width="500" align="center" border="0" cellpadding="2" cellspacing="0" class="formFrame">
                <tr>
                  <td class="advTitle" width="100%" colspan="5">Qualification Round</td>
               </tr>
                <tr class="advHeader">
                   <td width="10%" align="center">
                       <a href="/tc?module=SimpleStats&d1=tournaments&d2=tco05&d3=spon_qualification&c=tco05_spon_qual&trans=true&<%=DataAccessConstants.SORT_COLUMN%>=seed&<%=DataAccessConstants.SORT_DIRECTION%>=asc">
                           Seed
                       </a>
                   </td>
                   <td width="30%" align="left">
                       <a href="/tc?module=SimpleStats&d1=tournaments&d2=tco05&d3=spon_qualification&c=tco05_spon_qual&trans=true&<%=DataAccessConstants.SORT_COLUMN%>=handle_sort&<%=DataAccessConstants.SORT_DIRECTION%>=asc">
                           Handle
                       </a>
                   </td>
                   <td width="30%" align="center">
                       <a href="/tc?module=SimpleStats&d1=tournaments&d2=tco05&d3=spon_qualification&c=tco05_spon_qual&trans=true&<%=DataAccessConstants.SORT_COLUMN%>=round_name&<%=DataAccessConstants.SORT_DIRECTION%>=asc">
                           Problem Set
                       </a>
                   </td>
                   <td width="15%" align="right">
                       <a href="/tc?module=SimpleStats&d1=tournaments&d2=tco05&d3=spon_qualification&c=tco05_spon_qual&trans=true&<%=DataAccessConstants.SORT_COLUMN%>=rating&<%=DataAccessConstants.SORT_DIRECTION%>=desc">
                           Rating
                       </a>
                   </td>
                   <td width="15%" align="right">
                       <a href="/tc?module=SimpleStats&d1=tournaments&d2=tco05&d3=spon_qualification&c=tco05_spon_qual&trans=true&<%=DataAccessConstants.SORT_COLUMN%>=points&<%=DataAccessConstants.SORT_DIRECTION%>=desc">
                           Points
                       </a>
                   </td>
                </tr>

                                <%boolean even = false;%>
                <rsc:iterator list="<%=rsc%>" id="resultRow"><tr>
                <td class="<%=even?"advanceDk":"advanceLt"%>" align="center"><rsc:item name="seed" row="<%=resultRow%>"/></td>
                <td class="<%=even?"advanceDk":"advanceLt"%>" align="left"><tc-webtag:handle coderId='<%=resultRow.getIntItem("user_id")%>' context="algorithm"/></td>
                <td class="<%=even?"advanceDk":"advanceLt"%>" align="center" nowrap="0"><rsc:item name="round_name" row="<%=resultRow%>"/></td>
                <td class="<%=even?"advanceDk":"advanceLt"%>" align="right"><rsc:item name="rating" row="<%=resultRow%>"/></td>
                <td class="<%=even?"advanceDk":"advanceLt"%>" align="right"><rsc:item name="points" row="<%=resultRow%>" format="0.00"/></td>
                </tr>
                   <%even=!even;%>
                </rsc:iterator>
             </table>
        </div>
		</td>


<!-- Right Column-->
<td width="170" align="right">
<img src="/i/clear.gif" alt="" width="170" height="15" border="0" /><br />
<img src="/i/tournament/tco05/sun_right.gif" alt="Sun" border="0" /><br />
<img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
<img src="/i/tournament/tco05/nsa_right.gif" alt="NSA" border="0" /><br />
<img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
<img src="/i/tournament/tco05/yahoo_right.gif" alt="Yahoo" border="0" /><br />
<img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
<img src="/i/tournament/tco05/verisign_right.gif" alt="Verisign" border="0" /><br />
<img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
<jsp:include page="../../calendar.jsp" />
</td>

	</tr>

</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
