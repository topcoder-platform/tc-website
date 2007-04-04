<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="header.jsp" />


        <% ResultSetContainer rsc = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("tco07_spon_qual"); %>

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

                    <jsp:include page="nav.jsp" >
                    <jsp:param name="tabLev1" value="advancers"/>
                    <jsp:param name="tabLev2" value="qualification"/>
                    <jsp:param name="tabLev3" value=""/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">
                        <h1><span>Advancers - Qualification</span></h1>


                        <table width="500" align="center" border="0" cellpadding="2" cellspacing="0" class="formFrame">
                            <tr>
                                <td class="advTitle" width="100%" colspan="4">Qualification Round</td>
                            </tr>
                            <tr class="advHeader">
                                <td width="10%" align="center">
                                    <a href="/tc?module=SimpleStats&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsortrack&amp;d4=qualification&amp;c=tco07_spon_qual&amp;trans=true&amp;<%=DataAccessConstants.SORT_COLUMN%>=seed&amp;<%=DataAccessConstants.SORT_DIRECTION%>=asc">
                                        Seed
                                    </a>
                                </td>
                                <td width="30%" align="left">
                                    <a href="/tc?module=SimpleStats&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsortrack&amp;d4=qualification&amp;c=tco07_spon_qual&amp;trans=true&amp;<%=DataAccessConstants.SORT_COLUMN%>=handle_sort&amp;<%=DataAccessConstants.SORT_DIRECTION%>=asc">
                                        Handle
                                    </a>
                                </td>
                                <td width="15%" align="right">
                                    <a href="/tc?module=SimpleStats&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsortrack&amp;d4=qualification&amp;c=tco07_spon_qual&amp;trans=true&amp;<%=DataAccessConstants.SORT_COLUMN%>=rating&amp;<%=DataAccessConstants.SORT_DIRECTION%>=desc">
                                        Rating
                                    </a>
                                </td>
                                <td width="15%" align="right">
                                    <a href="/tc?module=SimpleStats&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsortrack&amp;d4=qualification&amp;c=tco07_spon_qual&amp;trans=true&amp;<%=DataAccessConstants.SORT_COLUMN%>=points&amp;<%=DataAccessConstants.SORT_DIRECTION%>=desc">
                                        Points
                                    </a>
                                </td>
                            </tr>

                            <%boolean even = false;%>
                            <rsc:iterator list="<%=rsc%>" id="resultRow"><tr>
                                <td class="<%=even?"advanceDk":"advanceLt"%>" align="center">
                                    <rsc:item name="seed" row="<%=resultRow%>"/></td>
                                <td class="<%=even?"advanceDk":"advanceLt"%>" align="left">
                                    <tc-webtag:handle coderId='<%=resultRow.getIntItem("user_id")%>' context="algorithm"/></td>
                                <td class="<%=even?"advanceDk":"advanceLt"%>" align="right">
                                    <rsc:item name="rating" row="<%=resultRow%>"/></td>
                                <td class="<%=even?"advanceDk":"advanceLt"%>" align="right">
                                    <rsc:item name="points" row="<%=resultRow%>" format="0.00"/></td>
                            </tr>
                                <%even = !even;%>
                            </rsc:iterator>
                        </table>




                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="footer.jsp" />
    </div>
</div>

</body>

</html>
