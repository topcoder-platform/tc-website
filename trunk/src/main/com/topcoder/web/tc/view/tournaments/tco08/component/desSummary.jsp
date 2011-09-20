<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
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
    <jsp:param name="tabLev3" value="summary"/>
    </jsp:include>


        <h2>Component Design Competition Summary</h2>
        
        <div class="sub_content">
        
            <p><img src="/i/m/ivern_big2.jpg" alt="ivern" style="width:55px; height:61px; border:0px; padding-right:2px;" hspace="6" vspace="1" align="left" class="myStatsPhoto" /><span>Thursday, May 15, 2008<br />Introduction by <tc-webtag:handle coderId="156859" context="algorithm" darkBG="true" /></span></p>
            <p align="right"><tc-webtag:forumLink forumID="521237" message="Discuss this competition" /></p>
            <br /><br />
            
            <h3>Pops is the new Component Design Champion!</h3>
            <br />
            <p style="float:right; width:200px; 350px; margin-left:10px;"><img src="/i/tournament/tco08/compDes.jpg" alt="Pops is the new Component Design Champion!" /></p>
            
            <p>This year's component project was part of a combined effort between the Components and Studio tracks to build a small visual application within the timeframe of the TCO finals.  This application displays TopCoder members that are "related" to a specified member through one or more of a variety of metrics, and places these members on the screen at a distance from the original member inversely proportional to how "related" they are.  The sample application allows the user to specify geographical location, rating, and TopCoder match overlap as metrics for the visualization.</p>
            <p>The Components tracks were responsible for building the business logic for calculating distances between members as a component.  TopCoder provided the component competitors with sample member data, as well as a data access layer with a reference implementation to read the sample data.</p>
            <p>The overall winner of the design competition, which took place on Monday and lasted six hours, was <tc-webtag:handle coderId="119676" context="design" darkBG="true" /> with a Java submission.  <tc-webtag:handle coderId="8544935" context="design" darkBG="true" /> submitted the top .NET solution and both of their designs became inputs to the development competition, which ran on Wednesday and lasted eight and a half hours.  After reviews were done, <tc-webtag:handle coderId="8499822" context="development" darkBG="true" /> emerged as the overall development winner.</p>
            <p>Congratulations to the winners, and a special thanks to <tc-webtag:handle coderId="278342" context="design" darkBG="true" />, <tc-webtag:handle coderId="151743" context="design" darkBG="true" />, <tc-webtag:handle coderId="11789293" context="design" darkBG="true" />, <tc-webtag:handle coderId="277356" context="development" darkBG="true" />, <tc-webtag:handle coderId="297731" context="development" darkBG="true" />, and <tc-webtag:handle coderId="7210680" context="development" darkBG="true" /> for delivering a true reviewing tour de force this week.</p>
            
            <br />
            <h4>Component Design Competition Final Scores</h4>
                <table cellspacing="0" cellpadding="0" class="stat">
                    <tr>
                        <th>&nbsp;</th>
                        <th>&nbsp;</th>
                        <th colspan="3"><center>Review Board</center></th>
                        <th>&nbsp;</th>
                        <th>&nbsp;</th>
                    </tr>
                    <tr>
                        <th>Competitor</th>
                        <th>Rating</th>
                        <th><tc-webtag:handle coderId="278342" context="design" darkBG="true" /></th>
                        <th><tc-webtag:handle coderId="151743" context="design" darkBG="true" /></th>
                        <th><tc-webtag:handle coderId="11789293" context="design" darkBG="true" /></th>
                        <th>Link</th>
                        <th>Total</th>
                    </tr>
                    <%-- Pops --%>
                    <tr class="light">
                        <td class="value"><tc-webtag:handle coderId="119676" context="design" darkBG="true" /></td>
                        <td class="value">2572</td>
                        <td class="value">87.25</td>
                        <td class="value">89.31</td>
                        <td class="value">90.78</td>
                        <td class="value"><a target="_blank" href="http://software.topcoder.com/html/tco08/desSub/Pops.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                        <td class="value">89.11</td>
                    </tr>
                    <%-- Luca --%>
                    <tr class="dark">
                        <td class="value"><tc-webtag:handle coderId="10348862" context="design" darkBG="true" /></td>
                        <td class="value">1502</td>
                        <td class="value">87.06</td>
                        <td class="value">89.09</td>
                        <td class="value">88.59</td>
                        <td class="value"><a target="_blank" href="http://software.topcoder.com/html/tco08/desSub/Luca.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                        <td class="value">88.25</td>
                    </tr>
                    <%-- ShindouHikaru --%>
                    <tr class="light">
                        <td class="value"><tc-webtag:handle coderId="7463987" context="design" darkBG="true" /></td>
                        <td class="value">1582</td>
                        <td class="value">86.16</td>
                        <td class="value">85.97</td>
                        <td class="value">90.34</td>
                        <td class="value"><a target="_blank" href="http://software.topcoder.com/html/tco08/desSub/ShindouHikaru.jar"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                        <td class="value">87.49</td>
                    </tr>
                    <%-- Wendell --%>
                    <tr class="dark">
                        <td class="value"><tc-webtag:handle coderId="8544935" context="design" darkBG="true" /></td>
                        <td class="value">2152</td>
                        <td class="value">81.53</td>
                        <td class="value">81.97</td>
                        <td class="value">86.91</td>
                        <td class="value"><a target="_blank" href="http://software.topcoder.com/html/tco08/desSub/Wendell.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                        <td class="value">83.47</td>
                    </tr>
                    <%-- dmks --%>
                    <tr class="light">
                        <td class="value"><tc-webtag:handle coderId="7360309" context="design" darkBG="true" /></td>
                        <td class="value">1602</td>
                        <td class="value">77.53</td>
                        <td class="value">81.28</td>
                        <td class="value">84.56</td>
                        <td class="value"><a target="_blank" href="http://software.topcoder.com/html/tco08/desSub/dmks.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                        <td class="value">81.12</td>
                    </tr>
                    <%-- fabrizyo --%>
                    <tr class="dark">
                        <td class="value"><tc-webtag:handle coderId="21926605" context="design" darkBG="true" /></td>
                        <td class="value">1406</td>
                        <td class="value">82.28</td>
                        <td class="value">75.28</td>
                        <td class="value">79.69</td>
                        <td class="value"><a target="_blank" href="http://software.topcoder.com/html/tco08/desSub/fabrizyo.jar"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                        <td class="value">79.08</td>
                    </tr>
                    <%-- kyky --%>
                    <tr class="light">
                        <td class="value"><tc-webtag:handle coderId="152342" context="design" darkBG="true" /></td>
                        <td class="value">2788</td>
                        <td class="value">77.38</td>
                        <td class="value">79.41</td>
                        <td class="value">74.84</td>
                        <td class="value"><a target="_blank" href="http://software.topcoder.com/html/tco08/desSub/kyky.jar"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                        <td class="value">77.21</td>
                    </tr>
                    <%-- argolite --%>
                    <tr class="dark">
                        <td class="value"><tc-webtag:handle coderId="287614" context="design" darkBG="true" /></td>
                        <td class="value">1265</td>
                        <td class="value">75.44</td>
                        <td class="value">74.56</td>
                        <td class="value">80.56</td>
                        <td class="value"><a target="_blank" href="http://software.topcoder.com/html/tco08/desSub/argolite.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                        <td class="value">76.85</td>
                    </tr>
                    <%-- AleaActaEst --%>
                    <tr class="light">
                        <td class="value"><tc-webtag:handle coderId="252022" context="design" darkBG="true" /></td>
                        <td class="value">1304</td>
                        <td class="value">76.56</td>
                        <td class="value">75.94</td>
                        <td class="value">78.03</td>
                        <td class="value"><a target="_blank" href="http://software.topcoder.com/html/tco08/desSub/AleaActaEst.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                        <td class="value">76.84</td>
                    </tr>
                    <%-- tushak --%>
                    <tr class="dark">
                        <td class="value"><tc-webtag:handle coderId="19930287" context="design" darkBG="true" /></td>
                        <td class="value">1687</td>
                        <td class="value">75.72</td>
                        <td class="value">76.59</td>
                        <td class="value">78.16</td>
                        <td class="value"><a target="_blank" href="http://software.topcoder.com/html/tco08/desSub/tushak.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                        <td class="value">76.82</td>
                    </tr>
                </table>
                <br />
        
        </div><%-- .sub_content --%>
        
    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
