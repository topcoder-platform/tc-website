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
        <jsp:param name="tabLev1" value="<%=EventType.MARATHON_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="advancers"/>
        <jsp:param name="tabLev3" value="bracket"/>
        </jsp:include>

            <div id="pageBody">
                <h1><span>Marathon Match Finalist Bracket</span></h1>
                
                <p align="center">The finalists are sorted alphabetically.</p>
                <div align="center" style="margin:20px;">
                    <table cellpadding="0" cellspacing="0" border="0" style="margin-bottom: 40px;">
                       <tr>
                          <td align="right"><img src="/i/tournament/tccc07/bracket_NW.png" alt="" border="0" /></td>
                          <td rowspan="3" style="background-color: #ffffff;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
                          <td rowspan="3" valign="middle"><img src="/i/tournament/tccc07/bracket_R.png" alt="" border="0" /></td>
                          <td rowspan="3" valign="middle" align="center"><img src="/i/tournament/tccc07/bracket_champion.png" alt="" border="0" /><span class="bigTitle"><br /><tc-webtag:handle coderId="7454301" darkBG="true" context="marathon_match" /></span></td>
                       </tr>
                       <tr>
                          <td style="padding: 15px" valign="middle" align="center">
                              <tc-webtag:handle coderId="9987185" darkBG="true" context="marathon_match" /><br /><br />
                              <tc-webtag:handle coderId="309453" darkBG="true" context="marathon_match" /><br /><br />
                              <tc-webtag:handle coderId="15805598" darkBG="true" context="marathon_match" /><br /><br />
                              <tc-webtag:handle coderId="269788" darkBG="true" context="marathon_match" /><br /><br />
                              <tc-webtag:handle coderId="10600282" darkBG="true" context="marathon_match" /><br /><br />
                              <tc-webtag:handle coderId="150796" darkBG="true" context="marathon_match" /><br /><br />
                              <tc-webtag:handle coderId="7454301" darkBG="true" context="marathon_match" /><br /><br />
                              <tc-webtag:handle coderId="7394165" darkBG="true" context="marathon_match" />
                          </td>
                       </tr>
                       <tr>
                          <td align="right"><img src="/i/tournament/tccc07/bracket_SW.png" alt="" border="0" /></td>
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