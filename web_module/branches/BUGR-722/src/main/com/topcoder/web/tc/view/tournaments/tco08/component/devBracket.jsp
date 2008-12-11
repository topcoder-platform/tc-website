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
    <jsp:param name="tabLev2" value="development"/>
    <jsp:param name="tabLev3" value="bracket"/>
    </jsp:include>


        <h2>Component Development Finalist Bracket</h2>
        
        <div class="sub_content">
        
            <div align="center">
                <p>The finalists are sorted alphabetically.</p>
                <table cellpadding="0" cellspacing="0" border="0" style="margin-bottom: 40px;">
                    <tr>
                        <td align="right"><img src="/i/tournament/tco08/bracket_NW.png" alt="" border="0" /></td>
                        <td rowspan="3" style="background-color: #ffffff;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
                        <td rowspan="3" valign="middle"><img src="/i/tournament/tco08/bracket_R.png" alt="" border="0" /></td>
                        <td rowspan="3" valign="middle" align="center"><img src="/i/tournament/tco08/bracketChampion.png" alt="" border="0" /><span class="bigTitle"><br /><tc-webtag:handle coderId="8499822" context="development" darkBG="true" /></span></td>
                    </tr>
                    <tr>
                        <td style="padding: 15px" valign="middle" align="center">
                            <tc-webtag:handle coderId="15763205" context="development" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="20092786" context="development" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="15214882" context="development" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="10651566" context="development" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="15692556" context="development" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="20089342" context="development" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="302053" context="development" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="22629385" context="development" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="9998760" context="development" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="8499822" context="development" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="10405908" context="development" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="7360318" context="development" darkBG="true" />
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
                    The Review Board for the<br />TCO08 Component Development Finals:<br /><br />
                    <tc-webtag:handle coderId="277356" context="development" darkBG="true" /><br />
                    <tc-webtag:handle coderId="7210680" context="development" darkBG="true" /><br />
                    <tc-webtag:handle coderId="297731" context="development" darkBG="true" />
                    </p>
                </div>
        
        </div><%-- .sub_content --%>
        
    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
