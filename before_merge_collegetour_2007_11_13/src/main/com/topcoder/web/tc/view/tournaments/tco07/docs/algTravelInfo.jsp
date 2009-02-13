<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp"/>
</head>
<body>
<%ResultSetContainer info = (ResultSetContainer) ((Map) request.getAttribute("info")).get("Affidavit_Info");%>

<div align="center" style="background: transparent;">
<div id="content">

<jsp:include page="../header.jsp"/>

<table cellpadding="0" cellspacing="0" id="spacer">
<tbody>
<tr>
<td id="navSpacer">

    <jsp:include page="../nav.jsp">
        <jsp:param name="tabLev1" value="overview"/>
        <jsp:param name="tabLev2" value="joinus"/>
        <jsp:param name="tabLev3" value=""/>
    </jsp:include>

</td>
<td id="bodySpacer" width="100%">
<div id="pageBody">


<h1><span>Important Information Needed</span></h1>
<h2>Please read all instructions carefully before proceeding.</h2>


<h2>Travel Information - must be submitted by 5:00 PM EDT (GMT/UTC -4) on on Friday, May 11,
    2007 (we appreciate a quick response)</h2>

<p>
    <B><U>HOTEL INFORMATION:</U></B><br/>
    <br/>
    <a href="http://www.mirage.com/" target="blank">The Mirage</a><br/>
    3400 S. Las Vegas Blvd.<br/>
    Las Vegas, NV 89109<br/>
    800-374-9000<br/>
</p>

<p>
    A hotel room will be confirmed for your arrival on June 26 and departure on June 30, 2007.
    The check-in time is 3:00PM and check out time is 12:00PM (noon). If you have any special requests,
    please indicate them on the travel form below. The cost of your sleeping room and applicable taxes
    will be charged to the TopCoder master account. You will be required, however, to provide a
    credit card upon check-in for any incidental expenses. </p>

<p>
    <b>At the TCO07, you will be sharing a hotel room with another competitor.</b> Please fill in the
    appropriate space with your roommate preference if you have one. We will do our best to
    accommodate your request.</p>

<B><U>AIRLINE INFORMATION:</U></B>

<p>
    As soon as you send in this form, TopCoder will secure airline reservations based upon your registration
    information and will email a travel itinerary to you by Wednesday, June 20, 2007. Please be advised that
    once airlines tickets are confirmed, any changes are subject to penalty fees at your own expense. TopCoder
    will provide air travel arrangements for each competitor. The flight reserved by and paid for by TopCoder
    is for arrival on June 26, 2007 and departure on June 30, 2007 (or Sunday, July 1, 2007 if ticket cost is
    significantly less due to a Saturday night stay). Unless there are extenuating circumstances, which DO NOT
    include personal holiday/vacation, flights will not be booked for dates other than those stated. Extended
    flights and/or hotel room nights are your responsibility to coordinate with Globe Travel directly and TopCoder
    will only reimburse you the cost of a flight for the dates stated above. Please be sure to state any
    requests below for Globe Travel.
</p>
<B><U>AIRPORT TRANSPORTATION:</U></B>

<p>

    TopCoder will provide transportation to and from the hotel and airport in Las Vegas. Further information on
    where to board upon your arrival at the airport will be indicated on your agenda.</p>


<h2 align="center">Travel Form</h2>
<form name="questForm" method="POST" action="${sessionInfo.secureAbsoluteServletPath}">
<input type="hidden" name="<%=Constants.MODULE_KEY%>" value="TCO07TravelInfoSubmit"/>
<table border="0" cellspacing="3" cellpadding="0" width="100%" class="bodyText">
<tr>
    <td class="sidebarText" colspan="2"><U><B>COMPETITOR INFORMATION:</B></U><br/></td>
</tr>


<%--
<tr>
    <td class="sidebarText" align="right"><input type="hidden" name="q32" value="Social Security #"/>Social Security #:
    </td>
    <td class="sidebarText" align="left"><input type="text" name="a32" size="10"/></td>
    <td class="sidebarText"></td>
</tr>
--%>

<tr>
    <td class="sidebarText" align="right"><input type="hidden" name="q33" value="Date of Birth"/>Date of Birth:</td>
    <td class="sidebarText" align="left"><input type="text" name="a33" size="10"/></td>
    <td class="sidebarText"></td>
</tr>

<tr>
    <td class="sidebarText" align="right"><input type="hidden" name="q34" value="Passport Number"/>Passport #:</td>
    <td class="sidebarText" align="left"><input type="text" name="a34" size="15"/></td>
</tr>

<tr>
    <td class="sidebarText" align="right"><input type="hidden" name="q35" value="School"/>School:</td>
    <td class="sidebarText" align="left"><input type="text" name="a35" size="15"/></td>
</tr>


<tr>
    <td class="sidebarText" colspan="2"><U><B>Emergency contact:</B></U></td>
</tr>
<tr>
    <td class="sidebarText" align="right"><input type="hidden" name="q36" value="Emergency contact Name"/>Name:</td>
    <td class="sidebarText" align="left"><input type="text" name="a36" size="30"/><br/></td>
</tr>

<tr>
    <td class="sidebarText" align="right"><input type="hidden" name="q37" value="Emergency contact Phone"/>Phone:</td>
    <td class="sidebarText" align="left"><input type="text" name="a37" size="15"/></td>
</tr>

<tr>
    <td class="sidebarText" align="right"><input type="hidden" name="q38" value="Emergency contact Relationship"/>
        Relationship:
    </td>
    <td class="sidebarText" align="left"><input type="text" name="a38" size="30"/></td>
</tr>

<tr>
    <td class="sidebarText" colspan="2"><U><B>Media Information:</B></U></td>
</tr>

<tr>
    <td class="sidebarText" colspan="2">
        Please list your local newspapers, radio, and television stations for your hometown.
    </td>
</tr>

<tr>
    <td class="sidebarText" align="right"><input type="hidden" name="q39" value="Newspapers"/>Newspapers:</td>
    <td class="sidebarText" align="left"><input type="text" name="a39" size="50"/></td>
</tr>

<tr>
    <td class="sidebarText" align="right"><input type="hidden" name="q40" value="Radio"/>Radio:</td>
    <td class="sidebarText" align="left"><input type="text" name="a40" size="50"/></td>
</tr>

<tr>
    <td class="sidebarText" align="right"><input type="hidden" name="q41" value="TV"/>TV:</td>
    <td class="sidebarText" align="left"><input type="text" name="a41" size="50"/></td>
</tr>

<tr>
    <td class="sidebarText" colspan="2"><U><B>TRAVEL INFORMATION:</B></U></td>
</tr>
<tr>
    <td class="sidebarText" align="right"><input type="hidden" name="q42" value="Departure City/Airport"/>Departure
        City/Airport:
    </td>
    <td class="sidebarText" align="left"><input type="text" name="a42" size="50"/></td>
</tr>

<tr>
    <td class="sidebarText" align="right">
        <input type="hidden" name="q44" value="June 26, 2007 - Preferred arrival time"/>
        June 26, 2007 - Preferred arrival time in Las Vegas:
    </td>
    <td class="sidebarText" align="left"><select name="a44">
        <option value="AM">AM</option>
        <option value="PM">PM</option>
    </select></td>
</tr>

<tr>
    <td class="sidebarText" align="right">
        <input type="hidden" name="q45" value="June 30, 2007 - preferred departure time"/>June 30, 2007 -
        Preferred departure time from Las Vegas:
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

<%--
<tr>
    <td class="sidebarText" align="right"><input type="hidden" name="q47" value="Preference for your hotel room"/>
        Preference for your hotel room :</td>
    <td class="sidebarText" align="left"><select name="a47"><option value="Smoking">Smoking</option>
        <option value="Non Smoking">Non Smoking</option></select></td>
</tr>
--%>

<tr>
    <td class="sidebarText" align="right"><input type="hidden" name="q48" value="Roommate preference"/>Roommate
        preference:
    </td>
    <td class="sidebarText" align="left"><input type="text" name="a48" size="20"/></td>
</tr>


<tr>
    <td class="sidebarText" align="center" colspan="2">
        <input type="hidden" name="q49" value="Personal Considerations/Special Requests"/>
        If you have special requests or questions regarding your travel, please provide them here:
    </td>
</tr>
<tr>
    <td class="sidebarText" align="right" colspan="2">
        <textarea cols="80" rows="10" name="a49"></textarea>
    </td>
</tr>

<tr>
    <td class="sidebarText" colspan="2"><U><B>Introduction Information:</B></U></td>
</tr>

<tr>
    <td class="sidebarText" colspan="2">
        In order to help us correctly pronounce your name and handle please fill in the
        information below. If you would prefer to send a recording, you may email it
        to <a href="mailto:ntrefz@topcoder.com">Nick Trefz</a>
    </td>
</tr>

<tr>
    <td class="sidebarText" align="right"><input type="hidden" name="q50" value="Phonetic Handle"/>Phonetic spelling of
        your handle
    </td>
    <td class="sidebarText" align="left"><input type="text" name="a50" size="50"/></td>
</tr>

<tr>
    <td class="sidebarText" align="right"><input type="hidden" name="q51" value="Phonetic Name"/>Phonetic spelling of
        your full name
    </td>
    <td class="sidebarText" align="left"><input type="text" name="a51" size="50"/></td>
</tr>

<tr>
    <td class="bigRed" colspan="2" align="center">
        IMPORTANT: As soon as you submit this form, your flight will be booked. Please make sure you have noted any
        special travel information in the box above pertinent to your flight.
    </td>
</tr>
<tr>
    <td class="sidebarText" colspan="2" ALIGN="center"><input type="submit" name="submit" value=" Submit "/></td>
</tr>
<tr>
    <td class="sidebarText"><br/></td>
    <td class="sidebarText"><br/></td>
</tr>
<tr>
    <td class="sidebarText" colspan="2">
        <br/><br/>
        <font color="#ff0000">PLEASE NOTE:</font>
        Guests are invited to attend the TCO07. However, all
        costs (hotel, travel, meals, etc.) are at the guest's own expense.
        <br/><br/>
    </td>
</tr>
</table>
</form>

</div>
</td>
</tr>
</tbody>
</table>


<jsp:include page="../footer.jsp"/>
</div>
</div>

</body>

</html>




