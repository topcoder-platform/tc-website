<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>
  <xsl:import href="../includes/pr_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>      

<title>TopCoder Hosts Software Component Design and Development Contest</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<!-- Header begins -->
<xsl:call-template name="Top"/>
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="180" valign="top">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->	
        <td class="bodyText" width="99%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">press_room</xsl:with-param>
                <xsl:with-param name="title">&#160;Press Release</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                        <div align="center">
                        <p><span class="bodyTitle">TopCoder Hosts Software Component Design and Development Contest as Part of 2003 TopCoder Open</span><br />
                        <span class="bodySubTitle"><em>International Competitors Vie For $30,000</em></span></p>
                        </div>
                        
                        <p><strong>GLASTONBURY, Conn., August 19, 2003&#151;</strong>
                        TopCoder, Inc., the leader in on-line programming competition and skills assessment, today announced its Software 
                        Component Design and Development Contest as part of the 2003 TopCoder Open.  In addition to the annual coding 
                        competition for professional and collegiate programmers, TopCoder will host a separate two-part contest focused on 
                        software component development.  One aspect of the component competition will test the design skills of software 
                        architects while the other will challenge programmers to implement previous winning designs.</p>

                        <p>"The addition of the Software Component Design and Development Contest is a natural progression for TopCoder," 
                        said Jack Hughes, chairman and founder of TopCoder.  "The common denominator amongst our vast and growing member 
                        base is great technologists.  The additional competitions allow them to test their skills by tackling a business problem 
                        with a software design, or use existing designs to develop software components, in addition to quickly solving 
                        algorithmic problems.  Many will do all three."</p>

                        <p><span class="bodySubTitle">Software Component Design and Development Contest</span><br />
                        The development competition of the Software Component Design and Development Contest begins on September 2.  
                        TopCoder will post software designs <A href="/?&amp;t=development&amp;c=comp_projects">here</A>.  
                        Eligible TopCoder members view the project designs and submit source code by September 15.  On September 4, the 
                        design competition begins and TopCoder will post software design specifications.  Architects are invited to submit 
                        designs by September 17.  All submissions will be judged in a peer review process and given a score.  Ten competitors 
                        will advance in each competition.</p>

                        <p>The second online rounds will begin on October 7 and October 9 for the development and design competitions, 
                        respectively.  Submission deadlines will be October 20 and October 22.  Two competitors from each of the second 
                        online rounds will advance to the finals.</p>

                        <p>The final four will compete simultaneously in two head-to-head competitions onsite at the Mohegan Sun Casino 
                        in Uncasville, Connecticut on December 5.  The winner of the onsite design and development competitions will each 
                        receive a grand prize of $10,000.  Each second place finisher will receive $5,000.</p>

                        <p>"We are very excited to integrate a software design and development contest into the TopCoder Open," said Dave 
                        Tanacea, president of TopCoder Software.  "It gives us an opportunity to showcase the quality of the commercial 
                        software TopCoder Software is building in addition to highlighting the incredible talent of TopCoder members."</p>

                        <p><span class="bodySubTitle">About TopCoder Software</span><br />
                        TopCoder Software harnesses the talent of the internationally ranked TopCoder member base to design, develop and 
                        implement cost-effective, high quality software.  Through a unique competition-based development methodology, 
                        TopCoder Software leverages its catalogs of re-usable components to develop and deliver commercial applications 
                        and services.  For more information regarding TopCoder Software, please visit www.topcodersoftware.com.</p>

                        <p>###</p>
                        <p><br /></p>
                        

                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170" valign="top"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="pr_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
<xsl:call-template name="Foot"/>
<!-- Footer ends -->

</body>

</html>

  </xsl:template>
</xsl:stylesheet>
