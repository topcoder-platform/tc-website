<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/vcc03_links.xsl"/>
  <xsl:import href="../includes/modules/vcc03_sublinks.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
<html>
<head>

<xsl:call-template name="Preload"/>      

<title>2003 Verizon Coding Challenge - Computer Programming Tournament - Rules - Prizes</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<a name="top_page"></a>
<table valign="top" width="100%" cellpadding="0" cellspacing="0">
   <tr valign="top" width="100%">
      <td align="center" width="100%">
         <div align="center"><object 
            type="application/x-shockwave-flash"
            data="/i/tournament/vcc03/vcc03_still.swf"
            width="100%"
            height="125"
            valign="top">
            <param name="movie" value="/i/tournament/vcc03/vcc03_still.swf" />
            <param name="quality" value="high" />
         </object></div>
      </td>
   </tr>
</table>
<xsl:variable name="contestId">
    <xsl:value-of select="/TC/SCHEDULE/ContestId"/>
</xsl:variable>

<!-- Top Begins
<xsl:call-template name="Top"/>
Top Ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/>
        </td>
<!-- Gutter Ends -->

<!-- Left Column Begins-->
         <td>
         <p><img src="/i/clear.gif" width="180" height="10" border="0"/><br />
         <img src="/i/tournament/vcc03/vcc03_right.gif" width="180" height="400" border="0"/><br />
         <img src="/i/clear.gif" width="180" height="40" border="0"/>
         </p>
         </td>         
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
        <td class="bodyText" width="100%">
<!-- TCO Header -->
<!-- Tab bar links-->
            <xsl:call-template name="vcc03_links">
                <xsl:with-param name="selectedTab">rules</xsl:with-param>
            </xsl:call-template>

<!-- Tab bar sub links-->
            <xsl:call-template name="vcc03_sublinks">
                <xsl:with-param name="selectedList">rules</xsl:with-param>
                <xsl:with-param name="selectedTab">prizes</xsl:with-param>
            </xsl:call-template>
    
            <blockquote>
            <h2>About the Prizes</h2>
            
            <p>All participants who compete in Round #1 will receive a Verizon Coding Challenge t-shirt.  In addition, the top four scorers in the 
            Championship Round will receive cash prizes.  Any and all applicable taxes on prizes are the sole responsibility of the prizewinner.  
            Prizes will be distributed as follows:</p>
            
            <table width="450" border="0" cellpadding="5" cellspacing="2" class="sidebarBox" align="center">
                <tr>
                    <td width="50%" class="sidebarTitle">Competitor(s)</td>
                    <td width="50%" class="sidebarTitle" align="right">Prize</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText"><strong>1<span class="super">st</span> place finisher* in the Championship Round</strong></td>
                    <td width="50%" class="sidebarText" align="right"><strong>$1,000 USD</strong></td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">2<span class="super">nd</span> place finisher* in the Championship Round</td>
                    <td width="50%" class="sidebarText" align="right">$500 USD</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">3<span class="super">rd</span> place finisher* in the Championship Round</td>
                    <td width="50%" class="sidebarText" align="right">$300 USD</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">4<span class="super">th</span> place finisher* in the Championship Round</td>
                    <td width="50%" class="sidebarText" align="right">$100 USD</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">Up to 500 competitors who compete in Online Round #1</td>
                    <td width="50%" class="sidebarText" align="right">Verizon Coding Challenge t-shirt</td>
                </tr>


                <tr>
                    <td colspan="2" class="sidebarText">* Prize will be awarded at the conclusion of the Championship Round. 
                        Winner must be present at the onsite rounds to receive prize.</td>
                </tr>
            </table>
            </blockquote>

            <p><br/></p>
            
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
<!-- Right Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<!-- Footer Begins -->
<xsl:call-template name="FootVCC"/>
<!-- Footer Ends -->

</body>
</html>

  </xsl:template>
</xsl:stylesheet>

