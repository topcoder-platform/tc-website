<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="../top.xsl" />
	<xsl:import href="../script.xsl" />
	<xsl:import href="../includes/body_top.xsl" />  
	<xsl:import href="../foot.xsl" />
	<xsl:import href="../includes/modules/stats_intro.xsl" />  
  <xsl:import href="../includes/global_left.xsl"/>  
	<xsl:import href="../includes/dev/public_dev_right.xsl" />     
	<xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" />
	<xsl:template match="/">

<html>
<head>

	<xsl:call-template name="Preload" />      

 <title>TopCoder | Development</title>

	<xsl:call-template name="CSS" />      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

</head>

<BODY>
	<xsl:call-template name="Top" />

<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr valign="top">
<!-- Left Column Begins -->
		<td width="170" bgcolor="#CCCCCC">
			<xsl:call-template name="global_left"/>
	  	</td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
		<td width="4" bgcolor="#CCCCCC"><img src="/i/clear.gif" width="4" height="5" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
            <td class="bodyText" width="100%">
			<xsl:call-template name="BodyTop">
			<xsl:with-param name="image1">steelblue</xsl:with-param>
			<xsl:with-param name="image">development</xsl:with-param>
			<xsl:with-param name="title">&#160;Application Development</xsl:with-param>
			</xsl:call-template>
			<table border="0" cellspacing="0" cellpadding="0" bgcolor="#000033" background="/i/steel_darkblue_bg.gif" width="100%">
				<tr valign="top">
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" height="10"><img src="/i/clear.gif" alt="" width="240" height="10" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>
			</table>
				
			   <table border="0" cellspacing="0" cellpadding="5" background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="100%">
                <tr valign="top">
                    <td class="statText"><div align="center"><h1 class="devSubhead"><strong>TopCoder Software Application Development Methodology</strong></h1></div></td>
                </tr>

                <tr valign="top">
                    <td width="100%">
                        <div align="center">
                        <table width="494" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td><a class="statText" href="#qa"><img src="/i/development/development_methodology_03.gif" width="189" height="69" border="0" alt="quality_assurance" /></a></td>
							<td><img src="/i/development/development_methodology_04.gif" width="116" height="69" alt="" /></td>
							<td><a class="statText" href="#spec"><img src="/i/development/development_methodology_05.gif" width="189" height="69" alt="specification" border="0" /></a></td>
						</tr>
						<tr>
							<td><img src="/i/development/development_methodology_07.gif" width="189" height="50" alt="" /></td>
							<td><img src="/i/development/development_methodology_08.gif" width="116" height="50" alt="" /></td>
							<td><img src="/i/development/development_methodology_09.gif" width="189" height="50" alt="" /></td>
						</tr>
						<tr>
							<td><a class="statText" href="#development"><img src="/i/development/development_methodology_10.gif" width="189" height="87" alt="development" border="0" /></a></td>
							<td><img src="/i/development/development_methodology_11.gif" width="116" height="87" alt="" /></td>
							<td><a class="statText" href="#design"><img src="/i/development/development_methodology_12.gif" width="189" height="87" alt="design" border="0" /></a></td>
						</tr>
						</table>		
                        </div></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="10" background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="100%">
                <tr valign="top">
                    <td class="statText">
                        <p>The TopCoder Software Application Development Methodology utilizes the TopCoder Software Component Catalog and 
                        distributed member base to create robust, high quality applications.  It combines our Component Development 
                        Methodology with our peer review, components customization, and application integration processes.</p></td>
                </tr>

<!-- Specification begins -->
                <tr valign="top">
                    <td width="100%" background="/i/steel_darkblue_bg.gif"><a name="spec"></a>
                        <table width="100%" border="0" cellspacing="0" cellpadding="10" bgcolor="#333333">
                            <tr valign="top">
                                <td class="methNav" width="98%">
                                    <span class="statText"><strong>Specification</strong></span>&#160;&#160;|&#160;&#160;<a class="methNav" href="#design">Architecture and Design</a>&#160;&#160;|&#160;&#160;<a class="methNav" href="#development">Development and Testing</a>&#160;&#160;|&#160;&#160;<a class="methNav" href="#qa">QA</a>&#160;&#160;&#160;&#160;</td>
                                <td class="statText" width="2%" nowrap="nowrap">
                                    <div class="topPage"><a class="statText" href="#top">[Top of Page]</a></div></td>
                            </tr>
                        </table></td>
                </tr>
                
                <tr valign="top">
                    <td class="statText">
                    <p><b>Specification Phase:</b> The Specification phase defines the scope of the project and the functional requirements.
                    </p>
                    <p>
					<ol>
					<li>TopCoder Software Application Manager creates an Application Design Specification to define scope.</li>
					<li>Application Manager creates Activity Diagrams to define the functional flow of the applications.</li>
					<li>Application Manager creates high-level Use Cases that describe all actors and processes involved in the 
					functionality of the application.</li>  
					<li>Application Manager and Information Architect create a working prototype of the application.  This is a graphical 
					rendering of the application user interface.</li>
					<li>Application Manager creates a Architecture Diagram that defines the logical and physical layout of the system.</li> 
					<li>Application Manager creates the Design Project Plan for the project.</li>
					</ol>
					</p>
                    </td>
                </tr>
<!-- Specification ends -->



<!-- Design begins -->
                <tr valign="top">
                    <td width="100%" background="/i/steel_darkblue_bg.gif"><a name="design"></a>
                        <table width="100%" border="0" cellspacing="0" cellpadding="10" bgcolor="#333333">
                            <tr valign="top">
                                <td class="methNav" width="98%">
                                    <a class="methNav" href="#spec">Specification</a>&#160;&#160;|&#160;&#160;<span class="statText"><strong>Architecture and Design</strong></span>&#160;&#160;|&#160;&#160;<a class="methNav" href="#development">Development and Testing</a>&#160;&#160;|&#160;&#160;<a class="methNav" href="#qa">QA</a>&#160;&#160;&#160;&#160;</td>
                                <td class="statText" width="2%" nowrap="nowrap">
                                    <div class="topPage"><a class="statText" href="#top">[Top of Page]</a></div></td>
                            </tr>
                        </table></td>
                </tr>
                
                <tr valign="top">
                    <td class="statText">
                   	<p><b>Architecture and Design Phase:</b>  Self-defined TopCoder Software Design teams of one or more members create and 
                   	submit application designs to TopCoder Software.</p>
                   	<p>
                   	<ol>
					<li>All eligible TopCoder members may submit completed designs for the application.</li>
					<li>Designers must submit a completed Application Design Specification on the Specification Submission Due 
					Date as stated in the Application Project Posting page.</li>
					<li>Application Managers will provide functional feedback to designers via the TopCoder Software NewsGroups.</li>
					<li>Designers must submit the following documents by the Design Submission Due Date:
					<ul>
					<li>Updated Application Specification Document</li>
					<li>Updated Use Case diagrams if required</li>
					<li>Deployment Diagrams - Associations between application classes and components</li>
					<li>Sequence Diagrams - Associations between application classes and components</li>
					<li>Persistence Diagrams - Data Definition Language (DDL), XML Schema, Document Type Definition (DTD)</li>
					<li>Configuration Data - Explanation of configuration parameters</li>
					<li>Static Data - Data required for the application to be used</li>
					<li>Test Cases - Functional Test Cases that cover the public API of the application</li>
					</ul></li>
					<li>The Application Specification Document is expected to specify both generic components that can be mapped 
					to the TopCoder Software Component Catalog, new components and component extensions necessary to implement 
					functionality specific to the application.</li>
					<li>An Architecture Review Board reviews and scores all design submissions. The Board will take several factors, 
					including number of current TopCoder Software components used and new components identified into account when
					scoring the submissions.</li>
					<li>The Architecture Review Board selects a winning design submission and the top two entries are compensated.</li>
					<li>If the new components are required for the application, they will be developed separately using the 
					<a class="statText" href="index?t=development&amp;c=comp_meth">Component Development Methodology</a>.</li>
					<li>The winning designer(s) incorporate Review Board suggestions into their design.</li>
					<li>The Architecture Review Board performs a final review and accepts the application design.</li>
					<li>The winning design is posted as an Application Development Project.</li>
					</ol>
					</p>
            		
            		
                    </td>
                </tr>
<!-- Design ends -->



<!-- Development begins -->
                <tr valign="top">
                    <td width="100%" background="/i/steel_darkblue_bg.gif"><a name="development"></a>
                        <table width="100%" border="0" cellspacing="0" cellpadding="10" bgcolor="#333333">
                            <tr valign="top">
                                <td class="methNav" width="98%">
                                    <a class="methNav" href="#spec">Specification</a>&#160;&#160;|&#160;&#160;<a class="methNav" href="#design">Architecture and Design</a>&#160;&#160;|&#160;&#160;<span class="statText"><strong>Development and Testing</strong></span>&#160;&#160;|&#160;&#160;<a class="methNav" href="#qa">QA</a>&#160;&#160;&#160;&#160;</td>
                                <td class="statText" width="2%" nowrap="nowrap">
                                    <div class="topPage"><a class="statText" href="#top">[Top of Page]</a></div></td>
                            </tr>
                        </table></td>
                </tr>
                
                <tr valign="top">
                    <td class="statText">
                    <p><b>Development and Testing Phase:</b> All new components identified in the Design and Architecture Phase are posted and 
                    developed according to the TopCoder Software Component Development Methodology.  Application Development team members 
                    are strongly encouraged to submit designs for all components.</p> 
					<p>Self-defined TopCoder Software Development teams of one or more members integrate TopCoder Software components 
					into application development solutions and submit them to TopCoder Software for review.</p>
					<p>
					<ol>
					<li>Teams submit development solutions in the same manner as design solutions.</li>  
					<li>Although the application design is complete, not all components have completed development.  
					Application development teams are expected to "stub out" component interfaces for components not yet 
					delivered to the catalog.</li> 
					<li>As components become available, development teams integrate them into the application solution.</li>
					<li>Teams are responsible for submitting completed development solutions.  Completed solutions include a working 
					solution, unit test cases and all associated documentation.</li>
					<li>Solutions are designed as extensions, customizations and integrations of TopCoder Software components and 
					must be developed as such.  The development teams can add additional code where necessary.</li>  
					<li>The Designer and TopCoder Software Application Manager are available to answer questions 
					and give guidance.</li>
					<li>A Development Review Board is selected from the Development Review Board Pool.</li>  
					<li>The Development Review Board and Designer are responsible for systems testing and scoring 
					each application.</li>  
					<li>Scoring includes accuracy testing, negative testing, stress testing, User Interface testing and integration testing.</li>  
					<li>Once all solutions are scored a winning solution is chosen and the runner-up development team is compensated.</li>
					</ol>
					</p>  
                    </td>
                </tr>
<!-- Development ends -->


<!-- QA begins -->
                <tr valign="top">
                    <td width="100%" background="/i/steel_darkblue_bg.gif"><a name="qa"></a>
                        <table width="100%" border="0" cellspacing="0" cellpadding="10" bgcolor="#333333">
                            <tr valign="top">
                                <td class="methNav" width="98%">
                                    <a class="methNav" href="#spec">Specification</a>&#160;&#160;|&#160;&#160;<a class="methNav" href="#design">Architecture and Design</a>&#160;&#160;|&#160;&#160;<a class="methNav" href="#development">Development and Testing</a>&#160;&#160;|&#160;&#160;<span class="statText"><strong>QA</strong></span>&#160;&#160;&#160;&#160;</td>
                                <td class="statText" width="2%" nowrap="nowrap">
                                    <div class="topPage"><a class="statText" href="#top">[Top of Page]</a></div></td>
                            </tr>
                        </table></td>
                </tr>
                
                <tr valign="top">
                    <td class="statText">
                  
                    <ol>
					<li>The Development Review Board and Designer team up with the TopCoder Software Application Manager 
					and Quality Assurance Manager to perform several iterations of QA testing with the winning Development Team.</li>  
					<li>Once the TopCoder Software Application Manager is satisfied that the winning application meets the rigorous 
					standards of TopCoder Software the development solution is accepted and the winning Development Team is compensated.</li>
					</ol>
				

                    </td>
                </tr>
<!-- QA ends -->



            </table>
			
			
			
				
			<table border="0" cellspacing="0" cellpadding="0" background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="100%">
				<tr valign="top">
					<td background="" bgcolor="#CCCCCC" width="10" align="right"><img src="/i/clear.gif" alt="" width="10" height="8" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="14"><img src="/i/table_mid_left2x.gif" alt="" width="14" height="8" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
					<td background="" bgcolor="#CCCCCC" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>	
	
				<tr valign="top">
					<td background="" bgcolor="#CCCCCC" width="10" align="right"><img src="/i/clear.gif" alt="" width="10" height="8" border="0" /></td>
					<td background="" bgcolor="#CCCCCC" width="14"><img src="/i/table_btm_left2.gif" alt="" width="14" height="8" border="0" /></td>
					<td background="" bgcolor="#CCCCCC" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
					<td background="" bgcolor="#CCCCCC" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>
			</table>
		</td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
		<td width="6"><img src="/i/clear.gif" width="6" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
		<td width="244" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="244" height="1" alt="" border="0" /><br/>
			<xsl:call-template name="public_dev_right" />        
        </td>
<!-- Right Column Ends -->
	
	</tr>
</table>

<!-- Footer Begins -->
        <xsl:call-template name="Foot" />
<!-- Footer Endss -->

</BODY>
</html>
	</xsl:template>
</xsl:stylesheet>

