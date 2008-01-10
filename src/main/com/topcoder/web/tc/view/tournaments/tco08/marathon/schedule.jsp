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
<body id="page_sub">

<div id="wrapper">

    <jsp:include page="../nav.jsp" >
    <jsp:param name="tabLev1" value="<%=EventType.MARATHON_TOURNAMENT_ID%>"/>
    <jsp:param name="tabLev2" value="schedule"/>
    <jsp:param name="tabLev3" value=""/>
    </jsp:include>


        <h2>Marathon Match Competition Schedule</h2>
        
        <div class="sub_content">
        
            <h3>Registration</h3>
            <p>Registration for the 2008 TopCoder Open Marathon Competition will open at 9:00 AM EST on Monday, January 14 and will close at 5:00 PM EST on Tuesday, January 29, 2008.</p>
            <table width="100%" cellpadding="0" cellspacing="0" class="stat">
                <tr>
                    <th colspan="5">Online Elimination Rounds</th>
                </tr>
                <tr>
                    <th>Round</th>
                    <th>Start Date and Time</th>
                    <th>End Date and Time</th>
                    <th># of Participants</th>
                    <th># of Advancers</th>
                </tr>
                <tr class="dark">
                    <td>Online Round 1</td>
                    <td>Wednesday, Jan. 30<br />at Noon*</td>
                    <td>Wednesday, Feb. 6<br />at Noon*</td>
                    <td>Unlimited</td>
                    <td>300</td>
                </tr>
                <tr class="light">
                    <td>Online Round 2</td>
                    <td>Wednesday, Feb. 13<br />at Noon*</td>
                    <td>Wednesday, Feb. 20<br />at Noon*</td>
                    <td>300</td>
                    <td>100</td>
                </tr>
                <tr class="dark">
                    <td>Online Round 3</td>
                    <td>Wednesday, Feb. 27<br />at Noon*</td>
                    <td>Wednesday, March 12<br />at Noon**</td>
                    <td>100</td>
                    <td>12</td>
                </tr>
                <tr>
                    <th colspan="5">Onsite Finals</th>
                </tr>
                <tr class="dark">
                    <td>Finals</td>
                    <td>Monday, May 12<br />at 9:00 AM***</td>
                    <td>Monday, May 12<br />at 5:00 PM***</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
            
            <table width="100%" cellpadding="0" cellspacing="0" class="stat">
                <tr>
                    <th colspan="2">Important Dates</th>
                </tr>
                <tr class="dark">
                    <td>Last day to request a visa letter</td>
                    <td>March 12, 2008 at 5:00 PM**</td>
                </tr>
                <tr class="light">
                    <td>Finalists documents due</td>
                    <td>March 26, 2008 at 5:00 PM**</td>
                </tr>
            </table>
            <br />
            
            <p>*Times listed in Eastern Standard Time (UTC/GMT -5).<br />
            **Times listed in Eastern Daylight Time (UTC/GMT -4).<br />
            ***Times listed in Pacific Daylight Time (UTC/GMT -7).</p>
            <p>In the event that a round must be cancelled for any reason, the round will start the following day at the same time.</p>

            
        </div><%-- .sub_content --%>
        
    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
