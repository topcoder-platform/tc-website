<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <TITLE>TopCoder Tax Form FAQ</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <xsl:call-template name="Preload"/>
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <xsl:call-template name="Top"/>


        <!-- Body Begins -->
        <TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
          <TR>
            <!-- Left Column Begins -->
            <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0" ALT=""/></TD>
            <!-- Left Column Ends -->
            <!-- Gutter Begins -->
            <TD WIDTH="10" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="8" BORDER="0"/></TD>
            <!-- Gutter Ends -->
            <!-- Body Area -->
            <!-- Center Column Begins -->
            <TD class="bodyText" width="100%" bgcolor="#CCCCCC" valign="top">
              <IMG src="/i/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"/><BR/>
              <DIV CLASS="header">Frequently Asked Questions regarding Form W-9 and Form W-8BEN</DIV><br/><br/>
              <DIV CLASS="bodyText">



          <table width="619" cellspacing="0" cellpadding="0" border="0">
            <tr>
              <td valign="top" height="12"><img src="/images/spacer.gif" width="1" height="12" /></td>
            </tr>
            <tr>
              <td class="bodyText">
1.  Which form do I need to complete?
<br/><br/>
Form W-9 is required to be completed by U.S. persons, including U.S. citizens and resident aliens, to:
<ul>
  <li>certify that the tax identification number (TIN) you are giving is correct; </li>
  <li>certify you are not subject to backup withholding; or </li>
  <li>claim exemption from backup withholding if you are a U.S. exempt payee.</li>
</ul>
Form W-8BEN is required to be completed by foreign persons who are:
<ul>
<li>NOT U.S. citizens, and</li>
<li>NOT U.S. resident aliens.</li>
</ul>
NOTE:  TopCoder CAN NOT tell you whether you are considered a U.S. citizen or a U.S. resident alien.
<br/><br/>
IT IS YOUR RESPONSIBILITY TO DETERMINE WHICH FORM APPLIES TO YOU.  TOPCODER CAN NOT PROVIDE ANY GUIDANCE ON WHICH FORM YOU SHOULD COMPLETE.
<br/><br/>
If you have further questions regarding which form you should complete, refer to the Instructions for each form, or consult an attorney or other expert for advice.
              </td>
            </tr>
            <tr>
              <td valign="top" height="25"><img src="/images/spacer.gif" width="1" height="25" /></td>
            </tr>
            <tr>
              <td width="619" align="left" class="bodyText">
                  <b>Form W-9</b>
              </td>
            </tr>
            <tr>
              <td valign="top" height="12"><img src="/images/spacer.gif" width="1" height="12" /></td>
            </tr>
            <tr>
              <td class="bodyText">
2.  Why do I need to complete this form?
<br/><br/>
TopCoder must get your correct TIN to report to the IRS income paid to you.
<br/><br/>
If you provide TopCoder with your correct TIN, make the proper certifications, and report all your taxable interest and dividends on your tax return, payments you receive from TopCo
der will not be subject to backup withholding (currently at a rate of 30.5%).
<br/><br/>
Payments you receive from TopCoder will be subject to backup withholdings if certain circumstances exist.  (See Form W-9 for the list of circumstances that would require TopCoder to
 withhold taxes on your winnings.)
              </td>
            </tr>
            <tr>
              <td valign="top" height="25"><img src="/images/spacer.gif" width="1" height="25" /></td>
            </tr>
            <tr>
              <td width="619" align="left" class="bodyText">
                  <b>Form W-8BEN</b>
              </td>
            </tr>
            <tr>
              <td valign="top" height="12"><img src="/images/spacer.gif" width="1" height="12" /></td>
            </tr>
            <tr>
              <td class="bodyText">
3.   Why do I need to complete this form?
<br/><br/>
Foreign persons are subject to U.S. tax at a rate of 30% on certain sources of U.S. income, including prize money won in competitions.  This tax is imposed on the gross amount paid 
and is collected by withholding on that amount.
<br/><br/>
If you receive certain types of income, including prize money won in TopCoder competitions, you must provide a Form W-8BEN to:
<ul>
  <li>Establish that you are not a U.S. person</li>
  <li>Claim that you are the beneficial owner of the income for which Form W-8BEN is being provided; and</li>
  <li>If applicable, claim a reduced rate of, or exemption from, withholding as a resident of a foreign country with which the U.S. has an income tax treaty. </li>
</ul>
If you do not claim a reduced rate of, or exemption from, withholding as a resident of a foreign country with which the U.S. has an income tax, TopCoder will withhold tax on your wi
nnings.
<br/><br/>
TOPCODER CAN NOT TELL YOU WHETHER THE COUNTRY YOU ARE A RESIDENT OF HAS AN INCOME TAX TREATY WITH THE U.S.  FURTHERMORE, TOPCODER WILL NOT ASSIST YOU IN DETERMINING YOUR ABILITY TO 
CLAIM A REDUCED RATE OF, OR EXEMPTION FROM, WITHHOLDINGS.
<br/><br/>
4.  Am I required to provide a tax identification number (TIN)?
<br/><br/>
You are only required to provide a tax identification number if you are claiming a reduced rate of, or exemption from, withholding as a resident of a foreign country with which the 
U.S. has an income tax treaty.  (If you complete Part II of Form W-8BEN, you must provide a U.S. TIN.)
<br/><br/>
If you are not claiming a reduce rate of, or exemption from, withholding, you do not need to furnish a TIN on line
              </td>
            </tr>
          </table>



              </DIV>
            </TD>
            <!-- Center Column Ends -->
            <!-- Body Area Ends -->
       
            <!-- Gutter -->
            <TD WIDTH="10" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
            <!-- Gutter Ends -->
            <!-- Right Column Begins -->
            <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/></TD>
      
            <!-- Right Column Include Begins -->
            <!-- Gutter -->
              <TD WIDTH="10" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1"/></TD>
              <!-- Gutter Ends -->
            <!-- Right Column Begins -->
            <TD WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1"/><BR/></TD>
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
