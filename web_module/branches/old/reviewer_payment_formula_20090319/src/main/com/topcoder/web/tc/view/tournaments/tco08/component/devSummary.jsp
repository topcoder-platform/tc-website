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
    <jsp:param name="tabLev2" value="development"/>
    <jsp:param name="tabLev3" value="summary"/>
    </jsp:include>


        <h2>Component Development Competition Summary</h2>
        
        <div class="sub_content">
        
            <p><img src="/i/m/ivern_big2.jpg" alt="ivern" style="width:55px; height:61px; border:0px; padding-right:2px;" hspace="6" vspace="1" align="left" class="myStatsPhoto" /><span>Thursday, May 15, 2008<br />Introduction by <tc-webtag:handle coderId="156859" context="algorithm" darkBG="true" /></span></p>
            <p align="right"><tc-webtag:forumLink forumID="521237" message="Discuss this competition" /></p>
            <br /><br />
            
            <h3>romanoTC is the new Component Development Champion!</h3>
            <br />
            <p style="float:right; width:200px; 350px; margin-left:10px;"><img src="/i/tournament/tco08/compDev.jpg" alt="romanoTC is the new Component Development Champion!" /></p>
            
            <p>This year's component project was part of a combined effort between the Components and Studio tracks to build a small visual application within the timeframe of the TCO finals.  This application displays TopCoder members that are "related" to a specified member through one or more of a variety of metrics, and places these members on the screen at a distance from the original member inversely proportional to how "related" they are.  The sample application allows the user to specify geographical location, rating, and TopCoder match overlap as metrics for the visualization.</p>
            <p>The Components tracks were responsible for building the business logic for calculating distances between members as a component.  TopCoder provided the component competitors with sample member data, as well as a data access layer with a reference implementation to read the sample data.</p>
            <p>The overall winner of the design competition, which took place on Monday and lasted six hours, was <tc-webtag:handle coderId="119676" context="design" darkBG="true" /> with a Java submission.  <tc-webtag:handle coderId="8544935" context="design" darkBG="true" /> submitted the top .NET solution and both of their designs became inputs to the development competition, which ran on Wednesday and lasted eight and a half hours.  After reviews were done, <tc-webtag:handle coderId="8499822" context="development" darkBG="true" /> emerged as the overall development winner.</p>
            <p>Congratulations to the winners, and a special thanks to <tc-webtag:handle coderId="278342" context="design" darkBG="true" />, <tc-webtag:handle coderId="151743" context="design" darkBG="true" />, <tc-webtag:handle coderId="11789293" context="design" darkBG="true" />, <tc-webtag:handle coderId="277356" context="development" darkBG="true" />, <tc-webtag:handle coderId="297731" context="development" darkBG="true" />, and <tc-webtag:handle coderId="7210680" context="development" darkBG="true" /> for delivering a true reviewing tour de force this week.</p>
            
            <br />
            <h4>Component Development Competition Final Scores</h4>
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
                        <th><tc-webtag:handle coderId="297731" context="development" darkBG="true" /></th>
                        <th><tc-webtag:handle coderId="277356" context="development" darkBG="true" /></th>
                        <th><tc-webtag:handle coderId="7210680" context="development" darkBG="true" /></th>
                        <th>Link</th>
                        <th>Total</th>
                    </tr>
                    <%-- romanoTC --%>
                    <tr class="light">
                        <td class="value"><tc-webtag:handle coderId="8499822" context="development" darkBG="true" /></td>
                        <td class="value">1840</td>
                        <td class="value">85.66</td>
                        <td class="value">97.94</td>
                        <td class="value">94.31</td>
                        <td class="value"><a target="_blank" href="http://software.topcoder.com/html/tco08/devSub/romanoTC.jar"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                        <td class="value">92.64</td>
                    </tr>
                    <%-- PE --%>
                    <tr class="dark">
                        <td class="value"><tc-webtag:handle coderId="9998760" context="development" darkBG="true" /></td>
                        <td class="value">1797</td>
                        <td class="value">86.28</td>
                        <td class="value">88.31</td>
                        <td class="value">96.56</td>
                        <td class="value"><a target="_blank" href="http://software.topcoder.com/html/tco08/devSub/PE.jar"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                        <td class="value">90.38</td>
                    </tr>
                    <%-- cyberjag --%>
                    <tr class="light">
                        <td class="value"><tc-webtag:handle coderId="15763205" context="development" darkBG="true" /></td>
                        <td class="value">1052</td>
                        <td class="value">86.41</td>
                        <td class="value">96.34</td>
                        <td class="value">87.56</td>
                        <td class="value"><a target="_blank" href="http://software.topcoder.com/html/tco08/devSub/cyberjag.jar"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                        <td class="value">90.10</td>
                    </tr>
                    <%-- Orange_Cloud --%>
                    <tr class="dark">
                        <td class="value"><tc-webtag:handle coderId="22629385" context="development" darkBG="true" /></td>
                        <td class="value">1701</td>
                        <td class="value">86.64</td>
                        <td class="value">96.47</td>
                        <td class="value">86.75</td>
                        <td class="value"><a target="_blank" href="http://software.topcoder.com/html/tco08/devSub/Orange_Cloud.jar"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                        <td class="value">89.95</td>
                    </tr>
                    <%-- enefem21 --%>
                    <tr class="light">
                        <td class="value"><tc-webtag:handle coderId="20092786" context="development" darkBG="true" /></td>
                        <td class="value">1468</td>
                        <td class="value">86.03</td>
                        <td class="value">86.42</td>
                        <td class="value">96.19</td>
                        <td class="value"><a target="_blank" href="http://software.topcoder.com/html/tco08/devSub/enefem21.jar"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                        <td class="value">89.55</td>
                    </tr>
                    <%-- oldbig --%>
                    <tr class="dark">
                        <td class="value"><tc-webtag:handle coderId="302053" context="development" darkBG="true" /></td>
                        <td class="value">2165</td>
                        <td class="value">82.84</td>
                        <td class="value">86.03</td>
                        <td class="value">94.44</td>
                        <td class="value"><a target="_blank" href="http://software.topcoder.com/html/tco08/devSub/oldbig.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                        <td class="value">87.77</td>
                    </tr>
                    <%-- wiedzmin --%>
                    <tr class="light">
                        <td class="value"><tc-webtag:handle coderId="10405908" context="development" darkBG="true" /></td>
                        <td class="value">1725</td>
                        <td class="value">80.98</td>
                        <td class="value">88.47</td>
                        <td class="value">89.5</td>
                        <td class="value"><a target="_blank" href="http://software.topcoder.com/html/tco08/devSub/wiedzmin.jar"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                        <td class="value">86.32</td>
                    </tr>
                    <%-- hefeng --%>
                    <tr class="dark">
                        <td class="value"><tc-webtag:handle coderId="15214882" context="development" darkBG="true" /></td>
                        <td class="value">1987</td>
                        <td class="value">87.88</td>
                        <td class="value">84.01</td>
                        <td class="value">74.12</td>
                        <td class="value"><a target="_blank" href="http://software.topcoder.com/html/tco08/devSub/hefeng.rar"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                        <td class="value">82.00</td>
                    </tr>
                    <%-- hotblue --%>
                    <tr class="light">
                        <td class="value"><tc-webtag:handle coderId="10651566" context="development" darkBG="true" /></td>
                        <td class="value">1192</td>
                        <td class="value">89.59</td>
                        <td class="value">75.31</td>
                        <td class="value">79.31</td>
                        <td class="value"><a target="_blank" href="http://software.topcoder.com/html/tco08/devSub/hotblue.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                        <td class="value">81.40</td>
                    </tr>
                    <%-- netsafe --%>
                    <tr class="dark">
                        <td class="value"><tc-webtag:handle coderId="20089342" context="development" darkBG="true" /></td>
                        <td class="value">1358</td>
                        <td class="value">73.5</td>
                        <td class="value">75.93</td>
                        <td class="value">88.25</td>
                        <td class="value"><a target="_blank" href="http://software.topcoder.com/html/tco08/devSub/netsafe.jar"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                        <td class="value">79.23</td>
                    </tr>
                    <%-- Xuchen --%>
                    <tr class="light">
                        <td class="value"><tc-webtag:handle coderId="7360318" context="development" darkBG="true" /></td>
                        <td class="value">1638</td>
                        <td class="value">82.9</td>
                        <td class="value">77.19</td>
                        <td class="value">77.5</td>
                        <td class="value"><a target="_blank" href="http://software.topcoder.com/html/tco08/devSub/Xuchen.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                        <td class="value">79.20</td>
                    </tr>
                    <%-- jueyey --%>
                    <tr class="dark">
                        <td class="value"><tc-webtag:handle coderId="15692556" context="development" darkBG="true" /></td>
                        <td class="value">1674</td>
                        <td class="value">64.58</td>
                        <td class="value">67.44</td>
                        <td class="value">55.5</td>
                        <td class="value"><a target="_blank" href="http://software.topcoder.com/html/tco08/devSub/jueyey.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                        <td class="value">62.51</td>
                    </tr>
                </table>
                <br />
        
        </div><%-- .sub_content --%>
        
    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
