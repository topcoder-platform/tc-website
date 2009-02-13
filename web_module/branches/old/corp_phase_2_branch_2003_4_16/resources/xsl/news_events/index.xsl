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
        <title>TopCoder :: Press Room</title>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </head>
      <body bgcolor="#FFFFFF" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
    <!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC">
        <xsl:call-template name="global_left"/>
        </td>
    <!-- Left Column Ends -->

    <!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" border="0"/></td>
    <!-- Gutter Ends -->

    <!-- Center Column Begins -->    
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">press_room</xsl:with-param>
                <xsl:with-param name="title">Press Releases</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
                    <td class="bodyText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="10" border="0"/><br />          
                        <table width="100%" border="0" cellpadding="3" cellspacing="0">

<!-- 2003 Press Releases -->
                            <tr valign="middle"><td class="statTextBig" colspan="2" background="/i/steel_gray_bg.gif">Press Releases - 2003</td></tr>
                            
                            <tr valign="top">
                                <td class="bodyText">04.08.03</td>
                                <td class="bodyText"><a class="bodyText" href="/?&amp;t=news_events&amp;c=pr_04_08_03">Duke University's David Arthur Wins 2003 Collegiate Challenge</a></td>
                            </tr>    
                             
                            <tr valign="middle">
                                <td class="bodyText" valign="top">03.13.03</td>
                                <td class="bodyText"><a class="bodyText" href="/index?t=news_events&amp;c=pr_03_13_03">Sun Microsystems and TopCoder Highlight Field for 2003 Collegiate Challenge</a></td>
                            </tr>
                            
                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>
                        
<!-- 2002 Press Releases -->
                            <tr valign="middle"><td class="statTextBig" colspan="2" background="/i/steel_gray_bg.gif">Press Releases - 2002</td></tr>
                            
                            <tr valign="middle">
                                <td class="bodyText" valign="top">11.11.02</td>
                                <td class="bodyText"><a class="bodyText" href="/index?t=news_events&amp;c=pr_11_11_02">TopCoder Announces 16 Finalists in 2002 TopCoder Invitational</a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText" valign="top">10.30.02</td>
                                <td class="bodyText"><a class="bodyText" href="/index?t=news_events&amp;c=pr_10_30_02">TopCoder Competitions Expand to High Schools</a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText" valign="top">10.28.02</td>
                                <td class="bodyText"><a class="bodyText" href="/index?t=news_events&amp;c=pr_10_28_02">TopCoder Announces Field for the 2002 TopCoder Invitational</a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText" valign="top">10.22.02</td>
                                <td class="bodyText"><a class="bodyText" href="/index?t=news_events&amp;c=pr_10_22_02">TopCoder Expands to Include Employment Services</a></td>
                            </tr>
      
                            <tr valign="middle">
                                <td class="bodyText" valign="top">08.13.02</td>
                                <td class="bodyText"><a class="bodyText" href="/index?t=news_events&amp;c=pr_08_13_02">Sun Microsystems and TopCoder Host SunNetwork(SM) Coding Challenge</a></td>
                            </tr>
        
                            <tr valign="middle">
                                <td class="bodyText" valign="top">05.28.02</td>
                                <td class="bodyText"><a class="bodyText" href="/index?t=news_events&amp;c=pr_05_28_02">TopCoder Adds China, New Zealand and Ireland To Its Developer Community</a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText" valign="top">03.25.02</td>
                                <td class="bodyText"><a class="bodyText" href="/index?t=news_events&amp;c=pr_03_25_02">TopCoder Announces Sixteen Finalists for $150,000 Sun Microsystems and TopCoder Collegiate Challenge</a></td>
                            </tr>
                                            
                            <tr valign="middle">
                                <td class="bodyText" valign="top">03.05.02</td>
                                <td class="bodyText"><a class="bodyText" href="/index?t=news_events&amp;c=pr_03_05_02">TopCoder Reaches 10,000 Members Milestone</a></td>
                            </tr>
                        
                            <tr valign="middle">
                                <td class="bodyText" valign="top">02.19.02</td>
                                <td class="bodyText"><a class="bodyText" href="/index?t=news_events&amp;c=pr_02_19_02">TopCoder Announces Field for the 2002 Sun Microsystems and TopCoder Collegiate Challenge</a></td>
                            </tr>
          
                            <tr valign="middle">
                                <td class="bodyText" valign="top">01.28.02</td>
                                <td class="bodyText"><a class="bodyText" href="/index?t=news_events&amp;c=pr_01_28_02">TopCoder Adds the United Kingdom To Its Developer Community</a></td>
                            </tr>
                        
                            <tr valign="middle">
                                <td class="bodyText" colspan="2"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>
                        
<!-- 2001 Press Releases -->
                            <tr valign="middle"><td class="statTextBig" colspan="2" background="/i/steel_gray_bg.gif" height="18">&#160;Press Releases - 2001</td></tr> 

                            <tr valign="middle">
                                <td class="bodyText" valign="top">12.10.01</td>
                                <td class="bodyText"><a class="bodyText" href="/index?t=news_events&amp;c=pr_12_10_01">Sun Sponsoring 2002 Collegiate Challenge</a></td>
                            </tr>
           
                            <tr valign="middle">
                                <td class="bodyText" valign="top">11.06.01</td>
                                <td class="bodyText"><a class="bodyText" href="/index?t=news_events&amp;c=pr_11_06_01">Houston Native Jon McAlister Wins $250,000 TopCoder Invitational</a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText" valign="top">10.15.01</td>
                                <td class="bodyText"><a class="bodyText" href="/index?t=news_events&amp;c=pr_10_15_01">TopCoder Announces Sixteen Finalists For $250,000 Invitational Tournament</a></td>
                            </tr>
 
                            <tr valign="middle">
                                <td class="bodyText" valign="top">09.24.01</td>
                                <td class="bodyText"><a class="bodyText" href="/index?t=news_events&amp;c=pr_09_24_01">Foxwoods to Host $250,000 TopCoder Invitational Tournament</a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText" valign="top">06.07.01</td>
                                <td class="bodyText"><a class="bodyText" href="/index?t=news_events&amp;c=pr_06_07_01">Jason Woolever Wins 2001 TopCoder Collegiate Challenge</a></td>
                            </tr>
 
                            <tr valign="middle">
                                <td class="bodyText" valign="top">05.29.01</td>
                                <td class="bodyText"><a class="bodyText" href="/index?t=news_events&amp;c=pr_05_29_01">TopCoder Addresses Demand for Elite Programmers with Coding Competitions</a></td>
                            </tr>
                 
                            <tr valign="middle">
                                <td class="bodyText" valign="top">05.22.01</td>
                                <td class="bodyText"><a class="bodyText" href="/index?t=news_events&amp;c=pr_05_22_01">Sixteen Collegiate Programmers to Compete for Coveted "TopCoder" Title</a></td>
                            </tr>
                 
                            <tr valign="middle">
                                <td class="bodyText" valign="top">04.24.01</td>
                                <td class="bodyText"><a class="bodyText" href="/index?t=news_events&amp;c=pr_04_24_01">TopCoder Names Jack Hughes Chairman of the Board</a></td>
                            </tr>
                        </table>

                        <p><br/></p>
                    
                    </td>
                    <td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>
                <tr><td colspan="3" width="100%"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>       
             </table>
        </td>
    <!-- Center Column Ends -->
<!-- Body Area Ends -->

    <!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
    <!-- Gutter Ends -->
    <!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>       
<!-- Right Column Include Ends -->        
        </td>
    <!-- Right Column Ends -->
    <!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
    <!-- Gutter Ends -->
    </tr>
</table>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
