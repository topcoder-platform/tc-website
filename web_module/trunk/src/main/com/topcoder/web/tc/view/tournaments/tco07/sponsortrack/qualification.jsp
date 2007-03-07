<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

                    <jsp:include page="nav.jsp" >
                    <jsp:param name="tabLev1" value="description"/>
                    <jsp:param name="tabLev2" value=""/>
                    <jsp:param name="tabLev3" value=""/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <%--<img src="/i/tournament/tco07/competitorsbanner.jpg" alt="Competitors" />--%>
                    <div id="pageBody">
                        <h1><div>Advancers - Qualification</div></h1>

<% ResultSetContainer rsc = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("tco07_spon_qual"); %>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <!-- Body-->
    <tr valign="top">
        <td valign="top" align="center">
            <div class="bodySpacer">

                <span class="bigTitle">Advancers - Qualification</span>
                <br><br>
                <table width="500" align="center" border="0" cellpadding="2" cellspacing="0" class="formFrame">
                    <tr>
                        <td class="advTitle" width="100%" colspan="4">Qualification Round</td>
                    </tr>
                    <tr class="advHeader">
                        <td width="10%" align="center">
                            <a href="/tc?module=SimpleStats&d1=tournaments&d2=tco07&d3=qualification&c=tco07_spon_qual&trans=true&<%=DataAccessConstants.SORT_COLUMN%>=seed&<%=DataAccessConstants.SORT_DIRECTION%>=asc">
                                Seed
                            </a>
                        </td>
                        <td width="30%" align="left">
                            <a href="/tc?module=SimpleStats&d1=tournaments&d2=tco07&d3=qualification&c=tco07_spon_qual&trans=true&<%=DataAccessConstants.SORT_COLUMN%>=handle_sort&<%=DataAccessConstants.SORT_DIRECTION%>=asc">
                                Handle
                            </a>
                        </td>
                        <td width="15%" align="right">
                            <a href="/tc?module=SimpleStats&d1=tournaments&d2=tco07&d3=qualification&c=tco07_spon_qual&trans=true&<%=DataAccessConstants.SORT_COLUMN%>=rating&<%=DataAccessConstants.SORT_DIRECTION%>=desc">
                                Rating
                            </a>
                        </td>
                        <td width="15%" align="right">
                            <a href="/tc?module=SimpleStats&d1=tournaments&d2=tco07&d3=qualification&c=tco07_spon_qual&trans=true&<%=DataAccessConstants.SORT_COLUMN%>=points&<%=DataAccessConstants.SORT_DIRECTION%>=desc">
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
