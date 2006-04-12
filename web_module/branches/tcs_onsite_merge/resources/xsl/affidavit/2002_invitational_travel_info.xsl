<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <TITLE>2002 Invitational Travel Information</TITLE>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <CENTER>2002 TopCoder Invitational<BR/>
        <BR/>
        Travel Information
        </CENTER><BR/>
        <BR/> <BR/> <BR/>
        <B><U>HOTEL INFORMATION:</U></B><BR/>
        <BR/>
        Mohegan Sun Casino<BR/>
        Mohegan Sun Boulevard<BR/>
        Uncasville, CT<BR/>
        Phone: (888) 226-7711<BR/>
        <BR/>
        A room will be confirmed for your arrival on November 21st and departure on November 24th.   The check-in time is 4:00pm and check-out time is 11:00am.  If you have any special requests, please indicate them on the registration form. The cost of your sleeping room and applicable taxes will be charged to the TopCoder master account.  You will be required to provide a credit card upon check-in for any incidentals.  <BR/>
        <BR/>
        <BR/>
        <B><U>AIRLINE INFORMATION:</U></B><BR/>
        <BR/>
        TopCoder will secure airline reservations (up to a cost of $1,000 per ticket) based upon your registration information and email a travel itinerary to you.  Travel arrangements need to be finalized no later than Monday, November 4th.  Please be advised that once airlines tickets are confirmed, any changes are subject to penalty fees at your own expense.<BR/>
        <BR/>
        <BR/>
        <B><U>AIRPORT TRANSPORTATION:</U></B><BR/>
        <BR/>
        TopCoder will provide round trip transportation to and from the Mohegan Sun Casino and the airport. More information will be provided prior to the event. <B>Please plan for your arrival  by 4:00pm on November 21st.</B><BR/>
        <BR/>
        <BR/>
        <BR/>
        <BR/>
        <CENTER>
          <H1>Registration Form</H1>
          <BR/>
          <BR/>
          <U><B>REGISTRATION DEADLINE:</B></U>  Monday, October 28, 2002 12:00PM<BR/>
        </CENTER>
        <BR/>
        <BR/>
        <U><B>CONTACT INFORMATION:</B></U><BR/>
        Last Name: <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/last_name"/><BR/>
        First Name: <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/first_name"/><BR/>
        Social Security #:<BR/>
        Date of Birth:<BR/>
        Handle: <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/handle"/><BR/>
        Phone:<BR/>
        School (if currently full time):<BR/>
        <BR/>
        <B>Mailing address:</B><BR/>
        Street Address:<BR/>
        City:<BR/>
        State:<BR/>
        Zip:<BR/>
        <BR/>
        <B>Emergency contact:</B><BR/>
        Name:<BR/>
        Phone:<BR/>
        Relationship:<BR/>
        <BR/>
        <B>Media Information:</B> <BR/>
        Please list your local newspapers, radio, and television stations.  If you are a student, list both hometown and college locations.<BR/>
        <BR/>
        Newspapers:<BR/>
        Radio:<BR/>
        TV:<BR/>
        <BR/>
        <B>Miscellaneous:</B> <BR/>
        Shirt size (S|M|L|XL|XXL):<BR/>
        <BR/>
        <U><B>GUEST INFORMATION:</B></U><BR/>
        Last Name:<BR/>
        First Name:<BR/>
        Date of Birth:<BR/>
        Phone:<BR/>
        <BR/>
        <B>Emergency contact (for guest):</B><BR/>
        Name:<BR/>
        Phone:<BR/>
        Relationship:<BR/>
        <BR/>
        <U><B>TRAVEL INFORMATION:</B></U><BR/>
        Departure City/Airport:<BR/>
        <BR/>
        November 21, 2002 - preferred departure time (AM|PM):<BR/>
        November 24, 2002 - preferred departure time (AM|PM):<BR/>
        <BR/>
        Seating preference (Window|Aisle):<BR/>
        Preference for your hotel room (Smoking|Non Smoking):<BR/>
        Personal Considerations/Special Requests: (Physical requirements or Medical needs)
        <BR/>
        <BR/>
        <BR/>
        <BR/>
        <BR/>
        <BR/>

      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
