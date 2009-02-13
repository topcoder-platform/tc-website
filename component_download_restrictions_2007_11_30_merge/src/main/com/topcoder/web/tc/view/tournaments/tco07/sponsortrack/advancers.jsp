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
                    <jsp:param name="tabLev1" value="advancers"/>
                    <jsp:param name="tabLev2" value="overview"/>
                    <jsp:param name="tabLev3" value=""/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">
                        <h1><span>Advancers</span></h1>

                        <div align="center">
                            <table cellspacing="0" cellpadding="0" class="stat" style="width: 400px; margin-bottom: 100px;">
                            <thead>
                                <tr>
                                    <td class="title" colspan="3">
                                    Advancers
                                    </td>
                                </tr>
                                <tr>
                                    <td class="header">
                                    Handle
                                    </td>
                                    <td class="headerC">
                                    Round 1
                                    </td>
                                    <td class="headerC">
                                    Finals
                                    </td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="light">
                                    <td class="value">
                                    <tc-webtag:handle coderId="10445425" context="algorithm"/>
                                    </td>
                                    <td class="valueCA">
                                    Advanced
                                    </td>
                                    <td class="valueCA">
                                    Champion
                                    </td>
                                </tr>
                            </tbody>
                            <tbody>
                                <tr class="dark">
                                    <td class="value">
                                    <tc-webtag:handle coderId="15600872" context="algorithm"/>
                                    </td>
                                    <td class="valueCA">
                                    Advanced
                                    </td>
                                    <td class="valueCE">
                                    Eliminated
                                    </td>
                                </tr>
                            </tbody>
                            <tbody>
                                <tr class="light">
                                    <td class="value">
                                    <tc-webtag:handle coderId="15653863" context="algorithm"/>
                                    </td>
                                    <td class="valueCE">
                                    Eliminated
                                    </td>
                                    <td class="valueC">
                                    &nbsp;
                                    </td>
                                </tr>
                            </tbody>
                            <tbody>
                                <tr class="dark">
                                    <td class="value">
                                    <tc-webtag:handle coderId="20978640" context="algorithm"/>
                                    </td>
                                    <td class="valueCE">
                                    Eliminated
                                    </td>
                                    <td class="valueC">
                                    &nbsp;
                                    </td>
                                </tr>
                            </tbody>
                            </table>
                        </div>

                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="footer.jsp" />
    </div>
</div>

</body>

</html>
