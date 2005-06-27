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
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Statistics</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#CCCCCC" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <xsl:call-template name="Top"/>

          <!-- Body Begins -->
          <TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
          <TR>
              <!-- Left Column Begins -->
          <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
          <!-- Left Column Include Begins -->
              <!-- Global Seconday Nav Begins -->
                  <xsl:call-template name="global_left"/>
          <!-- Global Seconday Nav Ends -->
          <!-- Left Column Include Ends -->
            </TD>
          <!-- Left Column Ends -->
          <!-- Gutter Begins -->
          <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
              <!-- Gutter Ends -->
          
          <!-- Body Area -->
            <!-- Center Column Begins -->  
          <TD CLASS="bodyText" WIDTH="100%" bgcolor="#CCCCCC" valign="top">
  <FORM name="frmReferral" method="POST">
    <INPUT type="hidden" name="Task" value="search"/>
    <INPUT type="hidden" name="Command" value="refer"/>
    <INPUT type="hidden" name="Next" value="true"/>
    <INPUT type="hidden" name="Mode" value=""/>
    <INPUT type="hidden" name="Key">
      <xsl:attribute name="value">
        <xsl:choose>
          <xsl:when test="/TC/MEMBER_SEARCH/Referrals/Coder/SortKey/Key"><xsl:value-of select="/TC/MEMBER_SEARCH/Referrals/Coder/SortKey/Key"/></xsl:when>
          <xsl:otherwise>0</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
    </INPUT>
    <INPUT type="hidden" name="Dir">
      <xsl:attribute name="value">
        <xsl:choose>
          <xsl:when test="/TC/MEMBER_SEARCH/Referrals/Coder/SortKey/Dir"><xsl:value-of select="/TC/MEMBER_SEARCH/Referrals/Coder/SortKey/Dir"/></xsl:when>
          <xsl:otherwise>D</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
    </INPUT>
  </FORM>
  <SCRIPT type="text/javascript">
    <![CDATA[
var r=window.document.frmReferral
function getNext(){
  r.Mode.value="scroll"
  r.Next.value="true"
  r.submit()
}
function getPrevious(){
  r.Mode.value="scroll"
  r.Next.value="false"
  r.submit()
}
function sort(key,dir){
  if (r.Key.value==key) {
    if (r.Dir.value=="D") {
      r.Dir.value="A"
    } else {
      r.Dir.value="D"
    }
  } else {
    r.Key.value=key
    r.Dir.value=dir
  }
  r.Mode.value="sort"
  r.submit()
}
  ]]>
  </SCRIPT>
  <xsl:call-template name="BodyTop">
    <xsl:with-param name="image1">steelblue</xsl:with-param>
    <xsl:with-param name="image">statistics</xsl:with-param>
    <xsl:with-param name="title">&#160;Member Referrals</xsl:with-param>
  </xsl:call-template>
  <xsl:variable name="row">
    <xsl:value-of select="/TC/MEMBER_SEARCH/Referrals/Scroll/Row"/>
  </xsl:variable>
  <xsl:variable name="returns">
    <xsl:value-of select="/TC/MEMBER_SEARCH/Referrals/Scroll/Returns"/>
  </xsl:variable>
  <xsl:variable name="size">
    <xsl:value-of select="/TC/MEMBER_SEARCH/Referrals/Scroll/Size"/>
  </xsl:variable>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/><BR/>
  <P CLASS="statText">The table below indicates your referrals to date. If you are uncertain about how the referral program works, <A HREF="/index?t=about_tc&amp;c=membr_referrals" CLASS="statText">click here</A></P>
  <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" ALIGN="center" BACKGROUND="/i/steel_darkblue_bg.gif" >
  <TR><TD COLSPAN="3" ALIGN="left" HEIGHT="21" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">&#160;&#160;Members referred by:

          <xsl:if test="number($size)>0">
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
           </xsl:if>

        </TD></TR>

    <TR>
      <td colspan="3" align="center" bgcolor="#333333" class="statText">
          <xsl:if test="number($size)>0">
           <xsl:call-template name="ScrollLinks">
             <xsl:with-param name="ShowPrev"><xsl:value-of select="/TC/MEMBER_SEARCH/Referrals/Scroll/AllowPrevious"/></xsl:with-param>
             <xsl:with-param name="ShowNext"><xsl:value-of select="/TC/MEMBER_SEARCH/Referrals/Scroll/AllowNext"/></xsl:with-param>
             <xsl:with-param name="PrevLink">Javascript:getPrevious()</xsl:with-param>
             <xsl:with-param name="NextLink">Javascript:getNext()</xsl:with-param>
           </xsl:call-template>
          </xsl:if>
      </td>
    </TR>


  </TABLE>
  <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" ALIGN="center" BACKGROUND="/i/steel_darkblue_bg.gif" >
    <TR>
      <TD WIDTH="28%" HEIGHT="21" ALIGN="left" CLASS="statText">Member Since</TD>
      <TD WIDTH="15%" HEIGHT="21" ALIGN="left" CLASS="statText">Handle</TD>
      <TD WIDTH="15%" HEIGHT="21" ALIGN="right" CLASS="statText">Rating</TD>
      <TD WIDTH="21%" HEIGHT="21" ALIGN="right" CLASS="statText">Total Prize Money</TD>
      <TD WIDTH="21%" HEIGHT="21" ALIGN="right" CLASS="statText">Referral Earnings</TD>
    </TR>
    <xsl:for-each select="/TC/MEMBER_SEARCH/Referrals/Coder">
      <tr>
        <td align="left" class="statText">
                <xsl:value-of select="MemberSince"/>
        </td>
        <td align="left" class="statText">

          <a>
            <xsl:attribute name="href">/stat?&amp;c=member_profile&amp;cr=<xsl:value-of select="CoderId"/></xsl:attribute>
              <xsl:attribute name="CLASS">
                <xsl:call-template name="GetRatingClass"><xsl:with-param name="rating"><xsl:value-of select="Rating"/></xsl:with-param></xsl:call-template>
              </xsl:attribute>
              <xsl:value-of select="Handle"/>
          </a>
        </td>
        <td align="right" class="statText">
                <xsl:value-of select="Rating"/>
        </td>
        <td align="right" class="statText">
                <xsl:choose>
                  <xsl:when test="number(TotalEarnings)=0">-</xsl:when>
                  <xsl:otherwise>
                    $<xsl:value-of select="format-number(TotalEarnings,'0.00')"/>
                  </xsl:otherwise>
                </xsl:choose>
        </td>
        <td align="right" class="statText">
                <xsl:choose>
                  <xsl:when test="number(TotalEarnings)=0">-</xsl:when>
                  <xsl:otherwise>
                    $<xsl:value-of select="format-number(number(TotalEarnings)*.1,'0.00')"/>
                  </xsl:otherwise>
                </xsl:choose>
        </td>
      </tr>
    </xsl:for-each>

  <TR><TD COLSPAN="5" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="11" BORDER="0"/></TD></TR>
  </TABLE>
  </TD>
  <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR><TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>   
  <TR>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>  
  <TR>
    <TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>
</TABLE>








</TD>
<!-- Center Column Ends -->
<!-- Body Area Ends -->

<!-- Gutter -->
<TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
<!-- Right Column Begins -->
<TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins -->        
        <xsl:call-template name="public_right_col"/>        
<!-- Right Column Include Ends -->        
        </TD>
<!-- Right Column Ends -->
	<!-- Gutter -->
		<TD WIDTH="10" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
</TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>

