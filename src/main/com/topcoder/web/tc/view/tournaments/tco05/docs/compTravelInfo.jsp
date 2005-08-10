<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map,
                 com.topcoder.web.tc.Constants"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
</head>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<body>

<!-- Tab barlinks-->
<jsp:include page="../links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="details"/>
<jsp:param name="tabLev3" value=""/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>

        <p class=bigTitle>Important Information Needed</p>
        <span class=bodySubtitle>Please read all instructions carefully before proceeding.</span><br/>



        <h2>Travel Information - must be submitted by 9:00 PM EDT (GMT -4) on Wednesday, September 7, 2005</h2>
        <p>
        <B><U>HOTEL INFORMATION:</U></B><br />
        <br />
          Santa Clara Marriott<br />
          2700 Mission College Boulevard<br />
          Santa Clara, CA 95054<br />
          Phone: (408) 988-1500<br />
          <a target="_blank" href="http://www.santaclaramarriott.com">www.santaclaramarriott.com</a><br />

            <p>
                A hotel room will be confirmed for your arrival on October 11th and departure on October 15th.
                The check-in time is 3:00PM and check out time is 11:00AM. If you have any special requests, please
                indicate them on the travel form below. The cost of your sleeping room and applicable taxes will be
                charged to the TopCoder master account. You will be required, however, to provide a credit card upon
                check-in for any incidental expenses.
            </p>

            <p>
                <b>At the TCO05, you will be sharing a hotel room with another competitor.</b>  Please fill in the
                appropriate space with your roommate preference if you have one.  We will do our best to accommodate your request.
            </p>

        <B><U>AIRLINE INFORMATION:</U></B>
        <p>
            TopCoder will secure airline reservations based upon your registration information and will email
            a travel itinerary to you by Friday, October 7th. Please be advised that once airlines tickets are
            confirmed, any changes are subject to penalty fees at your own expense.  TopCoder will provide
            flight arrangements for each competitor up to a cost of $1,000 per person.  If your airfare is
            greater than $1,000, the difference between the cost of the airfare and $1,000 will be deducted from
            your total TCO prize money won.  If your total TCO prize money is not sufficient to cover the
            additional costs, your will be responsible for remitting to TopCoder the remainder of the cost.
        </p>
        <B><U>AIRPORT TRANSPORTATION:</U></B>
        <p>
            TopCoder will provide transportation to and from the airport and hotel. Further information on where
            to board upon your arrival at the airport will be indicated on your itinerary.
            </p>


        <table border="0" cellspacing="3" cellpadding="0" width="100%" class="bodyText">
    <form name="questForm" method="POST" action="<jsp:getProperty name="sessionInfo" property="ServletPath"/>">
        <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="TCO05TravelInfoSubmit"/>
            <tr><td colspan="2"><H1 align="center">Travel Form</H1></td></tr>
            <tr><td colspan="2"><U><B>COMPETITOR INFORMATION:</B></U><br /></td></tr>


            <tr>
              <td align="right"><input type="hidden" name="q32" value="Social Security #"/>Social Security #: </td>
              <td align="left"><input type="text" name="a32" size="10"/></td>
                <td></td>
            </tr>

            <tr>
              <td align="right"><input type="hidden" name="q33" value="Date of Birth"/>Date of Birth: </td>
              <td align="left"><input type="text" name="a33" size="10"/></td>
                <td></td>
            </tr>

        <tr>
          <td align="right"><input type="hidden" name="q34" value="Passport Number"/>Passport #:</td>
          <td align="left"><input type="text" name="a34" size="15"/></td>
        </tr>

            <tr>
              <td align="right"><input type="hidden" name="q35" value="School"/>School:</td>
              <td align="left"><input type="text" name="a35" size="15"/></td>
            </tr>


            <tr><td colspan="2"><U><B>Emergency contact:</B></U></td></tr>
            <tr>
              <td align="right"><input type="hidden" name="q36" value="Emergency contact Name"/>Name:</td>
              <td align="left"><input type="text" name="a36" size="30"/><br /></td>
            </tr>

            <tr>
              <td align="right"><input type="hidden" name="q37" value="Emergency contact Phone"/>Phone:</td>
              <td align="left"><input type="text" name="a37" size="15"/></td>
            </tr>

            <tr>
              <td align="right"><input type="hidden" name="q38" value="Emergency contact Relationship"/>Relationship:</td>
              <td align="left"><input type="text" name="a38" size="30"/></td>
            </tr>

            <tr><td colspan="2"><U><B>Media Information:</B></U></td></tr>

            <tr>
              <td colspan="2">
                  Please list your local newspapers, radio, and television stations for both hometown and college locations.
              </td>
            </tr>

            <tr>
              <td align="right"><input type="hidden" name="q39" value="Newspapers"/>Newspapers:</td>
              <td align="left"><input type="text" name="a39" size="50"/></td>
            </tr>

            <tr>
              <td align="right"><input type="hidden" name="q40" value="Radio"/>Radio:</td>
              <td align="left"><input type="text" name="a40" size="50"/></td>
            </tr>

            <tr>
              <td align="right"><input type="hidden" name="q41" value="TV"/>TV:</td>
              <td align="left"><input type="text" name="a41" size="50"/></td>
            </tr>

            <tr><td colspan="2"><U><B>TRAVEL INFORMATION:</B></U></td></tr>
            <tr>
              <td align="right"><input type="hidden" name="q42" value="Departure City/Airport"/>Departure City/Airport:</td>
              <td align="left"><input type="text" name="a42" size="50"/></td>
            </tr>

            <tr>
              <td align="right"><input type="hidden" name="q44" value="October 11, 2005 - Preferred arrival time"/>October 11, 2005 - Preferred arrival time:</td>
              <td align="left"><select name="a44"><option value="AM">AM</option><option value="PM">PM</option></select></td>
           </tr>

            <tr>
              <td align="right"><input type="hidden" name="q45" value="October 15, 2005 - preferred departure time"/>October 15, 2005 - preferred departure time:</td>
              <td align="left"><select name="a45"><option value="AM">AM</option><option value="PM">PM</option></select></td>
            </tr>

            <tr>
              <td align="right"><input type="hidden" name="q46" value="Seating preference"/>Seating preference:</td>
              <td align="left"><select name="a46"><option value="Window">Window</option><option value="Aisle">Aisle</option></select></td>
            </tr>

            <tr>
              <td align="right"><input type="hidden" name="q47" value="Preference for your hotel room"/>Preference for your hotel room :</td>
              <td align="left"><select name="a47"><option value="Smoking">Smoking</option><option value="Non Smoking">Non Smoking</option></select></td>
           </tr>

        <tr>
          <td align="right"><input type="hidden" name="q48" value="Roommate preference"/>Roommate preference:</td>
          <td align="left"><input type="text" name="a48" size="20"/></td>
        </tr>


            <tr>
              <td align="right"><input type="hidden" name="q49" value="Personal Considerations/Special Requests"/>Personal Considerations/Special Requests: (Physical requirements or Medical needs)</td>
              <td align="left"><input type="text" name="a49" size="50"/></td>
            </tr>

            <tr>
              <td align="left" colspan="2">
                    In order to help use correctly pronouce your name and handle please fill in the
                    questions below.  If you would prefer to send a recording, you may email it
                    to <a href="mailto:ntrefz@topcoder.com" >Nick Trefz</a>
              </td>
            </tr>


            <tr>
              <td align="right"><input type="hidden" name="q50" value="Phonetic Handle"/>Phonetic spelling of your handle</td>
              <td align="left"><input type="text" name="a50" size="50"/></td>
            </tr>

            <tr>
              <td align="right"><input type="hidden" name="q51" value="Phonetic Name"/>Phonetic spelling of our Name</td>
              <td align="left"><input type="text" name="a51" size="50"/></td>
            </tr>



            <tr><td colspan="2" ALIGN="center"><input type="submit" name="submit" value=" Submit "/></td></tr>
            </form>
            <tr><td><br/></td><td><br/></td></tr>
            <tr>
              <td colspan="2">
                  *For extended stays in the US, please contact <a href="mailto:bhealy@topcoder.com" >Barbara Healy</a>.
                  Any extra expenses will be your responsibility (extra hotel nights, meals, higher air fares, etc.)
                  and will be deducted from your total TCO prize money won.  If your total TCO prize money is not
                  sufficient to cover the additional costs, your will be responsible for remitting to TopCoder the
                  remainder of the cost.
              </td>
            </tr>
            <tr>
                <td colspan="2">
                    <br/><br/>
            <font color="#ff0000">PLEASE NOTE:</font>
            Guests are invited to attend the TCO05 and TopCoder can help make travel and lodging arrangements. However,
            all costs (hotel, travel, meals, etc.) are at the guest's own expense.
                <br/><br/>
                </td>
            </tr>

        </table>







        </div>
		</td>


<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../../public_right.jsp">
            <jsp:param name="level1" value="tco05"/>
            </jsp:include>
         </td>

	</tr>

</table>




<jsp:include page="../../../foot.jsp" />

</body>

</html>
