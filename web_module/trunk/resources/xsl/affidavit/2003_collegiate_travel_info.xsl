<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <TITLE>2003 Sun Microsystems and Topcoder Collegiate Challenge Information</TITLE>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <CENTER>
            2032 Sun Microsystems and <BR/>
            TopCoder Collegiate Challenge<BR/>
            April 4 - 5, 2003<BR/><BR/><BR/>
            Travel Information
        </CENTER>
        <BR/><BR/> <BR/><BR/>
        <B><U>HOTEL INFORMATION:</U></B><BR/>
        <BR/>
          University Park Hotel @ MIT<BR/>
          20 Sidney Street<BR/>
          Cambridge, MA 02139<BR/>
          Phone: (617) 577-0200<BR/>
        <BR/>
          A room will be confirmed for your arrival on April 3rd and departure on April 6th.   The check-in time is
          3:00pm and check-out time is 12:00noon.  If you have any special requests, please indicate them on the
          registration form. The cost of your sleeping room and applicable taxes will be charged to the TopCoder
          master account.  You will be required to provide a credit card upon check-in for any incidentals.<BR/>
        <BR/>
        <B><U>AIRLINE INFORMATION:</U></B><BR/>
        <BR/>
          TopCoder will secure airline reservations based upon your registration information and email a
          suggested travel itinerary to you.  Travel arrangements need to be finalized no later than Monday,
          March 17th.  Please be advised that once airlines tickets are confirmed, any changes are subject to
          penalty fees at your own expense.<BR/>
        <BR/>
        <B><U>AIRPORT TRANSPORTATION:</U></B><BR/>
        <BR/>
          TopCoder will provide round trip transportation to and from the University Park Hotel @ MIT and Boston/Logan
          airport. More information will be provided prior to the event. <B><U>Please plan for your arrival into Boston/Logan
          airport by 4:00pm on April 3rd.</U></B><BR/>
        <BR/>
        <BR/>
        <BR/>
        <CENTER>
          <H1>Registration Form</H1>
          <BR/>
          <BR/>
          <FONT color="#FF0000"><U><B>REGISTRATION DEADLINE:</B></U>  March 17, 2003</FONT><BR/>
        </CENTER>
        <BR/>
        <BR/>
        <TABLE border="0" cellspacing="0" cellpadding="0" width="70%">
    <FORM name="questForm" method="POST" action="/">
        <INPUT TYPE="hidden" NAME="t" VALUE="affidavit"/>
        <INPUT TYPE="hidden" NAME="c" VALUE="2003_collegiate_submit_info"/>
            <TR><TD COLSPAN="2"><U><B>CONTACT INFORMATION:</B></U><BR/></TD></TR>

            <TR>
                <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="First Name: "/>First Name: </TD>
                <TD align="left"><INPUT TYPE="text" NAME="a1" size="20"><xsl:attribute name="value"><xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/first_name"/></xsl:attribute></INPUT><BR/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="Last Name: "/>Last Name: </TD>
              <TD align="left"><INPUT TYPE="text" NAME="a1" size="20"><xsl:attribute name="value"><xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/last_name"/></xsl:attribute></INPUT><BR/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="Social Security #: "/>Social Security #: </TD>
              <TD align="left"><INPUT TYPE="text" NAME="a1" size="10"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="Date of Birth:"/>Date of Birth: </TD>
              <TD align="left"><INPUT TYPE="text" NAME="a1" size="10"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="Handle: "/>Handle: </TD>
              <TD align="left"><INPUT TYPE="text" NAME="a1" size="15"><xsl:attribute name="value"><xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/handle"/></xsl:attribute></INPUT></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="Phone: "/>Phone:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a1" size="15"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="School: "/>School:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a1" size="30"/></TD>
            </TR>
            <BR/>
            <TR><TD COLSPAN="2"><U><B>Mailing address:</B></U></TD></TR>
            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="Street Address: "/>Street Address:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a1" size="50"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="City: "/>City:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a1" size="25"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="State: "/>State:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a1" size="2"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="Zip: "/>Zip:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a1" size="15"/></TD>
            </TR>

            <BR/>
            <TR><TD COLSPAN="2"><U><B>Emergency contact:</B></U></TD></TR>
            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="Name: "/>Name:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a1" size="30"/><BR/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="Phone: "/>Phone:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a1" size="15"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="Relationship: "/>Relationship:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a1" size="30"/></TD>
            </TR>

            <BR/>


            <TR><TD COLSPAN="2"><U><B>Media Information:</B></U></TD></TR>
            Please list your local newspapers, radio, and television stations.  If you are a student, list both hometown and college locations.<BR/>
            <BR/>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="Newspapers: "/>Newspapers:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a1" size="50"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="Radio: "/>Radio:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a1" size="50"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="TV: "/>TV:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a1" size="50"/></TD>
            </TR>

            <BR/>
            <TR><TD COLSPAN="2"><U><B>Miscellaneous:</B></U></TD></TR>
            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="Shirt size (S|M|L|XL|XXL): "/>Shirt size (S|M|L|XL|XXL):</TD>
              <TD align="left">
                  <SELECT name="a1">
                      <OPTION value="S">S</OPTION>
                      <OPTION value="M">M</OPTION>
                      <OPTION value="L">L</OPTION>
                      <OPTION value="XL">XL</OPTION>
                      <OPTION value="XXL">XXL</OPTION>
                  </SELECT>
              </TD>
            </TR>

            <BR/>
            <TR><TD COLSPAN="2"><U><B>GUEST INFORMATION:</B></U></TD></TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="First Name: "/>First Name:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a1" size="20"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="Last Name: "/>Last Name:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a1" size="20"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="Date of Birth: "/>Date of Birth:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a1" size="15"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="Phone: "/>Phone:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a1" size="15"/></TD>
            </TR>
            <BR/>
            <TR><TD COLSPAN="2"><U><B>Emergency contact (for guest):</B></U></TD></TR>
            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="Name: "/>Name:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a1" size="30"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="Phone: "/>Phone:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a1" size="15"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="Relationship: "/>Relationship:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a1" size="30"/></TD>
            </TR>

            <BR/>
            <TR><TD COLSPAN="2"><U><B>TRAVEL INFORMATION:</B></U></TD></TR>
            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="Relationship: "/>Departure City/Airport:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a1" size="50"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="Relationship: "/>Guest Departure City/Airport (if different):</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a1" size="50"/></TD>
            </TR>

            <BR/>
            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="November 21, 2002 - preferred departure time (AM|PM): "/>November 21, 2002 - preferred departure time (AM|PM):</TD>
              <TD align="left"><SELECT name="a1"><OPTION value="AM">AM</OPTION><OPTION value="PM">PM</OPTION></SELECT></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="November 24, 2002 - preferred departure time (AM|PM): "/>November 24, 2002 - preferred departure time (AM|PM):</TD>
              <TD align="left"><SELECT name="a1"><OPTION value="AM">AM</OPTION><OPTION value="PM">PM</OPTION></SELECT></TD>
            </TR>

            <BR/>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="Seating preference (Window|Aisle): "/>Seating preference (Window|Aisle):</TD>
              <TD align="left"><SELECT name="a1"><OPTION value="Window">Window</OPTION><OPTION value="Aisle">Aisle</OPTION></SELECT></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="Preference for your hotel room (Smoking|Non Smoking): "/>Preference for your hotel room (Smoking|Non Smoking):</TD>
              <TD align="left"><SELECT name="a1"><OPTION value="Smoking">Smoking</OPTION><OPTION value="Non Smoking">Non Smoking</OPTION></SELECT></TD>
            </TR>


            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="Personal Considerations/Special Requests: (Physical requirements or Medical needs): "/>Personal Considerations/Special Requests: (Physical requirements or Medical needs)</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a1" size="50"/></TD>
            </TR>
            <BR/>
            <BR/>
            <BR/>
            <BR/>
            <BR/>
            </FORM>
        </TABLE>

      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
