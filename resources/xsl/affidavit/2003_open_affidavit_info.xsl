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
<xsl:call-template name="tco03_head"/>
<!-- TCO Head Ends -->

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
                    <td class="bodyText" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/>
                        <p><font color="#CC0000"><strong>IMPORTANT INFORMATION NEEDED</strong></font></p>
                        <p><strong>Please read all instructions carefully before proceeding.</strong></p>

                        <p>
                            Congratulations on your performance in the 2003 TopCoder Open Sponsored by Intel&#174;!
                            You are eligible for a cash award of at least $25, however we must receive the documents
                            below for you to collect your prize. IF WE DO NOT RECEIVE ALL OF THE
                            APPROPRIATE ITEMS BELOW BY MIDNIGHT, EASTERN TIME, WEDNESDAY, NOVEMBER 12th, YOU
                            WILL FORFEIT YOUR PRIZE.  If you have questions, please contact <a href="mailto:tlongo@topcoder.com" >Tom Longo</a>.
                        </p>

                        <p><strong>A.  To be completed by everyone:</strong></p>

                            <ol>
                                <li>
                                <p><strong>AFFIDAVIT</strong> - must be postmarked on or before Midnight, Eastern Time, Wednesday, November 12th.</p>
                                <p>
                                <xsl:choose>
                                    <xsl:when test="number(/TC/AFFIDAVIT/Affidavit/Info/has_notarized_affidavit)=0">
                                        We do not have a notarized affidavit from you on file. View a <a href="/?&amp;t=affidavit&amp;c=2003_open_affidavit">
                                        printable version</a> of your affidavit.  This affidavit must be notarized and returned to us at the address below.
                                    </xsl:when>
                                    <xsl:otherwise>
                                        View a <a href="/?&amp;t=affidavit&amp;c=2003_open_affidavit">printable version</a> of your affidavit.  Please read
                                        the affidavit, sign it and return it to us at the address below.  Note that you do not have to have this affidavit
                                        notarized because we already have a notorized affidavit on file for you.
                                    </xsl:otherwise>
                                </xsl:choose>
                                </p>
                                </li>
                                <li>
                                <p>
                                    <strong>2003 TOPCODER OPEN QUESTIONNAIRE</strong> - Form must be completed and submitted by Midnight, Eastern Time, Wednesday, Novemeber 12th:
                                    View the <a href="/tc?&amp;module=ViewSurvey&amp;sid=201">2003 TopCoder Open Questionnaire</a>.  Complete ALL questions.
                                </p>
                                </li>
                                <li>
                                <p><strong>TAX FORM</strong> - must be faxed to (860.657.4276) or postmarked on or before Midnight, Eastern Time, Wednesday, November 12th:</p>
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
                            </ol>
                            <p><strong>B. To be completed only by those who will be traveling to the onsite semifinal rounds on December 4th and 5th in Uncasville, CT in the USA.</strong></p>
                            <ol>
                                <li>
                                <p><strong>TRAVEL INFORMATION PAGE</strong> - form must be completed and submitted by Midnight, Eastern Time, Wednesday, November 12th:</p>

                                <p>View the <a href="/?&amp;t=affidavit&amp;c=2003_open_travel_info">Travel Information Page.</a> Complete ALL questions.</p>
                                </li>

                                <li>
                                <p><strong>HEAD SHOT</strong> - must be emailed by Midnight, Eastern Time, November, November 12th:</p>
                                <xsl:choose>
                                    <xsl:when test="number(/TC/AFFIDAVIT/Affidavit/Info/has_image)=0">
                                        <p>We do not have your headshot on file.  Click below to submit your headshot.</p>
                                        <div align="center"><a><xsl:attribute name="HREF">mailto:memberphotos@topcoder.com?subject=<xsl:value-of select="/TC/ActivationCode"/> | [ <xsl:value-of select="/TC/Handle"/> ] | <xsl:value-of select="/TC/UserId"/> SUBMIT IMAGE: PLEASE DO NOT CHANGE SUBJECT</xsl:attribute><img src="/i/m/nophoto_submit.gif" width="126" height="140" border="0"/></a></div>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        We have a head shot on file. If you'd like to change it click <a><xsl:attribute name="HREF">mailto:memberphotos@topcoder.com?subject=<xsl:value-of select="/TC/ActivationCode"/> | [ <xsl:value-of select="/TC/Handle"/> ] | <xsl:value-of select="/TC/UserId"/> RE-SUBMIT IMAGE: PLEASE DO NOT CHANGE SUBJECT</xsl:attribute>here</a>
                                    </xsl:otherwise>
                                </xsl:choose>
                                </li>
                            </ol>
                        <div align="center">
                            Address to send affidavits &amp; tax forms to:
                            TopCoder Attn: Tom Longo<br/>
                            703 Hebron Avenue<br/>
                            Glastonbury, CT 06033
                        </div>

                        <p><strong>Reminder, you will not receive any prize money unless all necessary items above are completed by Midnight, Eastern Time, Wednesday, November 12th.  Any
                        items that need to be mailed via the postal service must be postmarked by this date.</strong></p>

                        <p>If you have questions, please contact <a href="mailto:tlongo@topcoder.com" >Tom Longo</a>.</p>
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
