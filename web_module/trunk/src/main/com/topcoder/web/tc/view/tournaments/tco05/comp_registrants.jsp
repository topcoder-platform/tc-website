<%@  page language="java"  %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
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
      <td class="advTitle" colspan="3" width="100%">Registrants</td>
   </tr>
    <tr class="advHeader">
       <td align="left" width="30%">Handle</td>
       <td align="right" width="15%">Design Rating</td>
       <td align="right" width="15%">Development Rating</td>
    </tr>
    <%boolean even = false;%>
    <rsc:iterator list='<%=rsc%>' id="resultRow">
    <tr>
    <td class="<%=(even ? "advanceDk" : "advanceLt")%>" align="left"><tc-webtag:handle coderId='<%=resultRow.getIntItem("coder_id")%>'/></td>
    <td class="<%=(even ? "advanceDk" : "advanceLt")%>" align="right"><rsc:item name="design_rating" row='<%=resultRow%>' /></td>
    <td class="<%=(even ? "advanceDk" : "advanceLt")%>" align="right"><rsc:item name="dev_rating" row='<%=resultRow%>' /></td>
    </tr>
    <%even = !even;%>
    </rsc:iterator>
    
</table>

        </div>
		</td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="tco05"/>
            </jsp:include>
         </td>
		
	</tr>
	
</table>
	
	


<jsp:include page="../../foot.jsp" />

</body>

</html>
