<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>Forms W-9 &amp; W-8BEN FAQ at TopCoder</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY>
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
	<TR>
    <!-- Left Column Begins -->
		<TD WIDTH="180" VALIGN="top">
<!-- Left Column Include Begins -->	
    <!-- Global Seconday Nav Begins -->	
        <xsl:call-template name="global_left"/>
	<!-- Global Seconday Nav Ends -->		
<!-- Left Column Include Ends -->							
	  	</TD>
	<!-- Left Column Ends -->
	<!-- Gutter Begins -->
		<TD WIDTH="4" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
	<!-- Center Column Begins -->	
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#FFFFFF" VALIGN="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">support</xsl:with-param>
  <xsl:with-param name="title">&#160;Forms W-9 &amp; W-8BEN FAQ</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
                   <BR/>
                   <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
                        <TR><TD VALIGN="middle" ALIGN="left"><A HREF="#1" CLASS="bodyText"><B>Which form do I need to complete?</B></A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#2" CLASS="bodyText"><B>Why do I need to complete Form W-9?</B></A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#3" CLASS="bodyText"><B>Why do I need to complete Form W-8BEN?</B></A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#4" CLASS="bodyText"><B>Am I required to provide a tax identification number (TIN)?</B></A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR>
                            <TD CLASS="bodyText">
                                    <B>More Questions? <A HREF="/?t=contacts&amp;c=index" CLASS="bodyText">Contact Us</A></B>
                            </TD>
                        </TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
                        <!--end questions-->
                        <!--begin answers-->
                        <TR><TD CLASS="bodyText"><A NAME="1"><B>Which form do I need to complete?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">
<P>Form W-9 is required to be completed by U.S. persons, including U.S. citizens and resident aliens, to:</P>
<P>
    <UL>
	<LI>certify that the tax identification number (TIN) you are giving is correct;</LI>
	<LI>certify you are not subject to backup withholding; or</LI>
	<LI>claim exemption from backup withholding if you are a U.S. exempt payee.</LI>
</UL>
</P>
<P>Form W-8BEN is required to be completed by foreign persons who are:</P>
<P>
<UL>
	<LI>NOT U.S. citizens, and</LI>
	<LI>NOT U.S. resident aliens.</LI>
</UL>
</P>
<P>NOTE: TopCoder CAN NOT tell you whether you are considered a U.S. citizen or a U.S. resident alien.</P>
<P>IT IS YOUR RESPONSIBILITY TO DETERMINE WHICH FORM APPLIES TO YOU. TOPCODER CAN NOT PROVIDE ANY GUIDANCE ON WHICH FORM YOU SHOULD COMPLETE.</P>
<P>If you have further questions regarding which form you should complete, refer to the Instructions for each form, or consult an attorney or other expert for advice.</P>
                        </TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
                        <TR><TD CLASS="bodyText"><A NAME="2"><B>Why do I need to complete Form W-9?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">
<P>TopCoder must get your correct TIN to report to the IRS income paid to you.</P>
<P>If you provide TopCoder with your correct TIN, make the proper certifications, and report all your taxable interest and dividends on your tax return, payments you receive from TopCoder will not be subject to backup withholding (currently at a rate of 30.5%).</P>
<P>Payments you receive from TopCoder will be subject to backup withholdings if certain circumstances exist. (See Form W-9 for the list of circumstances that would require TopCoder to withhold taxes on your winnings.)</P>
                        </TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
                        <TR><TD CLASS="bodyText"><A NAME="3"><B>Why do I need to complete Form W-8BEN?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">
<P> Foreign persons are subject to U.S. tax at a rate of 30% on certain sources of U.S. income, including prize money won in competitions. This tax is imposed on the gross amount paid and is collected by withholding on that amount.</P>
<P>If you receive certain types of income, including prize money won in TopCoder competitions, you must provide a Form W-8BEN to:</P>
<P>
<UL>
	<LI>Establish that you are not a U.S. person</LI>
	<LI>Claim that you are the beneficial owner of the income for which Form W-8BEN is being provided; and</LI>
	<LI>If applicable, claim a reduced rate of, or exemption from, withholding as a resident of a foreign country with which the U.S. has an income tax treaty.</LI>
</UL>
</P>
<P>If you do not claim a reduced rate of, or exemption from, withholding as a resident of a foreign country with which the U.S. has an income tax, TopCoder will withhold tax on your winnings.</P>
<P>TOPCODER CAN NOT TELL YOU WHETHER THE COUNTRY YOU ARE A RESIDENT OF HAS AN INCOME TAX TREATY WITH THE U.S. FURTHERMORE, TOPCODER WILL NOT ASSIST YOU IN DETERMINING YOUR ABILITY TO CLAIM A REDUCED RATE OF, OR EXEMPTION FROM, WITHHOLDINGS.</P>
                        </TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
                        <TR><TD CLASS="bodyText"><A NAME="4"><B>Am I required to provide a tax identification number (TIN)?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">
<P> You are only required to provide a tax identification number if you are claiming a reduced rate of, or exemption from, withholding as a resident of a foreign country with which the U.S. has an income tax treaty. (If you complete Part II of Form W-8BEN, you must provide a U.S. TIN.)</P>
<P>If you are not claiming a reduce rate of, or exemption from, withholding, you do not need to furnish a TIN on line.</P>
                      </TD></TR>
                        <TR><TD CLASS="bodyText" VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
                    </TABLE>
					<P><BR/></P>
					</TD>
					<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>
				<TR><TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>   	
				<TR>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>	
				<TR>
					<TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>
			</TABLE>
		</TD>
	<!-- Center Column Ends -->
<!-- Body Area Ends -->

	<!-- Gutter -->
		<TD WIDTH="4" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	<!-- Right Column Begins -->
		<TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>       
<!-- Right Column Include Ends -->       
        </TD>
	<!-- Right Column Ends -->
	<!-- Gutter -->
		<TD WIDTH="10" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	</TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>

