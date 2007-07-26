<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants,com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,java.util.Map" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tccc07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>

<body>

<div align="center" style="background: transparent;">
    <div id="containAll">
    <div id="content">

        <jsp:include page="../nav.jsp" >
        <jsp:param name="tabLev1" value="<%=EventType.ALGORITHM_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="advancers"/>
        <jsp:param name="tabLev3" value="qualification"/>
        </jsp:include>

            <div id="pageBody">
                <h1><span>Qualification</span></h1>

                <div align="center">

<% ResultSetContainer rsc = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("tco07_alg_qual"); %>
                <table cellpadding="0" cellspacing="0" class="stat" style="width: 400px;">
                <thead>
                    <tr>
                        <td class="header" width="40%">
                            <a href="/tc?module=SimpleStats&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&&amp;d4=qualification&amp;c=tco07_alg_qual&amp;trans=true&amp;<%=DataAccessConstants.SORT_COLUMN%>=handle_sort&amp;<%=DataAccessConstants.SORT_DIRECTION%>=asc">
                                Handle
                            </a>
                        </td>
                        <td class="headerC" width="20%">
                            <a href="/tc?module=SimpleStats&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&&amp;d4=qualification&amp;c=tco07_alg_qual&amp;trans=true&amp;<%=DataAccessConstants.SORT_COLUMN%>=round_name&amp;<%=DataAccessConstants.SORT_DIRECTION%>=asc">
                                Problem Set
                            </a>
                        </td>
                        <td class="headerR" width="20%">
                            <a href="/tc?module=SimpleStats&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&&amp;d4=qualification&amp;c=tco07_alg_qual&amp;trans=true&amp;<%=DataAccessConstants.SORT_COLUMN%>=rating&amp;<%=DataAccessConstants.SORT_DIRECTION%>=desc">
                                Rating
                            </a>
                        </td>
                        <td class="headerR" width="20%">
                            <a href="/tc?module=SimpleStats&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&&amp;d4=qualification&amp;c=tco07_alg_qual&amp;trans=true&amp;<%=DataAccessConstants.SORT_COLUMN%>=points&amp;<%=DataAccessConstants.SORT_DIRECTION%>=desc">
                                Points
                            </a>
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <%boolean even = false;%>
<rsc:iterator list="<%=rsc%>" id="resultRow">
<tr class="<%=(even ? "dark" : "light")%>">
<td class="value">
<tc-webtag:handle coderId='<%=resultRow.getIntItem("user_id")%>' context="algorithm"/></td>
<td class="valueC" nowrap="nowrap">
<rsc:item name="round_name" row="<%=resultRow%>" ifNull="Bye"/></td>
<td class="valueR">
<rsc:item name="rating" row="<%=resultRow%>"/></td>
<td class="valueR">
<rsc:item name="points" row="<%=resultRow%>" format="0.00" ifNull="Bye"/></td>
</tr><%even = !even;%></rsc:iterator>

                </table>

                </div>

            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>