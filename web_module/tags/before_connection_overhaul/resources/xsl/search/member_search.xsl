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

<title>Advanced Member Search at TopCoder</title>

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
                <xsl:with-param name="title">Advanced Member Search</xsl:with-param>
            </xsl:call-template>

            <table border="0" cellspacing="0" cellpadding="10" bgcolor="#001B35" width="100%">
            <form name="searchForm" method="get">
                <tr valign="top">
                    <td colspan="2"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/>
                        
                        <p class="statText">Enter search criteria below then click the go button. Search results matching the criteria 
                        selections will be returned. Click on a Handle to view information about the Coder.</p>
        
                        
                        <input type="hidden" name="t" value="search"/>
                        <input type="hidden" name="c" value="member_search"/>
                        <input type="hidden" name="Next" value=""/>

<SCRIPT type="text/javascript"><![CDATA[
            var search=document.searchForm;
            function submitEnter(e) {
              var keycode;
              if (window.event) keycode = window.event.keyCode;
              else if (e) keycode = e.which;
              else return true;
              if (keycode == 13) {
               submitSearch();
               return false;
              } else return true;
            }
            function submitSearch() {
              if (checkInput()) {
                search.submit();
              }
            }
            function checkInput() {
              if (isNaN(search.MinRating.value)) {
                alert("Please enter a valid number.");
                search.MinRating.focus();
                return false;
              }
              if (search.MinRating.value < 0) {
                alert("Please enter a non-negative number.");
                search.MinRating.focus();
                return false;
              }
              if (isNaN(search.MaxRating.value)) {
                alert("Please enter a valid number.");
                search.MaxRating.focus();
                return false;
              }
              if (search.MaxRating.value < 0) {
                alert("Please enter a non-negative number.");
                search.MaxRating.focus();
                return false;
              }
              tempMax = parseInt(search.MaxRating.value);
              tempMin = parseInt(search.MinRating.value);
              if (tempMax < tempMin) {
                alert("The the Max Rating must be greater than the Min Rating.");
                search.MaxRating.focus();
                return false;
              }
              if (isNaN(search.MinNumRatings.value)) {
                alert("Please enter a valid number.");
                search.MinNumRatings.focus();
                return false;
              }
              if (search.MinNumRatings.value < 0) {
                alert("Please enter a non-negative number.");
                search.MinNumRatings.focus();
                return false;
              }
              if (isNaN(search.MaxNumRatings.value)) {
                alert("Please enter a valid number.");
                search.MaxNumRatings.focus();
                return false;
              }
              if (search.MaxNumRatings.value < 0) {
                alert("Please enter a non-negative number.");
                search.MaxNumRatings.focus();
                return false;
              }
              tempMaxNum = parseInt(search.MaxNumRatings.value);
              tempMinNum = parseInt(search.MinNumRatings.value);
              if (tempMaxNum < tempMinNum) {
                alert("The the Max number of competions must be greater than the Min.");
                search.MaxRating.focus();
                return false;
              }
              return true;
            }
]]></SCRIPT>

                        <table border="0" cellspacing="0" cellpadding="3" width="100%">
                            <tr><td background="/i/steel_gray_bg.gif" class="statTextBig">Member Search: Search by handle, rating or state.</td></tr>
                            
                            <tr>
                                <td background="/i/steel_bluebv_bg.gif" class="statText">
                                    An underscore ( _ ) = one character space<br/>
                                    A percent sign ( % ) = any number of character spaces
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                
                <tr valign="top">
                    <td width="50%">
                        <table border="0" cellspacing="5" cellpadding="0">
                            <tr><td class="statText">Handle</td></tr>
                            <tr>
                                <td class="statText">
                                    <input type="text" name="SearchHandle" size="15" maxlength="20" onkeypress="submitEnter(event)">
                                    <xsl:choose>
                                        <xsl:when test="/TC/MEMBER_SEARCH/MemberSearch/Handle!='%'">
                                            <xsl:attribute name="value">
                                            <xsl:value-of select="/TC/MEMBER_SEARCH/MemberSearch/Handle"/>
                                            </xsl:attribute>
                                        </xsl:when>
                                    </xsl:choose>
                                    </input>
                                </td>
                            </tr>
                            
                            <tr><td class="statText"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
                            
                            <tr><td class="statText" valign="middle" height="15" width="50%">State</td></tr>
                            
                            <tr>
                                <td class="statText">
                                    <select name="State" size="1">
                                        <option value="">All</option>
                                        <xsl:for-each select="/TC/MEMBER_SEARCH/States/State">
                                        <option>
                                            <xsl:attribute name="VALUE"><xsl:value-of select="StateCode"/></xsl:attribute>
                                            <xsl:if test="/TC/MEMBER_SEARCH/MemberSearch/State=StateCode">
                                            <xsl:attribute name="SELECTED">TRUE</xsl:attribute>
                                            </xsl:if>
                                            <xsl:value-of select="StateCode"/>
                                        </option>
                                        </xsl:for-each>
                                    </select>
                                </td>
                            </tr>
                  
                            <tr><td class="statText"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
                
                            <tr><td class="statText">Max Time Since Last Competition</td></tr>
                
                            <tr>
                                <td class="statText">
                                    <select name="MonthsSinceLastComp" size="1">
                                        <option value="">None Specified</option>
                                        <option value="1">
                                            <xsl:if test="/TC/MEMBER_SEARCH/MemberSearch/MonthsSinceLastComp='1'">
                                                <xsl:attribute name="SELECTED">TRUE</xsl:attribute>
                                            </xsl:if>
                                            30 Days
                                        </option>
                                        <option value="3">
                                            <xsl:if test="/TC/MEMBER_SEARCH/MemberSearch/MonthsSinceLastComp='3'">
                                                <xsl:attribute name="SELECTED">TRUE</xsl:attribute>
                                            </xsl:if>
                                            90 Days
                                        </option>
                                        <option value="6">
                                            <xsl:if test="/TC/MEMBER_SEARCH/MemberSearch/MonthsSinceLastComp='6'">
                                                <xsl:attribute name="SELECTED">TRUE</xsl:attribute>
                                            </xsl:if>
                                            180 Days
                                        </option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </td>
            
                    <td width="50%">
                        <table border="0" cellspacing="5" cellpadding="0">
                            <tr><td class="statTextBig" align="center" colspan="2">Rating</td></tr>
                            
                            <tr>
                                <td class="statText" width="50%">Min</td>
                                <td class="statText" width="50%">Max</td>
                            </tr>

                            <tr>
                                <td class="statText">
                                    <input type="text" name="MinRating" size="6" maxlength="6" onkeypress="submitEnter(event)">
                                    <xsl:choose>
                                    <xsl:when test="/TC/MEMBER_SEARCH/MemberSearch/MinRating!='-1'">
                                        <xsl:attribute name="value">
                                        <xsl:value-of select="/TC/MEMBER_SEARCH/MemberSearch/MinRating"/>
                                        </xsl:attribute>
                                    </xsl:when>
                                    </xsl:choose>
                                    </input>
                                </td>

                                <td class="statText">
                                    <input type="text" name="MaxRating" size="6" maxlength="6" onkeypress="submitEnter(event)">
                                    <xsl:choose>
                                    <xsl:when test="/TC/MEMBER_SEARCH/MemberSearch/MaxRating!='-1'">
                                        <xsl:attribute name="value">
                                        <xsl:value-of select="/TC/MEMBER_SEARCH/MemberSearch/MaxRating"/>
                                        </xsl:attribute>
                                    </xsl:when>
                                    </xsl:choose>
                                    </input>
                                </td>
                            </tr>
                  
                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/></td></tr>
                  
                            <tr><td class="statTextBig" align="center" colspan="2"># of Rated Events</td></tr>
                  
                            <tr>
                                <td class="statText" width="50%">Min</td>
                                <td class="statText" width="50%">Max</td>
                            </tr>

                            <tr>
                                <td class="statText">
                                    <input type="text" name="MinNumRatings" size="6" maxlength="6" onkeypress="submitEnter(event)">
                                        <xsl:choose>
                                        <xsl:when test="/TC/MEMBER_SEARCH/MemberSearch/MinNumRatings!='-1'">
                                            <xsl:attribute name="value">
                                            <xsl:value-of select="/TC/MEMBER_SEARCH/MemberSearch/MinNumRatings"/>
                                            </xsl:attribute>
                                        </xsl:when>
                                        </xsl:choose>
                                    </input>
                                </td>
                                
                                <td class="statText">
                                    <input type="text" name="MaxNumRatings" size="6" maxlength="6" onkeypress="submitEnter(event)">
                                        <xsl:choose>
                                        <xsl:when test="/TC/MEMBER_SEARCH/MemberSearch/MaxNumRatings!='-1'">
                                            <xsl:attribute name="value">
                                            <xsl:value-of select="/TC/MEMBER_SEARCH/MemberSearch/MaxNumRatings"/>
                                            </xsl:attribute>
                                        </xsl:when>
                                        </xsl:choose>
                                    </input>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                            
                <tr>
                    <td colspan="2" class="statText" align="center">
                        <A href="javascript:submitSearch()"><xsl:attribute name="CLASS">statText</xsl:attribute>[ Submit ]</A><br /><br />
                    </td>
                </tr>
            </form>
            </table>
            
            <xsl:if test="/TC/MEMBER_SEARCH/MemberSearch/IsResult='true'">
            
            <table border="0" cellspacing="0" cellpadding="10" bgcolor="#001B35" width="100%">
                <tr valign="top">
                    <td width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/>
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
                                            <xsl:with-param name="PrevLink">javascript:document.searchForm.Next.value='false';javascript:document.searchForm.submit()</xsl:with-param>
                                            <xsl:with-param name="NextLink">javascript:document.searchForm.Next.value='true';javascript:document.searchForm.submit()</xsl:with-param>
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
                                            <xsl:with-param name="PrevLink">javascript:document.searchForm.Next.value='false';javascript:document.searchForm.submit()</xsl:with-param>
                                            <xsl:with-param name="NextLink">javascript:document.searchForm.Next.value='true';javascript:document.searchForm.submit()</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:if>
                                </td>
                            </tr>

                            <tr><td colspan="7"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td></tr>    
                        </table>  
                    </td>
                </tr>
            </table>

            </xsl:if>
            
            <p><br /></p>

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

