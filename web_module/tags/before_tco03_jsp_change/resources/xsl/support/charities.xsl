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
        <TITLE>Charity Donations at TopCoder</TITLE>
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
  <xsl:with-param name="title">&#160;Charity Donations</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/><BR/>
					  <P>
On Occasion, TopCoder will allow the substitution of prize money (during an event with a cash payment) with a charitable donation for any
					  members who are not eligible to receive prizes. The follow list of charities, based on the list of America's Top 100 Charities posted at worth.com,
					  are the charities to which TopCoder will allow donations in these circumstances.
</P>

					  <!-- Starting in February 2002, TopCoder will donate $500 of the total prize purse of each Single Round Match to one of the charities listed below. At the conclusion of each match, TopCoder will randomly select a room number.  The winner of that room will choose the charity to receive the donation.<BR/><BR/>
					  In the event of a tie in the room chosen, each winner will choose a charity.  The $500 will be split equally amongst the charities selected.<BR/><BR/>
					  In the event that there are no positive point finishers in the room, TopCoder will randomly select another room.<BR/><BR/>
					  Based on the list of America's Top 100 Charities posted at Worth.com --><UL>
						<LI><A HREF="http://www.accion.org" CLASS="bodyText">ACCION</A></LI>
						<LI><A HREF="http://www.alz.org" CLASS="bodyText">ALZHEIMER'S ASSOCIATION</A></LI>
						<LI><A HREF="http://www.cancer.org" CLASS="bodyText">AMERICAN CANCER SOCIETY</A></LI>
						<LI><A HREF="http://www.diabetes.org" CLASS="bodyText">AMERICAN DIABETES ASSOCIATION</A></LI> 
						<LI><A HREF="http://www.amfar.org" CLASS="bodyText">AMERICAN FOUNDATION FOR AIDS RESEARCH</A></LI>
						<LI><A HREF="http://www.americanheart.org" CLASS="bodyText">AMERICAN HEART ASSOCIATION</A></LI>
						<LI><A HREF="http://www.lungusa.org" CLASS="bodyText">AMERICAN LUNG ASSOCIATION</A></LI>
						<LI><A HREF="http://www.archq.org" CLASS="bodyText">AMERICAN REFUGEE COMMITTEE</A></LI>
						<LI><A HREF="http://www.secondharvest.org" CLASS="bodyText">AMERICA'S SECOND HARVEST</A></LI>
						<LI><A HREF="http://www.arthritis.org" CLASS="bodyText">ARTHRITIS FOUNDATION</A></LI>
						<LI><A HREF="http://www.ashoka.org" CLASS="bodyText">ASHOKA</A></LI>
						<LI><A HREF="http://www.capcure.org" CLASS="bodyText">ASSOCIATION FOR THE CURE OF CANCER OF THE PROSTATE</A></LI>
						<LI><A HREF="http://www.bbbsa.org" CLASS="bodyText">BIG BROTHERS BIG SISTERS OF AMERICA</A></LI>
						<LI><A HREF="http://www.bgca.org" CLASS="bodyText">BOYS &amp; GIRLS CLUBS OF AMERICA</A></LI>
						<LI><A HREF="http://www.campfire.org" CLASS="bodyText">CAMP FIRE USA</A></LI>
						<LI><A HREF="http://www.care.org" CLASS="bodyText">CARE USA</A></LI>
						<LI><A HREF="http://www.communitychange.org" CLASS="bodyText">CENTER FOR COMMUNITY CHANGE</A></LI>
						<LI><A HREF="http://www.yar.org" CLASS="bodyText">CENTER FOR YOUTH AS RESOURCES</A></LI>
						<LI><A HREF="http://www.childfindofamerica.org" CLASS="bodyText">CHILD FIND OF AMERICA</A></LI>
						<LI><A HREF="http://www.cwla.org" CLASS="bodyText">CHILD WELFARE LEAGUE OF AMERICA</A></LI>
						<LI><A HREF="http://www.childrensdefense.org" CLASS="bodyText">CHILDREN'S DEFENSE FUND</A></LI>
						<LI><A HREF="http://www.paralysis.org" CLASS="bodyText">CHRISTOPHER REEVE PARALYSIS FOUNDATION</A></LI>
						<LI><A HREF="http://www.csfa.org" CLASS="bodyText">CITIZENS' SCHOLARSHIP FOUNDATION OF AMERICA</A></LI>
						<LI><A HREF="http://www.cisnet.org" CLASS="bodyText">COMMUNITIES IN SCHOOLS</A></LI>
						<LI><A HREF="http://www.conservation.org" CLASS="bodyText">CONSERVATION INTERNATIONAL</A></LI>
						<LI><A HREF="http://www.defenders.org" CLASS="bodyText">DEFENDERS OF WILDLIFE</A></LI>
						<LI><A HREF="http://www.directrelief.org" CLASS="bodyText">DIRECT RELIEF INTERNATIONAL</A></LI>
						<LI><A HREF="http://www.doctorswithoutborders.org" CLASS="bodyText">DOCTORS WITHOUT BORDERS</A></LI>
						<LI><A HREF="http://www.earthjustice.org" CLASS="bodyText">EARTHJUSTICE</A></LI>
						<LI><A HREF="http://www.easter-seals.org" CLASS="bodyText">EASTER SEALS</A></LI>
						<LI><A HREF="http://www.pedaids.org" CLASS="bodyText">ELIZABETH GLASER PEDIATRIC AIDS FOUNDATION</A></LI>
						<LI><A HREF="http://www.efa.org" CLASS="bodyText">EPILEPSY FOUNDATION</A></LI>
						<LI><A HREF="http://www.fvpf.org" CLASS="bodyText">FAMILY VIOLENCE PREVENTION FUND</A></LI>
						<LI><A HREF="http://www.villagebanking.org" CLASS="bodyText">FINCA</A></LI>
						<LI><A HREF="http://www.blindness.org" CLASS="bodyText">FOUNDATION FIGHTING BLINDNESS</A></LI>
						<LI><A HREF="http://www.freefromhunger.org" CLASS="bodyText">FREEDOM FROM HUNGER</A></LI>
						<LI><A HREF="http://www.girlscouts.org" CLASS="bodyText">GIRL SCOUTS OF THE USA</A></LI>
						<LI><A HREF="http://www.girlsinc.org" CLASS="bodyText">GIRLS INC.</A></LI>
						<LI><A HREF="http://www.goodwill.org" CLASS="bodyText">GOODWILL INDUSTRIES INTERNATIONAL</A></LI>
						<LI><A HREF="http://www.wcn.org/gcf/" CLASS="bodyText">GYNECOLOGIC CANCER FOUNDATION</A></LI>
						<LI><A HREF="http://www.habitat.org" CLASS="bodyText">HABITAT FOR HUMANITY</A></LI>
						<LI><A HREF="http://www.heifer.org" CLASS="bodyText">HEIFER INTERNATIONAL</A></LI>
						<LI><A HREF="http://www.icrw.org" CLASS="bodyText">INTERNATIONAL CENTER FOR RESEARCH ON WOMEN</A></LI>
						<LI><A HREF="http://www.imc-la.org" CLASS="bodyText">INTERNATIONAL MEDICAL CORPS</A></LI>
						<LI><A HREF="http://www.theirc.org" CLASS="bodyText">INTERNATIONAL RESCUE COMMITTEE</A></LI>
						<LI><A HREF="http://www.jstart.org" CLASS="bodyText">JUMPSTART FOR YOUNG CHILDREN</A></LI>
						<LI><A HREF="http://www.jdf.org" CLASS="bodyText">JUVENILE DIABETES RESEARCH FOUNDATION INTERNATIONAL</A></LI> 
						<LI><A HREF="http://www.laubach.org" CLASS="bodyText">LAUBACH LITERACY INTERNATIONAL</A></LI>
						<LI><A HREF="http://www.literacyvolunteers.org" CLASS="bodyText">LITERACY VOLUNTEERS OF AMERICA</A></LI>
						<LI><A HREF="http://www.modimes.org" CLASS="bodyText">MARCH OF DIMES</A></LI>
						<LI><A HREF="http://www.mercycorps.org" CLASS="bodyText">MERCY CORPS INTERNATIONAL</A></LI>
						<LI><A HREF="http://www.madd.org" CLASS="bodyText">MOTHERS AGAINST DRUNK DRIVING</A></LI>
						<LI><A HREF="http://www.ms.foundation.org" CLASS="bodyText">MS. FOUNDATION FOR WOMEN</A></LI>
						<LI><A HREF="http://www.mhsource.com/narsad" CLASS="bodyText">NATIONAL ALLIANCE FOR RESEARCH ON SCHIZOPHRENIA AND DEPRESSION</A></LI>
						<LI><A HREF="http://www.nami.org" CLASS="bodyText">NATIONAL ALLIANCE FOR THE MENTALLY ILL</A></LI>
						<LI><A HREF="http://www.audubon.org" CLASS="bodyText">NATIONAL AUDUBON SOCIETY</A></LI>
						<LI><A HREF="http://www.famlit.org" CLASS="bodyText">NATIONAL CENTER FOR FAMILY LITERACY</A></LI>
						<LI><A HREF="http://www.missingkids.org" CLASS="bodyText">NATIONAL CENTER FOR MISSING AND EXPLOITED CHILDREN</A></LI>
						<LI><A HREF="http://www.ncadv.org" CLASS="bodyText">NATIONAL COALITION AGAINST DOMESTIC VIOLENCE</A></LI>
						<LI><A HREF="http://www.ncoa.org" CLASS="bodyText">NATIONAL COUNCIL ON THE AGING</A></LI>
						<LI><A HREF="http://www.kidney.org" CLASS="bodyText">NATIONAL KIDNEY FOUNDATION</A></LI>
						<LI><A HREF="http://www.nmha.org" CLASS="bodyText">NATIONAL MENTAL HEALTH ASSOCIATION</A></LI> 
						<LI><A HREF="http://www.rarediseases.org" CLASS="bodyText">NATIONAL ORGANIZATION FOR RARE DISORDERS</A></LI>
						<LI><A HREF="http://www.try-nova.org" CLASS="bodyText">NATIONAL ORGANIZATION FOR VICTIM ASSISTANCE</A></LI>
						<LI><A HREF="http://www.nationalpartnership.org" CLASS="bodyText">NATIONAL PARTNERSHIP FOR WOMEN &amp; FAMILIES</A></LI>
						<LI><A HREF="http://www.4npcc.org" CLASS="bodyText">NATIONAL PROSTATE CANCER COALITION</A></LI>
						<LI><A HREF="http://www.nwf.org" CLASS="bodyText">NATIONAL WILDLIFE FEDERATION</A></LI>
						<LI><A HREF="http://www.nrdc.org" CLASS="bodyText">NATURAL RESOURCES DEFENSE COUNCIL</A></LI>
						<LI><A HREF="http://www.opusa.org" CLASS="bodyText">OPERATION USA</A></LI>
						<LI><A HREF="http://www.oxfamamerica.org" CLASS="bodyText">OXFAM AMERICA</A></LI>
						<LI><A HREF="http://www.pactworld.org" CLASS="bodyText">PACT</A></LI>
						<LI><A HREF="http://www.patnc.org" CLASS="bodyText">PARENTS AS TEACHERS NATIONAL CENTER</A></LI>
						<LI><A HREF="http://www.phrusa.org" CLASS="bodyText">PHYSICIANS FOR HUMAN RIGHTS</A></LI>
						<LI><A HREF="http://www.preventchildabuse.org" CLASS="bodyText">PREVENT CHILD ABUSE AMERICA</A></LI>
						<LI><A HREF="http://www.rainn.org" CLASS="bodyText">RAPE, ABUSE &amp; INCEST NATIONAL NETWORK</A></LI>
						<LI><A HREF="http://www.reachoutandread.org" CLASS="bodyText">REACH OUT AND READ</A></LI>
						<LI><A HREF="http://www.rif.org" CLASS="bodyText">READING IS FUNDAMENTAL</A></LI>
						<LI><A HREF="http://www.refugeesinternational.org" CLASS="bodyText">REFUGEES INTERNATIONAL</A></LI>
						<LI><A HREF="http://www.rmhc.org" CLASS="bodyText">RONALD MCDONALD HOUSE CHARITIES</A></LI>
						<LI><A HREF="http://www.strength.org" CLASS="bodyText">SHARE OUR STRENGTH</A></LI>
						<LI><A HREF="http://www.shrinershq.org" CLASS="bodyText">SHRINERS HOSPITALS FOR CHILDREN</A></LI>
						<LI><A HREF="http://www.sidsalliance.org" CLASS="bodyText">SIDS ALLIANCE</A></LI>
						<LI><A HREF="http://www.specialolympics.org" CLASS="bodyText">SPECIAL OLYMPICS</A></LI>
						<LI><A HREF="http://www.stjude.org" CLASS="bodyText">ST. JUDE CHILDREN'S RESEARCH HOSPITAL</A></LI> 
						<LI><A HREF="http://www.komen.org" CLASS="bodyText">SUSAN G. KOMEN BREAST CANCER FOUNDATION</A></LI>
						<LI><A HREF="http://www.teachforamerica.org" CLASS="bodyText">TEACH FOR AMERICA</A></LI>
						<LI><A HREF="http://www.technoserve.org" CLASS="bodyText">TECHNOSERVE</A></LI>
						<LI><A HREF="http://www.scholarshipfund.org" CLASS="bodyText">THE CHILDREN'S SCHOLARSHIP FUND</A></LI>
						<LI><A HREF="http://www.nature.org" CLASS="bodyText">THE NATURE CONSERVANCY</A></LI>
						<LI><A HREF="http://www.oceanconservancy.org" CLASS="bodyText">THE OCEAN CONSERVANCY</A></LI>
						<LI><A HREF="http://www.tpl.org" CLASS="bodyText">THE TRUST FOR PUBLIC LAND</A></LI>
						<LI><A HREF="http://www.refugees.org" CLASS="bodyText">U.S. COMMITTEE FOR REFUGEES</A></LI>
						<LI><A HREF="http://www.unicefusa.org" CLASS="bodyText">U.S. FUND FOR UNICEF</A></LI>
						<LI><A HREF="http://www.vday.org" CLASS="bodyText">V-DAY</A></LI>
						<LI><A HREF="http://www.wics.org" CLASS="bodyText">WOMEN IN COMMUNITY SERVICE</A></LI>
						<LI><A HREF="http://www.wri.org" CLASS="bodyText">WORLD RESOURCES INSTITUTE</A></LI>
						<LI><A HREF="http://www.wwf.org" CLASS="bodyText">WORLD WILDLIFE FUND</A></LI>
						<LI><A HREF="http://www.ymca.net" CLASS="bodyText">YMCA-USA</A></LI>
						<LI><A HREF="http://www.ywca.org" CLASS="bodyText">YWCA OF THE U.S.A.</A></LI>
						<LI><A HREF="http://www.zerotothree.org" CLASS="bodyText">ZERO TO THREE</A></LI>
					  </UL>
					  <A HREF="mailto:charities@topcoder.com" CLASS="bodyText">Want to suggest a charity?</A>
					<P><BR/></P>
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

