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
        <jsp:param name="tabLev1" value="<%=EventType.COMPONENT_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="development"/>
        <jsp:param name="tabLev3" value="bracket"/>
        </jsp:include>

            <div id="pageBody">
                <h1><span>Component Development Finalist Bracket</span></h1>
                
                <p align="center">The finalists are sorted alphabetically.</p>
                <div align="center" style="margin:20px;">
                    <table cellpadding="0" cellspacing="0" border="0" style="margin-bottom: 40px;">
                       <tr>
                          <td align="right"><img src="/i/tournament/tccc07/bracket_NW.png" alt="" border="0" /></td>
                          <td rowspan="3" style="background-color: #ffffff;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
                          <td rowspan="3" valign="middle"><img src="/i/tournament/tccc07/bracket_R.png" alt="" border="0" /></td>
                          <td rowspan="3" valign="middle" align="center"><img src="/i/tournament/tccc07/bracket_champion.png" alt="" border="0" /><span class="bigTitle"><br /><tc-webtag:handle coderId="9998760" context="development" darkBG="true" /></span></td>
                       </tr>
                       <tr>
                          <td style="padding: 15px" valign="middle" align="center">
                              <tc-webtag:handle coderId="10063132" context="development" darkBG="true" /><br /><br />
                              <tc-webtag:handle coderId="20092786" context="development" darkBG="true" /><br /><br />
                              <tc-webtag:handle coderId="20095099" context="development" darkBG="true" /><br /><br />
                              <tc-webtag:handle coderId="21075542" context="development" darkBG="true" /><br /><br />
                              <tc-webtag:handle coderId="9998760" context="development" darkBG="true" /><br /><br />
                              <tc-webtag:handle coderId="20937270" context="development" darkBG="true" /><br /><br />
                              <tc-webtag:handle coderId="15604762" context="development" darkBG="true" />
                          </td>
                       </tr>
                       <tr>
                          <td align="right"><img src="/i/tournament/tccc07/bracket_SW.png" alt="" border="0" /></td>
                       </tr>
                    </table>
                    <%--
                    <p align="center">
                        Component Development Alternates:<br /><br />
                        <tc-webtag:handle coderId="20262386" context="development" darkBG="true" /><br />
                        <tc-webtag:handle coderId="15692556" context="development" darkBG="true" /><br />
                        <tc-webtag:handle coderId="22652765" context="development" darkBG="true" /><br />
                        <tc-webtag:handle coderId="22655207" context="development" darkBG="true" />
                    </p>
                    --%>
                    <p>&nbsp</p>
                    <p align="center">
                        The Review Board for the<br />TCCC07 Component Development Finals:<br /><br />
                        <tc-webtag:handle coderId="7210680" context="development" darkBG="true" /><br />
                        <tc-webtag:handle coderId="7360309" context="development" darkBG="true" /><br />
                        <tc-webtag:handle coderId="347569" context="development" darkBG="true" />
                    </p>
                </div>

            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>