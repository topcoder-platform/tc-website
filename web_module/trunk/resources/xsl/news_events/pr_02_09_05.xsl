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

<title>Google Code Jam Comes to India</title>

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
                        <p><span class="bodyTitle">GOOGLE CODE JAME COMES TO INDIA</span><br />
                        <span class="bodySubTitle"><em>Google Research &amp; Development Centre in Bangalore Launches Google India Code Jam to Find South Asia's Best Programmers</em></span></p>
                        </div>
                        
                        <p><strong>BANGALORE, INDIA, February 9, 2005&#151;</strong>
                        Google India today announced the launch of the Google India Code Jam 2005, a computer programming competition with a Rs. 3,00,000 ($6,900) first prize, to find the best programming talent from India and South Asia. 
                        <br /><br />	
                        The Google India Code Jam is an extension of Google's annual Code Jam competition and celebrates the art of computer science, demonstrating to software professionals everywhere the value Google places on excellent coding. In addition to rewarding the top programmers in the region, Google India also hopes that the competition will provide further opportunities to attract strong technical talent to the new Google R&amp;D centre in Bangalore, which opened in early 2004. 
                        <br /><br />	
                        The competition is open to participants throughout the region and registration begins today through February 25.  On February 27, contestants will compete online to qualify for the top 500 spots in the first round.  These 500 qualifiers will battle head-to-head for the 50 final positions.  Finalists will be flown to the Google R&amp;D Centre in Bangalore for the championship round on March 26.  The winner of the Google India Code Jam will receive Rs. 3,00,000 ($6,900) while additional cash prizes totaling Rs. 13,00,000 ($30,000) will be distributed to the other 49 finalists.
                        <br /><br />	
                        The Google India Code Jam is powered by TopCoder, Inc., the recognised leader in online programming competition, skills assessment and competitive software development.
                        <br /><br />	
                        More information on the competition and how to participate is available at www.google.com/bangalore - which also provides information about employment opportunities at the Google R&amp;D Centre in Bangalore.
                        <br /><br />	
                        <span class="bodySubtitle">About Google Inc.</span><br />
                        Google's innovative search technologies connect millions of people around the world with information every day. Founded in 1998 by Stanford Ph.D. students Larry Page and Sergey Brin, Google today is a top web property in all major global markets. Google's targeted advertising programme provides businesses of all sizes with measurable results, while enhancing the overall web experience for users. Google is headquartered in Silicon Valley with offices throughout North America, Europe, and Asia. For more information, visit www.google.com.
                        <br /><br />	
                        Google is a registered trademark of Google Inc. All other company and product names may be trademarks of the respective companies with which they are associated.
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
