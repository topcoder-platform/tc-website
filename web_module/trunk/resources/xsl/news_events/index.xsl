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

<title>TopCoder | Press Room</title>

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
        <td width="170" bgcolor="#CCCCCC" valign="top">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="5" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->	
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">press_room</xsl:with-param>
                <xsl:with-param name="title">Press Releases</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr><td class="bodyText"><div align="right"><A href="/?t=news_events&amp;c=articles">Go to Articles</A></div></td></tr>
            
                <tr valign="top">
                    <td class="bodyText" width="100%">      
                        <table width="100%" border="0" cellpadding="4" cellspacing="0">

<!-- 2003 -->
                            <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2003</font></td></tr>
                            
                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_05_21_03_javaone">TopCoder to Administer Contest at the 2003 JavaOne<span class="super">SM</span> Conference </A> [May 21]</td></tr>    
                           
                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_05_14_03">Amity Regional Takes First Place in 2003 High School Challenge</A> [May 21]</td></tr>    
                           
                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_05_14_03">TopCoder and CAS Announce 2003 High School Challenge</A> [May 14]</td></tr>    
                           
                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_04_08_03">Duke University's David Arthur Wins 2003 Collegiate Challenge</A> [April 8]</td></tr>    
                        
                            <tr><td class="prHead"><A href="/index?t=news_events&amp;c=pr_03_13_03">Sun Microsystems<span class="super">TM</span> and TopCoder Highlight Field for 2003 Collegiate Challenge</A> [March 13]</td></tr>
                            
                            <tr><td><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>
                        
<!-- 2002 -->
                            <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2002</font></td></tr>
                            
                            <tr><td class="prHead"><A href="/index?t=news_events&amp;c=pr_11_11_02">Sixteen Finalists Announced in 2002 TopCoder Invitational</A> [November 11]</td></tr>

                            <tr><td class="prHead"><A href="/index?t=news_events&amp;c=pr_10_30_02">TopCoder Competitions Expand to High Schools</A> [October 30]</td></tr>

                            <tr><td class="prHead"><A href="/index?t=news_events&amp;c=pr_10_28_02">Finalists Announced for 2002 TopCoder Invitational</A> [October 28]</td></tr>

                            <tr><td class="prHead"><A href="/index?t=news_events&amp;c=pr_10_22_02">TopCoder Expands to Include Employment Services</A> [October 22]</td></tr>
      
                            <tr><td class="prHead"><A href="/index?t=news_events&amp;c=pr_08_13_02">Sun Microsystems<span class="super">TM</span> and TopCoder Host SunNetwork<span class="super">SM</span> Coding Challenge</A> [August 13]</td></tr>
        
                            <tr><td class="prHead"><A href="/index?t=news_events&amp;c=pr_05_28_02">China, New Zealand and Ireland Added to TopCoder Developer Community</A> [May 28]</td></tr>

                            <tr><td class="prHead"><A href="/index?t=news_events&amp;c=pr_03_25_02">Sixteen Finalists Announced for $150,000 Collegiate Challenge</A> [March 25]</td></tr>
                                            
                            <tr><td class="prHead"><A href="/index?t=news_events&amp;c=pr_03_05_02">TopCoder Reaches 10,000 Member Milestone</A> [March 5]</td></tr>
                        
                            <tr><td class="prHead"><A href="/index?t=news_events&amp;c=pr_02_19_02">Field Announced for 2002 Sun Microsystems and TopCoder Collegiate Challenge</A> [February 19]</td></tr>
          
                            <tr><td class="prHead"><A href="/index?t=news_events&amp;c=pr_01_28_02">United Kingdom Added to TopCoder Developer Community</A> [January 28]</td></tr>
                        
                            <tr><td><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>
                        
<!-- 2001 -->
                            <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2001</font></td></tr> 

                            <tr><td class="prHead"><A href="/index?t=news_events&amp;c=pr_12_10_01">Sun<span class="super">TM</span> Sponsoring 2002 Collegiate Challenge</A> [December 10]</td></tr>
           
                            <tr><td class="prHead"><A href="/index?t=news_events&amp;c=pr_11_06_01">Houston Native Jon McAlister Wins $250,000 TopCoder Invitational</A> [November 6]</td></tr>

                            <tr><td class="prHead"><A href="/index?t=news_events&amp;c=pr_10_15_01">TopCoder Announces Sixteen Finalists For $250,000 Invitational Tournament</A> [October 15]</td></tr>
 
                            <tr><td class="prHead"><A href="/index?t=news_events&amp;c=pr_09_24_01">Foxwoods to Host $250,000 TopCoder Invitational Tournament</A> [September 24]</td></tr>

                            <tr><td class="prHead"><A href="/index?t=news_events&amp;c=pr_06_07_01">Jason Woolever Wins 2001 TopCoder Collegiate Challenge</A> [June 7]</td></tr>
 
                            <tr><td class="prHead"><A href="/index?t=news_events&amp;c=pr_05_29_01">TopCoder Addresses Demand for Elite Programmers with Coding Competitions</A> [May 29]</td></tr>
                 
                            <tr><td class="prHead"><A href="/index?t=news_events&amp;c=pr_05_22_01">Sixteen Collegiate Programmers to Compete for Coveted "TopCoder" Title</A> [May 22]</td></tr>
                 
                            <tr><td class="prHead"><A href="/index?t=news_events&amp;c=pr_04_24_01">TopCoder Names Jack Hughes Chairman of the Board</A> [April 24]</td></tr>
                        </table>

                        <p><br /></p>

                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170" valign="top"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="public_right_col"/>       
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
