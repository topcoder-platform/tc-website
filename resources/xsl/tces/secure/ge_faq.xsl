<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../../top.xsl"/>
  <xsl:import href="../../script.xsl"/>
  <xsl:import href="../../includes/body_top.xsl"/>  
  <xsl:import href="../../foot.xsl"/>
  <xsl:import href="../../includes/modules/practice_room.xsl"/>
  <xsl:import href="../../includes/modules/module_login.xsl"/>  
  <xsl:import href="../../includes/modules/calendar.xsl"/>
  <xsl:import href="../../includes/global_left.xsl"/> 
  <xsl:import href="../../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Employment Services</TITLE>
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
  <xsl:with-param name="image">jobs</xsl:with-param>
  <xsl:with-param name="title">&#160;TopCoder Employment Services</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">



        <TR>



          <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>



          <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/><BR/>



<!--body contextual links-->



<!-- <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="150">



   <TR>



        <TD ROWSPAN="5" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>



        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>



    </TR> 



                <TR> 



                <TD COLSPAN="2" BGCOLOR="#999999" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD>



                </TR>



              <TR>



                    <TD VALIGN="top" BGCOLOR="#999999" CLASS="moduleTitle">&#160; &#160;</TD>



                <TD BGCOLOR="#999999" VALIGN="top" CLASS="moduleTitle">EMPLOYMENT LINKS:</TD>



              </TR>                    



              <TR>



                    <TD COLSPAN="2" VALIGN="top" BGCOLOR="#999999">



          <TABLE BORDER="0" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#CCCCCC">



            <TR>



              <TD VALIGN="top" CLASS="smallText">&#160;&#160;</TD>



              <TD COLSPAN="2" VALIGN="top" CLASS="bodyText"><A HREF="mailto:tces@topcoder.com" CLASS="bodyText">Contact employment services</A></TD>



            </TR>



            <TR><TD VALIGN="top" COLSPAN="3" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>        



          </TABLE>



                </TD>



            </TR>



   <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                



</TABLE> -->



<TABLE WIDTH="100%" CELLPADDING="0" CELLSPACING="0" BORDER="0">



<TR>

<TD VALIGN="middle" HEIGHT="18" BGCOLOR="#43515E" CLASS="statText"><B>&#160;Great Jobs at GE</B></TD>

</TR>



<TR>

<TD VALIGN="middle" HEIGHT="18" CLASS="bodyText">

&#160;&#160;<A CLASS="bodyText" HREF="/?t=tces&amp;c=ge">Jobs</A>&#160;|&#160;

<A CLASS="bodyText" HREF="/?&amp;t=tces&amp;c=ge_faq&amp;a=secure">GE IMLP FAQ</A>&#160;|&#160;

<A CLASS="bodyText" HREF="/?&amp;t=tces&amp;c=ge_criteria&amp;a=secure">IMLP Criteria</A>&#160;|&#160;

<A CLASS="bodyText" HREF="http://www.gecareers.com/AboutGE/e_ben.cfm" TARGET="_blank">GE Benefits</A>
</TD>

</TR>



</TABLE>



<IMG SRC="/i/es/ge/ge_logo.gif" WIDTH="70" HEIGHT="60" ALT="" BORDER="0"/>



<P><B>IMLP<BR/>

 (Information Management Leadership Program)</B></P>



<A HREF="#imlp" CLASS="bodyText">What is IMLP?</A><BR/>

<A HREF="#process" CLASS="bodyText">How does the IMLP recruiting process work?</A><BR/>

<A HREF="#which" CLASS="bodyText">Which GE Business am I interviewing for?</A><BR/>

<A HREF="#choose" CLASS="bodyText">Can I choose the GE Business where I want to work?</A><BR/>

<A HREF="#differ" CLASS="bodyText">Does the program differ between GE businesses?</A><BR/>

<A HREF="#work" CLASS="bodyText">What kind of work will I be doing as an IMLP?</A><BR/>

<A HREF="#training" CLASS="bodyText">What is IMLP training like?  What will I be learning?</A><BR/>

<A HREF="#rotation" CLASS="bodyText">Can I do a cross-functional or cross-business rotation?</A><BR/>

<A HREF="#relocate" CLASS="bodyText">Will I relocate while on program?  Are moving expenses reimbursed?</A><BR/>

<A HREF="#international" CLASS="bodyText">Is there an opportunity for an international assignment during IMLP?</A><BR/>

<A HREF="#path" CLASS="bodyText">What type of career path will IMLP set me on?</A><BR/>

<A HREF="#benefits" CLASS="bodyText">What benefits does GE offer?</A>



<A NAME="imlp"></A>

<P><B>What is IMLP?</B></P>

<P>The IMLP is GE's premiere entry-level training program for high potential individuals seeking an accelerated career in Information Technology. The program consists of four 6 month rotational assignments at a GE Business combined with training. </P>



<A HREF="#top" CLASS="bodyText">top of page</A>



<A NAME="process"></A>

<P><B>How does the IMLP recruiting process work?</B></P>

<P>GE recruits for IMLP candidates at 35 U.S. universities. The on-campus process consists of one 45- minute interview per candidate that is preceded by an education session the evening before. Candidates selected from the on-campus interviews will be invited to the GE business that they have expressed an interest in for a site visit. The site visit interview allows students to get a better sense of the business. </P>



<A HREF="#top" CLASS="bodyText">top of page</A>



<A NAME="which"></A>

<P><B>Which GE Business am I interviewing for?</B></P>

<P>On campus, we recruit for positions on GE's Information Management Leadership Program in the U.S., not for a one specific Business, unless one particular business is sponsoring a given event. After the initial interview, candidates are queried as to the GE business they have an interest in exploring further. Students are then invited to a GE Business for a second round of interviews. At this point, the candidate will be interviewing for a specific GE Business. </P>



<A HREF="#top" CLASS="bodyText">top of page</A>



<A NAME="choose"></A>

<P><B>Can I choose the GE Business where I want to work?</B></P>

<P>Yes. We look for the best combined fit. At GE Capital, students are required to rotate across the different GE Capital businesses. The first rotation is assigned and the next three rotations are elected by the student. </P>



<A HREF="#top" CLASS="bodyText">top of page</A>



<A NAME="differ"></A>

<P><B>Does the program differ between GE businesses?</B></P>

<P>The program's philosophy, goals and basic structure of a combination of rotational assignments and course curriculum are the same across all GE businesses worldwide. What may differ between Businesses are the size of the program, evaluation process, assignment selection and off-program assignment process. </P>



<A HREF="#top" CLASS="bodyText">top of page</A>



<A NAME="work"></A>

<P><B>What kind of work will I be doing as an IMLP?</B></P>

<P>The nature of the work will depend upon the assignment; however, many similar experiences exist across businesses. IMLP's will be given challenging assignments that may include responsibilities ranging from project management, technical development and design, infrastructure management, process re-engineering, telecommunications. </P>



<A HREF="#top" CLASS="bodyText">top of page</A>



<A NAME="training"></A>

<P><B>What is IMLP training like? What will I be learning?</B></P>

<P>The training focuses both on developing leadership skill as well as your technical acumen through courses such as our 6-week boot camp, distance learning, and independent studies. Program members learn skills in teambuilding, presentation and business writing, database design and deployment, network components and functional design. </P>



<A HREF="#top" CLASS="bodyText">top of page</A>



<A NAME="rotation"></A>

<P><B>Can I do a cross-functional or cross-business rotation?</B></P>

<P>In general, yes most businesses allow for one or two cross-functional rotations as part of their program. Cross-business rotations are possible depending on the different businesses. </P>



<A HREF="#top" CLASS="bodyText">top of page</A>



<A NAME="relocate"></A>

<P><B>Will I relocate while on program? Are moving expenses reimbursed?</B></P>

<P>Businesses with IMLP assignments in multiple locations may require relocation from every 6 months to 1 year. However, assignment locations are based on Business needs. If a move is required, GE will pay for most basic moving expenses and provide relocation assistance. Rent subsidies and some other expense reimbursements differ by business and are often driven by cost of living differences between locations. </P>



<A HREF="#top" CLASS="bodyText">top of page</A>



<A NAME="international"></A>

<P><B>Is there an opportunity for an international assignment during IMLP?</B></P>

<P>This depends on the GE Businesses and whether they have international assignments; however, they only represent a small percent of the total assignments available. Therefore, a relatively small number of IMLP's will have an international assignment while on program. </P>



<A HREF="#top" CLASS="bodyText">top of page</A>



<A NAME="path"></A>

<P><B>What type of career path will IMLP set me on?</B></P>

<P>IMLP prepares graduates to become future information technology leaders. Off-program, graduates are hired into challenging positions with a significant level of responsibility. </P>



<A HREF="#top" CLASS="bodyText">top of page</A>



<A NAME="benefits"></A>

<P><B>What benefits does GE offer?</B></P>

<A HREF="http://www.gecareers.com/AboutGE/e_ben.cfm" TARGET="_blank">GE Benefits </A>





<!--end contextual links-->



          



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
