<%@  page language="java"  %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
</head>
<body>


<% ResultSetContainer rsc = (ResultSetContainer) (request.getAttribute("list")); %>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="component"/>
<jsp:param name="tabLev2" value="registrants"/>
<jsp:param name="tabLev3" value=""/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>
<span class="bigTitle">Component Design and Development Competition Registrants</span>
<br><br>
<table class="formFrame" border="0" cellpadding="6" cellspacing="0" width="300">
    <tbody><tr>
      <td class="advTitle" colspan="3" width="100%">Registrants (<%=rsc.size()%>)</td>
   </tr>
    <tr class="advHeader">
       <td align="left" width="50%"><a href="/tc?module=TCO06CompRegistrants<tc-webtag:sort column="1"/>">Handle</a></td>
       <td align="right" width="25%"><a href="/tc?module=TCO06CompRegistrants<tc-webtag:sort column="2"/>">Design Rating</a></td>
       <td align="right" width="25%"><a href="/tc?module=TCO06CompRegistrants<tc-webtag:sort column="3"/>">Development Rating</a></td>
    </tr>
<%boolean even = false;%>
<rsc:iterator list='<%=rsc%>' id="resultRow">
<tr>
<td class="<%=(even ? "advanceDk" : "advanceLt")%>"><tc-webtag:handle coderId='<%=resultRow.getIntItem("user_id")%>' context="component" darkBG="true"/></td>
<td class="<%=(even ? "advanceDk" : "advanceLt")%>" align="right"><rsc:item format="###0" ifNull="Unrated" name="design_rating" row='<%=resultRow%>' /></td>
<td class="<%=(even ? "advanceDk" : "advanceLt")%>" align="right"><rsc:item format="###0" ifNull="Unrated" name="dev_rating" row='<%=resultRow%>' /></td>
</tr>
<%even = !even;%>
</rsc:iterator>

</table>

        </div>
		</td>


<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>

	</tr>

</table>




<jsp:include page="../../foot.jsp" />

</body>

</html>
