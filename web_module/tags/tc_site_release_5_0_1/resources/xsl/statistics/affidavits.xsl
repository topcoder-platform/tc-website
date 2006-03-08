<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/> 
  <xsl:import href="../includes/modules/scroll.xsl"/>  
  <xsl:import href="../includes/modules/rating.xsl"/>  
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
    <TD WIDTH="4" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" bgcolor="#FFFFFF" valign="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">statistics</xsl:with-param>
  <xsl:with-param name="title">&#160;Affidavits</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<P CLASS="statText">
Prize Payment Requirements:<BR/>
All four requirements must be met for TopCoder to release payment.<BR/>
</P>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="2" WIDTH="100%">
   <TR>
      <TD CLASS="statText" VALIGN="top">1.</TD><TD CLASS="statText" VALIGN="top">Valid member profile information. We will mail the check to the address in your TopCoder profile, so please make sure that this information is current.</TD>
   </TR>
   <TR>
      <TD CLASS="statText" VALIGN="top">2.</TD><TD CLASS="statText" VALIGN="top">A Completed Affidavit of Eligibility, Liability, and Publicity Release. You must fill out, sign, and return an affidavit of eligibility before we can pay out prize money. The affidavit is a verification of your eligibility to participate in the match, as well as a publicity release. The affidavit must be postmarked no later than 60 days after the competition date - otherwise, you forfeit your prize for this competition.</TD>
   </TR>   
   <TR>
      <TD CLASS="statText" VALIGN="top">3.</TD><TD CLASS="statText" VALIGN="top">One notarized affidavit on file with TopCoder.
      TopCoder requires all winners (both direct or through referral commissions) to have one notarized affidavit on file with TopCoder before the prize can be paid. If you never had an affidavit notarized for TopCoder, you must do so for this Single Round Match before you will be paid. You need only have one affidavit notarized. All subsequent winnings will be paid upon receipt of a signed TopCoder affidavit.</TD>
   </TR>   
   <TR>
      <TD CLASS="statText" VALIGN="top">4.</TD><TD CLASS="statText" VALIGN="top">One completed tax form on file with TopCoder.<BR/>
      <A HREF="/?t=support&amp;c=form_faq" CLASS="statText">TopCoder FAQ regarding these forms >></A><BR/>
       The W-9 form should be filled out by all U.S. Citizens, including U.S resident aliens.<BR/>
       <A HREF="/i/iw9.pdf" CLASS="statText">Click here for W-9 form instructions >></A><BR/>
       <A HREF="/i/fw9.pdf" CLASS="statText">Click here for the W-9 form >></A><BR/>
       The W-8BEN form should be filled out by all non-U.S. Citizens.<BR/>
       <A HREF="/i/iw8ben.pdf" CLASS="statText">Click here for W-8BEN form instructions >></A><BR/>
       <A HREF="/i/fw8ben.pdf" CLASS="statText">Click here for the W-8BEN form >></A><BR/>      
      </TD>
   </TR>   
</TABLE>


<P CLASS="statText">
Mailing address for forms and affidavits: TopCoder, 703 Hebron Avenue, Glastonbury, CT 06033
</P>
       <A HREF="/?t=statistics&amp;c=getaffidavit" CLASS="statText">- View affidavit page -</A><BR/>
        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
          <xsl:variable name="size">
            <xsl:value-of select="/TC/STATLISTS/EarningsHistory/Scroll/Size"/>
          </xsl:variable>
          <TR>
            <TD BACKGROUND="/i/steel_gray_bg3.gif" CLASS="statTextBig" COLSPAN="5" HEIGHT="18">&#160;Affidavits for</TD>      
         </TR>   
          <TR>
            <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
          </TR> 
          <TR>
            <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" HEIGHT="16" COLSPAN="5" ALIGN="center">Previous | Next links here
              <xsl:if test="number($size)>0">
               <xsl:call-template name="ScrollLinks">
               <xsl:with-param name="ShowPrev"><SPAN CLASS="statText"><xsl:value-of select="/TC/STATLISTS/TopRankedCoders/Scroll/AllowPrevious"/></SPAN></xsl:with-param>
               <xsl:with-param name="ShowNext"><xsl:value-of select="/TC/STATLISTS/TopRankedCoders/Scroll/AllowNext"/></xsl:with-param>
               <xsl:with-param name="PrevLink">javascript:document.coderRankForm.Next.value='false';javascript:document.coderRankForm.submit()</xsl:with-param>
               <xsl:with-param name="NextLink">javascript:document.coderRankForm.Next.value='true';javascript:document.coderRankForm.submit()</xsl:with-param>
             </xsl:call-template>
           </xsl:if>
          </TD>
         </TR>  
          <TR>
            <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
          </TR>           
          <TR>
            <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
            <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="20%" HEIGHT="18">Date</TD>  
            <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="left" WIDTH="42%">Event</TD>
            <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="18%">Amount</TD>     
            <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
          </TR>
          <xsl:for-each select="/TC/STATLISTS/EarningsHistory/Earning">
            <xsl:if test="Amount!='0.0'">
              <TR>
                <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>    
                <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" HEIGHT="13"><xsl:value-of select="EventDate"/></TD>
                <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center">
                  <A>
                    <xsl:attribute name="HREF">index?t=statistics&amp;c=room_stats&amp;Contest_Id=<xsl:value-of select="ContestId"/>&amp;Round_Id=<xsl:value-of select="RoundId"/>&amp;Coder_Id=<xsl:value-of select="/TC/STATLISTS/CoderId"/></xsl:attribute>
                    <xsl:attribute name="CLASS">statText</xsl:attribute><xsl:value-of select="RoundName"/>
                  </A>
                </TD>
                <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right">$<xsl:value-of select="format-number(Amount, '0.00')"/></TD>
                <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>        
              </TR>  
            </xsl:if>
          </xsl:for-each>
          <TR>
            <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>    
          </TR>
          <TR>
            <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" HEIGHT="16" COLSPAN="5" ALIGN="center">Previous | Next links here
              <xsl:if test="number($size)>0">
               <xsl:call-template name="ScrollLinks">
               <xsl:with-param name="ShowPrev"><SPAN CLASS="statText"><xsl:value-of select="/TC/STATLISTS/TopRankedCoders/Scroll/AllowPrevious"/></SPAN></xsl:with-param>
               <xsl:with-param name="ShowNext"><xsl:value-of select="/TC/STATLISTS/TopRankedCoders/Scroll/AllowNext"/></xsl:with-param>
               <xsl:with-param name="PrevLink">javascript:document.coderRankForm.Next.value='false';javascript:document.coderRankForm.submit()</xsl:with-param>
               <xsl:with-param name="NextLink">javascript:document.coderRankForm.Next.value='true';javascript:document.coderRankForm.submit()</xsl:with-param>
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

