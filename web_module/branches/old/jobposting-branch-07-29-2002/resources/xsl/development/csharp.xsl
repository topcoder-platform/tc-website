<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="../css.xsl"/>
<xsl:import href="../top.xsl"/>
<xsl:import href="../bottom.xsl"/>
<xsl:import href="../left.xsl"/>
<xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
<xsl:template match="/">

<html>
<head>

<title>Development: C# System Design Project</title>
  
<xsl:call-template name="CSS"/>

</head>

<body bgcolor="#000000" background="/images/background_2.jpg" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0">

<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td colspan="2" valign="top">
      <xsl:call-template name="TopLoggedIn"/>
    </td>
    <td width="100%" bgcolor="#4d0000"><img src="/images/spacer.gif" width="1" height="1" alt="" /></td>
  </tr> 
  <tr>
    <td valign="top">
      <table width="156" cellpadding="0" cellspacing="0" border="0">
        <xsl:call-template name="DevelopmentList_LI"/>
        <tr>
          <td valign="top">
            <xsl:call-template name="LeftSideNavBarForm"/>
          </td>
        </tr>
        <tr>
          <td valign="top" height="5"><img src="/images/spacer.gif" width="1" height="5" alt="" /></td>
        </tr>
      </table>
    </td>
    <td valign="top">

    <xsl:comment>content area</xsl:comment>

    <xsl:comment>header table</xsl:comment>

     <table width="619" cellspacing="0" cellpadding="0" border="0">
       <tr>
         <td valign="top" height="5"><img src="/images/spacer.gif" width="1" height="5" alt="" /></td>
       </tr>
       <tr>
         <td align="left" valign="middle" width="490" height="20">
           <img src="/i/headers/dev_projects.gif" width="600" height="20" alt="" /><br/>
         </td>
       </tr>
     </table>

     <xsl:comment>end header table</xsl:comment>
     <xsl:comment>body table</xsl:comment>
     
     <table width="619" cellspacing="0" cellpadding="0" border="0">
     
      <tr>
          <td><img src="/images/spacer.gif" width="350" height="12" alt="" /></td>
          <td><img src="/images/spacer.gif" width="20" height="12" alt="" /></td>
          <td><img src="/images/spacer.gif" width="229" height="12" alt="" /></td>
          <td><img src="/images/spacer.gif" width="10" height="12" alt="" /></td>
      </tr>

      <tr>
        <td colspan="4">
          <font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff">
    
            <FORM name="frmInquire" method="POST">
              <xsl:attribute name="ACTION">http<xsl:value-of select="/TC/PostURL"/></xsl:attribute>
              <INPUT TYPE="hidden" NAME="Task" VALUE="development"/>
              <INPUT TYPE="hidden" NAME="Command" VALUE="inquire"/>
              <INPUT TYPE="hidden" NAME="Project" VALUE=""/>
              <INPUT TYPE="hidden" NAME="To" VALUE=""/>
            </FORM>

            <font size="3"><b>C# System Design Project</b></font><br/>
<!--
            <a href="Javascript:document.frmInquire.Project.value='csharp';document.frmInquire.To.value='service@topcoder.com';document.frmInquire.submit();">
              <b>Click here to inquire &gt;&gt;</b>
            </a>
-->
            <br/><br/>





            <b>Description</b><br/><br/>            
TopCoder plans to add C# to our arsenal of programming languages that are supported in competitions.  This project will address the feasibility, and plan the architecture that will be used in the actual implementation project that follows this project.  This project will involve two developers from the current member base, along with a TopCoder project manager.
<br/><br/>

            <b>Payment</b><br/><br/>
TopCoder will compensate all team members for their work on the C# System Design Project. 
Each development member will get paid a total $800.00 to be paid upon the completion of the project*.
<br/><br/>
*Completion of the project is defined as follows: 
<ul>
  <li>All tasks assigned by the project manager have been completed.</li>
  <li>The deliverables have been turned over to the project manager.</li>
  <li>The project manager has signed off on all deliverables.</li>
</ul>

            <b>Eligibility</b><br/><br/>            
You must be a valid TopCoder member, meeting all of the membership requirements and fit into one of the following categories:<br/>
<ol>
  <li>a US Citizen</li>
  <li>a Lawful Permanent Resident of the US (i.e., a Green Card holder)</li>
  <li>currently lawfully residing in the US with valid employment authorization to act as an dependent contractor.</li>
</ol>

            <b>Time Line</b><br/><br/>            
The project will begin on the 19th of December. There will be a kick-off conference call to address the following: introduction of team members, design considerations for the C# systems, specific time lines, deliverables, and any outstanding issues.<br/>
The project is scheduled to be completed by December 28th. The December 28th deadline entails delivery of a technical implementation plan as well as a high-level architecture diagram.
<ul>
  <li>Project Start Date:    December 19th, 2001</li>
  <li>Project End Date:      December 28th, 2001</li>
</ul>
            <b>Provisions</b><br/><br/>            
The TopCoder project manager will set project dates, milestones, goals, and deliverables prior to the project's start date. Any member that is chosen to join the project will have to agree to the specified tasks and dates. If at any point the TopCoder project manager feels that any team member is not accomplishing their task in a timely and acceptable manner they will be removed from the team and a new member will be assigned. In order to join the project team, all members will need to sign a contract agreeing to the specified terms.
<br/><br/>

            <b>Project Details</b><br/><br/>            

The C# System Design Project will provide a roadmap for the development and implementation of the C# System.  While this project does not include any of the development work, it will be desirable for the participants of this project to participate in the development project that will spawn from the design.  The goal of this project is to come up with a technical and architectural plan that will describe how compiling and testing of solutions written in C# can be integrated into TopCoder's current competition architecture (all UNIX).  Knowledge of C# and Java will be necessary in order to contribute on this team.  The deliverables of this project will be:
<ol>
  <li>A technical implementation plan that outlines the necessary technologies and components to integrate C# with TopCoder?s competition engine.</li>
  <li>A High-Level Architecture diagram that outlines how the technologies and components will interact</li>
</ol>


<!--
            <a href="Javascript:document.frmInquire.Project.value='csharp';document.frmInquire.To.value='service@topcoder.com';document.frmInquire.submit();">
              <b>Click here to inquire &gt;&gt;</b>
            </a>
-->
          </font>
        </td>
      </tr>
    </table>
    <xsl:comment>end body table</xsl:comment>
    <xsl:comment>end content area</xsl:comment>
  </td>
  <td width="100%"><img src="/images/spacer.gif" width="1" height="1" alt="" /></td>
 </tr>
</table> 

<xsl:call-template name="Bottom"/>

</body> 
</html>
</xsl:template>
</xsl:stylesheet>
