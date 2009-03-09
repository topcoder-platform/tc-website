<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>2008 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco08.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp"/>
    <script language="JavaScript" type="text/javascript" src="/js/jquery-1.2.3.pack.js"></script>
    <script language="JavaScript" type="text/javascript"><!--
    function verify() {
        var elarr = document.questForm.elements;
        for (var i=0; i<elarr.length; i++) {
            if (jQuery.trim(elarr[i].value)=='') {
                alert("Please be sure to fill in all fields.");
                return false;
            }
        }
        return true;
    }
    //-->
    </script>

</head>
<body id="page_sub">
<%ResultSetContainer info = (ResultSetContainer) ((Map) request.getAttribute("info")).get("Affidavit_Info");%>

<div id="wrapper">

    <jsp:include page="../nav.jsp">
    <jsp:param name="tabLev1" value="overview"/>
    <jsp:param name="tabLev2" value="joinus"/>
    <jsp:param name="tabLev3" value=""/>
    </jsp:include>


        <h2>Important Information Needed</h2>
            
            <div class="sub_content">
                <h3>Please read all instructions carefully before proceeding.</h3>
                
                <br />
                <h4><span class="bigRed">Travel Information - must be submitted by 5:00 PM EDT (GMT/UTC -4) on Wednesday, March 26, 2008 (we appreciate a quick response)</span></h4>
                <br />

<p>
    <strong><u>HOTEL INFORMATION:</u></strong><br />
    <a target="blank" href="http://www.mirage.com/">The Mirage</a><br />
    3400 S. Las Vegas Blvd.<br />
    Las Vegas, NV 89109<br />
    USA<br />
    702-791-7111<br />
</p>

<p>A hotel room will be confirmed for your arrival on Sunday, May 11 or Monday, May 12 and departure on Thursday, May 15 or Friday, May 16, 2008.</p>
May 11, 2008 arrivals:
<ul>
<li>Component Design Competitors</li>
<li>Studio Design Competitors</li>
<li>Marathon Competitors</li>
</ul>
May 12, 2008 arrivals:
<ul>
<li>Algorithm Competitors</li>
<li>Component Development Competitors</li>
<li>Review Board Members</li>
    <li>Digital Run winners</li>
</ul>
<p>
The check-in time is 3:00PM and check out time is 11:00AM. If you have any special requests, please indicate them on
    the travel form below. The cost of your sleeping room and applicable taxes will be charged to the TopCoder master
    account. You may be asked, however, to provide a credit card upon check-in for any incidental expenses.
    </p>
<p>
At the TCO08, all competitors (with exception of the Review Board) will be sharing a hotel room with another competitor.
    Please fill in the appropriate space with your roommate preference if you have one. We will do our best to
    accommodate your request.
</p>

<strong><u>AIRLINE INFORMATION:</u></strong>

<p>As soon as you send in this form, TopCoder will secure airline reservations based upon your registration information
    and will email a travel itinerary to you by Friday, May 2, 2008. Please be advised that once airline tickets are
    confirmed, any changes are subject to penalty fees at your own expense.</p>

<p>TopCoder will provide air travel arrangements for each competitor. The flight reserved by and paid for by TopCoder is
    for arrival on May 11 or May 12, 2008 and departure on May 15 or May 16, 2008. Unless there are extenuating
    circumstances, which DO NOT include personal holiday/vacation, flights will not be booked for dates other than those
    stated. Extended flights and/or hotel room nights are your responsibility to coordinate with airlines directly and
    TopCoder will only reimburse you the cost of a flight for the dates stated above. Please be sure to state any
    special requests below.</p>

<p>If by some unfortunate circumstance you miss your connection flight, please proceed directly to the airline desk for
    immediate resolution and to rebook your flight. Contacting TopCoder may delay your travel. </p>


<strong><u>AIRPORT TRANSPORTATION:</u></strong>

<p>

   Ambassador Limousine will provide transportation to and from the hotel and airport in Las Vegas.
    Further information on where to meet them upon your arrival at the airport will also be indicated on your agenda.</p>


<h3>Travel Form</h3>
<form name="questForm" method="post" action="https://<%=ApplicationServer.SERVER_NAME%>/tco08" onsubmit="return verify();">
<input type="hidden" name="<%=Constants.MODULE_KEY%>" value="TravelInfoSubmit"/>
<table border="0" cellspacing="3" cellpadding="0" width="100%" class="bodyText">
<%--

<tr>
    <td class="sidebarText" colspan="2"><u><strong>COMPETITOR INFORMATION:</strong></u><br /></td>
</tr>
--%>


<%--
<tr>
    <td class="sidebarText" align="right"><input type="hidden" name="q32" value="Social Security #"/>Social Security #:
    </td>
    <td class="sidebarText" align="left"><input type="text" name="a32" size="10"/></td>
    <td class="sidebarText"></td>
</tr>
--%>

<%--
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
--%>


<tr>
    <td class="sidebarText" colspan="2"><u><strong>Emergency contact:</strong></u></td>
</tr>
<tr>
    <td class="sidebarText" align="right"><input type="hidden" name="q36" value="Emergency contact Name"/>Name:</td>
    <td class="sidebarText" align="left"><input type="text" name="a36" size="40"/><br /></td>
</tr>

<tr>
    <td class="sidebarText" align="right"><input type="hidden" name="q37" value="Emergency contact Phone"/>Phone:</td>
    <td class="sidebarText" align="left"><input type="text" name="a37" size="20"/></td>
</tr>

<tr>
    <td class="sidebarText" align="right"><input type="hidden" name="q38" value="Emergency contact Relationship"/>
        Relationship:
    </td>
    <td class="sidebarText" align="left"><input type="text" name="a38" size="40"/></td>
</tr>

<tr>
    <td class="sidebarText" colspan="2"><u><strong>Media Information:</strong></u></td>
</tr>

<tr>
    <td class="sidebarText" colspan="2">
        Please list your local newspapers, radio, and television stations for your hometown.
    </td>
</tr>

<tr>
    <td class="sidebarText" align="right"><input type="hidden" name="q39" value="Newspapers"/>Newspapers:</td>
    <td class="sidebarText" align="left"><input type="text" name="a39" size="40"/></td>
</tr>

<tr>
    <td class="sidebarText" align="right"><input type="hidden" name="q40" value="Radio"/>Radio:</td>
    <td class="sidebarText" align="left"><input type="text" name="a40" size="40"/></td>
</tr>

<tr>
    <td class="sidebarText" align="right"><input type="hidden" name="q41" value="TV"/>TV:</td>
    <td class="sidebarText" align="left"><input type="text" name="a41" size="40"/></td>
</tr>

<tr>
    <td class="sidebarText" colspan="2"><u><strong>TRAVEL INFORMATION:</strong></u></td>
</tr>
<tr>
    <td class="sidebarText" align="right"><input type="hidden" name="q42" value="Departure City/Airport"/>Departure
        City/Airport:
    </td>
    <td class="sidebarText" align="left"><input type="text" name="a42" size="40"/></td>
</tr>

<tr>
    <td class="sidebarText" align="right">
        <input type="hidden" name="q44" value="May 11 or 12, 2008 - Preferred arrival time"/>
        May 11 or 12, 2008 - Preferred arrival time in Las Vegas:
    </td>
    <td class="sidebarText" align="left"><select name="a44">
        <option value="AM">AM</option>
        <option value="PM">PM</option>
    </select></td>
</tr>

<tr>
    <td class="sidebarText" align="right">
        <input type="hidden" name="q45" value="May 16, 2008 - preferred departure time"/>
        May 16, 2008 - Preferred departure time from Las Vegas:
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
    <td class="sidebarText" align="center" colspan="2">
        <textarea cols="70" rows="10" name="a49"></textarea>
    </td>
</tr>

<tr>
    <td class="sidebarText" align="center" colspan="2">
        <input type="hidden" name="q143" value="Meals Considerations"/>
        If you have any special considerations regarding meals or need special assistance, please note that here:
    </td>
</tr>
<tr>
    <td class="sidebarText" align="center" colspan="2">
        <textarea cols="70" rows="10" name="a143"></textarea>
    </td>
</tr>
<%--
<tr>
    <td class="value" align="center" colspan="2">
        <input type="hidden" name="q143" value="Meals Considerations"/>
        If you have any special considerations regarding meals or need special assistance, please note that here:
    </td>
</tr>
<tr>
    <td class="valueC" colspan="2">
        <textarea cols="70" rows="10" name="a143"></textarea>
    </td>
</tr>
--%>


<tr>
    <td class="sidebarText" colspan="2"><u><strong>Introduction Information:</strong></u></td>
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
    <td colspan="2" align="center"><span class="bigRed">
        IMPORTANT: As soon as you submit this form, your flight will be booked. Please make sure you have noted any
        special travel information in the box above pertinent to your flight.</span>
    </td>
</tr>
<tr>
    <td class="sidebarText" colspan="2" align="center"><input type="submit" name="submit" value=" Submit "/></td>
</tr>
<tr>
    <td class="sidebarText"><br /></td>
    <td class="sidebarText"><br /></td>
</tr>
<tr>
    <td class="sidebarText" colspan="2">
        <br /><br />
        <font color="#ff0000">PLEASE NOTE:</font>
        Guests are invited to attend the TCO08. However, all
        costs (hotel, travel, meals, etc.) are at the guest's own expense.
        <br /><br />
    </td>
</tr>
</table>
</form>

</div>
</div>

<jsp:include page="../footer.jsp"/>

</div>

</body>

</html>




