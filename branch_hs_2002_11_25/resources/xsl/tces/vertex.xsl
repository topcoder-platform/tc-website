<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/module_login.xsl"/>  
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/tces/public_tces_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
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
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
  <TR>
    <!-- Left Column Begins -->
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
  <!-- Global Seconday Nav Begins -->    
<!-- Left Column Include Begins -->  
    <!-- Global Seconday Nav Begins -->  
        <xsl:call-template name="public_tces_left"/>
  <!-- Global Seconday Nav Ends -->  
<!-- Left Column Include Ends -->
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top"><img src="/i/clear.gif" width="240" height="1" VSPACE="5" BORDER="0"/><BR/>
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
     <TD VALIGN="middle" HEIGHT="18" BGCOLOR="#43515E" CLASS="statText"><B>&#160;Great Jobs at Vertex</B></TD>
   </TR>
   <TR>
     <TD VALIGN="middle" HEIGHT="18" CLASS="bodyText">
&#160;&#160;<A CLASS="bodyText" HREF="/?t=tces&amp;c=vertex_openings&amp;a=secure">Jobs</A>
     </TD>
   </TR>
</TABLE>
<IMG SRC="/i/es/vertex/vertex_logo.gif" WIDTH="76" HEIGHT="52" BORDER="0"/><BR/> 
<P>
<B>About Vertex</B>
</P>

<P>
A Leader in Small Molecule Drug Discovery...
</P>

<P>
Founded in Cambridge, MA in 1989, Vertex Pharmaceuticals Incorporated discovers, develops and markets small molecule drugs that address major unmet medical needs. We have more than 12 drug candidates in development to treat viral diseases, inflammation, cancer, autoimmune diseases, neurological disorders and genetic disorders.
</P>

<P>
<B>with a Proven Track Record...</B>
</P>

<P>
Vertex has created its pipeline using a proprietary, information-driven approach to drug design that integrates multiple technologies in biology, chemistry and biophysics, aimed at increasing the speed and success rate of drug discovery. Vertex's first approved product is Agenerase&#174; (amprenavir), an HIV protease inhibitor, which Vertex co-promotes with GlaxoSmithKline. Vertex's goal is to develop and commercialize a range of products for medically underserved diseases in the coming years. 
</P>

<P>
Since 1991, Vertex has been traded on NASDAQ under the symbol VRTX.
</P>

<P>
<B>Vision</B>
</P>

<P>
A vision as great as this can only be achieved in an environment where creative and talented people can thrive.
</P>

<P>
As we have grown in size from 10 to more than 1,000 people in the last eleven years, we have worked to develop an organizational structure that rewards collaborative effort and encourages interaction among people from across the company. From the start of a research program at Vertex, an interdisciplinary team of people focuses on maximizing the potential value of the final product in the medical marketplace. The free flow of information across disciplines, and the insight that emerges through open exchange and interaction, accelerates the drug discovery and development process and allows each product to reach its full commercial potential.
</P>

<P>
We are now entering a new period of growth, during which we will expand our capabilities to take advantage of the chemogenomics opportunity and commercialize a range of important new drugs. 
</P>

<P>
As we pursue our vision for the future, we will continue to recruit top industry talent, and foster an integrated, team-oriented culture of innovation.
</P>

<P>
<B>Environment</B>
</P>

<P>
An Environment that Encourages Employees to Excel...
</P>

<P>
Vertex has engineered an integrated team environment where employees set high goals and work together to accomplish them. We provide our employees with tools that enable them to achieve, and provide opportunities for professional development. We encourage employees' participation in educational seminar series. Our extensive collaborations allow our employees to interact with colleagues from leading research centers and companies based in Cambridge, MA and Oxford, U.K., as well as throughout the world.	
</P>

<P>
We encourage our employees to continue building their knowledge base and skills. Our scientists regularly publish their research in peer-reviewed journals. Along with tuition reimbursement, we offer a home computer reimbursement program for every employee. Vertex is committed to employee wellness and provides an on-site fitness facility for its employees. Our employee assistance program offers resources and guidance on parenting, elder care, financial planning and wellness. 
</P>

<P>
Vertex's success stems from the contributions of employees with diverse backgrounds and areas of expertise. We are actively committed to maintaining a diverse workplace. 
</P>

<P>
<B>Benefits</B>
</P>

<UL>
	<LI> Stock options </LI>
	<LI> 401K plan (company match) </LI>
	<LI> Health and dental insurance </LI>
	<LI> Eyewear reimbursement </LI>
	<LI> Employee Assistance Program (for wellness and prevention) </LI>
	<LI> Life insurance </LI>
	<LI> Tax-free dependent care </LI>
	<LI> Family leave </LI>
	<LI> Limited parking available </LI>
	<LI> Generous vacation policy </LI>
	<LI> Tuition reimbursement</LI>
	<LI> Home computer reimbursement </LI>
	<LI> Employee stock purchase plan </LI>
	<LI> On-site fitness center</LI>
</UL>
 
<P>
We offer some of the best benefits in the industry. 
</P>




<P><A HREF="/?t=tces&amp;c=vertex_openings&amp;a=secure" CLASS="bodyText">Click here</A> for jobs.</P>

<!--end contextual links-->

          <P><BR/></P>
          </TD>
          <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        </TR>
        <TR>
          <TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
        </TR>     
        <TR>
          <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
          <TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
          <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
          <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
        </TR>  
        <TR>
          <TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
          <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
          <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
          <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
        </TR>
      </TABLE>
    </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->

  <!-- Gutter -->
    <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><br/>
<!-- <xsl:if test="not(/TC/LoggedIn='true')">
<xsl:call-template name="module_login"/>
</xsl:if> -->
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>      
<!-- Right Column Include Ends -->        
        </TD>
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

