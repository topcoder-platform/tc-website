<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
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
        <jsp:param name="tabLev3" value="bracket"/>
        </jsp:include>

            <div id="pageBody">
                <h1><span>Algorithm Finalist Bracket</span></h1>
                
                <div align="left" style="margin:20px 0px 20px 0px;">
                    <table cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td align="center"><img src="/i/tournament/tccc07/bracket_room1.png" alt="" border="0" /></td>
                            <td colspan="2">&#160;</td>
                            <td align="center"><img src="/i/tournament/tccc07/bracket_wildcard.png" alt="" border="0" /></td>
                            <td colspan="2">&#160;</td>
                            <td align="center"><img src="/i/tournament/tccc07/bracket_finals.png" alt="" border="0" /></td>
                            <td colspan="3">&#160;</td>
                        </tr>
                        <tr>
                            <td align="right"><img src="/i/tournament/tccc07/bracket_NW.png" alt="" border="0" /></td>
                            <td rowspan="2" style="background-color: #ffffff;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
                            <td colspan="2" align="right"><img src="/i/tournament/tccc07/bracket_NW.png" alt="" border="0" /></td>
                            <td rowspan="2" style="background-color: #ffffff;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
                            <td colspan="2" align="right"><img src="/i/tournament/tccc07/bracket_NW.png" alt="" border="0" /></td>
                            <td rowspan="11" style="background-color: #ffffff;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
                            <td rowspan="2" valign="middle"></td>
                        </tr>
                        <tr>
                            <td style="padding: 15px 15px 15px 0px" valign="middle" align="center">
                                <%-- ROOM 1 --%>
                                <tc-webtag:handle coderId="10574855" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="310333" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="9906197" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="8472826" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="8365685" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="307060" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="7390467" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="10597114" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="15803924" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="22652597" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="22653739" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="16056363" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="8584653" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="15657561" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="11899489" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="22627586" context="algorithm" darkBG="true" /><br />
                            </td>
                            <td valign="middle"><img src="/i/tournament/tccc07/bracket_bar.png" alt="" border="0" /></td>
                            <td style="padding: 15px 15px 15px 0px" valign="middle" align="center">
                                <%-- WILDCARD ROOM --%>
                                <tc-webtag:handle coderId="310333" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="7390467" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="22652597" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="8472826" context="algorithm" darkBG="true" /><br />
                            </td>
                            <td valign="middle">&#160;</td>
                            <td rowspan="9" style="padding: 15px" valign="middle" align="center">
                                <%-- FINALS --%>
                                <tc-webtag:handle coderId="10574855" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="9906197" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="19849563" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="7390224" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="21822659" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="8362207" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="309982" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="22652597" context="algorithm" darkBG="true" /><br />
                            </td>
                        </tr>
                        <tr>
                            <td align="right"><img src="/i/tournament/tccc07/bracket_SW.png" alt="" border="0" /></td>
                            <td colspan="4" style="background-color: #ffffff;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
                            <td style="background-color: #ffffff;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
                        </tr>
                        <tr>
                            <td align="center"><img src="/i/tournament/tccc07/bracket_room2.png" alt="" border="0" /></td><td colspan="3">&#160;</td>
                            <td style="background-color: #ffffff;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
                            <td>&#160;</td>
                        </tr>
                        <tr>
                            <td align="right"><img src="/i/tournament/tccc07/bracket_NW.png" alt="" border="0" /></td>
                            <td colspan="5" style="background-color: #ffffff;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
                        </tr>
                        <tr>
                            <td style="padding: 15px 15px 15px 0px" valign="middle" align="center">
                                <%-- ROOM 2 --%>
                                <tc-webtag:handle coderId="19849563" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="7442498" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="7390224" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="21971539" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="7421158" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="309982" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="19721111" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="293874" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="2058177" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="7546003" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="15485957" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="7563318" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="308453" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="7452866" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="22630769" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="11884173" context="algorithm" darkBG="true" /><br />
                            </td>
                            <td rowspan="2" style="background-color: #ffffff;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
                            <td valign="middle"><img src="/i/tournament/tccc07/bracket_bar.png" alt="" border="0" /></td>
                            <td style="padding: 15px 15px 15px 0px" valign="middle" align="center">
                                <%-- WILDCARD ROOM --%>
                                <tc-webtag:handle coderId="7442498" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="309982" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="7421158" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="7563318" context="algorithm" darkBG="true" /><br />
                            </td>
                            <td rowspan="2" style="background-color: #ffffff;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
                            <td valign="middle"><img src="/i/tournament/tccc07/bracket_bar.png" alt="" border="0" /></td>
                            <td valign="middle"><img src="/i/tournament/tccc07/bracket_R.png" alt="" border="0" /></td>
                            <td valign="middle" align="center">
                                <img src="/i/tournament/tccc07/bracket_champion.png" alt="" border="0" />
                                <br /><span class="bigTitle">&nbsp;<tc-webtag:handle coderId="10574855" context="algorithm" darkBG="true" /></span>
                            </td>
                        </tr>
                        <tr>
                            <td align="right"><img src="/i/tournament/tccc07/bracket_SW.png" alt="" border="0" /></td>
                            <td colspan="2"></td>
                        </tr>
                        <tr>
                            <td align="center"><img src="/i/tournament/tccc07/bracket_room3.png" alt="" border="0" /></td><td colspan="3">&#160;</td>
                            <td style="background-color: #ffffff;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
                            <td>&#160;</td>
                            <td colspan="3"align="center"></td>
                        </tr>
                        <tr>
                            <td align="right"><img src="/i/tournament/tccc07/bracket_NW.png" alt="" border="0" /></td>
                            <td colspan="4" style="background-color: #ffffff;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
                            <td style="background-color: #ffffff;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
                        </tr>
                        <tr>
                            <td style="padding: 15px 15px 15px 0px" valign="middle" align="center">
                                <%-- ROOM 3 --%>
                                <tc-webtag:handle coderId="251074" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="14970299" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="14886245" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="20315020" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="21822659" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="13351270" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="15868491" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="21659750" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="7340263" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="272408" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="8362207" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="7581406" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="11771960" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="22630033" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="347569" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="21691199" context="algorithm" darkBG="true" /><br />
                            </td>
                            <td rowspan="2" style="background-color: #ffffff;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
                            <td valign="middle"><img src="/i/tournament/tccc07/bracket_bar.png" alt="" border="0" /></td>
                            <td style="padding: 15px 15px 15px 0px" valign="middle" align="center">
                                <%-- WILDCARD ROOM --%>
                                <tc-webtag:handle coderId="14970299" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="347569" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="7581406" context="algorithm" darkBG="true" /><br />
                                <tc-webtag:handle coderId="15868491" context="algorithm" darkBG="true" /><br />
                            </td>
                            <td rowspan="2" style="background-color: #ffffff;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
                        </tr>
                        <tr>
                            <td align="right"><img src="/i/tournament/tccc07/bracket_SW.png" alt="" border="0" /></td>
                            <td align="right" colspan="2"><img src="/i/tournament/tccc07/bracket_SW.png" alt="" border="0" /></td>
                            <td align="right" colspan="2"><img src="/i/tournament/tccc07/bracket_SW.png" alt="" border="0" /></td>
                        </tr>
                    </table>
                </div>

            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>