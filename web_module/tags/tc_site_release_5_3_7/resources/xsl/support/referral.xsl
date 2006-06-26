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
        <TITLE>TopCoder Referral Program</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY>
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="00" CELLSPACING="0">
	<TR>
    <!-- Left Column Begins -->
		<TD WIDTH="180" VALIGN="top">
<!-- Left Column Include Begins -->	
        <xsl:call-template name="global_left"/>
	  	</TD>
	<!-- Left Column Ends -->
	<!-- Gutter Begins -->
		<TD WIDTH="4" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
	<!-- Center Column Begins -->	
<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#FFFFFF" VALIGN="top" ALIGN="CENTER">
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="20" BGCOLOR="#FFFFFF" WIDTH="525">
	<TR>
		<TD CLASS="bodyText">
			<DIV ALIGN="CENTER"><IMG SRC="/i/referral_header.gif" WIDTH="510" HEIGHT="40" BORDER="0"/></DIV>
			<P><STRONG>The TopCoder Referral Program is designed to increase the number of
			top-performing coders who participate in TopCoder competitions, 
			and to reward those TopCoder members who spread the word.</STRONG></P>

			<TABLE>
				<TR>
					<TD CLASS="bodyText">
				
				
				
			<P><STRONG><font size="4">How it works</font></STRONG><BR/>
			On the member registration page, there is a "Referring Member" field. If you tell a fellow coder to register with TopCoder, 
			ask him or her to provide your handle in the "Referring Member" field.</P>

			<P>The referring member (you) will receive a referral commission equal to 10% of any 
			amounts earned or won by the referred member during the 12 months following registration.</P>


			<P>TopCoder will keep track of all member commissions earned and will pay them out at the end of each quarter. </P>
			</TD>
			<TD>
			
				<TABLE BORDER="0" CELLSPACING="1" CELLPADDING="5" BGCOLOR="#999999" WIDTH="200" ALIGN="RIGHT" STYLE="MARGIN-LEFT: 10PX; MARGIN-TOP: 0PX; MARGIN-RIGHT: 0PX; MARGIN-BOTTOM: 10PX;" >
					<TR>
						<TD CLASS="smallText" BGCOLOR="#EEEEEE">
						<P><STRONG>Example #1</STRONG><BR/>
						You refer 3 new members. During the next 12 months, each of the 3 members you referred wins $500 in component design and development 
						competitions, totaling $1,500 in prize money awarded. You will receive a commission of $150.</P>
						<P><STRONG>Example #2</STRONG><BR/>
						You refer a new member who wins one of the grand prizes of $25,000 in the TopCoder Open. You will receive $2,500!!! </P>
						</TD>
					</TR>
				</TABLE>
				
				</TD>
				</TR>
				</TABLE>


			<P>The "Referring Member" field in the registration cannot be changed once the registration process has been completed. 
			Therefore, please ensure that any referred member provides the correct handle upon registering with TopCoder.</P>

			<P><STRONG><font size="4">Official Rules</font></STRONG><BR/>
         Any eligible TopCoder member whose TopCoder handle was provided in the "Referring Member" field of the TopCoder registration process will be placed into the Referral Program.</P>

			<P>TopCoder will pay a referral commission equal to 10% of any amount earned or won by a referred member during the 365-day 
			period following the initial registration date of the referred member. No additional referral compensation will be paid 
			for a referred member's winnings following the one-year anniversary of the referred member's registration.  This includes amounts won during algorithm and component competitions, logo competitions, and amounts earned by referred members as Review Board members.</P>

			<P>To receive a referral commission, the TopCoder member must be 18 years of age or older and must not have been permanently 
			suspended from participating in TopCoder competitions.  Payment is contingent upon TopCoder receiving a completed affidavit 
			of eligibility, verifying the member's eligibility to participate in the Referral Program, and a completed appropriate tax form.</P>

			<P>The "Referring Member" field in the registration may not be changed once the registration process has been completed.</P>

			<P>TopCoder prohibits members from "spamming" individuals with unsolicited emails in an attempt to entice people 
			to register and participate at TopCoder. Sending such unsolicited emails may lead to your termination from the TopCoder Referral Program.</P>

			<P>TopCoder reserves the right to modify or cancel the TopCoder Referral Program at any time for any reason. TopCoder also reserves 
			the right to disqualify any TopCoder member from the TopCoder Referral Program at any time for any reason.</P>
		
		</TD>
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

