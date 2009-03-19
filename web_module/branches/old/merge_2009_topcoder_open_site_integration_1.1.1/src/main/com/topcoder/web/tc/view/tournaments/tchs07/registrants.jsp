<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html> 
<head> 
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/coders.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/tchs07.css"/>
    <title>TopCoder High School 2007</title> 
</head>
<body>

<% ResultSetContainer rsc = (ResultSetContainer) (request.getAttribute("list")); %>

<div align="center" style="background: transparent;">
    <div class="content">
        <img src="/i/tournament/tchs07/contentN.png" alt="contentN" style="display: block;" />

        <jsp:include page="links.jsp" >
        <jsp:param name="tabLev1" value="registrants"/>
        <jsp:param name="tabLev2" value=""/>
        <jsp:param name="tabLev3" value=""/>
        </jsp:include>

        <div class="contentSpacer">
          <h2>Registrants</h2>
          
<div align="center">

<table cellpadding="0" cellspacing="0" class="stat" style="width:400px; margin-bottom: 100px;">
<thead>
    <tr><td class="title" colspan="4">Registrants: <%=rsc.size()%></td></tr>
    <tr>
        <td class="header" width="60%">
            <a href="/tc?module=TCHS07ViewRegistrants<tc-webtag:sort column="<%=rsc.getColumnIndex("handle_lower")%>"/>">Handle</a>
        </td>
        <td class="header" width="40%">
            <a href="/tc?module=TCHS07ViewRegistrants<tc-webtag:sort column="<%=rsc.getColumnIndex("region_name")%>"/>">Region</a>
        </td>
        <td class="headerR">
            <a href="/tc?module=TCHS07ViewRegistrants<tc-webtag:sort column="<%=rsc.getColumnIndex("rating")%>"/>">Rating</a>
        </td>
    </tr>
</thead>
<tbody>
        <%boolean even = false;%>
        <rsc:iterator list='<%=rsc%>' id="resultRow">
            <tr class="<%=(even ? "dark" : "light")%>">
                <td class="value">
                    <tc-webtag:handle coderId='<%=resultRow.getIntItem("user_id")%>' context="hs_algorithm" />
                </td>
                <td class="value">
                    <rsc:item name="region_name" row='<%=resultRow%>'/>
                </td>
                <td class="valueR">
                    <rsc:item format="###0" ifNull="Unrated" name="rating" row='<%=resultRow%>'/>
                </td>
            </tr>
        <%even = !even;%></rsc:iterator>
</tbody>
</table>
</div>


        </div>
        <div class="footer">
            Copyright &#169; 2000-2006, TopCoder, Inc. All rights reserved.
        </div>
        <img src="/i/tournament/tchs07/contentS.png" alt="contentS" style="display: block;"/>
    </div>
</div>

</body> 
</html>

