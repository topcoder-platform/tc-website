<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/> 
  <xsl:import href="../includes/modules/scroll.xsl"/>  
  <xsl:import href="../includes/modules/rating.xsl"/>  
  <xsl:import href="../includes/stats/public_stats_left.xsl"/> 
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
        <xsl:call-template name="public_stats_left"/>
  <!-- Global Seconday Nav Ends -->      
<!-- Left Column Include Ends -->              
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="240" height="1" VSPACE="5" BORDER="0"/><BR/>
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">statistics</xsl:with-param>
  <xsl:with-param name="title">&#160;Affidavits</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/><BR/><BR/>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="2" WIDTH="100%">
  <TR>
    <TD CLASS="statText" VALIGN="top">
                  <b>Prize Payment Requirements:</b><br/>
                  All four requirements must be met for TopCoder to release payment.
                      <ul>
                        <li><b>Valid member profile information.</b><br/>
We will mail the check to the address in your TopCoder profile,
so please make sure that this information is current.
                        </li>
                        <li><b>A Completed Affidavit of Eligibility, Liability, and Publicity Release.</b><br/>
You must fill out, sign, and return an affidavit of eligibility before we can pay out prize money.  The affidavit is a verification of your eligibility to participate in the match, 
as well as a publicity release.  The affidavit must be postmarked no later than 60 days after the competition date - otherwise, you forfeit your prize for this competition.
                        </li>
                        <li><b>
                          <xsl:choose>
                            <xsl:when test="/TC/Affidavit/HomeCountry='Canada' or /TC/Affidavit/HomeCountry='United Kingdom'">
                              One affidavit on file with TopCoder for which you swore to.
                            </xsl:when>
                            <xsl:when test="/TC/Affidavit/HomeCountry='Australia'">
                              One affidavit on file with TopCoder signed by a Solicitor/Justice of the Peace.
                            </xsl:when>
                            <xsl:otherwise>
                              One notarized affidavit on file with TopCoder.
                            </xsl:otherwise>
                          </xsl:choose>
                        </b><br/>
<xsl:choose>
  <xsl:when test="/TC/Affidavit/HomeCountry='Canada' or /TC/Affidavit/HomeCountry='United Kingdom'">
    TopCoder requires all winners (both direct or through referral commissions) to have one affidavit on file which you swore to in front of a Commissioner of Oaths.  TopCoder must 
receive one affidavit signed by a Commissioner of Oaths before the prize can be paid.  You need only have one affidavit signed under oath.  <i>All subsequent winnings will be paid u
pon receipt of a signed TopCoder affidavit.</i>
  </xsl:when>
  <xsl:when test="/TC/Affidavit/HomeCountry='Australia'">
    TopCoder requires all winners (both direct or through referral commissions) to have one affidavit on file which you swore to in front of a Solicitor/Justice of the Peace.  TopCo
der must receive one affidavit signed by a Solicitor/Justice of the Peace before the prize can be paid.  You need only have one witnessed affidavit.  <i>All subsequent winnings will
 be paid upon receipt of a signed TopCoder affidavit.</i>
  </xsl:when>
  <xsl:otherwise>
    TopCoder requires all winners (both direct or through referral commissions) to have one notarized affidavit on file with TopCoder before the prize can be paid.  If you never had
 an affidavit notarized for TopCoder, you must do so for this Single Round Match before you will be paid.  You need only have one affidavit notarized.  <i>All subsequent winnings wi
ll be paid upon receipt of a signed TopCoder affidavit.</i>
  </xsl:otherwise>
</xsl:choose>
                        </li>
                        <li><b>One completed tax form on file with TopCoder.</b><br/>
<a href="/?t=support&amp;c=form_faq" class="statText">TopCoder FAQ regarding these forms &gt;&gt;</a><br/>
The <b>W-9 form</b> should be filled out by all U.S. Citizens, including U.S resident aliens.<br/>
  <a href="/contest/iw9.pdf" class="statText">Click here for W-9 form instructions &gt;&gt;</a><br/>
  <a href="/contest/fw9.pdf" class="statText">Click here for the W-9 form &gt;&gt;</a><br/>
The <b>W-8BEN form</b> should be filled out by all non-U.S. Citizens.<br/>
  <a href="/contest/iw8ben.pdf" class="statText">Click here for W-8BEN form instructions &gt;&gt;</a><br/>
  <a href="/contest/fw8ben.pdf" class="statText">Click here for the W-8BEN form &gt;&gt;</a><br/>
                        </li>
                      </ul>
                    Mailing address for forms and affidavits:  TopCoder, 703 Hebron Avenue, Glastonbury, CT 06033

    </TD>
  </TR>
</TABLE>

<FORM name="frmAffidavit" method="POST">
  <INPUT type="hidden" name="t" value="affidavit"/>
  <INPUT type="hidden" name="c" value=""/>
  <INPUT type="hidden" name="ContestId" value=""/>
  <INPUT type="hidden" name="Next" value="true"/>
  <INPUT type="hidden" name="Mode" value=""/>
  <INPUT type="hidden" name="Key">
    <xsl:attribute name="value">
      <xsl:choose>
        <xsl:when test="/TC/Affidavit/Key"><xsl:value-of select="/TC/Affidavit/Key"/></xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </INPUT>
  <INPUT type="hidden" name="Dir">
    <xsl:attribute name="value">
      <xsl:choose>
        <xsl:when test="/TC/Affidavit/Dir"><xsl:value-of select="/TC/Affidavit/Dir"/></xsl:when>
        <xsl:otherwise>D</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </INPUT>
</FORM>
<SCRIPT type="text/javascript">
  <![CDATA[
var frmA=window.document.frmAffidavit;
function getAffidavit(contestId){
  frmA.c.value="frame"
  frmA.ContestId.value=contestId;
  frmA.submit()
}
function getNext(){
  frmA.Mode.value="scroll"
  frmA.Next.value="true"
  frmA.submit()
}
function getPrevious(){
  frmA.Mode.value="scroll"
  frmA.Next.value="false"
  frmA.submit()
}
function sort(key,dir){
  if (frmA.Key.value==key) {
    if (frmA.Dir.value=="D") {
      frmA.Dir.value="A"
    } else {
      frmA.Dir.value="D"
    }
  } else {
    frmA.Key.value=key
    frmA.Dir.value=dir
  }
  frmA.Mode.value="sort"
  frmA.submit()
}
  ]]>
</SCRIPT>
<xsl:variable name="row">
  <xsl:value-of select="/TC/Affidavit/AffidavitList/Scroll/Row"/>
</xsl:variable>
<xsl:variable name="returns">
  <xsl:value-of select="/TC/Affidavit/AffidavitList/Scroll/Returns"/>
</xsl:variable>
<xsl:variable name="size">
  <xsl:value-of select="/TC/Affidavit/AffidavitList/Scroll/Size"/>
</xsl:variable>


        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
          <TR>
            <TD BACKGROUND="/i/steel_gray_bg3.gif" CLASS="statTextBig" COLSPAN="5" HEIGHT="18">
              &#160;Affidavits for <xsl:value-of select="/TC/UserName"/>
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
            </TD>    
         </TR>   
          <TR>
            <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
          </TR> 
          <TR>
            <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" HEIGHT="16" COLSPAN="5" ALIGN="center">
              <xsl:if test="number($size)>0">
               <xsl:call-template name="ScrollLinks">
                 <xsl:with-param name="ShowPrev"><xsl:value-of select="/TC/Affidavit/AffidavitList/Scroll/AllowPrevious"/></xsl:with-param>
                 <xsl:with-param name="ShowNext"><xsl:value-of select="/TC/Affidavit/AffidavitList/Scroll/AllowNext"/></xsl:with-param>
                 <xsl:with-param name="PrevLink">Javascript:getPrevious()</xsl:with-param>
                 <xsl:with-param name="NextLink">Javascript:getNext()</xsl:with-param>
               </xsl:call-template>
              </xsl:if>
            </TD>
          </TR>  
          <TR>
            <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
          </TR>           
          <TR>
            <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
            <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="left" WIDTH="20%" HEIGHT="18">
              <a href="JavaScript:sort('4','A')" class="statText">Date</a>
            </TD>  
            <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="42%">
              <a href="JavaScript:sort('0','A')" class="statText">Event</a>
            </TD>
            <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="18%">
              <a href="JavaScript:sort('3','A')" class="statText">Amount</a>
            </TD>     
            <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
          </TR>
          <xsl:for-each select="/TC/Affidavit/AffidavitList/Earning">
            <xsl:variable name="color">
              <xsl:call-template name="GetRatingColor">
                <xsl:with-param name="rating"><xsl:value-of select="Rating"/></xsl:with-param>
              </xsl:call-template>
            </xsl:variable>
            <TR>
              <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>    
              <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" HEIGHT="13">
                <a class="statText">
                  <xsl:attribute name="href">/?t=affidavit&amp;c=frame&amp;ContestId=<xsl:value-of select="ContestId"/></xsl:attribute>
                  <xsl:attribute name="CLASS">statText</xsl:attribute>
                  <xsl:value-of select="EventDate"/>
                </a>
              </TD>
              <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center">
                <a class="statText">
                  <xsl:attribute name="href">/?t=affidavit&amp;c=frame&amp;ContestId=<xsl:value-of select="ContestId"/></xsl:attribute>
                  <xsl:attribute name="CLASS">statText</xsl:attribute>
                    <xsl:value-of select="RoundName"/>
                </a>
              </TD>
              <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right">
                <a class="statText">
                  <xsl:attribute name="href">/?t=affidavit&amp;c=frame&amp;ContestId=<xsl:value-of select="ContestId"/></xsl:attribute>
                  <xsl:attribute name="CLASS">statText</xsl:attribute>
                  $<xsl:value-of select="format-number(Amount, '0.00')"/>
                </a>
              </TD>
              <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>        
            </TR>  
          </xsl:for-each>
          <TR>
            <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>    
          </TR>
          <TR>
            <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" HEIGHT="16" COLSPAN="5" ALIGN="center">
              <xsl:if test="number($size)>0">
               <xsl:call-template name="ScrollLinks">
                 <xsl:with-param name="ShowPrev"><xsl:value-of select="/TC/Affidavit/AffidavitList/Scroll/AllowPrevious"/></xsl:with-param>
                 <xsl:with-param name="ShowNext"><xsl:value-of select="/TC/Affidavit/AffidavitList/Scroll/AllowNext"/></xsl:with-param>
                 <xsl:with-param name="PrevLink">Javascript:getPrevious()</xsl:with-param>
                 <xsl:with-param name="NextLink">Javascript:getNext()</xsl:with-param>
               </xsl:call-template>
              </xsl:if>
            </TD>
          </TR>          
        </TABLE>





    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>     
  <TR>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>  
  <TR>
    <TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
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
    <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>

