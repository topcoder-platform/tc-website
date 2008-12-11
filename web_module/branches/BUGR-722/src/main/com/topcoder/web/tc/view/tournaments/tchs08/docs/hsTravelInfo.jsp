<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>TopCoder High School 2008</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tchs08.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../../script.jsp"/>
</head>
<body>
<%ResultSetContainer info = (ResultSetContainer) ((Map) request.getAttribute("info")).get("Affidavit_Info");%>

<div id="wrapper">

    <jsp:include page="../nav.jsp" >
    <jsp:param name="tabLev1" value=""/>
    <jsp:param name="tabLev2" value=""/>
    <jsp:param name="tabLev3" value=""/>
    </jsp:include>
    
    <div id="main"><div id="mainwrapper">
    
        <div id="title">
            <h2>Important Information Needed</h2>
        </div><%-- #title --%>
        
        <div id="content">

<h3>Please read all instructions carefully before proceeding.</h3>


<p><strong>Travel Information - must be submitted by 5:00 PM EST (GMT/UTC -5) on
    Monday, February 18, 2008</strong>
</p>

<p>
    <b><u>ROOMING INFORMATION:</u></b><br/>
    <br/>
    Purdue University<br/>
    Union Club Hotel<br />
    101 N Grant St.
    West Lafayette, Indiana<br/>
    (765) 494-8913<br/>
</p>

<p>
   A room at the Union Club Hotel at Purdue University will be confirmed for your arrival on Friday, March 14
    and departure on Sunday, March 16, 2008. Registration will take place
    between 10:00 AM and 5:00 PM on Friday, March 14. At registration you will receive your TopCoder bag, program and name badge.
    You will receive more information about registration
    in your agenda, which TopCoder will email to you after your flight is booked. If you have any special requests, please indicate
    them on the travel form below. </p>

<p>
    <b>At the TCHS, you will be sharing a hotel room with another competitor.</b> Please
        fill in the appropriate space with your roommate preference if you have one. We will do our
        best to accommodate your request.</p>

<b><u>AIRLINE INFORMATION:</u></b>

<p>As soon as you send in this form, TopCoder will secure airline reservations based upon your registration information
    and will email a travel itinerary to you by Friday, March 7, 2008. Please be advised that once airlines tickets are
    confirmed, any changes are subject to penalty fees at your own expense.
    </p>

<p>TopCoder will provide air travel arrangements for each competitor.  The flight reserved by and paid for by TopCoder is
    for arrival on March 14, 2008 and departure on March 16, 2008. Unless there are extenuating circumstances, which DO
    NOT include personal holiday/vacation, flights will not be booked for dates other than those stated. Extended
    flights and/or hotel room nights are your responsibility to coordinate with airlines directly and TopCoder will only
    reimburse you the cost of a flight for the dates stated above. Please be sure to state any special requests below.</p>

<p>If by some unfortunate circumstance you miss your connection flight, please proceed directly to the airline desk for
    immediate resolution and to rebook your flight. Contacting TopCoder may delay your travel.</p>


<b><u>AIRPORT TRANSPORTATION:</u></b>

<p>
    TopCoder will provide transportation to and from the hotel and airport in Indiana via Hoosier Limousine.
    Hoosier Limo will be waiting for you upon arrival at the Indianapolis International Airport holding a
    TopCoder sign at baggage claim.  Hoosier Limo will also have a prearranged time to bring you back to
    the airport at your scheduled departure time.  More detailed information will be provided on your agenda.
</p>


<br clear="all" />
<h3 align="center">Travel Form</h3>

<form name="questForm" method="post" action="https://<%=ApplicationServer.SERVER_NAME%>/tchs08">
<input type="hidden" name="<%=Constants.MODULE_KEY%>" value="TravelInfoSubmit"/>

<table cellspacing="0" cellpadding="0" class="stat">
<tr class="light">
    <td class="value" colspan="2"><u><b>COMPETITOR INFORMATION:</b></u><br/></td>
</tr>


<%--
<tr class="light">
    <td class="valueR" ><input type="hidden" name="q32" value="Social Security #"/>Social Security #:
    </td>
    <td class="value"><input type="text" name="a32" size="10"/></td>
</tr>
--%>

<tr class="light">
    <td class="valueR" ><input type="hidden" name="q33" value="Date of Birth"/>Date of Birth:</td>
    <td class="value"><input type="text" name="a33" size="10"/></td>
</tr>

<%--
<tr class="light">
    <td class="valueR" ><input type="hidden" name="q34" value="Passport Number"/>Passport #:</td>
    <td class="value"><input type="text" name="a34" size="15"/></td>
</tr>
--%>

<tr class="light">
    <td class="valueR"><input type="hidden" name="q35" value="School"/>School:</td>
    <td class="value"><input type="text" name="a35" size="15"/></td>
</tr>


<tr class="light">
    <td class="value" colspan="2"><u><b>Emergency contact:</b></u></td>
</tr>
<tr class="light">
    <td class="valueR"><input type="hidden" name="q36" value="Emergency contact Name"/>Name:</td>
    <td class="value"><input type="text" name="a36" size="30"/><br/></td>
</tr>

<tr class="light">
    <td class="valueR"><input type="hidden" name="q37" value="Emergency contact Phone"/>Phone:</td>
    <td class="value"><input type="text" name="a37" size="15"/></td>
</tr>

<tr class="light">
    <td class="valueR"><input type="hidden" name="q38" value="Emergency contact Relationship"/>
        Relationship:
    </td>
    <td class="value"><input type="text" name="a38" size="30"/></td>
</tr>

<tr class="light">
    <td class="value" colspan="2"><u><b>Media Information:</b></u></td>
</tr>

<tr class="light">
    <td class="value" colspan="2">
        Please list your local newspapers, radio, and television stations for your hometown.
    </td>
</tr>

<tr class="light">
    <td class="valueR"><input type="hidden" name="q39" value="Newspapers"/>Newspapers:</td>
    <td class="value"><input type="text" name="a39" size="50"/></td>
</tr>

<tr class="light">
    <td class="valueR"><input type="hidden" name="q40" value="Radio"/>Radio:</td>
    <td class="value"><input type="text" name="a40" size="50"/></td>
</tr>

<tr class="light">
    <td class="valueR"><input type="hidden" name="q41" value="TV"/>TV:</td>
    <td class="value"><input type="text" name="a41" size="50"/></td>
</tr>

<tr class="light">
    <td class="value" colspan="2"><u><b>TRAVEL INFORMATION:</b></u></td>
</tr>
<tr class="light">
    <td class="valueR"><input type="hidden" name="q42" value="Departure City/Airport"/>Departure
        City/Airport:
    </td>
    <td class="value"><input type="text" name="a42" size="50"/></td>
</tr>


<tr>
    <td class="sidebarText" align="right">
        <input type="hidden" name="q44" value="March 14, 2008 - Preferred arrival time"/>
        March 14, 2008 - Preferred arrival time in Indiana:
    </td>
    <td class="sidebarText" align="left"><select name="a44">
        <option value="AM">AM</option>
        <option value="PM">PM</option>
    </select></td>
</tr>

<tr>
    <td class="sidebarText" align="right">
        <input type="hidden" name="q45" value="March 16, 2008 - preferred departure time"/>March 16, 2008 -
        Preferred departure time from Indiana:
    </td>
    <td class="sidebarText" align="left"><select name="a45">
        <option value="AM">AM</option>
        <option value="PM">PM</option>
    </select></td>
</tr>

<tr>
    <td class="sidebarText" align="right"><input type="hidden" name="q46" value="Seating preference"/>Seating
        preference:
    </td>
    <td class="sidebarText" align="left"><select name="a46">
        <option value="Window">Window</option>
        <option value="Aisle">
            Aisle
        </option>
    </select></td>
</tr>

<tr class="light">
    <td class="valueR"><input type="hidden" name="q48" value="Roommate preference"/>Roommate
        preference:
    </td>
    <td class="value"><input type="text" name="a48" size="20"/></td>
</tr>



<tr>
    <td class="sidebarText" align="center" colspan="2">
        <input type="hidden" name="q49" value="Personal Considerations/Special Requests"/>
        If you have special requests or questions regarding your travel, please provide them here:
    </td>
</tr>
<tr>
    <td class="sidebarText" align="center" colspan="2">
        <textarea cols="50" rows="10" name="a49"></textarea>
    </td>
</tr>

<tr class="light">
    <td class="value" align="center" colspan="2">
        <input type="hidden" name="q143" value="Meals Considerations"/>
        If you have any special considerations regarding meals or need special assistance, please note that here:
    </td>
</tr>
<tr class="light">
    <td class="valueC" colspan="2">
        <textarea cols="50" rows="10" name="a143"></textarea>
    </td>
</tr>



<tr class="light">
    <td class="value" colspan="2"><u><b>Introduction Information:</b></u></td>
</tr>

<tr class="light">
    <td class="value" colspan="2">
        In order to help us correctly pronouce your name and handle please fill in the
        questions below. If you would prefer to send a recording, you may email it
        to <a href="mailto:ntrefz@topcoder.com">Nick Trefz</a>
    </td>
</tr>

<tr class="light">
    <td class="valueR"><input type="hidden" name="q50" value="Phonetic Handle"/>Phonetic spelling of
        your handle
    </td>
    <td class="value"><input type="text" name="a50" size="50"/></td>
</tr>

<tr class="light">
    <td class="valueR"><input type="hidden" name="q51" value="Phonetic Name"/>Phonetic spelling of
        your full name
    </td>
    <td class="value"><input type="text" name="a51" size="50"/></td>
</tr>

<tr>
    <td class="bigRed" colspan="2" align="center">
        IMPORTANT: As soon as you submit this form, your flight will be booked. Please make sure you have noted any
        special travel information in the box above pertinent to your flight.
    </td>
</tr>


<tr class="light">
    <td class="valueC" colspan="2"><input type="submit" name="submit" value=" Submit "/></td>
</tr>
<tr class="light">
    <td class="value"><br/></td>
    <td class="value"><br/></td>
</tr>
<tr class="light">
    <td class="value" colspan="2">
        <br/><br/>
        <span class="bigRed">PLEASE NOTE:</span>
        Guests are invited to attend the TCHS08. However, all costs (hotel, travel, meals, etc.) are at
        the guest's own expense.
        <br/><br/>
    </td>
</tr>
</table>
</form>

        </div><%-- #content --%>
        
        <jsp:include page="../footer.jsp" />

        </div></div>


</div><%-- #wrapper --%>

</body>
</html>