<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/tccc03_links.xsl"/>
  <xsl:import href="../includes/modules/tccc03summary_links.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
<html>
<head>

<xsl:call-template name="Preload"/>

<title>TopCoder | Tournaments</title>

<!-- Include external CSS files -->
<xsl:call-template name="CSS"/>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

<script language="JavaScript">
  function changeImage(image, newImage) {
    document[image].src=newImage;
    return;
  }
</script>
     
</head>

<body>

<!-- Top begins -->
<xsl:call-template name="Top"/>
<!-- Top ends -->

<a name="top_page"></a>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC">
              <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">steelgray</xsl:with-param>
                <xsl:with-param name="image">tournaments_gray</xsl:with-param>
                <xsl:with-param name="title">Brackets</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="tccc03_links">
                <xsl:with-param name="selectedTab">summary</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="summary_links"/>
    
            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr><td height="1"><img src="/i/clear.gif" alt="" width="10" height="3" border="0"/></td></tr>
                <tr><td class="tourney_subnav" colspan="3"><strong>Tournament Advancement Brackets</strong></td></tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="3" width="100%" bgcolor="#333333">
                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                    <td width="99%" class="bodyText"><div align="center"><img src="/i/tournament/tccc03/tccc03_brackets.gif" width="507" height="312" usemap="#tccc03_rooms" border="0"/></div></td>

                        <map name="tccc03_rooms">
                            <area shape="rect" alt="" coords="392,262,498,282" href="/stat?c=member_profile&amp;cr=274498" class="statText"/>
                            <area shape="rect" alt="" coords="392,235,498,256" href="/stat?c=member_profile&amp;cr=266571" class="statText"/>
                            <area shape="rect" alt="" coords="393,208,498,228" href="/stat?c=member_profile&amp;cr=155275" class="statText"/>
                            <area shape="rect" alt="" coords="392,181,498,201" href="/stat?c=member_profile&amp;cr=262936" class="statText"/>
                            <area shape="rect" alt="" coords="391,108,499,126" href="/stat?c=member_profile&amp;cr=156592" class="statText"/>
                            <area shape="rect" alt="" coords="392,81,499,102" href="/stat?c=member_profile&amp;cr=251183" class="statText"/>
                            <area shape="rect" alt="" coords="392,52,498,75" href="/stat?c=member_profile&amp;cr=114853" class="statText"/>
                            <area shape="rect" alt="" coords="392,27,500,46" href="/stat?c=member_profile&amp;cr=158837" class="statText"/>
                            <area shape="rect" alt="" coords="10,261,116,282" href="/stat?c=member_profile&amp;cr=273112" class="statText"/>
                            <area shape="rect" alt="" coords="8,235,116,257" href="/stat?c=member_profile&amp;cr=107835" class="statText"/>
                            <area shape="rect" alt="" coords="8,208,117,229" href="/stat?c=member_profile&amp;cr=287496" class="statText"/>
                            <area shape="rect" alt="" coords="9,182,117,201" href="/stat?c=member_profile&amp;cr=264869" class="statText"/>
                            <area shape="rect" alt="" coords="8,107,116,128" href="/stat?c=member_profile&amp;cr=311051" class="statText"/>
                            <area shape="rect" alt="" coords="9,80,115,101" href="/stat?c=member_profile&amp;cr=269554" class="statText"/>
                            <area shape="rect" alt="" coords="8,53,117,74" href="/stat?c=member_profile&amp;cr=263379" class="statText"/>
                            <area shape="rect" alt="" coords="9,25,117,48" href="/stat?c=member_profile&amp;cr=153902" class="statText"/>
                        </map>   
            
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>

                <tr><td colspan="4" width="100%"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>     
            </table>

            <p><br/></p>
        
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
<!-- Body Ends -->

<!-- Foot begins -->
<xsl:call-template name="Foot"/>
<!-- Foot ends -->

</body>
</html>

  </xsl:template>
</xsl:stylesheet>


