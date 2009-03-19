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
        <jsp:param name="tabLev3" value="summary"/>
        </jsp:include>

            <div id="pageBody">
                <h1><span>paranoia is the new Marathon Match Champion!</span></h1>
                
                <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518065">Discuss this competition</A>
                <p style="float:right; width:200px; 350px; margin-left:10px;"><img src="/i/tournament/tccc07/marathon.jpg"></p>
                <br /><br />
                
                <p>After the dust settled, <tc-webtag:handle coderId="7454301" context="marathon_match" darkBG="true" /> emerged as the winner of the 2007 TopCoder Collegiate Challenge Marathon Match competition, taking home the top prize of $15,000. <tc-webtag:handle coderId="10600282" context="marathon_match" darkBG="true" /> came in second, and <tc-webtag:handle coderId="7394165" context="marathon_match" darkBG="true" /> took home the third.</p>
                
                <p style="font-size:14px; font-weight:bold;">Marathon Match Final Scores</p>
                    <table cellspacing="0" cellpadding="0" class="stat" style="width: 60%">
                        <thead>
                            <tr class="sidebarTitle" nowrap="nowrap">
                                <td class="header" colspan="1">Handle</td>
                                <td class="headerC" colspan="1">Provisional Score</td>
                                <td class="headerC" colspan="1">Final Score</td>
                            </tr>
                        </thead> 
                        <%-- paranoia --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="7454301" darkBG="true" context="marathon_match" /></td>
                                <td class="valueC">2.8719</td>
                                <td class="valueC">2.7693</td>
                            </tr>
                        </tbody>
                        <%-- PaulJefferys --%>
                        <tbody>
                            <tr class="dark">
                                <td class="value"><tc-webtag:handle coderId="7394165" darkBG="true" context="marathon_match" /></td>
                                <td class="valueC">2.8013</td>
                                <td class="valueC">2.7107</td>
                            </tr>
                        </tbody>
                        <%-- Mojito1 --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="10600282" darkBG="true" context="marathon_match" /></td>
                                <td class="valueC">2.7823</td>
                                <td class="valueC">2.7158</td>
                            </tr>
                        </tbody>
                        <%-- KOTEHOK --%>
                        <tbody>
                            <tr class="dark">
                                <td class="value"><tc-webtag:handle coderId="15805598" darkBG="true" context="marathon_match" /></td>
                                <td class="valueC">2.7655</td>
                                <td class="valueC">2.6923</td>
                            </tr>
                        </tbody>
                        <%-- Jan_Kuipers --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="309453" darkBG="true" context="marathon_match" /></td>
                                <td class="valueC">2.7320</td>
                                <td class="valueC">2.6984</td>
                            </tr>
                        </tbody>
                        <%-- doudouille --%>
                        <tbody>
                            <tr class="dark">
                                <td class="value"><tc-webtag:handle coderId="9987185" darkBG="true" context="marathon_match" /></td>
                                <td class="valueC">2.7284</td>
                                <td class="valueC">2.6328</td>
                            </tr>
                        </tbody>
                        <%-- Maris --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="269788" darkBG="true" context="marathon_match" /></td>
                                <td class="valueC">2.5808</td>
                                <td class="valueC">2.5254</td>
                            </tr>
                        </tbody>
                        <%-- paisa --%>
                        <tbody>
                            <tr class="dark">
                                <td class="value"><tc-webtag:handle coderId="150796" darkBG="true" context="marathon_match" /></td>
                                <td class="valueC">2.5255</td>
                                <td class="valueC">2.5774</td>
                            </tr>
                        </tbody>
                    </table>
                

            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>