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
  <xsl:import href="../includes/modules/tco03_head.xsl"/>
  <xsl:import href="../includes/modules/tco03_links.xsl"/>
  <xsl:import href="../includes/modules/tco03_sublinks.xsl"/>
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

<body bgcolor="#FFFFFF" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">

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
            <div align="center">
                <img src="/i/clear.gif" alt="" width="10" height="15" border="0" /><br/>
                <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco04&amp;d3=overview" target="_top"><img src="/i/tournament/tco04/tco04_home_banner2.gif" alt="2004 TopCoder Open" width="540" height="99" border="0"/></A><br/>
                <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br/>
            </div>
<!-- TCO Head Ends -->

        <h2>Travel Information</h2>
        <p>
        <B><U>HOTEL INFORMATION:</U></B><BR/>
        <BR/>
          Boston Park Plaza Hotel &amp; Towers<BR/>
          64 Arlington Street<BR/>
          Boston, MA 02116<BR/>
          Phone: (617) 426-2000<BR/>
          <a target="_blank" href="http://www.bostonparkplaza.com">www.bostonparkplaza.com</a><BR/>
        <BR/>
         A room will be confirmed for your arrival on April 14th and departure on April 17th.   The check-in time is
            3:00pm and check out time is 12:00noon.  If you have any special requests, please indicate them on the
            travel form. The cost of your sleeping room and applicable taxes will be charged to the TopCoder master
            account.  You will be required, however, to provide a credit card upon check-in for any incidental expenses.
            <BR/><BR/>
            <b>At the TCO04, you will be sharing a hotel room with another competitor.</b>  Once the finalists have
            been announced, you can email <a href="mailto:bhealy@topcoder.com">Barbara Healy</a> with any preference you may have for a
            roommate.  We will do everything possible to accommodate your request. <BR/>
        <BR/>
        <B><U>AIRLINE INFORMATION:</U></B><BR/>
        <BR/>
          Your travel information must be submitted no later than <strong>9:00 PM ET on Wednesday, March 24th</strong>.    TopCoder will secure
            airline reservations based upon your registration information and will email a travel itinerary to you
            by Friday, April 2nd.  Please be advised that once airlines tickets are confirmed, any changes are
            subject to penalty fees at your own expense.
            <BR/>
        <BR/>
        <B><U>AIRPORT TRANSPORTATION:</U></B><BR/>
        <BR/>
            The Boston Park Plaza Hotel provides a shuttle to and from Logan International Airport every half hour.
            Further information on where to board upon your arrival at the airport will be indicated on your itinerary.
        </p>


        <TABLE border="0" cellspacing="3" cellpadding="0" width="100%" class="bodyText">
    <FORM name="questForm" method="POST" action="/">
        <INPUT TYPE="hidden" NAME="t" VALUE="affidavit"/>
        <INPUT TYPE="hidden" NAME="c" VALUE="2004_open_submit_info"/>
            <TR><TD COLSPAN="2"><H1 align="center">Travel Form</H1></TD></TR>
            <TR><TD COLSPAN="2"><U><B>COMPETITOR INFORMATION:</B></U><BR/></TD></TR>

        <TR>
          <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="Handle"/>Handle: </TD>
          <TD align="left"><INPUT TYPE="text" NAME="a1" size="15"><xsl:attribute name="value"><xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/handle"/></xsl:attribute></INPUT></TD>
        </TR>

            <TR>
                <TD align="right"><INPUT TYPE="hidden" NAME="q2" VALUE="First Name"/>First Name: </TD>
                <TD align="left"><INPUT TYPE="text" NAME="a2" size="20"><xsl:attribute name="value"><xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/first_name"/></xsl:attribute></INPUT><BR/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q3" VALUE="Last Name"/>Last Name: </TD>
              <TD align="left"><INPUT TYPE="text" NAME="a3" size="20"><xsl:attribute name="value"><xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/last_name"/></xsl:attribute></INPUT><BR/></TD>
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
          <TD align="right"><INPUT TYPE="hidden" NAME="q8" VALUE="Zip"/>Country:</TD>
          <TD align="left"><INPUT TYPE="text" NAME="a8" size="15"/></TD>
        </TR>


        <TR>
          <TD align="right"><INPUT TYPE="hidden" NAME="q9" VALUE="Phone"/>Phone:</TD>
          <TD align="left"><INPUT TYPE="text" NAME="a9" size="15"/></TD>
        </TR>

        <TR>
          <TD align="right"><INPUT TYPE="hidden" NAME="q10" VALUE="Phone"/>Email Address:</TD>
          <TD align="left"><INPUT TYPE="text" NAME="a10" size="15"/></TD>
        </TR>


            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q11" VALUE="Social Security #"/>Social Security #: </TD>
              <TD align="left"><INPUT TYPE="text" NAME="a12" size="10"/></TD>
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
              <TD align="right"><INPUT TYPE="hidden" NAME="q15" VALUE="School"/>Employer or School:</TD>
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
          <TD align="center">*Departure time will be based on arrival by 4:00 PM, November 10, 2004 in San Jose, CA</TD>
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

            <TR>
              <TD COLSPAN="2">
                  *For extended stays in San Jose/USA, please contact <a href="mailto:bhealy@topcoder.com" >Barbara healy</a>.  Any extra expenses will be the
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

        <p><br/></p>
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
