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
    <jsp:param name="tabLev1" value="<%=EventType.STUDIO_TOURNAMENT_ID%>"/>
    <jsp:param name="tabLev2" value="advancers"/>
    <jsp:param name="tabLev3" value="bracket"/>
    </jsp:include>


        <h2>Studio Design Finalist Bracket</h2>
        
        <div class="sub_content">
        
            <div align="center">
                <p>The finalists are sorted alphabetically.</p>
                <table cellpadding="0" cellspacing="0" border="0" style="margin-bottom: 40px;">
                    <tr>
                        <td align="right"><img src="/i/tournament/tco08/bracket_NW.png" alt="" border="0" /></td>
                        <td rowspan="3" style="background-color: #ffffff;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
                        <td rowspan="3" valign="middle"><img src="/i/tournament/tco08/bracket_R.png" alt="" border="0" /></td>
                        <td rowspan="3" valign="middle" align="center"><img src="/i/tournament/tco08/bracketChampion.png" alt="" border="0" /><span class="bigTitle"><br /><tc-webtag:handle coderId="22418135" darkBG="true" /></span></td>
                    </tr>
                    <tr>
                        <td style="padding: 15px" valign="middle" align="center">
                            <tc-webtag:handle coderId="22689218" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="22690288" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="22666646" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="22673098" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="22658469" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="22673573" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="15006955" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="22418135" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="22076237" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="22682305" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="22673857" darkBG="true" /><br /><br />
                            <tc-webtag:handle coderId="13298470" darkBG="true" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right"><img src="/i/tournament/tco08/bracket_SW.png" alt="" border="0" /></td>
                    </tr>
                    </table>
                    <%--
                    <p>
                    Studio Design Alternates:<br /><br />
                    
                    </p>
                    --%>
                </div>
    
        </div><%-- .sub_content --%>
        
    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
