<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/module_login.xsl"/>  
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
<html>

<head>

<xsl:call-template name="Preload"/>      

<title>TopCoder | Employment Services</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>
<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr valign="top">

<!-- Left Column Begins -->
    <td width="170" bgcolor="#CCCCCC" valign="top">
        <xsl:call-template name="global_left"/>
      </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" border="0"/></td>
<!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
        <td class="bodyText" width="100%">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">jobs</xsl:with-param>
  <xsl:with-param name="title">TopCoder Employment Services</xsl:with-param>
</xsl:call-template>
            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" width="100%">
                <tr valign="top">
                    <td width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
                    <td class="bodyText" width="100%"><img src="/i/clear.gif" alt="" width="240" height="11" border="0"/><br/><br/>
                        <p>TopCoder Employment Services [TCES] is pleased to announce its Candidate Recruiting Program. We are actively 
                        soliciting top companies who are looking to hire software engineers and developers. These companies value programming 
                        talent and are interested in hiring TopCoder members. All TopCoder members can choose to be notified via email of new 
                        job postings, and rated members may express interest in open positions at these top companies through the job postings 
                        and employment advertisements on TopCoder's website. Rated members can showcase their competition achievements and 
                        upload their resume as part of the process.</p>

                        <p><strong>Only rated members can apply for jobs posted by TCES.</strong> This allows companies to differentiate coders 
                        who otherwise look the same on paper. Non-rated members wishing to obtain a rating should review the competition calendar 
                        for the <a class="bodyText"><xsl:attribute name="HREF">/?&amp;t=schedule&amp;c=srm&amp;RoundId=<xsl:value-of select="/TC/TCES/NextSRM/Info/round_id"/></xsl:attribute>next Single Round Match</a> 
                        or <a href="/?&amp;t=schedule&amp;c=index" class="bodyText">click here</a> for a complete list of upcoming Single 
                        Round Matches.</p>

                        <table border="0" cellspacing="0" cellpadding="3" bgcolor="#FFFFFF" width="100%">
                            <tr valign="middle"><td colspan="3" bgcolor="#43515E" class="statText"><strong>Employers</strong></td></tr>
                        </table>

                        <table border="0" cellspacing="5" cellpadding="0" bgcolor="#FFFFFF" width="100%">
<!-- Vertex begins  ### Vertex's contract has expired 3/31/03 ###
    <tr>
    <td valign="middle" class="bodyText" align="center"><a href="/?&amp;t=tces&amp;c=vertex"><img src="/i/es/vertex/vertex_logo.gif" width="76" height="52" alt="" border="0" vspace="10"/></a></td>
        <td><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
        <td width="100%" valign="middle" class="bodyText">Vertex Pharmaceuticals Incorporated (NASDAQ: VRTX) is a global biotechnology company. Vertex seeks to discover, develop, and commercialize major pharmaceutical products independently and with partners.  Vertex has more than 12 drug candidates in clinical and preclinical development to treat viral diseases, inflammation, cancer, autoimmune diseases, neurological disorders and genetic disorders.  They have two open Associate Scientific Software Analyst positions. <a href="/?&amp;t=tces&amp;c=vertex" class="bodyText">Click here for details.</a><br/><br/></td>
    </tr>
    <tr>
        <td colspan="3" bgcolor="#43515E" class="statText"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
    </tr>
Vertex ends -->

<!-- Microsoft begins
                            <tr valign="top">
                                <td class="bodyText" align="center"><a href="/?&amp;t=tces&amp;c=ms"><img src="/i/es/ms/ms_logo.gif" width="160" height="40" alt="" border="0" /></a></td>
                                <td width="99%" class="bodyText">At Microsoft, we see no limits to the potential we all might reach because we see no limits to human imagination.  That is what inspires us.  And that is why we create software that helps people and businesses reach their potential.  It's not just our purpose. It's our passion. <a href="/?&amp;t=tces&amp;c=ms" class="bodyText">How far will you GO?</a><br /><br /></td>
                            </tr>
                        
                            <tr><td colspan="2" bgcolor="#43515E"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td></tr>
Microsoft ends -->

<!-- Solipsys begins -->
                            <tr valign="top">
                                <td class="bodyText" align="center"><a href="/?&amp;t=tces&amp;c=solipsys"><img src="/i/es/solipsys/solipsys_logo.gif" width="135" height="60" border="0"/></a></td>
                                <td width="99%" class="bodyText">Solipsys Corporation is a small, high technology business specializing in products for defense application.  Our primary corporate focus is the development of products designed to address the multi-faceted problem of Joint and Coalition Forces information networking.  We are constantly scanning the horizon for motivated, team-oriented management, technology, and engineering professionals to lead our company into the 21st century.  <a href="/?&amp;t=tces&amp;c=solipsys" class="bodyText">Check out</a> our open Software Developer and Systems Engineer positions.<br /><br /></td>
                            </tr>
                        
                            <tr><td colspan="2" bgcolor="#43515E"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td></tr>
<!-- Solipsys ends -->

<!-- Nvidia begins -->
                            <tr valign="top">
                                <td class="bodyText" align="center"><a href="/?&amp;t=tces&amp;c=nvidia"><img src="/i/es/nvidia/nvidia_logo.gif" width="120" height="83" border="0"/></a></td>
                                <td width="99%" class="bodyText"><b>NVIDIA&#174; Corporation (Nasdaq: NVDA)</b> is the worldwide leader in graphics processors and media and communications devices.  At NVIDIA we work hard. We thrive on innovation. We define the cutting-edge. We deliver to the nth degree.
                                    <a href="/?&amp;t=tces&amp;c=nvidia" class="bodyText">Click here</a> to check out our open Software Engineering positions.<br /><br /></td>
                            </tr>
                        
                            <tr><td colspan="2" bgcolor="#43515E"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td></tr>
<!-- Nvidia ends -->

<!-- Cryptic begins ### Cryptic's contract has expired 2/4/03 ###
  <tr>
        <td valign="middle" class="bodyText" align="center"><a href="/?&amp;t=tces&amp;c=cryptic"><img src="/i/es/cryptic/cryptic_logo.gif" width="120" height="63" alt="" border="0" vspace="10"/></a></td>
        <td><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
        <td width="100%" valign="middle" class="bodyText">Want to be a part of creating the world's first super powered MMP experience?  Cryptic Studios is an independent developer of massive multiplayer online games for the PC and next generation consoles.  We're looking for an Associate Game Designer and an entry level Level Designer.            
          <a href="/?&amp;t=tces&amp;c=cryptic" class="bodyText">Click here</a> for more information.<br/><br/></td>
    </tr>
    <tr>
        <td colspan="3" bgcolor="#43515E" class="statText"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
    </tr>       
 Cryptic ends -->

<!-- FBI begins -->
                            <tr valign="top">
                                <td class="bodyText" align="center"><a href="/?&amp;t=tces&amp;c=fbi"><img src="/i/es/fbi/fbi_logo.gif" width="100" height="103" border="0"/></a></td>
                                <td width="99%" class="bodyText">The FBI. It is like no other career choice you've explored. It's 
                                    challenging. Compelling. Important. Whatever your background or expertise, you will find an FBI future exceptionally
                                    rewarding. Because the work you perform will have a daily impact on the nation's security and the quality-of-life 
                                    for all U.S. citizens.  <a href="/?&amp;t=tces&amp;c=fbi" class="bodyText">Are you ready?</a><br /><br /></td>
                            </tr>
                        
                            <tr><td colspan="2" bgcolor="#43515E"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td></tr>
<!-- FBI ends -->

<!-- Google begins
                            <tr valign="top">
                                <td class="bodyText" align="center"><a href="/?&amp;t=tces&amp;c=google"><img src="/i/es/google_sm.gif" width="143" height="59" border="0"/></a></td>
                                <td width="99%" class="bodyText">Google is looking for exceptional people who like to develop innovative new products, especially software 
                                    engineers and tech-savvy product managers. Are you exceptional at what you do? 
                                    <a href="/?&amp;t=tces&amp;c=google" class="bodyText">Click here</a> to view current 
                                    positions available at Google.<br /><br /></td>
                            </tr>
                        
                            <tr><td colspan="2" bgcolor="#43515E"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td></tr>
 Google ends -->

<!-- GE begins
 <TR>
        <TD VALIGN="middle" CLASS="bodyText" ALIGN="center"><A HREF="/?&amp;t=tces&amp;c=ge"><IMG SRC="/i/es/ge/ge_logo.gif" WIDTH="70" HEIGHT="60" ALT="" BORDER="0"/></A></TD>
        <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
        <TD VALIGN="middle" CLASS="bodyText">
<A HREF="/?&amp;t=tces&amp;c=ge" CLASS="bodyText">Click here</A> for information about GE's premier entry-level Information Management Leadership Program (IMLP).  
IMLP puts information management careers on the fast track. Program graduates are in tremendous demand throughout GE.<BR/><BR/>        
       </TD>
    </TR>
    <tr>
        <td colspan="3" bgcolor="#43515E" class="statText"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
    </tr>
 GE ends -->

<!-- Apex begins -->
                            <tr valign="top">
                                <td class="bodyText" align="center"><a href="/?&amp;t=tces&amp;c=apex"><img src="/i/es/apex/apexlogo.gif" width="82" height="71" alt="Apex" border="0"/></a></td>
                                <td class="bodyText" width="99%">Apex is a company built upon a set of core values that guide their every action - excellence, human 
                                    dignity and integrity.  They consider themselves "the best place for the best people to work."  
                                    <a href="/?&amp;t=tces&amp;c=apex" class="bodyText">Click here</a> to view current job opportunities available at Apex.<br /><br /></td>
                            </tr>
                        
                            <tr><td colspan="2" bgcolor="#43515E"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td></tr>
<!-- Apex ends -->

<!-- TopCoder Software begins ### Pulled on 2/4/03 ###
    <tr>
        <td valign="middle" class="bodyText" align="center"><a href="/?&amp;t=tces&amp;c=tcs_openings&amp;a=secure"><img src="/i/es/topcoder/topcoder_logo.gif" width="160" height="31" vspace="16" alt="TopCoder" border="0"/></a></td>
        <td><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
        <td valign="middle" class="bodyText">TopCoder Software Sales - <a href="/?&amp;t=tces&amp;c=tcs_openings&amp;a=secure" class="bodyText">Click here</a> for details.<br/><br/>    
        </td>
    </tr>
    <tr>
        <td colspan="3" bgcolor="#43515E" class="statText"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
    </tr>    
 TopCoder Software ends -->
            
                        </table>

                        <p><br /></p>
                        
                        <p class="smallText"><strong>Members please note:</strong><br />
                            By indicating interest in a job, you authorize TopCoder to release your member profile information, 
                            competition statistics, code samples, resume, rating and ranking to the potential employer.  You will 
                            have the ability to update and change your profile information at any time and we encourage you to keep 
                            it updated.  Only TopCoder sponsors and subscribing employers will have access to view your profile 
                            information, competition statistics, code samples, resume, rating and ranking.  The personal information 
                            you provide must be accurate and complete and all registration details (where applicable) must contain 
                            your real name, address and other requested details. You are solely responsible for your personal 
                            information and we may take any action with respect to your personal information we deem necessary or 
                            appropriate if we believe it may cause us to suffer any loss, liability or commercial damage.</p>

                        <p><br /></p>
                    
                    </td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>
                
                <tr><td colspan="3" width="100%"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>       
            </table>
        </td>
    <!-- Center Column Ends -->
<!-- Body Area Ends -->

<!-- Gutter -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="public_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

        <xsl:call-template name="Foot"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
