<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>TopCoder High School 2008</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tchs08.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<% ResultSetContainer rsc = (ResultSetContainer) (request.getAttribute("list")); %>

<div id="wrapper">

    <jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="registrants"/>
    <jsp:param name="tabLev2" value=""/>
    <jsp:param name="tabLev3" value=""/>
    </jsp:include>
    
    
    
        <div id="title">
            <h2>Registrants</h2>
        </div><%-- #title --%>
        
        <div id="content">
            <div align="center">

            <table cellpadding="0" cellspacing="0" class="stat" width="50%">
            <thead>
                <tr><th colspan="4">Registrants: <%=rsc.size()%></th></tr>
                <tr>
                    <td class="header" width="60%">
                        <a href="/tchs08?module=ViewEventRegistrants<tc-webtag:sort column="<%=rsc.getColumnIndex("handle_lower")%>"/>">Handle</a>
                    </td>
<%--
                    <td class="header" width="40%">
                        <a href="/tc?module=TCHS08ViewRegistrants<tc-webtag:sort column="<%=rsc.getColumnIndex("region_name")%>"/>">Region</a>
                    </td>
--%>
                    <td class="headerR">
                        <a href="/tchs08?module=ViewEventRegistrants<tc-webtag:sort column="<%=rsc.getColumnIndex("rating")%>"/>">Rating</a>
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
<%--
                            <td class="value">
                                <rsc:item name="region_name" row='<%=resultRow%>'/>
                            </td>
--%>
                            <td class="valueR">
                                <rsc:item format="###0" ifNull="Unrated" name="rating" row='<%=resultRow%>'/>
                            </td>
                        </tr>
                    <%even = !even;%></rsc:iterator>
            </tbody>
            </table>
            </div>
            
        </div><%-- #content --%>
        
        <jsp:include page="footer.jsp" />


</div><%-- #wrapper --%>

</body>
</html>