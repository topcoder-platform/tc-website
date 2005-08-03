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



        <h2>Travel Information</h2>
        <p>
        <B><U>HOTEL INFORMATION:</U></B><br />
        <br />
          Santa Clara Marriott<br />
          2700 Mission College Boulevard<br />
          Santa Clara, CA 95054<br />
          Phone: (408) 988-1500<br />
          <a target="_blank" href="http://www.santaclaramarriott.com">www.santaclaramarriott.com</a><br />
        <br />
        TopCoder has added the Competitor Game Room to the onsite activities on Wednesday, March 9.
        The room will be open from 9:00AM through 5:00PM.  Competitors who wish to arrive on Tuesday,
        March 8 may do so and take advantage of the room on March 9.  TopCoder will run a Poker tournament with
        prizes for 1st, 2nd, and 3rd place, and will also have various other games available (Backgammon,
        Cards, Checkers, Chess, Clue, Monopoly, Othello, Risk, Scrabble and Trivial Pursuit).  We hope many
        of you will take this opportunity to spend some time together outside of the tournament.
        <BR /><BR />

         A hotel room will be confirmed for your arrival on either March 8th or 9th and departure on March 12th.   The check-in time is
            3:00 PM and check out time is 11:00 AM .  If you have any special requests, please indicate them on the
            travel form. The cost of your sleeping room and applicable taxes will be charged to the TopCoder master
            account.  You will be required, however, to provide a credit card upon check-in for any incidental expenses.
            <br /><br />
            <b>At the TCO05, you will be sharing a hotel room with another competitor.</b>  Please fill in the
            appropriate space with your roommate preference if you have one.  We will do our best to accommodate your request.<br />
        <br />
        <B><U>AIRLINE INFORMATION:</U></B><br />
        <br />
          Your travel information must be submitted no later than <strong>5:00 PM EST on Friday, February 18th</strong>.
            TopCoder will secure
            airline reservations based upon your registration information and will email a travel itinerary to you
            by Friday, March 4th.  Please be advised that once airlines tickets are confirmed, any changes are
            subject to penalty fees at your own expense.
            <br />
        <br />
        <B><U>AIRPORT TRANSPORTATION:</U></B><br />
        <br />
            TopCoder will provide transportation to and from San Jose International Airport.  Further information on
            where to board upon your arrival at the airport will be indicated on your itinerary.
        </p>


        <table border="0" cellspacing="3" cellpadding="0" width="100%" class="bodyText">
    <form name="questForm" method="POST" action="<jsp:getProperty name="sessionInfo" property="ServletPath"/>">
        <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="TCO05TravelInfoSubmit"/>
            <tr><td colspan="2"><H1 align="center">Travel Form</H1></td></tr>
            <tr><td colspan="2"><U><B>COMPETITOR INFORMATION:</B></U><br /></td></tr>

        <tr>
          <td align="right"><input type="hidden" name="q1" value="Handle"/>Handle: </td>
          <td align="left"><input type="text" name="a1" size="15"></INPUT></td>
        </tr>

            <tr>
                <td align="right"><input type="hidden" name="q2" value="First Name"/>First Name: </td>
                <td align="left"><input type="text" name="a2" size="20"></INPUT><br /></td>
            </tr>

            <tr>
              <td align="right"><input type="hidden" name="q3" value="Last Name"/>Last Name: </td>
              <td align="left"><input type="text" name="a3" size="20"></INPUT><br /></td>
                <td></td>
            </tr>

        <tr>
          <td align="right"><input type="hidden" name="q4" value="Street Address"/>Street Address:</td>
          <td align="left"><input type="text" name="a4" size="50"/></td>
        </tr>

        <tr>
          <td align="right"><input type="hidden" name="q5" value="City"/>City:</td>
          <td align="left"><input type="text" name="a5" size="25"/></td>
        </tr>

        <tr>
          <td align="right"><input type="hidden" name="q6" value="State"/>State:</td>
          <td align="left"><input type="text" name="a6" size="2"/></td>
        </tr>

        <tr>
          <td align="right"><input type="hidden" name="q7" value="Zip"/>Postal Code:</td>
          <td align="left"><input type="text" name="a7" size="15"/></td>
        </tr>

        <tr>
          <td align="right"><input type="hidden" name="q8" value="Country"/>Country:</td>
          <td align="left"><input type="text" name="a8" size="15"/></td>
        </tr>


        <tr>
          <td align="right"><input type="hidden" name="q9" value="Phone"/>Phone:</td>
          <td align="left"><input type="text" name="a9" size="15"/></td>
        </tr>

        <tr>
          <td align="right"><input type="hidden" name="q10" value="Email"/>Email Address:</td>
          <td align="left"><input type="text" name="a10" size="15"/></td>
        </tr>


            <tr>
              <td align="right"><input type="hidden" name="q11" value="Social Security #"/>Social Security #: </td>
              <td align="left"><input type="text" name="a11" size="10"/></td>
                <td></td>
            </tr>

            <tr>
              <td align="right"><input type="hidden" name="q13" value="Date of Birth"/>Date of Birth: </td>
              <td align="left"><input type="text" name="a13" size="10"/></td>
                <td></td>
            </tr>

        <tr>
          <td align="right"><input type="hidden" name="q14" value="Passport Number"/>Passport #:</td>
          <td align="left"><input type="text" name="a14" size="15"/></td>
        </tr>

            <tr>
              <td align="right"><input type="hidden" name="q15" value="School"/>School:</td>
              <td align="left"><input type="text" name="a15" size="15"/></td>
            </tr>


            <tr><td colspan="2"><U><B>Emergency contact:</B></U></td></tr>
            <tr>
              <td align="right"><input type="hidden" name="q16" value="Emergency contact Name"/>Name:</td>
              <td align="left"><input type="text" name="a16" size="30"/><br /></td>
            </tr>

            <tr>
              <td align="right"><input type="hidden" name="q17" value="Emergency contact Phone"/>Phone:</td>
              <td align="left"><input type="text" name="a17" size="15"/></td>
            </tr>

            <tr>
              <td align="right"><input type="hidden" name="q18" value="Emergency contact Relationship"/>Relationship:</td>
              <td align="left"><input type="text" name="a18" size="30"/></td>
            </tr>

            <tr><td colspan="2"><U><B>Media Information:</B></U></td></tr>

            <tr>
              <td colspan="2">
                  Please list your local newspapers, radio, and television stations for both hometown and college locations.
              </td>
            </tr>

            <tr>
              <td align="right"><input type="hidden" name="q19" value="Newspapers"/>Newspapers:</td>
              <td align="left"><input type="text" name="a19" size="50"/></td>
            </tr>

            <tr>
              <td align="right"><input type="hidden" name="q20" value="Radio"/>Radio:</td>
              <td align="left"><input type="text" name="a20" size="50"/></td>
            </tr>

            <tr>
              <td align="right"><input type="hidden" name="q21" value="TV"/>TV:</td>
              <td align="left"><input type="text" name="a21" size="50"/></td>
            </tr>

            <tr><td colspan="2"><U><B>TRAVEL INFORMATION:</B></U></td></tr>
            <tr>
              <td align="right"><input type="hidden" name="q22" value="Departure City/Airport"/>Departure City/Airport:</td>
              <td align="left"><input type="text" name="a22" size="50"/></td>
            </tr>

            <tr>
              <td align="right"><input type="hidden" name="q23" value="Preferred arrival date"/>Preferred arrival date:</td>
              <td align="left"><select name="a23"><option value="Tuesday, March 8">Tuesday, March 8</option><option value="Wednesday, March 9">Wednesday, March 9</option></select></td>
           </tr>
            <tr>
              <td align="right"><input type="hidden" name="q24" value="Preferred arrival time"/>Preferred arrival time:</td>
              <td align="left"><select name="a24"><option value="AM">AM</option><option value="PM">PM</option></select></td>
           </tr>

            <tr>
              <td align="right"><input type="hidden" name="q25" value="March 12, 2005 - preferred departure time"/>March 12, 2005 - preferred departure time:</td>
              <td align="left"><select name="a25"><option value="AM">AM</option><option value="PM">PM</option></select></td>
            </tr>

            <tr>
              <td align="right"><input type="hidden" name="q26" value="Seating preference"/>Seating preference:</td>
              <td align="left"><select name="a26"><option value="Window">Window</option><option value="Aisle">Aisle</option></select></td>
            </tr>

            <tr>
              <td align="right"><input type="hidden" name="q27" value="Preference for your hotel room"/>Preference for your hotel room :</td>
              <td align="left"><select name="a27"><option value="Smoking">Smoking</option><option value="Non Smoking">Non Smoking</option></select></td>
           </tr>

        <tr>
          <td align="right"><input type="hidden" name="q28" value="Roommate preference"/>Roommate preference:</td>
          <td align="left"><input type="text" name="a28" size="20"/></td>
        </tr>


            <tr>
              <td align="right"><input type="hidden" name="q29" value="Personal Considerations/Special Requests"/>Personal Considerations/Special Requests: (Physical requirements or Medical needs)</td>
              <td align="left"><input type="text" name="a29" size="50"/></td>
            </tr>
            <tr><td colspan="2" ALIGN="center"><input type="submit" name="submit" value=" Submit "/></td></tr>
            </form>
            <tr><td><br/></td><td><br/></td></tr>
            <tr>
              <td colspan="2">
                  *For extended stays in the US, please contact <a href="mailto:bhealy@topcoder.com" >Barbara Healy</a>.  Any extra expenses will be the
                  responsibility of the competitor (extra hotel nights, meals, higher air fares, etc.).
              </td>
            </tr>
            <tr>
                <td colspan="2">
                    <br/><br/>
            <font color="#ff0000">PLEASE NOTE:</font>
            Guests are invited to attend the TCO05; however, all costs (hotel, travel, meals, etc.) are at their own
                expense.
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
