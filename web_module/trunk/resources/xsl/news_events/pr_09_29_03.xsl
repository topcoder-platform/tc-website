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

<title>TopCoder Announces Intel as Title Sponsor</title>

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
                        <p><span class="bodyTitle">TopCoder Announces Intel as Title Sponsor for Annual International Programming Tournament</span><br />
                        <span class="bodySubTitle"><em>World's Largest Chip Maker Joins TopCoder in Crowning International Programming Champion</em></span></p>
                        </div>
                        
                        <p><strong>GLASTONBURY, Conn., September 29, 2003&#151;</strong>
                        TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced Intel 
                        Corporation as the title sponsor for the 2003 TopCoder Open.  The 2003 TopCoder Open will bring many of the world's best programmers together 
                        in competition for international ranking, notoriety and the $100,000 prize purse, of which $50,000 will be awarded to the tournament champion.  
                        Details are provided at: <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_overview">http://www.topcoder.com/tco</A>.</p>

                        <p>Beginning in October, programmers from all around the world will compete in qualifying rounds of the 2003 TopCoder Open.  Through a series 
                        of online rounds, the field will be narrowed to 16 semifinalists.  These semifinalists will then compete head-to-head over two days at the Mohegan 
                        Sun Casino in Uncasville, CT on December 4th and 5th.  For the first time, in addition to the programming tournament, the event will feature new 
                        component design and development contests.  The winners of each of these contests will receive $15,000.</p>

                        <p>"Intel is excited to be a part of this great programming tournament," said Richard Wirt, Intel Senior Fellow and General Manager, Software and 
                        Solutions Group.  "It is clear that many of these competitors are involved in the technology decisions that will shape our future.  By working together 
                        with TopCoder, Intel and its developer network, Intel Developer Services (<A href="http://www.intel.com/IDS">www.intel.com/IDS</A>), will continue to educate programmers on current 
                        and next-generation computing initiatives and technologies."</p>

                        <p>"Intel is the ultimate technology leader and matches well with the TopCoder member base," said Jack Hughes, Chairman and Founder of TopCoder.  
                        "Our members want to be associated with the best technology resources in the world.  To that end, we are happy to bring them that much closer to 
                        Intel by joining forces to put on the 2003 TopCoder Open."</p>

                        <p><span class="bodySubTitle">About TopCoder, Inc.</span><br />
                        TopCoder, Inc. organizes and hosts online and onsite programming competitions for a global community of members.  TopCoder members extend across 
                        all professional and collegiate levels.  The attraction of competition and the associated rewards create a powerful community of programmers.  Corporate 
                        partners access this member base for employment, software development and sponsorship.  For registration details or information regarding TopCoder 
                        Software, TopCoder Employment Services or sponsorship of TopCoder Events, please visit <A href="/">www.topcoder.com</A> or call toll free 866-TOPCODER.</p>

                        <p>TopCoder is a trademark of TopCoder, Inc. in the United States and other countries.</p>

                        <p>Intel is a trademark of Intel Corporation or its subsidiaries in the United States and other countries.</p>

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
