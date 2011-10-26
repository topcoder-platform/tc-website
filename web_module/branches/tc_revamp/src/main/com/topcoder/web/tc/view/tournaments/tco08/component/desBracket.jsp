<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The 2008 TopCoder&reg; Open - Get ready for the Ultimate TopCoder Event!</title>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<link type="text/css" rel="stylesheet" href="/css/tournaments/tco08.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
<script language="JavaScript" type="text/javascript" src="/js/arena.js"></script>
</head>
<body id="page_sub">

<div id="wrapper">

    <jsp:include page="../nav.jsp" >
    <jsp:param name="tabLev1" value="<%=EventType.COMPONENT_TOURNAMENT_ID%>"/>
    <jsp:param name="tabLev2" value="design"/>
    <jsp:param name="tabLev3" value="bracket"/>
    </jsp:include>


        <h2>Component Design Finalist Bracket</h2>
        
        <div class="sub_content">
        
            <div align="center">
                <p>The finalists are sorted alphabetically.</p>
                <table cellpadding="0" cellspacing="0" border="0" style="margin-bottom: 40px;">
                    <tr>
                        <td align="right"><img src="/i/tournament/tco08/bracket_NW.png" alt="" border="0" /></td>
                        <td rowspan="3" style="background-color: #ffffff;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
                        <td rowspan="3" valign="middle"><img src="/i/tournament/tco08/bracket_R.png" alt="" border="0" /></td>
                        <td rowspan="3" valign="middle" align="center"><img src="/i/tournament/tco08/bracketChampion.png" alt="" border="0" /><span class="bigTitle"><br /><tc-webtag:handle coderId="119676" context="design" darkBG="true" /></span></td>
                    </tr>
                    <tr>
                        <td style="padding: 15px" valign="middle" align="center">
                            <tc-webtag:handle coderId="252022" context="design" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="287614" context="design" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="7360309" context="design" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="21926605" context="design" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="15179224" context="design" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="152342" context="design" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="10348862" context="design" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="119676" context="design" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="7463987" context="design" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="19930287" context="design" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="21471587" context="design" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="8544935" context="design" darkBG="true" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right"><img src="/i/tournament/tco08/bracket_SW.png" alt="" border="0" /></td>
                    </tr>
                    </table>
                    <%--
                    <p>
                    Component Design Alternates:<br /><br />
                    
                    </p>
                    --%>
                    <p>
                    The Review Board for the<br />TCO08 Component Design Finals:<br /><br />
                    <tc-webtag:handle coderId="278342" context="design" darkBG="true" /><br />
                    <tc-webtag:handle coderId="151743" context="design" darkBG="true" /><br />
                    <tc-webtag:handle coderId="11789293" context="design" darkBG="true" />
                    </p>
                </div>
        
        </div><%-- .sub_content --%>
        
    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
