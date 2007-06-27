<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="../header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

                    <jsp:include page="../nav.jsp" >
                    <jsp:param name="tabLev1" value="overview"/>
                    <jsp:param name="tabLev2" value=""/>
                    <jsp:param name="tabLev3" value=""/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">
                        <h1><span style="text-align:center;">Admin Blogs | Member Blogs</span></h1>
                        <div style="width:600px;">
                            <%-- Admin Blogs --%>
                            <div style="width:200px; float:left;">
                                <p>
                                    <h3><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=blogs&d4=admin01">Top 10 lessons learned</A></h3>
                                    <p class="newsPhoto"><img src="/i/m/polgara_big2.jpg" alt="" width="55" height="61"/><br>
                                    by <tc-webtag:handle coderId="153650" context="algorithm"/><br>
                                        [ Tuesday, June 26 - 7:00 PM ]
                                </p>
                            </div>
                            
                            <%-- Spacer Div --%>
                            <div style="width:200px; float:left;">
                                <img src="/i/spacer.gif" />
                            </div>
                            
                            <%-- Member Blogs --%>
                            <div style="width:200px; float:left;">
                                <img src="/i/spacer.gif" />
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>