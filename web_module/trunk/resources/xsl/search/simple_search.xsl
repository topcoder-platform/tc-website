<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/scroll.xsl"/>
  <xsl:import href="../includes/modules/rating.xsl"/>  
  <xsl:import href="../includes/modules/stats_intro.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>      

<title>Member Search Results at TopCoder</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
    <!-- Gutter Ends -->

<!-- Center Column Begins -->	
        <td class="bodyText" width="99%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">steelblue</xsl:with-param>
                <xsl:with-param name="image">statistics</xsl:with-param>
                <xsl:with-param name="title">Member Search Results</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="10" bgcolor="#001B35" width="100%">
                <tr valign="top">
                    <td width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/>
                        <xsl:if test="/TC/MEMBER_SEARCH/MemberSearch/IsResult='true'">
                        <form name="simpleSearch" method="get">
                        <input type="hidden" name="t" value="search"/>
                        <input type="hidden" name="c" value="simple_search"/>
                        <input type="hidden" name="Next" value=""/>
                        
                        <table border="0" cellspacing="0" cellpadding="3" width="100%">
                            <xsl:variable name="row">
                                <xsl:value-of select="/TC/MEMBER_SEARCH/MemberSearch/Scroll/Row"/>
                            </xsl:variable>
                            
                            <xsl:variable name="returns">
                                <xsl:value-of select="/TC/MEMBER_SEARCH/MemberSearch/Scroll/Returns"/>
                            </xsl:variable>
                            
                            <xsl:variable name="size">
                                <xsl:value-of select="/TC/MEMBER_SEARCH/MemberSearch/Scroll/Size"/>
                            </xsl:variable>
                            
                            <tr valign="middle">
                                <td background="/i/steel_gray_bg.gif" colspan="7" class="statTextBig">Search Results:
                                    <xsl:choose>
                                        <xsl:when test="number($size)>0">
                                        &#160;&#160;<xsl:value-of select="$row"/>
                                        to
                                    <xsl:choose>
                                        <xsl:when test="number($row)+number($returns)>number($size)">
                                            <xsl:value-of select="$size"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="number($row)+number($returns)-1"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    of
                                        <xsl:value-of select="$size"/>
                                        </xsl:when>
                                        <xsl:otherwise>0</xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
          
                            <tr valign="middle">
                                <td class="statText" height="16" colspan="7" align="center">
                                    <xsl:if test="number($size)>0">
                                        <xsl:call-template name="ScrollLinks">
                                            <xsl:with-param name="ShowPrev"><xsl:value-of select="/TC/MEMBER_SEARCH/MemberSearch/Scroll/AllowPrevious"/></xsl:with-param>
                                            <xsl:with-param name="ShowNext"><xsl:value-of select="/TC/MEMBER_SEARCH/MemberSearch/Scroll/AllowNext"/></xsl:with-param>
                                            <xsl:with-param name="PrevLink">javascript:document.simpleSearch.Next.value='false';javascript:document.simpleSearch.submit()</xsl:with-param>
                                            <xsl:with-param name="NextLink">javascript:document.simpleSearch.Next.value='true';javascript:document.simpleSearch.submit()</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:if>
                                </td>
                            </tr>
          
                            <tr>
                                <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" height="18" width="20%">Handle</td>
                                <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" align="right" width="10%">Rating</td>
                                <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" align="right" width="3"><img src="/i/clear.gif" alt="" width="3" height="1" border="0"/></td>
                                <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" align="center" width="5%">State</td>
                                <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" align="right" width="30%"># of Rated Events</td>
                                <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" align="right" width="30%">Last Date Competed</td>
                                <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" align="right" width="3"><img src="/i/clear.gif" alt="" width="3" height="1" border="0"/></td>
                            </tr>
          
                            <xsl:for-each select="/TC/MEMBER_SEARCH/MemberSearch/CoderList/SearchResult">
                            <tr>
                                <td class="statText" valign="middle" height="13">
                                    <A>
                                    <xsl:attribute name="HREF">?t=statistics&amp;c=member_profile&amp;Coder_Id=<xsl:value-of select="CoderId"/></xsl:attribute>
                                    <xsl:attribute name="CLASS">
                                        <xsl:call-template name="GetRatingClass"><xsl:with-param name="rating"><xsl:value-of select="Rating"/></xsl:with-param></xsl:call-template>
                                    </xsl:attribute>
                                    <xsl:value-of select="Handle"/>
                                    </A>
                                </td>
                                <td class="statText" valign="middle" align="right"><xsl:value-of select="Rating"/></td>
                                <td class="statText" valign="middle" align="right" width="3"><img src="/i/clear.gif" alt="" width="3" height="1" border="0"/></td>
                                <td class="statText" valign="middle" align="center"><xsl:value-of select="State"/></td>
                                <td class="statText" valign="middle" align="right"><xsl:value-of select="NumRatings"/></td>
                                <td class="statText" valign="middle" align="right"><xsl:value-of select="LastCompDate"/></td>
                                <td class="statText" valign="middle" align="right" width="3"><img src="/i/clear.gif" alt="" width="3" height="1" border="0"/></td>
                            </tr>       
                            </xsl:for-each>
          
                            <tr><td colspan="7"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td></tr>
          
                            <tr valign="middle">
                                <td class="statText" height="16" colspan="7" align="center">
                                    <xsl:if test="number($size)>0">
                                        <xsl:call-template name="ScrollLinks">
                                            <xsl:with-param name="ShowPrev"><xsl:value-of select="/TC/MEMBER_SEARCH/MemberSearch/Scroll/AllowPrevious"/></xsl:with-param>
                                            <xsl:with-param name="ShowNext"><xsl:value-of select="/TC/MEMBER_SEARCH/MemberSearch/Scroll/AllowNext"/></xsl:with-param>
                                            <xsl:with-param name="PrevLink">javascript:document.simpleSearch.Next.value='false';javascript:document.simpleSearch.submit()</xsl:with-param>
                                            <xsl:with-param name="NextLink">javascript:document.simpleSearch.Next.value='true';javascript:document.simpleSearch.submit()</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:if>
                                </td>
                            </tr>

                            <tr><td colspan="7"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td></tr>    
                        </table>  
                        </form>
                        </xsl:if>
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <xsl:call-template name="public_right_col"/>        
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>

  </xsl:template>
</xsl:stylesheet>

