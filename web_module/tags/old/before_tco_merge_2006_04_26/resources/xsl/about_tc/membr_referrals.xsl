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
        <TITLE>TopCoder :: About TopCoder</TITLE>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
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
	<!-- Global Seconday Nav Begins -->		
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
  <xsl:with-param name="image">about_tc_membr</xsl:with-param>
  <xsl:with-param name="title">&#160;What are referrals?</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>
<!--body contextual links-->
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="150" ALIGN="right">
 	<TR>
        <TD ROWSPAN="5" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
                <TR> 
          			<TD COLSPAN="2" BGCOLOR="#999999" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD>
                </TR>
	            <TR>
                    <TD VALIGN="top" BGCOLOR="#999999" CLASS="moduleTitle">&#160; &#160;</TD>
		            <TD BGCOLOR="#999999" VALIGN="top" CLASS="moduleTitle">QUESTIONS?:</TD>
	            </TR>                    
	            <TR>
                    <TD COLSPAN="2" VALIGN="top" BGCOLOR="#999999">
					<TABLE BORDER="0" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#FFFFFF">
						<TR>
							<TD VALIGN="top" CLASS="smallText">&#160;&#160;</TD>
							<TD COLSPAN="2" VALIGN="top" CLASS="bodyText"><A HREF="mailto:service@topcoder.com" CLASS="bodyText">Contact member services</A></TD>
						</TR>
						<TR><TD VALIGN="top" COLSPAN="3" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>    		
					</TABLE>
		          	</TD>
        		</TR>
 	<TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>
<!--end contextual links-->
<P>The TopCoder Referral Incentive Program is designed to increase the number of quality coders who participate in TopCoder competitions, and to reward those of our members who spread the word.  Here's how it works:</P>
<P>On the member registration page, there is a "Referring Member" field.  If you convince a fellow coder to register with TopCoder, you can ask him or her to provide your handle in the "Referring Member" field when they register on www.topcoder.com.</P>
<P>For a one-year period following the registration of a referral, the referring member (you) will receive a referral commission equal to 10% of any cash prize (or 10% of the value of any non-cash prize) that the referred member wins in the following year. Here are 2 examples:</P>
<P><B>Example #1</B></P>
<P>You refer 3 new members.  During the next year, each of the 3 members you referred wins $500 in Single Round Match prize money, totaling $1,500 in prize money awarded to the members you referred.  You will receive a commission for $150.</P>
<P><B>Example #2</B></P>
<P>You refer a new member who wins the grand prize of $100,000 in the TopCoder Invitational.  You will receive $10,000!!!</P>
<P>TopCoder will keep track of all member commissions earned during the year and pay them out at the end of each month.</P>
<P>The "Referring Member" field in the registration cannot be changed once the registration process has been completed.  Therefore, please ensure that any referred member provides the correct handle upon registering with TopCoder.</P>
<P>Non-profit groups can use the Referral Incentive Program as a fund-raiser for their organization.  Simply create a "member" with a "handle" that represents your group (i.e., the SWE group at MIT could be MITSWE).  All contact information (address, phone number, etc.) should be for the organization or chapter.  It should not represent an individual.  This handle should never be used for actual competition. Then, tell the members of your organization to sign up for TopCoder and to enter the handle representing your organization in the "Referring Member" field.  Now, whenever one of these members wins money, we will send your organization a check for 10% of the winnings!!</P>
<P><B>Checking on your referrals</B></P>
<P>The handle of every member you refer, along with his or her earnings history, will be available in the "My Features" portion of your member home page.</P>
<P><B>Official Rules</B></P>
<P>The Referral Incentive Program will apply only to those referred members who have registered with TopCoder after August 1, 2001 and prior to January 1st, 2003.</P>
<P>Any eligible TopCoder member whose TopCoder handle was provided in the "Referring Member" field of the TopCoder registration process after August 1, 2001 will be placed into the Referral Incentive Program.</P>
<P>TopCoder will pay a referral commission equal to 10% of any cash prize (or 10% of the value of any non-cash prize) won by a referred member during the 365-day period following the initial registration date of the referred member.  No additional referral compensation will be paid for referred member's winnings following the one-year anniversary of the referred member's registration. TopCoder and the donating sponsor will determine the value of any non-cash prize.</P>
<P>Referral compensation will only be paid to TopCoder members who meet the following citizenship requirements:<UL>
<LI>All US* Citizens</LI>
<LI>All Lawful Permanent Residents of the US (i.e., Green Card Holders)</LI>
<LI>All non-immigrants** currently residing in the US with a valid Visa</LI>
<LI>All Citizens and Legal Permanent Residents of the following countries:</LI><UL>
<LI>Canada, excluding Quebec</LI>
<LI>Australia</LI>
<LI>India</LI>
<LI>Ireland</LI>
<LI>United Kingdom</LI></UL></UL></P>
<P>* Including the US Territories of Guam, Puerto Rico and the US Virgin Islands<BR/>
** Non-immigrants refer to people who come to the US, but not permanently (i.e., they are not permanent residents)</P>
<P>The "Referring Member" field in the registration cannot be changed once the registration process has been completed.</P>
<P>In order for a referring member to receive referral compensation, they must complete and return an affidavit of eligibility.  The affidavit requires the member to verify their eligibility to participate in the Referral Incentive Program, and to provide his or her social security number for tax reporting purposes.</P>
<P>TopCoder strongly discourages members from "spamming" individuals with unsolicited emails in an attempt to entice people to register and compete at TopCoder.  Sending such unsolicited emails to people will not be tolerated, and such activity may lead to your termination from the TopCoder Referral Incentive Program.</P>
					</TD>
					<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
				</TR>   	
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
		<TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><br/>
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
