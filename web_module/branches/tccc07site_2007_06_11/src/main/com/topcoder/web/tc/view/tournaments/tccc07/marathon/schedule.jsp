<%@ page contentType="text/html;charset=utf-8" %> 
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
    <div id="content">

        <jsp:include page="../nav.jsp" >
        <jsp:param name="tabLev1" value="marathon"/>
        <jsp:param name="tabLev2" value="schedule"/>
        <jsp:param name="tabLev3" value=""/>
        </jsp:include>
        
        <div id="pageBodyOutside">
        <div id="pageBody">
            <div id="h1Border">&nbsp;</div>
            <h1><span>Marathon Match Competition Schedule*</span></h1>
            <div id="h1Border">&nbsp;</div>
            
            <br /><br />
            <table cellpadding="0" cellspacing="0" class="stat"> 
                <tbody> 
                    <tr> 
                        <td class="header">Registration</td> 
                        <td class="header">OPENS: Monday, July 23, 2007 9:00 AM EDT<br />CLOSES: Tuesday, August 7, 2007 5:00 PM EDT</td> 
                    </tr>
                </tbody>
            </table>
            <br /><br />

            <table cellpadding="0" cellspacing="0" class="stat"> 
                <tbody>
                    <tr>
                        <td class="title" colspan="5">Online and Onsite Schedule</td>
                    </tr>
                    <tr> 
                        <td class="header">Round of Competition</td> 
                        <td class="header">Start Date and Time*</td> 
                        <td class="header">End Date and Time*</td> 
                        <td class="header">Participants</td> 
                        <td class="header">Advancers</td>
                    </tr> 
                    <tr class="light"> 
                        <td class="value">Online Round #1</td> 
                        <td class="value">Wednesday, August 8 Noon</td> 
                        <td class="value">Wednesday,  August 15 Noon</td> 
                        <td class="value">Unlimited</td>
                        <td class="value">300</td>
                    </tr> 
                    <tr class="dark"> 
                        <td class="value">Online Round #2</td> 
                        <td class="value">Wednesday, August 22 Noon</td> 
                        <td class="value">Wednesday, August 29 Noon</td> 
                        <td class="value">up to 300</td>
                        <td class="value">100</td>
                    </tr> 
                    <tr class="light"> 
                        <td class="value">Online Round #3</td> 
                        <td class="value">Wednesday, September 5 Noon</td> 
                        <td class="value">Wednesday, September 15 Noon</td> 
                        <td class="value">up to 100</td>
                        <td class="value">8</td>
                    </tr>
                    <tr class="dark"> 
                        <td class="value">Onsite Finals</td> 
                        <td class="value">Wednesday, June 27 9:00am</td> 
                        <td class="value">Wednesday, June 27 6:00pm</td> 
                        <td class="value">8</td>
                        <td class="value">Champion</td>
                    </tr> 
                    <tr class="light">
                        <td class="value" colspan="5">*Times listed in Eastern Daylight Time (UTC/GMT -4). In the event that a round must be cancelled for any reason, the round will start the following day at the same time.</td>
                    </tr> 
                </tbody>
            </table> 
            <br /><br />
                
            <table cellpadding="0" cellspacing="0" class="stat"> 
                <tbody> 
                    <tr>
                        <td class="title" colspan="2">Important Dates</td>
                    </tr>
                    <tr> 
                        <td class="header">Important Items To Note</td> 
                        <td class="header">Date and Time (Eastern Daylight Time)</td>
                    </tr> 
                    <tr class="light"> 
                        <td class="value">Last Day to Request a Visa Letter</td> 
                        <td class="value">Monday, September 10, 2007 at 5:00 PM</td> 
                    </tr> 
                    <tr class="dark"> 
                        <td class="value">Finalist Documents Due</td> 
                        <td class="value">Friday, September 28, 2007 at 5:00 PM</td> 
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
