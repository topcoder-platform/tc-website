<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>  
  <xsl:import href="../includes/dev/public_dev_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Development</TITLE>
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
<!-- Left Column Include Begins -->  
    <!-- Global Seconday Nav Begins -->        
        <xsl:call-template name="public_dev_left"/>
  <!-- Global Seconday Nav Ends -->      
<!-- Left Column Include Ends -->              
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="240" height="1" VSPACE="5" BORDER="0"/><BR/>
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">development</xsl:with-param>
  <xsl:with-param name="title">&#160;Overview</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
                                        <b>Payment Affidavit Contract Tracking System Project</b>
                                    <BR/>
                                    <!--<a href="/?t=development&amp;c=inquire&amp;Project=payment&amp;To=service@topcoder.com"><b>Click here to inquire &gt;&gt;</b></a>-->
                                    <BR/>
                                    <BR/>
                                    <b>Preface</b>
                                    <BR/>
                                    <BR/>            
TopCoder awards monetary prizes at the completion of a competition, to the winning participants.  Due to tax laws and other legalities, TopCoder is mandated to keep track of tax forms and official proclamations of identification.  Aside from the coding competitions, from time to time, TopCoder also contracts the expertise of the members that frequent the site for internal projects.  As the company has grown, so has the need to keep an accurate financial account of all monies being transacted for competition prizes and contractual work.  There is also an ever-growing need to keep accurate records of contracts and government regulatory paper work.  In order to adhere to the business needs, TopCoder has decided to begin the Payment Affidavit Contract Tracking System, which will accurately track all payments, reconciliation, affidavits, contracts and tax forms.  
<BR/>
                                    <BR/>
                                    <b>System Overview</b>
                                    <BR/>
                                    <BR/>
The Payment Affidavit Contract Tracking System (PACTS) will be a robust system with many different facets, namely: member affirmation and information verification, user profiles, affidavit and contract tracking, payments, deductions, reconciliation and payment printing system.
<BR/>
                                    <BR/>
                                    <b>Member Affirmation and Information Verification</b>
                                    <BR/>
                                    <BR/>
The member affirmation and information verification element of PACTS will be a web-based system for TopCoder members.  Presently, after a competition, notification emails go out to all of the winners.  In order to claim a prize, members must mail in a notarized affidavit verifying their personal information.  With the release of PACTS, a hyperlink will be included in those emails that will connect to a login page on the topcoder.com site.  Once the member's username and password is authenticated, the member is redirected to a verification status page.  From this point, members who have sent in at least one notarized affidavit should be able to verify that their personal information in the system is correct and submit an electronic affirmation of the affidavit.  The system should also give members the ability to view the status of all affidavits, contracts, tax forms and payments; both pending and historical.  Each line item should be hyperlinked to a detail page.  Members who do not have a notarized affidavit on file should be allowed to view their information and pending affidavits on-line, however, they should not be able to give an electronic affirmation. 
<BR/>
                                    <BR/>
                                    <b>User Profiles</b>
                                    <BR/>
                                    <BR/>
User profiles will be the structure used to consolidate all information that pertains to an individual user.  TopCoder employees should be able to log into PACTS and pull a user's profile.  TopCoder members should have access only to their profile.  A profile will contain all information for contracts, forms, payments and reconciliations for an individual user from their inauguration into the TopCoder system.   TopCoder employees should also have the ability to add notes to a user's profile.  These notes will not be viewable by the user.  Notes on a user should be grouped by subject matter or type.  There is currently a need for contract, affidavit, payment, tax form and problem submission note types.
<BR/>
                                    <BR/>
                                    <b>Affidavit and Contract Tracking</b>
                                    <BR/>
                                    <BR/>
The affidavit and contract tracking component of PACTS will encompass the functionality needed by TopCoder employees to keep an accurate account of member affidavits and contracts. TopCoder employees should have the ability to search for members based on several criteria including: name, handle, type of contract/form currently on file, type of contract/form pending, payments due, payments made, state, region, country, et cetera.   The results from the search should give a drillable list of matches.  This component should give the user the ability to view details on a member's profile, current and historical contracts, affidavits and tax forms.  Through this component, TopCoder employees should be able to quickly decipher which members have active contracts, affidavits pending verification and missing or on-file tax forms.  
<BR/>
                                    <BR/>
                                    <b>Payments, Deductions and Reconciliation</b>
                                    <BR/>
                                    <BR/>
Payments<BR/>
The payments component of PACTS will allow TopCoder employees the ability to track all money transactions between the company and members.  Users should be able to quickly decipher which members have money owed to them.  The system should bring up a drillable list of members based on search criteria.  The granularity of the drilling should be down to the line item that contributed to the gross figures.  
<BR/>
                                    <BR/>
TopCoder currently has multiple systems in place that necessitate payments to members.  The payment component must therefore be able to track multiple types of payments.  Several types of payments that are currently made include: problem submission, coder referral, contractual, competition prizes.
<BR/>
                                    <BR/>
Deductions
<BR/>
Current tax laws require that certain foreign countries have additional tax money withheld from winnings.  The deduction aspect of the payment component should automatically factor in any applicable deductions to monies owed to a member.
<BR/>
                                    <BR/>
Reconciliation
<BR/>
The reconciliation portion of PACTS must give TopCoder employees the ability to adjust payments that have been made to members.  For instance, in one aspect of payments, TopCoder members are paid for submission of problems that are used in the online programming competitions.  Currently, members are paid a monetary figure that is directly correlated to the difficulty of the submitted problem.  However, there are times when a member is compensated for a problem that is later used at a higher difficulty level.  In a situation such as this, the reconciliation portion of PACTS should be able to add line items that depict the additional monies being paid while keeping an audit trail of the changes. 
<BR/>
                                    <BR/>
Payment Printing
<BR/>
Through the payment facet of PACTS, TopCoder employees will have the ability to retrieve itemized information on monies owed to members.  The payment printing component will give the users the ability to print all payment information into a delimited file that will later be used as a load for proprietary accounting software.  Users must have the ability to select the line items that are actually paid and the line items that should be held for later payment.  Users should also have the ability to modify the amount of an individual line item.  All changes to payment amounts must be kept in an audit trail. 
<BR/>
                                    <BR/>
                                    <b>The Team</b>
                                    <BR/>
                                    <BR/>
The PACTS project shall be made up of a three-man team.  There will be one person who will be in charge of the EJBs and all activities that entail retrieving information from the database.  The second team member will be responsible for writing the JSPs and servlets that will handle all member side functionality.  The third member will be responsible for writing the JSPs and servlets that will handle all internal functionality.    All members will be required to give input into the design of the database schematic.<BR/>
                                    <BR/>
                                    <b>Calendar</b>
                                    <BR/>
                                    <BR/>
                                    <table border="0">
                                        <tr>
                                            <td>
                                                <font color="#ffffff" size="2" face="arial, helvetica, verdana, sans-serif">Project Inception</font>
                                            </td><td>
                                                <font color="#ffffff" size="2" face="arial, helvetica, verdana, sans-serif">TBA</font>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <font color="#ffffff" size="2" face="arial, helvetica, verdana, sans-serif">Design Phase</font>
                                            </td><td>
                                                <font color="#ffffff" size="2" face="arial, helvetica, verdana, sans-serif">One Week</font>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <font color="#ffffff" size="2" face="arial, helvetica, verdana, sans-serif">Coding</font>
                                            </td><td>
                                                <font color="#ffffff" size="2" face="arial, helvetica, verdana, sans-serif">Four Weeks</font>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <font color="#ffffff" size="2" face="arial, helvetica, verdana, sans-serif">Testing, Rework and Documentation</font>
                                            </td><td>
                                                <font color="#ffffff" size="2" face="arial, helvetica, verdana, sans-serif">One Week</font>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <font color="#ffffff" size="2" face="arial, helvetica, verdana, sans-serif">Integration and Final Bug Testing</font>
                                            </td><td>
                                                <font color="#ffffff" size="2" face="arial, helvetica, verdana, sans-serif">One Week</font>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <font color="#ffffff" size="2" face="arial, helvetica, verdana, sans-serif">Final Submission</font>
                                            </td><td>
                                                <font color="#ffffff" size="2" face="arial, helvetica, verdana, sans-serif">TBA</font>
                                            </td>
                                        </tr>
                                    </table>
                                    <BR/>
                                    <BR/>
                                    <b>Payment</b>
                                    <BR/>
                                    <BR/>


Each development member will get paid a total $3,150.00 
<ul>
                                        <li>$315.00 at the start of the project </li>
                                        <li>$775.00 at the completion of the second milestone determined by the project manager </li>
                                        <li>$800.00 at the completion of the fourth milestone determined by the project manager </li>
                                        <li>$1260.00 at the completion of the project* </li>
                                    </ul>

*Completion of the project is defined as follows: 
<ul>
                                        <li>All tasks assigned by the project manager have been completed.</li>
                                        <li>The deliverables have been turned over to the project manager.</li>
                                        <li>The project manager has signed off on all delivered components.</li>
                                    </ul>
                                    <b>Eligibility</b>
                                    <BR/>
                                    <BR/>            
You must be a rated TopCoder member, meeting all of the membership requirements and fit into one of the following categories:<BR/>
                                    <ol>
                                        <li>a US Citizen</li>
                                        <li>a Lawful Permanent Resident of the US (i.e., a Green Card holder)</li>
                                        <li>currently lawfully residing in the US with valid employment authorization to act as an independent contractor.</li>
                                    </ol>
                                    <!--<a href="/?t=development&amp;c=inquire&amp;Project=payment&amp;To=service@topcoder.com"><b>Click here to inquire &gt;&gt;</b></a>-->


          
          <P><br/></P>
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>     
  <TR>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>  
  <TR>
    <TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>
</TABLE>
    </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->

  <!-- Gutter -->
    <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
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

