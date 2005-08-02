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

 <title>Component Methdology for TopCoder Software Development</title>

    <xsl:call-template name="CSS" />      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />


</head>

<BODY>
                <xsl:call-template name="Top">
                <xsl:with-param name="level1">development</xsl:with-param>
                </xsl:call-template>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left">
                <xsl:with-param name="level1">development</xsl:with-param>
                <xsl:with-param name="level2">support</xsl:with-param>
                <xsl:with-param name="level3">getStarted</xsl:with-param>
            </xsl:call-template>
          </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="5" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
            <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
            <xsl:with-param name="image1">white</xsl:with-param>
            <xsl:with-param name="image">development</xsl:with-param>
            <xsl:with-param name="title">&#160;Components</xsl:with-param>
            </xsl:call-template>
	
		<table border="0" width="534" align="center" class="bodyText">
			<tr>
				<td align="right"><a href="#design">Design</a> | <a href="#development">Development</a></td>
			</tr>
			<tr>
				<td class="header"><a name="design"></a>Getting Started - Design</td>
			</tr>
			<tr>
				<td>					
					<p><br/><span class="bodySubtitle">Step 1 - Read the TopCoder Component Design Tutorial</span><br/>
					Read the <a href="/tc?module=Static&amp;d1=dev&amp;d2=support&amp;d3=desTutorial">Component Design Tutorial</a>.
					This page is a tutorial for developers new to the TopCoder component development methodology and environment.</p>
			
					<p><span class="bodySubtitle">Step 2 - Install the necessary Software</span><br/>
					In order to view designs you will need to have a UML tool installed.  TopCoder members currently use the free version of <a href="http://www.gentleware.com/">Poseidon</a>.</p>
			
					<p><span class="bodySubtitle">Step 3 - View Sample Component and Documentation</span><br/>
					Download and get familiar with some <a href="http://software.topcoder.com/catalog/index.jsp">existing components</a>.</p>
			
					<p><span class="bodySubtitle">Step 4 - Choose a component to design</span><br/>
					On the <a href="http://www.topcoder.com/?&amp;t=development&amp;c=comp_projects">Component Projects</a> page you will see a list of design projects available.  Click on a particular component, and then read the Project definition.  In addition to reading the project definition read the component requirements specification.  The link to the requirement specifications should exist on the component project definition page.</p>
			
					<p><span class="bodySubtitle">Step 5 - Register for the component</span><br/>
					Now that you have found a component you would like to design you must register for the component.  On the component definition page there is a "Register for this Component" link.  Regsiter and agree to the terms.</p>
			
					<p><span class="bodySubtitle">Step 6 - Check out the Developer Forum</span><br/>
					Upon registering for the project you will be granted access to the developer forum for that specific project.  The forum link will be in a confirmation email you receive from service@topcodersoftware.com.</p>
			
					<p><span class="bodySubtitle">Step 7 - Download the Development Distribution</span><br/>
					When you go to the developer forum for the project download the Design Distribution for that component.  Read through the docs and get familiar with the requirements.</p>
					
					<p><span class="bodySubtitle">Step 8 - Read the TopCoder Software Member Guide</span><br/>
					Download the <a href="http://www.topcoder.com/i/development/downloads/TopCoder_Software_Member_Guide.pdf" target="_blank">Software Member Guide</a>.  This document is a guide for developers new to the TopCoder component development methodology and environment. It will guide you through the required elements for submission.</p>
					
					<p><span class="bodySubtitle">Step 9 - Complete the Requirements</span><br/>
					Complete all of the necessary elements to the project as specified in the Member guide tutorial for design.</p>
			
					<p><span class="bodySubtitle">Step 10 - Submit</span><br/>
					<a href="http://software.topcoder.com/review/login.jsp">Login</a> to Project Submit and Review and submit your submission.</p>
					
					<p><br/></p>
				</td>
			</tr>
			<tr>
				<td class="header"><a name="Development"></a>Getting Started - Development</td>
			</tr>
			<tr>
				<td>				
					<p><br/><span class="bodySubtitle">Step 1 - Read the TopCoder Component Development Tutorial</span><br/>
					 The <a href="/tc?module=Static&amp;d1=dev&amp;d2=support&amp;d3=devTutorial" target="_blank">TopCoder Component Development Tutorial</a> provides detailed information on developing components using the TopCoder Software process. This tutorial was written by review board member AdamSelene.</p>
					
					<p><span class="bodySubtitle">Step 2 - Install the necessary Software</span><br/>
					In order to view designs you will need to have a UML tool installed.  TopCoder members currently use the free version of <a href="http://www.gentleware.com/">Poseidon</a>.</p>
					
					<p><span class="bodySubtitle">Step 3 - View Sample Component and Documentation</span><br/>
					Download and get familiar with some <a href="http://software.topcoder.com/catalog/index.jsp">existing components</a>.</p>
					
					<p><span class="bodySubtitle">Step 4 - Choose a component to develop</span><br/>			
					On the <a href="http://www.topcoder.com/?&amp;t=development&amp;c=comp_projects">Component Projects</a> page you will see a list of development projects available.  Click on a particular component, and then read the Project definition.  In addition to reading the project definition read the component requirements specification.  The link to the requirement specifications should exist on the component project definition page.</p>
					
					<p><span class="bodySubtitle">Step 5 - Register for the component</span><br/>
					Now that you have found a component you would like to development you must register for the component.  On the component definition page there is a "Register for this Component" link.  Register and agree to the terms.</p>
					
					<p><span class="bodySubtitle">Step 6 - Check out the Developer Forum</span><br/>
					Upon registering for the project you will be granted access to the developer forum for that specific project.  The forum link will be in a confirmation email you receive from service@topcodersoftware.com.</p>
					
					<p><span class="bodySubtitle">Step 7 - Download the Development Distribution</span><br/>
					When you go to the developer forum for the project download the Development Distribution for that component.  Read through the UML and get familiar with the design.</p>
					
					<p><span class="bodySubtitle">Step 8 - Read the TopCoder Software Member Guide</span><br/>
					Download the <a href="http://www.topcoder.com/i/development/downloads/TopCoder_Software_Member_Guide.pdf" target="_blank">Software Member Guide</a>.  This document is a guide for developers new to the TopCoder component development methodology and environment. It will guide you through the required elements for submission.</p>
					
					<p><span class="bodySubtitle">Step 9 - Complete the Requirements</span><br/>
					Complete all of the necessary elements to the project as specified in the Member guide tutorial for development.</p>
					
					<p><span class="bodySubtitle">Step 10 - Submit</span><br/>
					<a href="http://software.topcoder.com/review/login.jsp">Login</a> to Project Submit and Review and submit your submission.</p>
					
					<p><br/></p>
			        </td>
			</tr>
		</table>

		 


            
	</td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="244">
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

