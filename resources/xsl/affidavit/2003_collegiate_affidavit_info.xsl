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
        <td width="170" bgcolor="#CCCCCC"><img src="/i/spacer.gif" height="1" width="170"/></td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/spacer.gif" height="1" width="6"/></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->  
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">steelgray</xsl:with-param>
                <xsl:with-param name="image">invitation_gray</xsl:with-param>
                <xsl:with-param name="title">2003 TopCoder Collegiate Challenge</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%" id="tccc_bkgd">
                <tr valign="top">
                    <td width="50%" align="right"><a href="/?&amp;t=tournaments&amp;c=tccc03_sched"><img src="/i/tournament/tccc03/tccc03_home.gif" alt="" width="110" height="90" border="0" /></a></td>
                    <td width="50%" align="left"><a href="/?&amp;t=tournaments&amp;c=tccc03_sched"><img src="/i/tournament/tccc03/sun03_home.gif" alt="Sun Microsystems" width="135" height="90" border="0" /></a></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
                    <td class="bodyText" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/>
                        <p><strong>Please read all instructions carefully before proceeding.</strong></p>

                        <p>
                            Congratulations on your performance in the 2003 Sun Microsystems and TopCoder Collegiate Challenge! You are eligible for a
                            cash award of at least $50.  If you are a resident of a country that we do not pay cash prizes to, then your prize
                            will be donated to a charity of your choice in your name.  In order for you or your charity to receive your prize, you MUST complete the
                            APPROPRIATE items below by Midnight, Eastern Time, Monday, April 14th: IF WE DO NOT RECEIVE ALL OF THE APPROPRIATE ITEMS
                            BY 12:00 PM EST ON FRIDAY, MARCH 28th, 2003, YOU WILL FORFEIT YOUR PRIZE.  If you are one of the final 16 and have
                            been invited to the on site semifinals in Cambridge, MA, then you must complete item #4, the Travel Info Page, before
                            Midnight, Eastern Time, Monday, April 14th.  If you have questions, please contact <a href="mailto:mluce@topcoder.com" >MaryBeth Luce</a>.
                        </p>

                        <ol>
                            <li>
                                <p><strong>To be completed by everyone:</strong></p>
                                <p><strong>AFFIDAVIT</strong> - must be postmarked on or before Midnight, Eastern Time, Monday, April 14th</p>
                                <p>
                                <xsl:choose>
                                    <xsl:when test="number(/TC/AFFIDAVIT/Affidavit/Info/has_notarized_affidavit)=0">
                                        We do not have a notarized affidavit from you on file. View a <a href="/?&amp;t=affidavit&amp;c=2003_collegiate_affidavit">
                                        printable version</a> of your affidavit.  This affidavit must be notarized and returned to us at the address below.
                                    </xsl:when>
                                    <xsl:otherwise>
                                        View a <a href="/?&amp;t=affidavit&amp;c=2003_collegiate_affidavit">printable version</a> of your affidavit.  Please read
                                        the affidavit, sign it and return it to us at the address below.  Note that you do not have to have this affidavit
                                        notarized because we already have a notorized affidavit on file for you.
                                    </xsl:otherwise>
                                </xsl:choose>
                                </p>
                            </li>
                            <li>
                                <p><strong>To be completed by everyone:</strong></p>

                                <p>
                                    <strong>2003 TOPCODER COLLEGIATE CHALLENGE QUESTIONNAIRE</strong> - Form must be completed by Midnight, Eastern Time, Monday, April 14th:
                                    View the <a href="/?&amp;t=affidavit&amp;c=2003_collegiate_questionaire">2003 TopCoder Collegiate Challenge Questionnaire</a>.  Complete ALL questions.
                                </p>
                            </li>
                            <li>
                                <p><strong>To be completed by those who will personally receive a cash prize:</strong></p>
                                <p><strong>TAX FORM</strong> - must be postmarked on or before Midnight, Eastern Time, Monday, April 14th:</p>
                                <xsl:choose>
                                    <xsl:when test="number(/TC/AFFIDAVIT/Affidavit/Info/has_tax_form)=0">
                                        <p>You must complete, sign and return the appropriate tax form (Form W-9 or Form W-8BEN) to the address below.  If you don't know the form 
                                        that applies to you, please refer to the instructions below:</p>
                                        
                                        <p><strong>Instructions</strong><br/>
                                        Form W-9 Instructions: <a href="/contest/iw9.pdf">here (W9)</a><br/>
                                        Form W-8BEN Instructions: <a href="/contest/iw8ben.pdf">here (W8)</a></p> 

                                        <p><strong>Tax Forms</strong><br/>
                                        Form W-9 <a href="/contest/fw9.pdf">here (W9)</a><br/>
                                        Form W-8BEN <a href="/contest/fw8ben.pdf">here (W8)</a></p>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        We already have your tax form on file.  You do NOT need to complete and return another form.
                                    </xsl:otherwise>
                                </xsl:choose>
                            </li>
                            <li>
                                <p><strong>To be completed by those who will be traveling to the onsite semifinal rounds on April 4th and 5th in Cambridge, MA in the USA.</strong></p>
                                <p><strong>TRAVEL INFORMATION PAGE</strong> - form must be completed by Midnight, Eastern Time, Monday, April 14th:</p>
            
                                <p>View the <a href="/?&amp;t=affidavit&amp;c=2003_collegiate_travel_info">Travel Information Page.</a> Complete ALL questions.</p>
                            </li>
                            <li>
                                <p><strong>To be completed by those who will be traveling to the onsite semifinal rounds on April 4th and 5th in Cambridge, MA in the USA.</strong></p>
                                <p><strong>HEAD SHOT</strong> - must be emailed by Midnight, Eastern Time, Monday, April 14th:</p>
                                <xsl:choose>
                                    <xsl:when test="number(/TC/AFFIDAVIT/Affidavit/Info/has_image)=0">
                                        <p>We do not have your headshot on file.  Click below to submit your headshot.</p>
                                        <div align="center"><a><xsl:attribute name="HREF">mailto:memberphotos@topcoder.com?subject=<xsl:value-of select="/TC/ActivationCode"/>%20|%20[%20<xsl:value-of select="/TC/Handle"/>%20]%20|%20<xsl:value-of select="/TC/UserId"/>%20SUBMIT%20IMAGE:%20PLEASE%20DO%20NOT%20CHANGE%20SUBJECT</xsl:attribute><img src="/i/m/nophoto_submit.gif" width="126" height="140" border="0"/></a></div>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        We have a head shot on file. If you'd like to change it click <a><xsl:attribute name="HREF">mailto:memberphotos@topcoder.com?subject=<xsl:value-of select="/TC/ActivationCode"/>%20|%20[%20<xsl:value-of select="/TC/Handle"/>%20]%20|%20<xsl:value-of select="/TC/UserId"/>%20RE-SUBMIT%20IMAGE:%20PLEASE%20DO%20NOT%20CHANGE%20SUBJECT</xsl:attribute>here</a>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </li>
                        </ol>
                        
                        <div align="center"> 
                            TopCoder Attn: MaryBeth Luce<br/>
                            703 Hebron Avenue<br/>
                            Glastonbury, CT 06033
                        </div>
                        
                        <p><strong>Reminder, you will not receive any prize money unless all necessary items above are completed by Midnight, Eastern Time, Monday, April 14th.  Any
                        items that need to be mailed via the postal service must be postmarked by this date.</strong></p>

                        <p>If you have questions, please contact <a href="mailto:mluce@topcoder.com" >MaryBeth Luce</a>.</p>
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
            <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><A HREF="/?&amp;t=affidavit&amp;c=2003_collegiate_affidavit" CLASS="bodyText">get affidavit</A></TD></TR>
          </TABLE>
-->
                        <p><br/></p>
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
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="public_right_col"/>       
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
