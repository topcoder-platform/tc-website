<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.tc.Constants" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder High School 2007</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tchs07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../../script.jsp"/>
</head>
<body>
<%ResultSetContainer info = (ResultSetContainer) ((Map) request.getAttribute("info")).get("Affidavit_Info");%>

<div align="center" style="background: transparent;">
<div class="content">
<img src="/i/tournament/tchs07/contentN.png" alt="contentN" style="display: block;"/>

<jsp:include page="../links.jsp">
    <jsp:param name="tabLev1" value=""/>
    <jsp:param name="tabLev2" value=""/>
    <jsp:param name="tabLev3" value=""/>
</jsp:include>

<div class="contentSpacer">
<h2>Important Information Needed</h2>

<h3>Please read all instructions carefully before proceeding.</h3>


<strong>Travel Information - must be submitted by 5:00 PM EDT (GMT/UTC -4) on
    Wednesday, April 25, 2007</strong>

<p>
    <B><U>ROOMING INFORMATION:</U></B><br/>
    <br/>
    Purdue University<br/>
    West Lafayette, Indiana<br/>
    (765) 494-4600<br/>
</p>

<p>
   A room at the University will be confirmed for your arrival on May 18 and departure on May 20, 2007. In
    order to receive your rooming assignment, please register upon arrival. Registration will take place
    between 8:00 AM and 6:00 PM on Friday, May 18. You will receive more information about registration
    in your agenda, which TopCoder will email to you. If you have any special requests, please indicate
    them on the travel form below. </p>

<p>
    <b>At the TCHS, you will be sharing a hotel room with another competitor or with your team.</b> Please
        fill in the appropriate space with your roommate preference if you have one. We will do our
        best to accommodate your request.</p>


<B><U>AIRPORT TRANSPORTATION:</U></B>

<p>
    TopCoder will provide transportation to and from the hotel and airport in Indiana. We will email you
    a voucher for a round-trip ticket for the Lafayette Limo shuttle that will pick you up from the
    Indianapolis airport and drop you off at the registration desk at Purdue University.  Upon returning to
    the airport, Lafayette Limo will provide you with a schedule of times for pick ups to coincide
    with your flight departures.
</p>


<h3 align="center">Travel Form</h3>

<form name="questForm" method="POST" action="${sessionInfo.secureAbsoluteServletPath}">
<input type="hidden" name="<%=Constants.MODULE_KEY%>" value="TCHS07TravelInfoSubmit"/>

<table cellspacing="0" cellpadding="0" class="stat">
<tr class="light">
    <td class="value" colspan="2"><U><B>COMPETITOR INFORMATION:</B></U><br/></td>
</tr>


<%--
<tr class="light">
    <td class="valueR" ><input type="hidden" name="q32" value="Social Security #"/>Social Security #:
    </td>
    <td class="value"><input type="text" name="a32" size="10"/></td>
</tr>
--%>

<!--<tr class="light">
    <td class="valueR" ><input type="hidden" name="q33" value="Date of Birth"/>Date of Birth:</td>
    <td class="value"><input type="text" name="a33" size="10"/></td>
</tr>-->

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
    <td class="value" colspan="2"><U><B>Emergency contact:</B></U></td>
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
    <td class="value" colspan="2"><U><B>Media Information:</B></U></td>
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
    <td class="value" colspan="2"><U><B>TRAVEL INFORMATION:</B></U></td>
</tr>
<tr class="light">
    <td class="valueR"><input type="hidden" name="q42" value="Departure City/Airport"/>Departure
        City/Airport:
    </td>
    <td class="value"><input type="text" name="a42" size="50"/></td>
</tr>

<tr class="light">
    <td class="valueR">
        <input type="hidden" name="q137" value="Arrival Airline and Flight #"/>
        Arrival Airline and Flight #:
    </td>
    <td class="value"><input type="text" name="a137" size="50"/></td>
</tr>
<tr class="light">
    <td class="valueR">
        <input type="hidden" name="q138" value="Arrival Date"/>
        Arrival Date:
    </td>
    <td class="value"><input type="text" name="a138" size="50"/></td>
</tr>
<tr class="light">
    <td class="valueR">
        <input type="hidden" name="q139" value="Arrival Time"/>
        Arrival Time:
    </td>
    <td class="value"><input type="text" name="a139" size="50"/></td>
</tr>
<tr class="light">
    <td class="valueR">
        <input type="hidden" name="q140" value="Departing Airline and Flight #"/>
        Departing Airline and Flight #:
    </td>
    <td class="value"><input type="text" name="a140" size="50"/></td>
</tr>
<tr class="light">
    <td class="valueR">
        <input type="hidden" name="q141" value="Departing Date"/>
        Departing Date:
    </td>
    <td class="value"><input type="text" name="a141" size="50"/></td>
</tr>
<tr class="light">
    <td class="valueR">
        <input type="hidden" name="q142" value="Departure Time"/>
        Departure Time:
    </td>
    <td class="value"><input type="text" name="a142" size="50"/></td>
</tr>

<tr class="light">
    <td class="valueR"><input type="hidden" name="q48" value="Roommate preference"/>Roommate
        preference:
    </td>
    <td class="value"><input type="text" name="a48" size="20"/></td>
</tr>


<tr class="light">
    <td class="value" align="center" colspan="2">
        <input type="hidden" name="q49" value="Personal Considerations"/>
        If you have special considerations, please provide them here:
    </td>
</tr>
<tr class="light">
    <td class="valueC" colspan="2">
        <textarea cols="60" rows="10" name="a49"></textarea>
    </td>
</tr>

<tr class="light">
    <td class="value" colspan="2"><U><B>Introduction Information:</B></U></td>
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
        Guests are invited to attend the TCHS. However, all costs (hotel, travel, meals, etc.) are at
        the guest's own expense.
        <br/><br/>
    </td>
</tr>
</table>
</form>

</div>
<div class="footer">
    Copyright &#169; 2000-2007, TopCoder, Inc. All rights reserved.
</div>
<img src="/i/tournament/tchs07/contentS.png" alt="contentS" style="display: block;"/>
</div>
</div>

</body>
</html>

