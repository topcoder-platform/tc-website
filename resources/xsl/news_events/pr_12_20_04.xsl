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

<title>TopCoder&#174; Announces Yahoo! as Title Sponsor for 2005 TopCoder Collegiate Challenge</title>

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
                        <p><span class="bodyTitle">TopCoder&#174; Announces Yahoo! as Title Sponsor for 2005 TopCoder Collegiate Challenge</span><br />
                        <span class="bodySubTitle"><em>Leading Global Internet Company Pairs with TopCoder in $150,000 programming tournament for collegiate coders</em></span></p>
                        </div>
                        
                        <p><strong>GLASTONBURY, CT, December 20, 2004&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced Yahoo! Inc. as the title sponsor of the 2005 TopCoder Collegiate Challenge (TCCC).  The 2005 TCCC will bring many of the world's finest student programmers together in competition for international ranking, notoriety and a share of the $150,000 prize purse for Algorithm, Design and Development categories. Details and rules are provided at:  <A href="/tccc05">http://www.topcoder.com/tccc05</A>
<br /><br />
"Yahoo! is proud to continue our relationship with TopCoder and more importantly, our relationship with the talented coders participating in the TopCoder Collegiate Challenge," said Libby Sartain, Senior Vice President, Human Resources and Chief People Yahoo.  "This competition is a tremendous recruiting opportunity for Yahoo! and we look forward to meeting with the outstanding coders who have the potential to become outstanding Yahoos."   
<br /><br />
Registration for the tournament begins today.  Starting in January, eligible college students from around the world will compete in qualifying rounds of the 2005 TCCC. Contestants will have their choice of participating in either the Algorithm or Component competitions, or both should they be that skilled.  Through a series of online rounds, the field will be narrowed to 32 semifinalists, comprised of 24 Algorithm and 8 Component competitors. These semifinalists will then compete head-to-head over two days during the onsite finals at the Santa Clara Marriott in Santa Clara, California on March 10th and 11th to determine the winners.
<br /><br />
The Algorithm competition will award up to 500 competitors with $60,000 in cash and other prizes, with the winner taking home $20,000. The Component Design and Development competitions will share $90,000 in cash prizes.  The Design champion will win $25,000 and the Development champion $13,000.
<br /><br />
 "At the very core of what we do at TopCoder is the belief that competition is the best method of evaluating ability and delivering quantifiable results," said Rob Hughes, President of TopCoder.  "TopCoder tournaments provide our clients the chance to interface with some of the world's most ruthlessly proficient programmers in the most demanding of environments -the onsite final." 
<br /><br />
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com. 
<br /><br />
TopCoder is a trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.
						</p>
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
