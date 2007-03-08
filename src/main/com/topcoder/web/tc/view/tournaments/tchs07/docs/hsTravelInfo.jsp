<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder High School - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tchs07.css"/>
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
        <jsp:param name="tabLev1" value="algorithm"/>
        <jsp:param name="tabLev2" value="description"/>
        <jsp:param name="tabLev3" value=""/>
    </jsp:include>

</td>
<td id="bodySpacer" width="100%">
<div id="pageBody">


<h1>
    <div>Important Information Needed</div>
</h1>
<h2>Please read all instructions carefully before proceeding.</h2>


<h2>Travel Information - must be submitted by 5:00 PM EDT (GMT/UTC -4) on
    Wednesday, April 25, 2007 (we appreciate a quick response)</h2>

<p>
    <B><U>ROOMING INFORMATION:</U></B><br/>
    <br/>
    Purdue University<br />
    West Lafayette, Indiana<br />
    (765) 494-4600<br />
</p>

<p>
    A room at the University will be confirmed for your arrival on May 18 and departure on
    May 20, 2007. In order to receive your rooming assignment, please register upon arrival.
    Registration is 8:00AM and 6:00PM.  You will receive more information about registration
    in your agenda.   If you have any special requests, please indicate them on the travel form below. </p>

<p>
    <b><b>At the TCHS, you will be sharing a hotel room with another competitor or with your team.</b> Please 
        fill in the appropriate space with your roommate preference if you have one. We will do our
        best to accommodate your request</p>


<B><U>AIRPORT TRANSPORTATION:</U></B>

<p>

    TopCoder will provide transportation to and from the hotel and airport in Indiana. We will email
    you a voucher for a round-trip ticket for the Lafayette Limo shuttle that will drop you off at
    the registration desk.</p>


<div align="center"><span class="bigTitle">Travel Form</span></div>
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

<%--
<tr>
    <td class="sidebarText" align="right"><input type="hidden" name="q34" value="Passport Number"/>Passport #:</td>
    <td class="sidebarText" align="left"><input type="text" name="a34" size="15"/></td>
</tr>
--%>

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
        Please list your local newspapers, radio, and television stations for both hometown and college locations.
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
        <input type="hidden" name="q137" value="Arrival Airline and Flight #"/>
        Arrival Airline and Flight #:
    </td>
    <td class="sidebarText" align="left"><input type="text" name="a137" size="50"/></td>
</tr>
<tr>
    <td class="sidebarText" align="right">
        <input type="hidden" name="q138" value="Arrival Date"/>
        Arrival Date:
    </td>
    <td class="sidebarText" align="left"><input type="text" name="a138" size="50"/></td>
</tr>
<tr>
    <td class="sidebarText" align="right">
        <input type="hidden" name="q139" value="Arrival Time"/>
        Arrival Time:
    </td>
    <td class="sidebarText" align="left"><input type="text" name="a139" size="50"/></td>
</tr>
<tr>
    <td class="sidebarText" align="right">
        <input type="hidden" name="q140" value="Departing Airline and Flight #"/>
        Departing Airline and Flight #:
    </td>
    <td class="sidebarText" align="left"><input type="text" name="a140" size="50"/></td>
</tr>
<tr>
    <td class="sidebarText" align="right">
        <input type="hidden" name="q141" value="Departing Date"/>
        Departing Date:
    </td>
    <td class="sidebarText" align="left"><input type="text" name="a141" size="50"/></td>
</tr>
<tr>
    <td class="sidebarText" align="right">
        <input type="hidden" name="q142" value="Departure Time"/>
        Departure Time:
    </td>
    <td class="sidebarText" align="left"><input type="text" name="a142" size="50"/></td>
</tr>

<tr>
    <td class="sidebarText" align="right"><input type="hidden" name="q48" value="Roommate preference"/>Roommate
        preference:
    </td>
    <td class="sidebarText" align="left"><input type="text" name="a48" size="20"/></td>
</tr>


<tr>
    <td class="sidebarText" align="center" colspan="2">
        <input type="hidden" name="q49" value="Personal Considerations"/>
        If you have special considerations, please provide them here:
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
        In order to help us correctly pronouce your name and handle please fill in the
        questions below. If you would prefer to send a recording, you may email it
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
Guests are invited to attend the TCHS. However, all costs (hotel, travel, meals, etc.) are at
        the guest's own expense.
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




