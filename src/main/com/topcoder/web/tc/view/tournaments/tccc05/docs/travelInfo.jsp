<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map,
                 com.topcoder.web.tc.Constants"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
</head>
<%--<%ResultSetContainer info = (ResultSetContainer)((Map)request.getAttribute("info")).get("Affidavit_Info");%>--%>

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
        <B><U>HOTEL INFORMATION:</U></B><BR/>
        <BR/>
          Santa Clara Marriott<BR/>
          2700 Mission College Boulevard<BR/>
          Santa Clara, CA 95054<BR/>
          Phone: (408) 988-1500<BR/>
          <a target="_blank" href="http://www.santaclaramarriott.com">www.santaclaramarriott.com</a><BR/>
        <BR/>
         A room will be confirmed for your arrival on November 10th and departure on November 13th.   The check-in time is
            3:00 PM and check out time is 11:00 AM .  If you have any special requests, please indicate them on the
            travel form. The cost of your sleeping room and applicable taxes will be charged to the TopCoder master
            account.  You will be required, however, to provide a credit card upon check-in for any incidental expenses.
            <BR/><BR/>
            <b>At the TCO04, you will be sharing a hotel room with another competitor.</b>  Please fill in the
            appropriate space with your roommate preference if you have one.  We will do our best to accommodate your request.<BR/>
        <BR/>
        <B><U>AIRLINE INFORMATION:</U></B><BR/>
        <BR/>
          Your travel information must be submitted no later than <strong>9:00 AM ET on Monday, October 18th</strong>.
            TopCoder will secure
            airline reservations based upon your registration information and will email a travel itinerary to you
            by Friday, November 5th.  Please be advised that once airlines tickets are confirmed, any changes are
            subject to penalty fees at your own expense.
            <BR/>
        <BR/>
        <B><U>AIRPORT TRANSPORTATION:</U></B><BR/>
        <BR/>
            TopCoder will provide transportation to and from San Jose International Airport.  Further information on
            where to board upon your arrival at the airport will be indicated on your itinerary.
        </p>


        <TABLE border="0" cellspacing="3" cellpadding="0" width="100%" class="bodyText">
    <FORM name="questForm" method="POST" action="/">
        <INPUT TYPE="hidden" NAME="<%=Constants.MODULE_KEY%>" VALUE="TCCC05TravelInfoSubmit"/>
            <TR><TD COLSPAN="2"><H1 align="center">Travel Form</H1></TD></TR>
            <TR><TD COLSPAN="2"><U><B>COMPETITOR INFORMATION:</B></U><BR/></TD></TR>

        <TR>
          <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="Handle"/>Handle: </TD>
          <TD align="left"><INPUT TYPE="text" NAME="a1" size="15"></INPUT></TD>
        </TR>

            <TR>
                <TD align="right"><INPUT TYPE="hidden" NAME="q2" VALUE="First Name"/>First Name: </TD>
                <TD align="left"><INPUT TYPE="text" NAME="a2" size="20"></INPUT><BR/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q3" VALUE="Last Name"/>Last Name: </TD>
              <TD align="left"><INPUT TYPE="text" NAME="a3" size="20"></INPUT><BR/></TD>
                <td></td>
            </TR>

        <TR>
          <TD align="right"><INPUT TYPE="hidden" NAME="q4" VALUE="Street Address"/>Street Address:</TD>
          <TD align="left"><INPUT TYPE="text" NAME="a4" size="50"/></TD>
        </TR>

        <TR>
          <TD align="right"><INPUT TYPE="hidden" NAME="q5" VALUE="City"/>City:</TD>
          <TD align="left"><INPUT TYPE="text" NAME="a5" size="25"/></TD>
        </TR>

        <TR>
          <TD align="right"><INPUT TYPE="hidden" NAME="q6" VALUE="State"/>State:</TD>
          <TD align="left"><INPUT TYPE="text" NAME="a6" size="2"/></TD>
        </TR>

        <TR>
          <TD align="right"><INPUT TYPE="hidden" NAME="q7" VALUE="Zip"/>Postal Code:</TD>
          <TD align="left"><INPUT TYPE="text" NAME="a7" size="15"/></TD>
        </TR>

        <TR>
          <TD align="right"><INPUT TYPE="hidden" NAME="q8" VALUE="Country"/>Country:</TD>
          <TD align="left"><INPUT TYPE="text" NAME="a8" size="15"/></TD>
        </TR>


        <TR>
          <TD align="right"><INPUT TYPE="hidden" NAME="q9" VALUE="Phone"/>Phone:</TD>
          <TD align="left"><INPUT TYPE="text" NAME="a9" size="15"/></TD>
        </TR>

        <TR>
          <TD align="right"><INPUT TYPE="hidden" NAME="q10" VALUE="Email"/>Email Address:</TD>
          <TD align="left"><INPUT TYPE="text" NAME="a10" size="15"/></TD>
        </TR>


            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q11" VALUE="Social Security #"/>Social Security #: </TD>
              <TD align="left"><INPUT TYPE="text" NAME="a11" size="10"/></TD>
                <td></td>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q13" VALUE="Date of Birth"/>Date of Birth: </TD>
              <TD align="left"><INPUT TYPE="text" NAME="a13" size="10"/></TD>
                <td></td>
            </TR>

        <TR>
          <TD align="right"><INPUT TYPE="hidden" NAME="q14" VALUE="Passport Number"/>Passport #:</TD>
          <TD align="left"><INPUT TYPE="text" NAME="a14" size="15"/></TD>
        </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q15" VALUE="Employer/School"/>Employer or School:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a15" size="15"/></TD>
            </TR>


            <TR><TD COLSPAN="2"><U><B>Emergency contact:</B></U></TD></TR>
            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q16" VALUE="Emergency contact Name"/>Name:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a16" size="30"/><BR/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q17" VALUE="Emergency contact Phone"/>Phone:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a17" size="15"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q18" VALUE="Emergency contact Relationship"/>Relationship:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a18" size="30"/></TD>
            </TR>

            <TR><TD COLSPAN="2"><U><B>Media Information:</B></U></TD></TR>

            <TR>
              <TD COLSPAN="2">
                  Please list your local newspapers, radio, and television stations for both hometown and college locations.
              </TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q19" VALUE="Newspapers"/>Newspapers:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a19" size="50"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q20" VALUE="Radio"/>Radio:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a20" size="50"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q21" VALUE="TV"/>TV:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a21" size="50"/></TD>
            </TR>

            <TR><TD COLSPAN="2"><U><B>TRAVEL INFORMATION:</B></U></TD></TR>
            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q22" VALUE="Departure City/Airport"/>Departure City/Airport:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a22" size="50"/></TD>
            </TR>

        <TR>
            <td></td>
          <TD>*Departure time will be based on arrival by 4:00 PM, November 10, 2004 in San Jose, CA</TD>
        </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q23" VALUE="November 13, 2004 - preferred departure time"/>November 13, 2004 - preferred departure time:</TD>
              <TD align="left"><SELECT name="a23"><OPTION value="AM">AM</OPTION><OPTION value="PM">PM</OPTION></SELECT></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q24" VALUE="Seating preference"/>Seating preference:</TD>
              <TD align="left"><SELECT name="a24"><OPTION value="Window">Window</OPTION><OPTION value="Aisle">Aisle</OPTION></SELECT></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q25" VALUE="Preference for your hotel room"/>Preference for your hotel room :</TD>
              <TD align="left"><SELECT name="a25"><OPTION value="Smoking">Smoking</OPTION><OPTION value="Non Smoking">Non Smoking</OPTION></SELECT></TD>
           </TR>

        <TR>
          <TD align="right"><INPUT TYPE="hidden" NAME="q26" VALUE="Roommate preference"/>Roommate preference:</TD>
          <TD align="left"><INPUT TYPE="text" NAME="a26" size="20"/></TD>
        </TR>


            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q27" VALUE="Personal Considerations/Special Requests"/>Personal Considerations/Special Requests: (Physical requirements or Medical needs)</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a27" size="50"/></TD>
            </TR>
            <TR><TD COLSPAN="2" ALIGN="center"><input type="submit" name="submit" value=" Submit "/></TD></TR>
            </FORM>
            <tr><td><br/></td><td><br/></td></tr>
            <TR>
              <TD COLSPAN="2">
                  *For extended stays in San Jose/USA, please contact <a href="mailto:bhealy@topcoder.com" >Barbara Healy</a>.  Any extra expenses will be the
                  responsibility of the competitor (extra hotel nights, meals, higher air fares, etc.).
              </TD>
            </TR>
            <tr>
                <td colspan="2">
                    <br/><br/>
            <font color="#ff0000">PLEASE NOTE:</font>
            Guests are invited to attend the TCO04; however, all costs (hotel, travel, meals, etc.) are at their own
                expense.
                <br/><br/>
                </td>
            </tr>

        </TABLE>







        </div>
		</td>


<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../../public_right.jsp">
            <jsp:param name="level1" value="tccc05"/>
            </jsp:include>
         </td>

	</tr>

</table>




<jsp:include page="../../../foot.jsp" />

</body>

</html>
