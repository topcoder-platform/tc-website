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
        <td width="180">
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
                            <AREA SHAPE="rect" ALT="" COORDS="391,261,498,284" HREF="/stat?c=member_profile&amp;cr=274498" class="statText"/>
							<AREA SHAPE="rect" ALT="" COORDS="390,234,498,256" HREF="/stat?c=member_profile&amp;cr=266571" class="statText"/>
							<AREA SHAPE="rect" ALT="" COORDS="390,207,498,229" HREF="/stat?c=member_profile&amp;cr=155275" class="statText"/>
							<AREA SHAPE="rect" ALT="" COORDS="390,179,499,202" HREF="/stat?c=member_profile&amp;cr=262936" class="statText"/>
							<AREA SHAPE="rect" ALT="" COORDS="390,106,498,128" HREF="/stat?c=member_profile&amp;cr=156592" class="statText"/>
							<AREA SHAPE="rect" ALT="" COORDS="390,79,499,101" HREF="/stat?c=member_profile&amp;cr=251183" class="statText"/>
							<AREA SHAPE="rect" ALT="" COORDS="389,53,498,74" HREF="/stat?c=member_profile&amp;cr=114853" class="statText"/>
							<AREA SHAPE="rect" ALT="" COORDS="390,25,498,48" HREF="/stat?c=member_profile&amp;cr=158837" class="statText"/>
							<AREA SHAPE="rect" ALT="" COORDS="268,220,377,242" HREF="/stat?c=member_profile&amp;cr=262936" class="statText"/>
							<AREA SHAPE="rect" ALT="" COORDS="268,66,376,88" HREF="/stat?c=member_profile&amp;cr=114853" class="statText"/>
							<AREA SHAPE="rect" ALT="" COORDS="199,143,307,165" HREF="/stat?c=member_profile&amp;cr=262936" class="statText"/>
							<AREA SHAPE="rect" ALT="" COORDS="130,220,238,242" HREF="/stat?c=member_profile&amp;cr=107835" class="statText"/>
							<AREA SHAPE="rect" ALT="" COORDS="129,65,239,88" HREF="/stat?c=member_profile&amp;cr=269554" class="statText"/>
							<AREA SHAPE="rect" ALT="" COORDS="8,261,116,283" HREF="/stat?c=member_profile&amp;cr=273112" class="statText"/>
							<AREA SHAPE="rect" ALT="" COORDS="7,235,117,256" HREF="/stat?c=member_profile&amp;cr=107835" class="statText"/>
							<AREA SHAPE="rect" ALT="" COORDS="8,207,116,228" HREF="/stat?c=member_profile&amp;cr=287496" class="statText"/>
							<AREA SHAPE="rect" ALT="" COORDS="8,179,116,202" HREF="/stat?c=member_profile&amp;cr=264869" class="statText"/>
							<AREA SHAPE="rect" ALT="" COORDS="8,107,116,129" HREF="/stat?c=member_profile&amp;cr=311051" class="statText"/>
							<AREA SHAPE="rect" ALT="" COORDS="9,78,117,101" HREF="/stat?c=member_profile&amp;cr=269554" class="statText"/>
							<AREA SHAPE="rect" ALT="" COORDS="7,52,117,73" HREF="/stat?c=member_profile&amp;cr=263379" class="statText"/>
							<AREA SHAPE="rect" ALT="" COORDS="7,24,116,47" HREF="/stat?c=member_profile&amp;cr=153902" class="statText"/>
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


