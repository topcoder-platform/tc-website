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

<body  bgcolor="#FFFFFF" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">

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
                <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc04&amp;d3=tccc04_about" target="_top"><img src="/i/tournament/tccc04/tccc04_home_banner2.gif" alt="2004 TopCoder Collegiate Challenge" width="540" height="99" border="0"/></A><br/>
                <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br/>
            </div>
<!-- TCO Head Ends -->

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
                    <td class="bodyText" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/>
                        <p><font color="#CC0000"><strong>IMPORTANT INFORMATION NEEDED</strong></font></p>
                        <p><strong>Please read all instructions carefully before proceeding.</strong></p>

                        <p>
                            Congratulations on your performance in the 2004 TopCoder Collegiate Challenge, sponsored by Yahoo!&#174;
                        </p>

                        <p><strong>A.  To be completed by everyone by 9:00 PM ET Wednesday, March 17:</strong></p>

                            <ol>
                                <li>
                                    <p><strong>UPDATE YOUR MEMBER PROFILE</strong> - your member profile <u>must be</u>
                                        accurate <u>and complete</u>.  You will not receive a cash prize or a t-shirt
                                        unless your profile is complete.
                                    </p>
                                </li>
                                <li>
                                <p>
                                    <strong>QUESTIONNAIRE</strong> - Form must be completed and submitted by 9:00 PM ET on Wednesday, March 17.
                                    View the <a href="/tc?&amp;module=ViewSurvey&amp;sid=202">2004 TopCoder Collegiate Challenge Questionnaire</a>.
                                    Complete ALL questions.  Please note that responses to the questions will be used in te TCCC program.
                                </p>
                                </li>
                            </ol>
                            <p><strong>B. To be completed only by those who will be traveling to the onsite semifinal rounds on April 15 &amp; 16 in Boston, MA, USA.</strong></p>
                            <ol>
                                <li>
                                <p><strong>TRAVEL INFORMATION PAGE</strong> - form must be completed and submitted by 9:00 PM ET on Wednesday, March 24.</p>

                                <p>View the <a href="/?&amp;t=affidavit&amp;c=2004_collegiate_comp_travel_info">Travel Information Page.</a> Complete ALL questions.</p>
                                </li>

                                <li>
                                <p><strong>AFFIDAVIT</strong> - must be postmarked on or before 9:00 PM ET on Wednesday, March 24.</p>
                                <p>
                                <xsl:choose>
                                    <xsl:when test="number(/TC/AFFIDAVIT/Affidavit/Info/has_notarized_affidavit)=0">
                                        We do not have a notarized affidavit from you on file. View a <a href="/?&amp;t=affidavit&amp;c=2004_collegiate_comp_affidavit">
                                        printable version</a> of your affidavit.  This affidavit must be notarized and returned to us at the address below.
                                    </xsl:when>
                                    <xsl:otherwise>
                                        View a <a href="/?&amp;t=affidavit&amp;c=2004_collegiate_comp_affidavit">printable version</a> of your affidavit.  Please read
                                        the affidavit, sign it and return it to us at the address below.  Note that you do not have to have this affidavit
                                        notarized because we already have a notorized affidavit on file for you.
                                    </xsl:otherwise>
                                </xsl:choose>
                                </p>
                                </li>


                                <li>
                                <p><strong>TAX FORM</strong> - must be faxed to (860.657.4276) or postmarked on or before 9:00 PM ET on Wednesday, March 24.</p>
                                <xsl:choose>
                                    <xsl:when test="number(/TC/AFFIDAVIT/Affidavit/Info/has_tax_form)=0">
                                        <p>You must complete, sign and return the appropriate tax form (Form W-9 or Form W-8BEN) via fax or mail to the address below.  If you don't know the form
                                        that applies to you, please refer to the instructions below:</p>

                                        <p>Instructions<br/>
                                        Form W-9 Instructions: <a href="/contest/iw9.pdf">here (W9)</a><br/>
                                        Form W-8BEN Instructions: <a href="/contest/iw8ben.pdf">here (W8)</a></p>

                                        <p>Tax Forms<br/>
                                        Form W-9 <a href="/contest/fw9.pdf">here (W9)</a><br/>
                                        Form W-8BEN <a href="/contest/fw8ben.pdf">here (W8)</a></p>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        We already have your tax form on file.  You do NOT need to complete and return another form.
                                    </xsl:otherwise>
                                </xsl:choose>
                                </li>


                                <li>
                                <p><strong>HEAD SHOT</strong> - must be emailed by 9:00 PM ET on Wednesday, March 24.</p>
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
                            Address to send affidavits &amp; tax forms to:<br/>
                            TopCoder, Inc. <br/>
                            Attn: MaryBeth Luce<br/>
                            703 Hebron Avenue<br/>
                            Glastonbury, CT 06033
                        </div>

                        <p><strong>Reminder, you will not receive any prize money unless all necessary items above are completed by 9:00 PM ET on Wednesday, March 24.  Any
                        items that need to be mailed via the postal service must be received by this date.</strong></p>

                        <p>If you have questions, please contact <a href="mailto:mluce@topcoder.com" >MaryBeth Luce</a>.</p>
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
