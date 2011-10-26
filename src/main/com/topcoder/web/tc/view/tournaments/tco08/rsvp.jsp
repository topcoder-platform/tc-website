<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>2008 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../../script.jsp" />

<style type="text/css">
html{ 
margin:0px;
padding:0px;
font-family: Arial, Verdana, Helvetica, sans-serif;
}

body{ 
font-family: Arial, Verdana, Helvetica, sans-serif;
line-height: normal;
font-size: 12px;
color: #ffffff;
background: #000000;
margin:0px;
padding:0px;
}

img{
border: none;
display: block;
}

h1{
font-style: italic;
font-size: 125%;
}

p{
padding: 0px;
margin: 0px 0px 10px 0px;
width:65%;
text-align:justify;
}

td, th{ 
line-height: normal;
font-size: 12px;
}

#contentOut{
width: 700px;
margin: 0;
background: transparent url(/i/tournament/tco08/rsvpBGStretch.png) top center repeat-y;
border-top: 1px solid black;
}

#contentIn{
background: transparent url(/i/tournament/tco08/rsvpBG.jpg) top center no-repeat;
border-top: 1px solid black;
padding: 40px 10px;
}

#contentBottom{
 font-size: 1px;
 height: 10px;
 margin-bottom: 20px;
 background: transparent url(/i/tournament/tco08/rsvpBGBottom.png) bottom center no-repeat;
}

span.bigRed{ color: #ff0000; font-weight: bold; text-decoration: none; }

a:link, a:visited {
    text-decoration: none;
    color: #ac1414;
}

a:hover, a:active {
    text-decoration: underline;
    color: #FFF;
}

table {
    text-align:left;
}
</style>

</head>
<body>


<div align="center" style="background: transparent;">
    <div id="contentOut">
        <div id="contentIn">

            <div align="center" style="margin: 20px;">
                <a target="_blank" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=about"><img src="/i/tournament/tco08/rsvpBanner.png" alt="2008 TopCoder Open" /></a>
            </div>

    <p><strong>This event is jam packed with four competitions:  Algorithm, Component Design &amp; Development, Marathon and Studio Design.  Don't miss the finals LIVE, beginning on Tuesday!</strong></p>
    <p><strong>TopCoder is also providing informative and thought provoking Developer and Corporate Forums.  Learn more about TopCoder and software development at these forums as well as interact with some of the best minds in the business.</strong></p>
    
    <h1><strong>The Corporate Forums include speakers:</strong></h1>
    <p><em>*Nic Perez</em>, Technical Director of Competitive Software Development, AOL&reg;<br />
    <em>*Grady Bryant</em>, Vice President of Research &amp; Development, VeriSign&reg;<br />
    <em>*Ron Burkhart</em>, CFO, On Point Technology</p>
    
    <h1><strong>Topics for the Developer Forums include:</strong></h1>
    <p><em>*Quality through Review</em><br />
    A Walk-through of the review mechanism, ensuring our building of the highest quality components with Sean Campion, TopCoder Project Manager</p>
    <p><em>*From Assembly to Architecture</em><br />
    Explore the process of creating architectural designs through our new Architecture Competitions with Greg Eldridge, TopCoder Architect</p>
    <p><em>*TopCoder Direct and Cockpit and Widget Innerworkings</em><br />
    We'll discuss a new evolution of TopCoder which will bring vast new opportunities for communication, collaboration and compensation to the community.  The second part of this will be a workshop to build your own widget, or write up the specifications for a new widget and/or service for TopCoder to build for you.</p>
    
    <h1><span class="bigRed">See a complete and detailed schedule <a target="_blank" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=rsvpSchedule">here</a>.</span></h1>
    
    <h1><strong>*Don't miss Jack Hughes, Chairman of TopCoder as our<br />Keynote Speaker on Thursday afternoon!</strong></h1>
    
    <h1><strong>Sit in our roundtable discussion:</strong></h1>
    <p><strong>TopCoder 101</strong>: An introduction to our model and process.  Any questions about what we do or who we are?  TopCoder staff will be there to answer all your questions.</p>
    <%--
    <p><strong>Business Transformation and TopCoder Return on Investment</strong>:  Lead by Dan Houlihan, TopCoder Sr. Vice President of Financial Services and Brian Wyatt, TopCoder Vice President of Business Development. A review of how TopCoder's innovative approach to application development can improve overall business performance and the business value of IT. This session will cover the dimensions of value of an enterprise Virtual Development Center (VDC), the multi-phased transformation process and a sample commercial business case and ROI model.</p>
    --%>
    
    <h1><strong>Start off the event with us at a Welcome Reception at<br /><a target="_blank" href="<tc-webtag:linkTracking link='http://www.hofbrauhauslasvegas.com/' refer='tco08_rsvp' />">Hofbrauhaus Las Vegas</a>.</strong></h1>
    
    <h1><strong>TopCoder will also host a TopCoder Casino Night<br />Cocktail Party at the event.</strong><br />
    The money isn't real, but the thrill is!</h1>
    
                <div style="margin: 20px 0px 20px 0px;">
                    <%--<img src="/i/tournament/tco08/rsvp/events.png" alt="" />--%>
                </div>
                
                <div>
                    <%--<a href="/tco0"><img src="/i/tournament/tco08/rsvp/schedule.png" alt="" /></a>--%>
                </div>
<%--
    <p>Rooms are available at The Mirage for all attendees.  Click <a target="_blank" href="<tc-webtag:linkTracking link='https://reservations.mgmmirage.com/bookingengine.aspx?host=group&pid=160&code=topcod08' refer='tco08_rsvp' />">here</a> to book a room.
    <br />--%><p>Contact Jessie D'Amato Ford for questions.
    <br />Phone:  866-TOP-CODE   Email:  <a href="mailto:jford@topcoder.com">jford@topcoder.com</a></p>
    
                <div style="margin: 20px 0px 20px 0px;">
                    <%--<img src="/i/tournament/tco08/rsvp/line.png" alt="" />--%>
                </div>
    
                <div style="margin: 20px 0px 20px 0px;">
                    <%--<img src="/i/tournament/tco08/rsvp/topics.png" alt="" />--%>
                </div>
    
    <p>Please note that the fees associated with travel and accommodations are the responsibility of the attendee.</p>
    
                <div style="margin: 20px 0px 20px 0px;">
                    <img src="/i/tournament/tco08/rsvpBar.png" alt="" />
                </div>
    
                <div style="margin: 0px 0px 10px 0px;">
                    <img src="/i/tournament/tco08/rsvpRequest.png" alt="" />
                </div>
    
                <form name="submitRsvp" method="post" action="/tco08">
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="SubmitRsvp"/>
    
                <table cellpadding="4" cellspacing="0">
                <tbody>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <input name="attending" value="" type="radio" checked="checked" /> I will be attending
                            <br />
                            <input name="attending" value="not " type="radio" /> I will not be attending
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Your Name:
                        </td>
                        <td>
                            <input type="text" size="30" name="name" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Your Email:
                        </td>
                        <td>
                            <input type="text" size="30" name="email" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Company:
                        </td>
                        <td>
                            <input type="text" size="30" name="company" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Guests:
                        </td>
                        <td>
                            <input type="text" size="30" name="guests" />
                        </td>
                    </tr>
                </tbody>
                </table>
    
                <button name="submit" value="submit" type="submit" class="button">Send</button>
                    
                </form>
    
        </div>

        <div id="contentBottom">&nbsp;</div>

    </div>
</div>


</body>

</html>
