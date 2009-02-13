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

<title>Development: Website Member Registration</title>
  
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

            <font size="3"><b>Website Member Registration Project</b></font><br/>
<!--
            <a href="Javascript:document.frmInquire.Project.value='registration';document.frmInquire.To.value='service@topcoder.com';document.frmInquire.submit();">
              <b>Click here to inquire &gt;&gt;</b>
            </a>
-->
            <br/><br/>





            <b>Description</b><br/><br/>            
TopCoder plans to introduce a new shorter (yes shorter!) website registration process for new prospective members.  This project will involve one developer from the current member base, along with a TopCoder project manager.
<br/><br/>

            <b>Payment</b><br/><br/>
TopCoder will compensate the developer a total of $3500.
<ul>
  <li>$500.00 at the start of the project</li>
  <li>$3,000.00 at the completion of the project*</li>
</ul>
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
The project will begin on the 2nd of January. There will be an initial conference call to address the following:  design considerations for the registration path, specific time lines, deliverables, and any outstanding issues.  
The project is scheduled for completion by January 21st. The January 21st deadline entails delivery of a fully functional member registration path. 
<ul>
  <li>Project Start Date:    January 2nd, 2002</li>
  <li>Project End Date:      January 21st, 2002</li>
</ul>

            <b>Provisions</b><br/><br/>            
The TopCoder project manager will set project dates, milestones, goals, and deliverables prior to the project's start date.  Any member that is chosen to join the project will have to agree to the specified tasks and dates.  If at any point the TopCoder project manager feels that the member is not accomplishing his/her tasks in a timely and acceptable manner, he/she will be removed from the project and a new member will be assigned.  In order to join the project, the member will need to sign a contract agreeing to the specified terms.
<br/><br/>

            <b>Project Details</b><br/><br/>            
<ul>
  <li>
    Project Goal
    <ul>
      <li>Create the new member registration path for the TopCoder website.</li>
    </ul>
  </li>
  <li>
    Required Skills
    <ul>
      <li>Java</li>
      <li>Servlets</li>
      <li>EJBs</li>
      <li>HTML</li>
      <li>Javascript</li>
      <li>XML/XSL</li>
    </ul>
  </li>
  <li>
    Tasks
    <ul>
      <li>
        Given the following: 
        <ul>
          <li>Access to a TopCoder development environment</li>
          <li>Existing servlet code</li>
          <li>Existing EJB code</li>
          <li>Existing XSL stylesheets</li>
          <li>HTML click-thru of the new registration path</li>
          <li>Documentation for the new registration path specs</li>
        </ul>
      </li>
      <li>Code new classes for handling the servlet requests for the registration process</li>
      <li>Convert the HTML files to XSL templates</li>
      <li>Modify EJB code for add/edit/deletes as necessary</li>
    </ul>
  </li>
</ul>


<!--
            <a href="Javascript:document.frmInquire.Project.value='registration';document.frmInquire.To.value='service@topcoder.com';document.frmInquire.submit();">
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
