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

<title>NVIDIA is a corporate sponsor of the 2003 TopCoder Open coding tournament</title>

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
        <td width="170" valign="top">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
<!-- Gutter Ends -->

<!-- Center Column Begins -->	
        <td class="promoText" width="100%">
            <table width="100%" border="0" cellpadding="15" cellspacing="0">
                <tr>
                    <td colspan="2" align="center"><A href="http://www.nvidia.com/page/home" target="_blank"><img src="/i/tournament/tco03/sponsors/nvidia/nvidia_banner.gif" alt="NVIDA" width="510" height="100" border="0" /></A>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><img src="/i/tournament/tco03/sponsors/nvidia/nvidia_visualize.gif" alt="NVIDA" width="357" height="18" border="0" />
                    </td>
                </tr>
                
                <tr valign="top">
                    <td class="bodyText" align="left" width="255">
                        
                        <p>At NVIDIA we're continually looking for the elite few who will shape the future of the software 
                        industry&#133;  those who play hard, work smart, and always strive to win.  The visual computing industry is ultra-competitive and the stakes are high&#133;
                        to remain a market leader we hire only the brightest and most innovative engineering talent.  As a TopCoder member you've distinguished yourself 
                        as a skilled coder who seeks a challenge, and as a competitor in the TopCoder Open you've told us that nothing can stop you from competing against 
                        the best of the best.</p>
                        
                        <p>NVIDIA's culture promotes and inspires our team of world-class engineers and developers to be at the top of their game.  We are creative, passionate, 
                        and we are shaping the world of tomorrow&#133;today.  </p>
                     </td>
                     
                      <td class="promoText" align="left" width="255">
                        <p>We invite you to explore the opportunities available at NVIDIA. Click on the link to see what your future may hold.</p>
                        <p><ul>
                        <li>Experienced professionals </li>
                        <li>New &#38; Recent College Graduates </li>
                        <li>Interns &#38; Co-ops</li></ul></p>
                       <p><strong>We love what we do because we do what we love. Join us.</strong></p>
                      </td>
                  </tr>
        
        
        <tr>
            <td colspan="2" align="center"><img src="/i/tournament/tco03/sponsors/nvidia/nvidia_partnering.gif" alt="NVIDA" width="357" height="18" border="0" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="left" class="bodyText">
                <p><A href="http://www.nvidia.edu" target="_blank"><img src="/i/tournament/tco03/sponsors/nvidia_geforcefx.gif" alt="geforce" width="160" height="160" border="0" align="right" /></A>
                         As a world leader in visual computing technology NVIDIA's objective remains solid: to be the most important 3D company in the world. We are committed 
                         to developing innovative technologies that deliver stunning multimedia experiences on mass computing platforms. We invest in our people and our 
                         technologies, support and fund industry research around the world, and consistently deliver a quality, competitively priced product to our customers. </p>
          
                        
                        <p>We constantly evaluate opportunities to partner with organizations that fit our corporate culture and objectives, and we're pleased to again be a part of 
                        TopCoder's programming competitions, this time as a leading sponsor of the TopCoder Open."TopCoder has built a great community of top notch, competitive talent.  
                        It's great when you see such a group of supportive folks really driving each other to excel.  We see a lot of synergy between the TopCoder community and our own 
                        here at NVIDIA.  We're delighted to be participating again, and I'm personally excited to see the college talent go toe to toe with the professionals.  It'll be a great 
                        match!" said Daniel Rohrer, Manager of Direct X Graphics at NVIDIA.</p>
                        
                        
                        <p>We at NVIDIA wish you and your colleagues the best of luck in the TopCoder Open, and encourage you to explore your potential for innovation in future 
                        TopCoder programs and at NVIDIA.  Regardless of points earned or rounds won, NVIDIA is proud of all who support and invest in TopCoder initiatives, and we 
                        look forward to a long and productive relationship with TopCoder and its participants.</p>
                        
                    </td>
                </tr>
            </table>
            <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <xsl:call-template name="public_right_col">
                <xsl:with-param name="sectionName">tourny</xsl:with-param>
            </xsl:call-template>
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
