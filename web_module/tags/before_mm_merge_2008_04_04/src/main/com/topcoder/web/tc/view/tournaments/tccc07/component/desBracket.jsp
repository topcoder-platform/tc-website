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
        <jsp:param name="tabLev2" value="design"/>
        <jsp:param name="tabLev3" value="bracket"/>
        </jsp:include>

            <div id="pageBody">
                <h1><span>Component Design Finalist Bracket</span></h1>
                
                <p align="center">The finalists are sorted alphabetically.</p>
                <div align="center" style="margin:20px;">
                    <table cellpadding="0" cellspacing="0" border="0" style="margin-bottom: 40px;">
                       <tr>
                          <td align="right"><img src="/i/tournament/tccc07/bracket_NW.png" alt="" border="0" /></td>
                          <td rowspan="3" style="background-color: #ffffff;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
                          <td rowspan="3" valign="middle"><img src="/i/tournament/tccc07/bracket_R.png" alt="" border="0" /></td>
                          <td rowspan="3" valign="middle" align="center"><img src="/i/tournament/tccc07/bracket_champion.png" alt="" border="0" /><span class="bigTitle"><br /><tc-webtag:handle coderId="293874" context="design" darkBG="true" /></span></td>
                       </tr>
                       <tr>
                          <td style="padding: 15px" valign="middle" align="center">
                              <tc-webtag:handle coderId="252022" context="design" darkBG="true" /><br /><br />
                              <tc-webtag:handle coderId="7568791" context="design" darkBG="true" /><br /><br />
                              <tc-webtag:handle coderId="20256177" context="design" darkBG="true" /><br /><br />
                              <tc-webtag:handle coderId="10348862" context="design" darkBG="true" /><br /><br />
                              <tc-webtag:handle coderId="293874" context="design" darkBG="true" /><br /><br />
                              <tc-webtag:handle coderId="275640" context="design" darkBG="true" /><br /><br />
                              <tc-webtag:handle coderId="21471587" context="design" darkBG="true" /><br /><br />
                              <tc-webtag:handle coderId="8518361" context="design" darkBG="true" />
                          </td>
                       </tr>
                       <tr>
                          <td align="right"><img src="/i/tournament/tccc07/bracket_SW.png" alt="" border="0" /></td>
                       </tr>
                    </table>
                    <%--
                    <p align="center">
                        Component Design Alternates:<br /><br />
                        <tc-webtag:handle coderId="20256177" context="design" darkBG="true" /><br />
                        <tc-webtag:handle coderId="275640" context="design" darkBG="true" /><br />
                        <tc-webtag:handle coderId="15540298" context="design" darkBG="true" /><br />
                        <tc-webtag:handle coderId="8419911" context="design" darkBG="true" />
                    </p>
                    --%>
                    <p>&nbsp</p>
                    <p align="center">
                        The Review Board for the<br />TCCC07 Component Design Finals:<br /><br />
                        <tc-webtag:handle coderId="277356" context="design" darkBG="true" /><br />
                        <tc-webtag:handle coderId="151743" context="design" darkBG="true" /><br />
                        <tc-webtag:handle coderId="152342" context="design" darkBG="true" />
                    </p>
                </div>

            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>