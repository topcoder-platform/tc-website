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
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Affidavit</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
  <TR>
    <!-- Left Column Begins -->
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
<IMG SRC="/i/spacer.gif" HEIGHT="1" WIDTH="170"/>
<!-- Left Column Include Begins -->  
    <!-- Global Seconday Nav Begins -->  
<!--        <xsl:call-template name="public_news_left"/>-->
  <!-- Global Seconday Nav Ends -->  
<!-- Left Column Include Ends -->        
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top"><img src="/i/clear.gif" width="240" height="1" VSPACE="5" BORDER="0"/><BR/>
      <xsl:call-template name="BodyTop">
        <xsl:with-param name="image1">white</xsl:with-param>
        <xsl:with-param name="image">invit</xsl:with-param>
        <xsl:with-param name="title"></xsl:with-param>
      </xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
        <TR>
          <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
          <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>          
          <P>
            <CENTER><IMG SRC="/i/invit02_logow.gif" HEIGHT="105" WIDTH="155"/></CENTER><BR/><BR/>
            Congratulations on advancing to Online Round #4 of the 2002 TopCoder Invitational!  You are one of the 64 finalists eligible to receive a cash prize of at least $500.  In order to receive your prize, you MUST complete and return all of the following 5 items by Monday, October 28th at 12:00PM EST:  IF WE DO NOT RECEIVE ALL OF THESE ITEMS BY 12:00PM EST ON MONDAY, OCTOBER 28, 2002, YOU WILL FORFEIT YOUR PRIZE AND YOUR SPOT IN THE TOURNAMENT.
            <BR/>
            <BR/>
            <ol>
              <li>
                <B>AFFIDAVIT</B> - must be postmarked on or before Oct. 28, 2002:<BR/><BR/>
                <xsl:choose>
                  <xsl:when test="number(/TC/AFFIDAVIT/Affidavit/Info/has_notarized_affidavit)=0">
                    We do not have a notarized affidavit from you on file.  Click <A HREF="/?&amp;t=affidavit&amp;c=2002_invitational_affidavit">here</A> to view a printable version of your affidavit.  This affidavit must be notarized and returned to us at the address below.
                  </xsl:when>
                  <xsl:otherwise>
                    Click <A HREF="/?&amp;t=affidavit&amp;c=2002_invitational_affidavit">here</A> to view a printable version of your affidavit.  Please read the affidavit, sign it and return it to us at the address below.  Note that you do not have to have this affidavit notarized because we already have a notorized affidavit on file for you.
                  </xsl:otherwise>
                </xsl:choose>
                <BR/>
                <BR/>
              </li>
              <li>
                <B>TAX FORM</B> - must be postmarked on or before Oct. 28, 2002:<BR/><BR/>
                <xsl:choose>
                  <xsl:when test="number(/TC/AFFIDAVIT/Affidavit/Info/has_tax_form)=0">
                    You must complete, sign and return the appropriate tax form (Form W-9 or Form W-8BEN) to the address below.  If you don't know the form that applies to you, please refer to the instructions below:<BR/><BR/>
                    <B>Instructions</B><BR/>
                    Form W-9 Instructions: <A HREF="/contest/iw9.pdf">here (W9)</A><BR/>
                    Form W-8BEN Instructions: <A HREF="/contest/iw8ben.pdf">here (W8)</A><BR/> 
                    <BR/>
                    <B>Tax Forms</B><BR/>
                    Form W-9 <A HREF="/contest/fw9.pdf">here (W9)</A><BR/>
                    Form W-8BEN <A HREF="/contest/fw8ben.pdf">here (W8)</A>
                  </xsl:when>
                  <xsl:otherwise>
                    We already have your tax form on file.  You do NOT need to complete and return another form.
                  </xsl:otherwise>
                </xsl:choose>
                <BR/>
                <BR/>
              </li>
              <li>
                <B>2002 TOPCODER INVITATIONAL QUESTIONNAIRE</B> - completed form must be emailed to <A HREF="mailto:invitational@topcoder.com">invitational@topcoder.com</A> by 12:00PM EST on Monday, Oct. 28th:<BR/><BR/>
	        Click <A HREF="/?&amp;t=affidavit&amp;c=2002_invitational_questionaire">here</A> to view 
                the 2002 TopCoder Invitational Questionnaire.  Copy this HTML page into a word processor.  Complete 
                ALL questions and return it via email.
                <BR/>
                <BR/>
              </li>
              <li>
                <B>TRAVEL INFORMATION PAGE</B> - completed form must be emailed to <A HREF="mailto:invitational@topcoder.com">invitational@topcoder.com</A> by 12:00PM EST on Monday, Oct. 28th:<BR/><BR/>
	        Click <A HREF="/?&amp;t=affidavit&amp;c=2002_invitational_travel_info">here</A> to view a Travel Information Page.  Copy this HTML page into 
                a word processor.  Complete ALL questions and return it via email.
                <BR/>
                <BR/>
              </li>
              <li>
                <B>HEADSHOT</B> - must be emailed by 12:00PM EST on Monday, Oct. 28th:<BR/><BR/>
                <xsl:choose>
                  <xsl:when test="number(/TC/AFFIDAVIT/Affidavit/Info/has_image)=0">
                    We do not have your headshot on file.  Click below to submit your headshot.<BR/><BR/>
                    <CENTER><TABLE><TR><TD><A><xsl:attribute name="HREF">mailto:memberphotos@topcoder.com?subject=<xsl:value-of select="/TC/ActivationCode"/>%20|%20[%20<xsl:value-of select="/TC/Handle"/>%20]%20|%20<xsl:value-of select="/TC/UserId"/>%20SUBMIT%20IMAGE:%20PLEASE%20DO%20NOT%20CHANGE%20SUBJECT</xsl:attribute><IMG SRC="/i/m/nophoto_submit.gif" WIDTH="126" HEIGHT="140" ALIGN="left" BORDER="0"/></A></TD></TR></TABLE></CENTER>

                  </xsl:when>
                  <xsl:otherwise>
                    We have a Headshot on file.  If you'd like to change it click <A><xsl:attribute name="HREF">mailto:memberphotos@topcoder.com?subject=<xsl:value-of select="/TC/ActivationCode"/>%20|%20[%20<xsl:value-of select="/TC/Handle"/>%20]%20|%20<xsl:value-of select="/TC/UserId"/> RE-SUBMIT%20IMAGE:%20PLEASE%20DO%20NOT%20CHANGE%20SUBJECT</xsl:attribute>here</A>
                  </xsl:otherwise>
                </xsl:choose>
                <BR/>
                <BR/>
              </li>
            </ol>
            <CENTER> 
              TopCoder Invitational<BR/>
              703 Hebron Avenue<BR/>
              Glastonbury, CT 06033<BR/>
            </CENTER>
            <BR/>
            <BR/>
            <B>
            Reminder, you will not receive any prize money unless all five items above are completed 
            by Monday, October 28th at 12:00PM EST.  Any items that need to be mailed via the postal 
            service must be postmarked by this date.
            </B>
          </P>

<!--
          <TABLE WIDTH="100%" BORDER="0" CELLPADDING="2" CELLSPACING="0" BGCOLOR="#FFFFFF">
            <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">blah blah blah blah blah</TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">has notorized affidavit <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/has_notarized_affidavit"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">has tax form <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/has_tax_form"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">has image <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/has_image"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">handle <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/handle"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">first name <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/first_name"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">last name <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/last_name"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">email <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/email"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">address1 <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/address1"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">address2 <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/address2"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">city <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/city"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">state code <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/stat_code"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">zip <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/zip"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">country <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/country_name"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">home phone <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/home_phone"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">work phone <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/work_phone"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">coder_type <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/coder_type_desc"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><A HREF="/?&amp;t=affidavit&amp;c=2002_invitational_affidavit" CLASS="bodyText">get affidavit</A></TD></TR>
          </TABLE>
-->
          <P><BR/></P>
          </TD>
          <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        </TR>
        <TR>
          <TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
        </TR>     
        <TR>
          <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
          <TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
          <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
          <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
        </TR>  
        <TR>
          <TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
          <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
          <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
          <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
        </TR>
      </TABLE>
    </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->

  <!-- Gutter -->
    <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>       
<!-- Right Column Include Ends -->       
        </TD>
  <!-- Right Column Ends -->
  <!-- Gutter -->
    <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
