<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/news_events/public_news_left.xsl"/>
  <xsl:import href="../includes/public_right_col.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>
  <xsl:import href="../includes/public_right_col.xsl"/>
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>

<title>TopCoder | Affidavit</title>

<xsl:call-template name="CSS"/>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body onLoad="timer(1);" bgcolor="#FFFFFF" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">

<!-- Top begins -->
<xsl:call-template name="Top"/>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
              <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/spacer.gif" height="1" width="6"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText">

<!-- TCO Head Begins -->
               <table align="center">
                  <tr>
                     <td align="center"><img src="/i/events/crpf03/crpf_congrats.gif" width="450" height="62" border="0" alt="TopCoder Charity Challenge benefiting the CRPF;T"/><br/>
                     <A href="/tc?&amp;module=CRPFStatic&amp;d1=crpf&amp;d2=crpf_overview"><img src="/i/events/crpf03/crfp_banner.jpg" width="510" height="160" border="0" alt="TopCoder Charity Challenge benefiting the CRPF;T"/></A><br/>
                     <img src="/i/clear.gif" width="10" height="15" border="0"/></td>
                  </tr>
               </table>
<!-- TCO Head Ends -->

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
                    <td class="bodyText" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/>
        <h2>Travel Information</h2>
        <p>
        <B><U>HOTEL INFORMATION:</U></B><BR/>
        <BR/>
          The Marriott Marquis<BR/>
          Broadway &amp; 45th Street<BR/>
          New York, NY 10036<BR/>
          Phone: (212) 398-1900<BR/>
        <BR/>
          A room will be confirmed for your arrival on Monday, November 24th and departure on Tuesday, November 25th.   The check-in
            time is 3:00pm and check-out time is 11:00am.  If you have any special requests, please indicate
            them on the travel form. The cost of your sleeping room and applicable taxes will be charged to
            the TopCoder master account.  You will be required to provide a credit card upon check-in for any
            incidentals.  <BR/>
        <BR/>
        <B><U>AIRLINE INFORMATION:</U></B><BR/>
        <BR/>
          TopCoder will secure airline reservations based upon your registration information and email a travel
            itinerary to you.  TopCoder will provide travel arrangements for each competitor, up
            to a cost of $1,000 per person.   Any cost in excess of $1,000 per person will be the responsibility
            of the contestant.  This form must be completed and submitted by <strong>12 noon, Monday, November 17th</strong>.
            Please be advised that once airlines tickets are confirmed, any changes are subject to penalty fees
            at your own expense.<BR/>
        <BR/>
        <B><U>AIRPORT TRANSPORTATION:</U></B><BR/>
        <BR/>
            Depending upon your arrival time, TopCoder will arrange with the hotel for a van to pick
            you up in a group.  If your arrival time is considerably earlier or later than the group
            departure, you can take the "Super Shuttle Service".  The cost for this service is between
            $17 and $20 which TopCoder will reimburse.  <strong><u>Please plan for your arrival at the hotel no later than 4:00pm
            on November 24th.</u></strong><BR/>
        <BR/>
            <B><U>CRPF "A MAGICAL EVENING" AWARDS DINNER:</U></B><BR/>
            <BR/>
            Monday, November 24, 2003<BR/>
            The Marriott Marquis<BR/>
            Reception:	6:30 PM<BR/>
            Dinner:		7:30 PM<BR/>
            <BR/>
            Please Note:  Black Tie is required for the event.  If you need help with your tuxedo requirement, please contact MaryBeth Luce at 866-867-2633 or mluce@topcoder.com.<BR/>
            <BR/>
            CRPF APPRECIATION BRUNCH<BR/>
            <BR/>
            Tuesday, November 25, 2005<BR/>
            The Marriott Marquis<BR/>
            Suite 4544<BR/>
            9:00 AM - 11:30 AM<BR/>

            <BR/>
        <BR/>
        <BR/>
        <CENTER>
          <H1>Travel Form</H1>
        </CENTER>
        </p>


        <TABLE border="0" cellspacing="3" cellpadding="0" width="100%">
    <FORM name="questForm" method="POST" action="/">
        <INPUT TYPE="hidden" NAME="t" VALUE="affidavit"/>
        <INPUT TYPE="hidden" NAME="c" VALUE="2003_crpf_submit_info"/>
            <TR><TD COLSPAN="2"><U><B>CONTESTANT INFORMATION:</B></U><BR/></TD></TR>

            <TR>
                <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="First Name"/>First Name: </TD>
                <TD align="left"><INPUT TYPE="text" NAME="a1" size="20"><xsl:attribute name="value"><xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/first_name"/></xsl:attribute></INPUT><BR/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q2" VALUE="Last Name"/>Last Name: </TD>
              <TD align="left"><INPUT TYPE="text" NAME="a2" size="20"><xsl:attribute name="value"><xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/last_name"/></xsl:attribute></INPUT><BR/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q3" VALUE="Social Security #"/>Social Security #: </TD>
              <TD align="left"><INPUT TYPE="text" NAME="a3" size="10"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q4" VALUE="Date of Birth"/>Date of Birth: </TD>
              <TD align="left"><INPUT TYPE="text" NAME="a4" size="10"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q5" VALUE="Handle"/>Handle: </TD>
              <TD align="left"><INPUT TYPE="text" NAME="a5" size="15"><xsl:attribute name="value"><xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/handle"/></xsl:attribute></INPUT></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q6" VALUE="Phone"/>Phone:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a6" size="15"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q7" VALUE="Employer"/>Employer (if applicable):</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a7" size="30"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q8" VALUE="School"/>School (if applicable):</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a8" size="30"/></TD>
            </TR>
            <BR/>
            <TR><TD COLSPAN="2"><U><B>Mailing address:</B></U></TD></TR>
            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q9" VALUE="Street Address"/>Street Address:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a9" size="50"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q10" VALUE="City"/>City:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a10" size="25"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q11" VALUE="State"/>State:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a11" size="2"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q12" VALUE="Zip"/>Zip:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a12" size="15"/></TD>
            </TR>

            <BR/>
            <TR><TD COLSPAN="2"><U><B>Emergency contact:</B></U></TD></TR>
            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q13" VALUE="Emergency contact Name"/>Name:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a13" size="30"/><BR/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q14" VALUE="Emergency contact Phone"/>Phone:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a14" size="15"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q15" VALUE="Emergency contact Relationship"/>Relationship:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a15" size="30"/></TD>
            </TR>

            <BR/>

            <TR><TD COLSPAN="2"><U><B>TRAVEL INFORMATION:</B></U></TD></TR>
            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q26" VALUE="Departure City/Airport"/>Departure City/Airport:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a26" size="50"/></TD>
            </TR>

            <BR/>
            <TR>
              <TD align="right">Arrive November 24, 2003 by 3:00 PM</TD>
              <TD align="left"></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q29" VALUE="Depart November 25, 2003 - preferred departure time"/>Depart November 25, 2003 - preferred departure time:</TD>
              <TD align="left"><SELECT name="a29"><OPTION value="AM">AM</OPTION><OPTION value="PM">PM</OPTION></SELECT></TD>
            </TR>

            <BR/>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q30" VALUE="Seating preference"/>Seating preference:</TD>
              <TD align="left"><SELECT name="a30"><OPTION value="Window">Window</OPTION><OPTION value="Aisle">Aisle</OPTION></SELECT></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q31" VALUE="Preference for your hotel room"/>Preference for your hotel room :</TD>
              <TD align="left"><SELECT name="a31"><OPTION value="Smoking">Smoking</OPTION><OPTION value="Non Smoking">Non Smoking</OPTION></SELECT></TD>
            </TR>


            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q32" VALUE="Personal Considerations/Special Requests"/>Personal Considerations/Special Requests: (Physical requirements or Medical needs)</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a32" size="50"/></TD>
            </TR>
            <TR><TD COLSPAN="2" ALIGN="center"><input type="submit" name="submit" value=" Submit "/></TD></TR>
            </FORM>
        </TABLE>
                    </td>
                    <td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>
                <tr><td colspan="4" valign="top" bgcolor="#FFFFFF" width="100%"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <xsl:call-template name="public_right_col">
                <xsl:with-param name="sectionName">tco03</xsl:with-param>
            </xsl:call-template>
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<!-- Footer begins -->
<xsl:call-template name="Foot"/>
<!-- Footer ends -->

</body>
</html>

  </xsl:template>
</xsl:stylesheet>
