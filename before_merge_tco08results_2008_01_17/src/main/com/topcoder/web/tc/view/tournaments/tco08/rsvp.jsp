<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../../script.jsp" />

<style TYPE="text/css">
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

a:link, a:visited {
    text-decoration: none;
    color: #ac1414;
}

a:hover, a:active {
    text-decoration: underline;
    color: #FFF;
}
</style>

</head>
<body>


<div align="center" style="background: transparent;">
    <div id="contentOut">
        <div id="contentIn">

            <div align="center" style="margin: 20px;">
                <img src="/i/tournament/tco08/rsvpBanner.png" alt="2008 TopCoder Open" />
            </div>
 
    <p>
    We invite you to attend the TCO07 to marvel at the four competition tracks of<br>Algorithm, Component Design &amp; Development, Marathon Match and Studio Design,<br>and participate in educational Developer Forums and Customer Round Table.
    </p>
    <p>
    Please also join us for the TopCoder Casino Night Cocktail Party.
    </p>
    
                <div style="margin: 20px 0px 20px 0px;">
                    <%--<img src="/i/tournament/tco07/rsvp/events.png" alt="" />--%>
                </div>
                
                <div>
                    <%--<A href="/tco07"><img src="/i/tournament/tco07/rsvp/schedule.png" alt="" /></A>--%>
                </div>
    <p>
    Rooms are available at The Mirage for all attendees, please mention TopCoder.
    <br>Contact Jessie D'Amato Ford for additional questions.
    <br>Phone:  866-TOP-CODE   Email:  <A href="mailto:jford@topcoder.com">jford@topcoder.com</A>
    </p>
    
                <div style="margin: 20px 0px 20px 0px;">
                    <%--<img src="/i/tournament/tco07/rsvp/line.png" alt="" />--%>
                </div>
    
                <div style="margin: 20px 0px 20px 0px;">
                    <%--<img src="/i/tournament/tco07/rsvp/topics.png" alt="" />--%>
                </div>
    
    <h1>
    1:00 PM - 2:00 PM<br>Protecting System Information Utilizing<br>
    TopCoder's Software Methodology
    </h1>
    
    <p>
    Presented by TopCoder Direct
    </p>
    
    <h1>
    2:00 PM - 3:00 PM<br>Talent, Skills and the Global Economy
    </h1>
    
    <p>
    Featuring TopCoder Founder<br>
    Jack Hughes
    </p>
    
    <h1>
    3:00 PM - 4:00 PM<br>Social Networking
    </h1>
    
    <p>
    Featuring Marcien Jenckes<br>
    Senior Vice President of Messaging and Social Media, AOL
    </p>
    
    <h1>
    4:00 PM - 5:00 PM<br>Virtual Workforce
    </h1>
    
    <p>
    Featuring Grady Bryant<br>
    Vice President of Research &amp; Development, VeriSign
    </p>
    
    <h1>
    5:00 PM - 6:00 PM<br>Evolving Business Systems from<br>
    Spreadsheets to Enterprise Software
    </h1>
    
    <p>
    Featuring Hugh Scott<br>
    Vice President, Direct Energy
    </p>
    
    <h1>
    Special Guest
    </h1>
    
    <p>
    Polly LaBarre, co-author of Mavericks at  Work
    </p>
    
    <p>
    Don't forget to join us after the Customer Round Table<br>
    for the TopCoder Casino Night Party!
    </p>
    
                <div style="margin: 20px 0px 20px 0px;">
                    <img src="/i/tournament/tco08/rsvpBar.png" alt="" />
                </div>
    
                <div style="margin: 0px 0px 10px 0px;">
                    <img src="/i/tournament/tco08/rsvpRequest.png" alt="" />
                </div>
    
                <form name="submitRsvp" method="post" action="/tc">
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="TCO07SubmitRsvp"/>
    
                <table cellpadding="4" cellspacing="0">
                <tbody>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <input name="attending" value="" type="radio" checked> I will be attending
                            <br>
                            <input name="attending" value="not " type="radio"> I will not be attending
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Your Name:
                        </td>
                        <td>
                            <input type="text" size="30" name="name">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Your Email:
                        </td>
                        <td>
                            <input type="text" size="30" name="email">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Company:
                        </td>
                        <td>
                            <input type="text" size="30" name="company">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Guests:
                        </td>
                        <td>
                            <input type="text" size="30" name="guests">
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
