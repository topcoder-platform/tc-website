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

<html>

<head>

<xsl:call-template name="Preload"/>      

<title>Jobs available working for TopCoder</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left"/>
          </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" alt="" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->    
        <td class="bodyText" width="99%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">about_tc</xsl:with-param>
                <xsl:with-param name="title">Jobs at TopCoder</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="10"  width="100%">
                <tr valign="top">
                    <td class="bodyText" width="100%">
                        <p>TopCoder has established itself as the premier way to differentiate development talent, and has developed several unique products and 
                        services designed to improve software development productivity and efficiency. We are looking to fill internal positions for a Graphic 
                        Designer and a Salesperson. See the job descriptions below for details.</p>
                        
                        <hr width="100%" noshade="noshade" />
                        
                        <h3>Web Design Production</h3>
                        
                        <p>We are currently looking for an entry-level web production artist in our Marketing Department. The ideal candidate is 
                        a self-starter who seeks out opportunities to learn new technologies and skills. Recent college grads are encouraged to apply.</p>

                        Responsibilities: 
                        <ul>
                            <li>Edit and create HTML/JSP templates for our web sites.</li>
                            <li>Design and produce promotions for our web sites.</li>
                            <li>Design and produce marketing / sales collateral materials.</li>
                        </ul>
                        
                        Qualifications: 
                        <ul>
                            <li>Eagerness to give 110% to a startup for delayed gratification.</li>
                            <li>Ability to meet aggressive deadlines and juggle multiple priorities.</li>
                            <li>Expects to be challenged by setbacks, obstacles and shifting priorities.</li>
                            <li>Strong understanding of the strengths and limitations of web-based design.</li>
                            <li>Meticulous attention to detail.</li>
                            <li>Excellent written and verbal communication skills.</li>
                            <li>Demonstrated ability to translate the written word into compelling imagery.</li>
                            <li>Advanced understanding of Photoshop, ImageReady and Illustrator. </li>
                            <li>Advanced understanding of HTML and CSS layouts.</li>
                            <li>Basic knowledge of desktop publishing tools (QuarkXPress, Acrobat, etc.).</li>
                            <li>Basic knowledge of JavaScript, JSP and XSL.</li>
                            <li>Experience on the Mac platform.</li>
                            <li>Proficiency at digital photography, image manipulation and retouching.</li>
                            <li>Degree in Graphic Design or equivalent.</li>
                        </ul>
                        
                        This position is at our Glastonbury, CT offices. No telecommuting options are available. 
                        <a class="bodyText" href="mailto:tces@topcoder.com?subject=TopCoder Web Design Production">Apply for this job</a> by email. 
                        Please provide a link to your portfolio in your inquiry.
                        
                        <hr width="100%" noshade="noshade" />
                        
<!-- Hold off until Premium Content becomes a reality
                        <h3>Web Editor</h3>
                        
                        <p>We are currently seeking a writer/editor to generate original content for four technology-oriented web sites 
                        and marketing collateral for our company. This is a new position created to enhance our web initiatives. The ideal 
                        candidate will be intelligent, efficient, personable, flexible, organized and excellent at communicating, writing, 
                        grammar, and researching. Recent college grads are encouraged to apply.</p>

                        Responsibilities: 
                        <ul>
                            <li>Write or edit all editorial and marketing copy for our company.</li>
                            <li>Coordinate production schedule for all web content.</li>
                            <li>Maintain a consistent voice for all outgoing written communication.</li>
                            <li>Maintain ongoing relationship with our PR firm.</li>
                            <li>Write and post press releases to the wire.</li>
                            <li>Manage relationships with feature writers from our member base and other outside writers.</li>
                            <li>Research and fact-check all feature articles for publication.</li>
                            <li>Establish and maintain a manual of style and best practices.</li>
                        </ul>
                        
                        Qualifications: 
                        <ul>
                            <li>Eagerness to give 110% to a startup for delayed gratification.</li>
                            <li>Ability to meet aggressive deadlines and juggle multiple priorities.</li>
                            <li>Expects to be challenged by setbacks, obstacles and shifting priorities.</li>
                            <li>Excellent written and verbal communication skills.</li>
                            <li>Experience writing for the Internet or a daily newspaper.</li>
                            <li>Meticulous attention to detail.</li>
                            <li>Basic knowledge of HTML.</li>
                            <li>Basic knowledge of desktop publishing tools (QuarkXPress, Acrobat, etc.).</li>
                            <li>Demonstrates an interest in technology, especially in computer software.</li>
                            <li>Degree in English, Journalism or equivalent.</li>
                        </ul>
                        
                        This position is at our Glastonbury, CT offices. No telecommuting options are available. 
                        <a class="bodyText" href="mailto:tces@topcoder.com?subject=TopCoder Web Editor">Apply for this job</a> by email. 
                        
                        <hr width="100%" noshade="noshade" /> -->

                        <h3>Salesperson</h3>
                        
                        <p>We are currently looking for a salesperson to join TopCoder Employment Services. Candidates must work well under pressure in a 
                        high-risk environment and must have excellent  communication skills. We currently offer two programs for clients&#151;the TopCoder 
                        Recruiting Program, whereby clients post jobs on our website and are given access to detailed statistical information about interested 
                        candidates, and the TopCoder Testing Program, whereby clients have the ability to test a developer's programming skills prior to making 
                        a hiring decision. The salesperson will be calling on qualified companies to identify and contact appropriate professionals interested in 
                        finding quality candidates through TopCoder. The salesperson will build a relationship with these professionals and set up phone calls 
                        and meetings for themselves and TopCoder executives.  Only qualified applicants with in-demand skills will be contacted. Salary and 
                        commission is based on experience.</p>
                        
                        Responsibilities: 
                        <ul>
                            <li>Identify companies with sales potential for TopCoder Employment Services.</li>
                            <li>Identify appropriate professionals within the companies. </li>
                            <li>Contact appropriate professionals and describe our company and programs. </li>
                            <li>Build a relationship with appropriate professionals. </li>
                            <li>Set up phone calls and meetings between appropriate professionals and TopCoder Executives. </li>
                            <li>Negotiate contracts and agreements with interested parties.</li>
                            <li>Ensure the collection of any outstanding payments due to TopCoder.</li>
                        </ul>
                        This position is at our Glastonbury, CT offices. No telecommuting options are available. <a class="bodyText" href="mailto:tces@topcoder.com?subject=TopCoder Employment Services Salesperson">Apply for this job</a> by email.
                        
                        <hr width="100%" noshade="noshade" />
                        
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170" bgcolor="#FFFFFF" valign="top"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="public_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="5" bgcolor="#FFFFFF"><img src="/i/clear.gif" width="5" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>

  </xsl:template>
</xsl:stylesheet>
