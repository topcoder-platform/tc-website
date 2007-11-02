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
        <jsp:param name="tabLev1" value="<%=EventType.STUDIO_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="advancers"/>
        <jsp:param name="tabLev3" value="bracket"/>
        </jsp:include>

            <div id="pageBody">
                <h1><span>Studio Finalist Bracket</span></h1>
                
                <p align="center">The finalists are sorted alphabetically.</p>
                <div align="center" style="margin:20px;">
                    <table cellpadding="0" cellspacing="0" border="0" style="margin-bottom: 40px;">
                       <tr>
                          <td align="right"><img src="/i/tournament/tccc07/bracket_NW.png" alt="" border="0" /></td>
                          <td rowspan="3" style="background-color: #ffffff;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
                          <td rowspan="3" valign="middle"><img src="/i/tournament/tccc07/bracket_R.png" alt="" border="0" /></td>
                          <td rowspan="3" valign="middle" align="center"><img src="/i/tournament/tccc07/bracket_champion.png" alt="" border="0" /><span class="bigTitle"><br /><tc-webtag:handle coderId="22689218" darkBG="true" /></span></td>
                       </tr>
                       <tr>
                          <td style="padding: 15px" valign="middle" align="center">
                              <tc-webtag:handle coderId="22689218" darkBG="true" /><br /><br />
                              <tc-webtag:handle coderId="13358674" darkBG="true" /><br /><br />
                              <tc-webtag:handle coderId="22677185" darkBG="true" /><br /><br />
                              <tc-webtag:handle coderId="15006955" darkBG="true" /><br /><br />
                              <tc-webtag:handle coderId="22076237" darkBG="true" /><br /><br />
                              <tc-webtag:handle coderId="22626864" darkBG="true" /><br /><br />
                              <tc-webtag:handle coderId="22673857" darkBG="true" /><br /><br />
                              <tc-webtag:handle coderId="13298470" darkBG="true" />
                          </td>
                       </tr>
                       <tr>
                          <td align="right"><img src="/i/tournament/tccc07/bracket_SW.png" alt="" border="0" /></td>
                       </tr>
                    </table>
                    <p>&nbsp</p>
                    <p align="center">
                        The Review Board for the<br />TCCC07 Studio Finals:<br /><br />
                        <tc-webtag:handle coderId="22666646" darkBG="true" /><br />
                        <tc-webtag:handle coderId="14947661" darkBG="true" /><br />
                        <tc-webtag:handle coderId="22652674" darkBG="true" />
                    </p>
                </div>

            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>