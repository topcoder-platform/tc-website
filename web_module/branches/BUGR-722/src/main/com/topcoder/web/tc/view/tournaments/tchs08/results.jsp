<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<%@ page import="com.topcoder.web.common.tag.HandleTag" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<% ResultSetContainer rsc = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("tchs08_alg_adv_overview"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tchs08.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <title>TopCoder High School 2008</title>
</head>
<body>

<div id="wrapper">

    <jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="resultsInd"/>
    <jsp:param name="tabLev2" value=""/>
    <jsp:param name="tabLev3" value=""/>
    </jsp:include>
    
    
    
        <div id="title">
            <h2>Results</h2>
        </div><%-- #title --%>
        
        <div id="content">

        <p>
            Online Rounds
            | <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tchs08&amp;d3=bracketInd">Finals</a>
        </p>


    <table cellspacing="0" cellpadding="0" class="stat">
        <thead>
            <tr>
                <td class="header">
                    Handle
                </td>
                <td class="headerC" nowrap="nowrap">
                    Round 1
                </td>
                <td class="headerC" nowrap="nowrap">
                    Round 2
                </td>
                <td class="headerC" nowrap="nowrap">
                    Round 3
                </td>
                <%--
                <td class="headerC">
                    Semifinals
                </td>
                --%>
                <td class="headerC">
                    Finals
                </td>
            </tr>
        </thead>
        <tbody>
            <%boolean even = false;%>
            <rsc:iterator list="<%=rsc%>" id="resultRow">
<tr class="<%=even?"dark":"light"%>">
<td class="value">
<tc-webtag:handle coderId='<%=resultRow.getLongItem("coder_id")%>' context="<%=HandleTag.HS_ALGORITHM%>"/>
</td>
<td class="valueC">
<% if (StringUtils.checkNull(resultRow.getStringItem("round1")).equals("Eliminated")) { %>
<span class="bigRed"><rsc:item name="round1" row="<%=resultRow%>"/></span>
<% } else { %>
<rsc:item name="round1" row="<%=resultRow%>"/>
<% } %>
</td>
<td class="valueC">
<% if (StringUtils.checkNull(resultRow.getStringItem("round2")).equals("Eliminated")) { %>
<span class="bigRed"><rsc:item name="round2" row="<%=resultRow%>"/></span>
<% } else { %>
<rsc:item name="round2" row="<%=resultRow%>"/>
<% } %>
</td>
<td class="valueC">
<% if (StringUtils.checkNull(resultRow.getStringItem("round3")).equals("Eliminated")) { %>
<span class="bigRed"><rsc:item name="round3" row="<%=resultRow%>"/></span>
<% } else { %>
<rsc:item name="round3" row="<%=resultRow%>"/>
<% } %>
</td>
<%--
<td class="valueC">
<% if (StringUtils.checkNull(resultRow.getStringItem("semi")).equals("Eliminated")) { %>
<span class="bigRed"><rsc:item name="semi" row="<%=resultRow%>"/></span>
<% } else { %>
<rsc:item name="semi" row="<%=resultRow%>"/>
<% } %>
</td>
--%>
<td class="valueC">
<% if (StringUtils.checkNull(resultRow.getStringItem("final")).equals("Eliminated")) { %>
<span class="bigRed"><rsc:item name="final" row="<%=resultRow%>"/></span>
<% } else { %>
<rsc:item name="final" row="<%=resultRow%>"/>
<% } %>
</td>
</tr>
<%even = !even;%>
</rsc:iterator>
        </tbody>
    </table>

</div><%-- #content --%>
        
        <jsp:include page="footer.jsp" />


</div><%-- #wrapper --%>

</body>
</html>

