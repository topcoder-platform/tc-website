<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/>
  <xsl:import href="../includes/dev/public_dev_right.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="Preload"/>      
        <title>TopCoder | Development</title>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </head>
      <body bgcolor="#CCCCCC" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">
        <xsl:call-template name="Top"/>

<!-- Body Begins -->
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
  <TR valign="top">
    <!-- Left Column Begins -->
    <td width="170" bgcolor="#CCCCCC" valign="top">
<!-- Left Column Include Begins -->  
    <!-- Global Seconday Nav Begins -->        
        <xsl:call-template name="global_left"/>
  <!-- Global Seconday Nav Ends -->      
<!-- Left Column Include Ends -->              
      </td>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="6"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <td class="bodyText" width="100%" bgcolor="#CCCCCC" valign="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">development</xsl:with-param>
  <xsl:with-param name="title">&#160;Overview</xsl:with-param>
</xsl:call-template>
<table border="0" cellspacing="0" cellpadding="0" bgcolor="#000033" background="/i/steel_darkblue_bg.gif" width="100%">
  <tr>
    <td bgcolor="#000033" background="/i/steel_darkblue_bg.gif" valign="top" width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
    <td class="statText" colspan="2" valign="top" bgcolor="#000033" background="/i/steel_darkblue_bg.gif" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/>
<!-- Title -->
                                    <b>Email Engine Enhancement Component Development</b>
                                    <br/>

                                    <a href="/?&amp;t=development&amp;c=tcs_inquire&amp;Project=Email Engine Enhancement Development" class="statText"><b>Click here to inquire &gt;&gt;</b></a>
                                    <br/>
<!-- Overview -->
<p>
<b>Overview</b>
</p>

<p>
The Email Engine component provides basic and advanced email functionality through Java API's.  As with any email software, the component supports one or more primary (TO), carbon copy (CC) and blind carbon copy (BCC) recipients, a subject line and file attachment capabilities.
As its name suggests, the Email Engine is used to send email messages.  This is not a GUI-based component such as Outlook Express or Yahoo Mail that manages user email accounts.  Rather, the Email Engine is a set of Java API's that enables a developer to send emails directly from application code.
<br/>
The existing Email Engine implementation needs to be enhanced to include the ability to attach files to email messages.
<br/>
For more details, check out the <a href="http://www.topcodersoftware.com/pages/c_component.jsp?comp=600056&amp;cat=11" class="statText">Email Engine Enhancement Component</a> at <a href="http://www.topcodersoftware.com" class="statText">topcodersoftware.com</a>.
</p>

<!-- Project Type -->
<p>
<b>Project Type</b>
</p>
<p>
Component Development Project: Provide a development solution for the Email Engine Enhancement component.<br/>
Please review the <a href="http://www.topcoder.com/?&amp;t=development&amp;c=index" class="statText">TopCoder Software Component Development Methodology</a> for further details regarding this project type.

</p>

<!-- Technologies -->
<b>Technologies</b>

<ul>
	<li>Java 1.4</li>
</ul>


<!-- Documentation -->
						<p><strong>Documentation</strong><br />
						All <a class="statText" href="http://www.topcodersoftware.com/pages/c_component.jsp?comp=600056">documentation</a> for this project is available on the TopCoder Software web site.</p>

<!-- Payment -->
<p>
<b>Payment</b>
</p>
<p>
TopCoder will compensate the member with the winning solution. Compensation will consist of both initial payments and royalties on the sale of the component. The initial payment will be distributed in two installments.<br/>
First Milestone: When the winning solution is submitted and review board suggestions are integrated.<br/>
Second Milestone: Is marked by the completion of the development project*.
</p>

<p>
Members will also collect royalties on the revenue generated from the sale of the component. The total royalty per component will be equal to 10%* of the component's revenue, with 25%* of the royalty being paid to the designer, 25% to the developer(s), 25% to the Architecture Board member(s) and 25% to the QA Board member(s).  Royalties may be diluted if additional work is done to the component, as the total work effort for the component will increase.  
</p>


<p>
<b>Designer</b>
</p>
<p>
Royalty Percentage - 25%<br/>
Total Payment - $120.00<br/>
First Deliverable - $90.00<br/>
Project Completion - $30.00<br/>
</p>

<!-- Definition of Completion -->
<p>
<sup>*</sup>Completion of the project is defined as follows: 
</p>

<ul>
	<li>The Initial Submission has been delivered by the Initial Submission Due Date.</li>
	<li>The Submission has been selected by the board as the winning submission.</li>
	<li>Final payment is conditional on acceptance of the fully functional component by the Development Review Board.</li>
</ul>

<!-- Eligibility Requirements -->
<p>
<b>Eligibility</b>
</p>
<p>
You must be a rated TopCoder member, at least 18 years of age, meeting all of the membership requirements and fit into one of the following categories:
</p>

<ol>
	<li>A US Citizen </li>
	<li>A Lawful Permanent Resident of the US (i.e., a Green Card holder) </li>
	<li>Currently lawfully residing in the US with valid employment authorization to act as an independent contractor.</li>
	<li>A Non US Citizen working in their country of residence.</li>
</ol>

<!-- Time Line -->
<p>
<b>Time Line</b>
<br/>All submissions are required to be submitted by the Initial Submission Due Date.  All questions submitted prior to 6PM EDT on the Initial Submission Due Date will be answered. Following review from the board the winning member is given untill the Final Submission Due Date to modify their submission.
<br/>
</p>
<p>
Component Posting: 11/15/2002<br/>
Initial Submission Due Date: 11/29/2002<br/>
Final Submission Due Date: 12/13/2002<br/>

<!-- Register at TCS -->
  Each eligible member will be granted access to more detailed information about the project and the deliverables.
</p>


            <a href="/?&amp;t=development&amp;c=tcs_inquire&amp;Project=Email Engine Enhancement Development" class="statText"><b>Click here to inquire &gt;&gt;</b></a>
          <p><br/></p>
    </td>
    <td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
  </tr>
                <tr><td height="5" colspan="7"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" width="100%">
                <tr valign="top">
                    <td background="" bgcolor="#FFFFFF" width="10" align="right"><img src="/i/clear.gif" alt="" width="10" height="8" border="0" /></td>
                    <td width="14"><img src="/i/table_mid_left2x.gif" alt="" width="14" height="8" border="0" /></td>
                    <td width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
                    <td background="" bgcolor="#FFFFFF" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>    
    
                <tr valign="top">
                    <td background="" bgcolor="#FFFFFF" width="10" align="right"><img src="/i/clear.gif" alt="" width="10" height="8" border="0" /></td>
                    <td background="" bgcolor="#FFFFFF" width="14"><img src="/i/table_btm_left2.gif" alt="" width="14" height="8" border="0" /></td>
                    <td background="" bgcolor="#FFFFFF" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
                    <td background="" bgcolor="#FFFFFF" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
    </td>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->

  <!-- Gutter -->
    <TD WIDTH="6"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->
    <td width="170" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
<!-- Right Column Include Begins -->        
        <xsl:call-template name="public_dev_right"/>        
<!-- Right Column Include Ends -->        
        </td>
  <!-- Right Column Ends -->
  <!-- Gutter -->
    <td width="25" bgcolor="#CCCCCC"><img src="/i/clear.gif" width="25" height="1" border="0"/></td>
    <!-- Gutter Ends -->
  </tr>
</table>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

