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

<title>TopCoder Press Releases Archive</title>

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
        <td width="15"><img src="/i/clear.gif" width="15" height="5" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->	
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">press_room</xsl:with-param>
                <xsl:with-param name="title"></xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr><td class="bodyText"><div align="right"><A href="/?t=news_events&amp;c=index">Current News</A>&#160;&#160;|&#160;&#160;<strong>Press Releases Archive</strong>&#160;&#160;|&#160;&#160;<A href="/?t=news_events&amp;c=article_archive">Articles Archive</A></div></td></tr>
            </table>
            
            <table width="100%" border="0" cellpadding="4" cellspacing="0">

<!-- 2005 -->
                            <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2005</font></td></tr>
                            
                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_01_25_05">TCS Delivers for International Consortium of Spinal Cord Injury Researchers</A> [January 25]<br/></td></tr>

                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_01_18_05">TopCoder&#174; Announces Motorola as Premier Sponsor of 2005 TopCoder Collegiate Challenge</A> [January 18]<br/><br/></td></tr>

<!-- 2004 -->
                            <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2004</font></td></tr>
                            
                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_12_20_04">TopCoder&#174; Announces Yahoo! as Title Sponsor for 2005 TopCoder Collegiate Challenge</A> [December 20]<br/></td></tr>

                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_11_15_04">Champions Announced In 2004 TopCoder&#174; Open Sponsored by Microsoft&#174;</A> [November 15]<br/></td></tr>

                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_11_01_04">TopCoder&#174; Announces Finalists for 2004 TopCoder Open Sponsored by Microsoft&#174;</A> [November 1]<br/></td></tr>

                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_10_05_04">Google announces 50 Google Code Jam Finalists</A> [October 5]<br/></td></tr>

                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_09_27_04">TopCoder Developing Web- Based Application for CRPF Spinal Cord Injury Research Group</A> [September 27]<br/></td></tr>

                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_09_07_04">TopCoder Software Industry Expert Michael Morris to Speak at 2004 SD Best Practices Conference</A> [September 7]<br/></td></tr>

                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_09_02_04">Yahoo! Signs On as Premier Sponsor of 2004 TopCoder Open</A> [September 2]<br/></td></tr>

                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_08_18_04">Intel Corporation Sponsors 2004 TopCoder Open Tournament</A> [August 18]<br/></td></tr>

                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_08_10_04">TopCoder Software Wins New Customer Contracts</A> [August 10]<br/></td></tr>

                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_08_04_04">NVIDIA Named Premier Level Sponsor of 2004 TopCoder Open Tournament</A> [August 4]<br/></td></tr>

                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_07_28_04">TopCoder Announces Microsoft as Title Sponsor for 2004 TopCoder Open Tournament</A> [July 28]<br/></td></tr>

                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_05_12_04">TopCoder Announces the Ultimate Software Development Contest</A> [May 12]<br/></td></tr>

                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_05_03_04">JavaOne Coding Challenge Powered by TopCoder</A> [May 03]<br/></td></tr>

                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_04_19b_04">Champions Announced In 2004 TCCC Sponsored by Yahoo!&#174;</A> [April 19]<br/></td></tr>

                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_04_19_04">Custom Web Application Enables Online Gift Card Service</A> [April 19]<br/></td></tr>

                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_04_06_04">TopCoder&#174; Announces 32 Semifinalists for 2004 TCCC Sponsored by Yahoo!&#174;</A> [April 6]<br/></td></tr>

                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_03_08_04">NVIDIA Sponsors 2004 TopCoder Collegiate Challenge</A> [March 8]<br/></td></tr>

                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_03_01_04">Columbia University Student Wins DCCC '04</A> [March 1]<br/></td></tr>

                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_02_16_04">TopCoder Announces Yahoo! as Title Sponsor for TCCC04</A> [February 16]<br/></td></tr>

                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_02_02_04">TopCoder Announces DoubleClick 2004 Coding Challenge</A> [February 2]<br/><br/></td></tr>

<!-- 2003 -->
                            <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2003</font></td></tr>

                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_12_08_03">Winners Announced in 2003 TopCoder Open sponsored by Intel&#174;</A> [December 8]</td></tr>
                            
                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_12_01_03">TopCoder and AT&amp;T Announce Winners of Charity Programming Tournament</A> [December 1]</td></tr>
                            
                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_11_12_03">TopCoder Announces Finalists in International Programming Tournament</A> [November 12]</td></tr>
                            
                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_11_06_03">AT&amp;T Foundation to Sponsor TopCoder Charity Tournament</A> [November 6]</td></tr>
                            
                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_11_03_03">TopCoder Teams with Telecom Leaders in OSS through Java&#153; Initiative</A> [November 3]</td></tr>
                            
                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_10_14_03">Talbots Licenses Component Catalog From TopCoder Software</A> [October 14]</td></tr>
                            
                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_10_01_03">Artifact and Northface to sponsor TopCoder Open</A> [October 1]</td></tr>
                            
                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_09_29_03">Intel is the Title Sponsor for TopCoder Open</A> [September 29]</td></tr>
                            
                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_09_22_03">NVIDIA Signs On To Sponsor 2003 TopCoder Open</A> [September 22]</td></tr>
                            
                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_08_13_03">TopCoder Charity Challenge</A> [August 13]</td></tr>
                        
                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_08_11_03">High quality software applications at a low cost</A> [August 11]</td></tr>
                        
                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_07_23_03">TopCoder has a Revelation</A> [July 23]</td></tr>
                        
                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_07_22_03">I want my VB.NET</A> [July 21]</td></tr>
                        
                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_06_17_03">Sweden Added to TopCoder Developer Community</A> [June 16]</td></tr>
                        
                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_06_16_03">Come In, We're Open</A> [June 16]</td></tr>
                        
                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_05_21_03_javaone">JavaOne Coding Challenge is Powered by TopCoder</A> [May 21]</td></tr>
                        
                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_05_21_03_hs">Amity clinches High School Challenge</A> [May 21]</td></tr>
                        
                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_05_14_03">TopCoder Challenges High School Students</A> [May 14]</td></tr>
                        
                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_04_07_03">David Arthur takes home the Collegiate Challenge crown</A> [April 7]</td></tr>
                        
                            <tr><td class="prHead"><A href="/?&amp;t=news_events&amp;c=pr_03_13_03">2003 Sun Microsystems TopCoder Collegiate Challenge</A> [March 13]</td></tr>
                        
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
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
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
