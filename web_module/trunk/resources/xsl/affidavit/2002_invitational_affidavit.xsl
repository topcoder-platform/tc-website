<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <TITLE>AFFIDAVIT OF ELIGIBILITY/LIABILITY &amp; PUBLICITY RELEASE</TITLE>
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
p.MsoHeader, li.MsoHeader, div.MsoHeader
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
p.MsoFooter, li.MsoFooter, div.MsoFooter
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.Section1
	{page:Section1;}
 /* List Definitions */
 ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
-->
</style>

      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <TABLE WIDTH="100%" HEIGHT="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#FFFFFF">
            <TR><TD VALIGN="middle" CLASS="bodyText" ><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" >blah blah blah blah blah</TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" >has notorized affidavit <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/has_notarized_affidavit"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" >has tax form <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/has_tax_form"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" >has image <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/has_image"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" >handle <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/handle"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" >first name <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/first_name"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" >last name <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/last_name"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" >email <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/email"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" >address1 <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/address1"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" >address2 <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/address2"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" >city <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/city"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" >state code <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/stat_code"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" >zip <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/zip"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" >country <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/country_name"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" >home phone <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/home_phone"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" >work phone <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/work_phone"/></TD></TR>
            <TR><TD VALIGN="middle" CLASS="bodyText" >coder_type <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/coder_type_desc"/></TD></TR>
          <xsl:for-each select="/TC/AFFIDAVIT/Demographics/Demographic">
            <TR>
              <TD WIDTH="100%" BGCOLOR="#FFFFFF" VALIGN="top">
                <xsl:value-of select="demographic_question_text"/> -------- <xsl:value-of select="demographic_answer_text"/>
              </TD>
            </TR>
          </xsl:for-each>

        </TABLE>


<div class=Section1>

<p class=MsoNormal align=center style='text-align:center'><b><span
style='layout-grid-mode:line'>AFFIDAVIT OF ELIGIBILITY</span></b></p>

<p class=MsoNormal align=center style='text-align:center'><b><span
style='layout-grid-mode:line'>and</span></b></p>

<p class=MsoNormal align=center style='text-align:center'><b><span
style='layout-grid-mode:line'>LIABILITY AND PUBLICITY RELEASE</span></b></p>

<p class=MsoNormal><b><span style='layout-grid-mode:line'>&nbsp;</span></b></p>

<p class=MsoNormal align=center style='text-align:center'><b><span
style='layout-grid-mode:line'>2002 TopCoder Invitational </span></b></p>

<p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>

<p class=MsoNormal><span style='layout-grid-mode:line'>I, _________, hereby
state:  I am at least 18 years of age.  My date of birth is _________.  I
hereby represent I am either:</span></p>

<p class=MsoNormal style='margin-left:54.75pt;text-indent:-18.75pt'><span
style='layout-grid-mode:line'>(a)<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
</span></span><span style='layout-grid-mode:line'>a U.S.* citizen;</span></p>

<p class=MsoNormal style='margin-left:54.75pt;text-indent:-18.75pt'><span
style='layout-grid-mode:line'>(b)<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
</span></span><span style='layout-grid-mode:line'>a lawful permanent resident
of the U.S.*;</span></p>

<p class=MsoNormal style='margin-left:54.75pt;text-indent:-18.75pt'><span
style='layout-grid-mode:line'>(c)<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
</span></span><span style='layout-grid-mode:line'>a non-immigrant residing in
the U.S.* with a  valid visa; or</span></p>

<p class=MsoNormal style='margin-left:54.75pt;text-indent:-18.75pt'><span
style='layout-grid-mode:line'>(d)<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
</span></span><span style='layout-grid-mode:line'>a citizen or legal permanent
resident of one of the following countries:</span></p>

<p class=MsoNormal style='margin-left:1.25in;text-indent:-.25in'><span
style='layout-grid-mode:line'>a.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><span style='layout-grid-mode:line'>Australia</span></p>

<p class=MsoNormal style='margin-left:1.25in;text-indent:-.25in'><span
style='layout-grid-mode:line'>b.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><span style='layout-grid-mode:line'>Canada (but not Quebec)</span></p>

<p class=MsoNormal style='margin-left:1.25in;text-indent:-.25in'><span
style='layout-grid-mode:line'>c.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><span style='layout-grid-mode:line'>China </span></p>

<p class=MsoNormal style='margin-left:1.25in;text-indent:-.25in'><span
style='layout-grid-mode:line'>d.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><span style='layout-grid-mode:line'>India</span></p>

<p class=MsoNormal style='margin-left:1.25in;text-indent:-.25in'><span
style='layout-grid-mode:line'>e.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><span style='layout-grid-mode:line'>New Zealand</span></p>

<p class=MsoNormal style='margin-left:1.25in;text-indent:-.25in'><span
style='layout-grid-mode:line'>f.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><span style='layout-grid-mode:line'>the United Kingdom</span></p>

<p class=MsoNormal style='margin-left:1.25in;text-indent:-.25in'><span
style='layout-grid-mode:line'>g.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><span style='layout-grid-mode:line'>Ireland</span></p>

<p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>

<p class=MsoNormal><span style='font-size:10.0pt;layout-grid-mode:line'>(*Including
the U.S. territories of Guam, Puerto Rico, and the U.S. Virgin Islands.)</span></p>

<p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>

<p class=MsoNormal><span style='layout-grid-mode:line'>I am submitting this
affidavit with the understanding that it will be relied upon to determine my
eligibility to receive the prize for which my entry has been submitted in the
2002 TopCoder Invitational (the “Contest”).</span></p>

<p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>

<p class=MsoNormal><span style='layout-grid-mode:line'>I hereby represent that
I am 18 years of age or older and that I have complied with, and will continue
to comply with, all the rules and regulations of this Contest and that I have
perpetrated no fraud or deception in entering the Contest or in claiming any
prize that may be awarded to me.  I hereby represent further that my
performance in the Contest is a result of my efforts alone and all ideas for
code or challenges submitted by me during the course of the Contest were mine
alone. </span></p>

<p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>

<p class=MsoNormal><span style='layout-grid-mode:line'>Further, I represent
that the following information contained in TopCoder’s member database
represents my personal, identifying information, and that such information is
true, accurate and comprehensive:</span></p>

<p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>

<p class=MsoNormal><span style='layout-grid-mode:line'>[INSERT DEMOGRAPHIC
INFORMATION CONTAINED IN DATABASE]</span></p>

<p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>

<p class=MsoNormal><span style='layout-grid-mode:line'>I also represent that
neither I nor any member of my immediate family, nor anyone living in my
household, is an employee of TopCoder, Inc. (“TopCoder”) or any entity that is
involved in the development, production (including prize suppliers),
implementation or distribution of the Contest or their advertising, marketing,
public relations and promotion agencies (the “Sponsors”), or any of their
parent corporations, subsidiaries, affiliates, agents, assigns, etc. or any
entity connected with this Contest, and that neither I nor any immediate family
member nor anyone living in my household is connected with any of the above.   </span></p>

<p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>

<p class=MsoNormal><span style='layout-grid-mode:line'>I understand that
neither TopCoder, the Sponsors nor their parent corporations, subsidiaries,
affiliates, agents, assigns, etc. or any entity connected with this Contest
will be responsible for any costs (including, without limitation, any federal,
state or local taxes) I may incur in connection with this Contest or any prize
I may be awarded, including the applicable taxes associated with the benefit of
a guest of my choice attending the Contest.  However, I understand that
TopCoder may make withholdings from any prize that I may be awarded in order to
comply with applicable tax laws.  I agree to sign any applicable forms
necessary to distribute the prize as required by tax authorities. </span></p>

<p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>

<p class=MsoNormal><span style='layout-grid-mode:line'>I hereby authorize
TopCoder and the Sponsors to publicize the Contest results, including my handle
or name.  I hereby grant to TopCoder and the Sponsors the absolute right and
permission to use my name, address (city and state), testimonial statement </span>(or
statements in different words which have substantially the same meaning)<span
style='layout-grid-mode:line'>, voice, photograph and/or other likeness in any
and all advertising and promotional materials, or to refrain from doing so, in
any manner or media whatsoever, worldwide, for advertising and promotional
purposes in conjunction with this and similar Contests without notice to me and
without further compensation.  I shall have no right of approval, no claim to
any compensation, and no claim arising out of the use, alteration, distortion
or illusionary effect or use in any composite form of my name, address,
testimonial statement, voice, photograph or likeness. </span></p>

<p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>

<p class=MsoNormal>I understand that TopCoder owns all photographs of me taken
by TopCoder and TopCoder may copyright material containing such photographs.</p>

<p class=MsoNormal>&nbsp;</p>

<p class=MsoNormal>I hereby agree that if I am contacted by a third-party
regarding employment opportunities and/or media interest as a result of my
participation in the Contest, I will promptly notify TopCoder of such contact
and will cooperate with TopCoder’s efforts to reach the contacting party.</p>

<p class=MsoNormal>&nbsp;</p>

<p class=MsoNormal>I understand that I retain any rights to ownership in any
materials posted, uploaded or otherwise sent to TopCoder or its Web site;
TopCoder will not gain ownership rights to this material.  I also understand
that by posting, uploading or otherwise sending any source code to TopCoder or
its Web site, I grant (or warrant that the owner of such rights has expressly
granted) to TopCoder a perpetual, royalty-free, irrevocable, non-exclusive
right and license to use, reproduce and publish such code into any form, medium
or technology. With respect to any other material posted, uploaded or otherwise
sent, I grant (or warrant that the owner of such rights has expressly granted)
TopCoder the same license as pertains to source code with the additional
license to modify, adapt, translate, create derivative works from, and
distribute such materials or incorporate such materials into any form, medium
or technology. </p>

<p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>

<p class=MsoNormal><span style='layout-grid-mode:line'>I understand and
acknowledge and hereby waive and release any and all rights, demands, losses,
liabilities, claims and causes of action whatsoever which I may now or
hereafter be entitled to assert, including, but not limited to, any death,
injury, loss of enjoyment or other harm or loss of any nature whatsoever caused
by, contributed to, or arising out of any prize awarded to me in this Contest. 
I understand that neither TopCoder nor the Sponsors will obtain insurance on my
behalf, and I am fully responsible for obtaining my own insurance, should I
desire it.</span></p>

<p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>

<p class=MsoNormal><span style='layout-grid-mode:line'>I understand that I will
be disqualified from receiving and agree to return to TopCoder any prize which
may be awarded to me if any statement made by me in this affidavit is false and
I agree to return immediately upon demand to TopCoder any prize, or at the
election of TopCoder the value of such prize, which has been or may have been
awarded to me if any statement made by me in this affidavit is false.  I state
further that I have read the above publicity and liability release prior to its
execution, and that I fully understand its contents.   </span></p>

<p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>

<p class=MsoNormal align=center style='text-align:center'><span
style='layout-grid-mode:line'>[REMAINDER OF PAGE INTENTIONALLY LEFT BLANK]</span></p>

<p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>

<span style='font-size:12.0pt;font-family:"Times New Roman";layout-grid-mode:
line'><br clear=all style='page-break-before:always'>
</span>

<p class=MsoNormal><span style='layout-grid-mode:line'>It is understood and
agreed that this is a complete RELEASE and DISCHARGE of all claims and rights
of the undersigned against TopCoder and the Sponsors and that no action will be
taken by or on behalf of the undersigned with respect to any such rights, it
being understood that this release shall be binding upon the heirs, executors,
and administrators of the undersigned.  </span></p>

<p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>

<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
 style='border-collapse:collapse'>
 <tr>
  <td width=265 valign=top style='width:198.9pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal><span style='layout-grid-mode:line'>_____________________________</span></p>
  </td>
  <td width=72 valign=top style='width:.75in;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal><span style='layout-grid-mode:line'>Name:</span></p>
  </td>
  <td width=294 valign=top style='width:220.5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal><span style='layout-grid-mode:line'>____________________________</span></p>
  </td>
 </tr>
 <tr>
  <td width=265 valign=top style='width:198.9pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal><span style='layout-grid-mode:line'>(Signature of
  &lt;NAME&gt;)</span></p>
  </td>
  <td width=72 valign=top style='width:.75in;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>
  </td>
  <td width=294 valign=top style='width:220.5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal><span style='layout-grid-mode:line'>(Please print)</span></p>
  </td>
 </tr>
 <tr>
  <td width=265 valign=top style='width:198.9pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>
  </td>
  <td width=72 valign=top style='width:.75in;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>
  </td>
  <td width=294 valign=top style='width:220.5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>
  </td>
 </tr>
 <tr>
  <td width=265 valign=top style='width:198.9pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>
  </td>
  <td width=72 valign=top style='width:.75in;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>
  </td>
  <td width=294 valign=top style='width:220.5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>
  </td>
 </tr>
 <tr>
  <td width=265 valign=top style='width:198.9pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>
  </td>
  <td width=72 valign=top style='width:.75in;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>
  </td>
  <td width=294 valign=top style='width:220.5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>
  </td>
 </tr>
</table>

<p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>

<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
 style='border-collapse:collapse'>
 <tr>
  <td width=187 valign=top style='width:1.95in;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal><span style='layout-grid-mode:line'>STATE OF</span></p>
  </td>
  <td width=120 valign=top style='width:1.25in;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal><span style='layout-grid-mode:line'>)</span></p>
  </td>
  <td width=331 valign=top style='width:3.45in;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>
  </td>
 </tr>
 <tr>
  <td width=187 valign=top style='width:1.95in;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>
  </td>
  <td width=120 valign=top style='width:1.25in;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal><span style='layout-grid-mode:line'>)</span></p>
  </td>
  <td width=331 valign=top style='width:3.45in;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal><span style='layout-grid-mode:line'>ss.:</span></p>
  </td>
 </tr>
 <tr>
  <td width=187 valign=top style='width:1.95in;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal><span style='layout-grid-mode:line'>COUNTY OF</span></p>
  </td>
  <td width=120 valign=top style='width:1.25in;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal><span style='layout-grid-mode:line'>)</span></p>
  </td>
  <td width=331 valign=top style='width:3.45in;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>
  </td>
 </tr>
</table>

<p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>

<p class=MsoNormal><span style='layout-grid-mode:line'>On this ___ day of
________, 2002, before me, ____________________, (notary name) personally
appeared ____________________ (name of contestant) to me personally known, who,
being by me duly sworn, did depose and say that he/she signed the foregoing
instrument and he/she acknowledged the same to be his/her free act and deed.</span></p>

<p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>

<p class=MsoNormal><span style='layout-grid-mode:line'>&nbsp;</span></p>

<p class=MsoNormal style='margin-left:2.5in;text-indent:.5in'><span
style='layout-grid-mode:line'>_____________________________</span></p>

<p class=MsoNormal style='margin-left:2.5in;text-indent:.5in'><span
style='layout-grid-mode:line'>NOTARY PUBLIC</span></p>

</div>





      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
