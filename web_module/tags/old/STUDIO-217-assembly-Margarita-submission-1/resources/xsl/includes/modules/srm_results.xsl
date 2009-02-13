<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="srm_results">
<!-- <BR/><BR/>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
        <TR>
          <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/steelblue_top_left1.gif" ALT="" WIDTH="11" HEIGHT="26" BORDER="0"></TD>
          <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="75" ALIGN="left"><IMG SRC="/i/steelblue_top_left2.gif" ALT="" WIDTH="75" HEIGHT="26" BORDER="0"/></TD>
          <TD COLSPAN="4" CLASS="bodyTextBold" VALIGN="middle" BGCOLOR="#FFFFFF" WIDTH="100%"><A HREF="/statistics/srm48/results.shtml"><IMG SRC="/i/label_srm_results_sm.gif" ALT="Last Match Resutls" WIDTH="138" HEIGHT="26" BORDER="0"/><IMG SRC="/i/label_arrow_sm.gif" ALT="" WIDTH="18" HEIGHT="26" BORDER="0"/></A></TD>
          <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
        </TR>
</TABLE> -->    
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">  
        <TR>
          <TD COLSPAN="11"><IMG HEIGHT="3" WIDTH="1" SRC="/i/clear.gif"/></TD>
        </TR>
        <TR>
          <TD CLASS="statText" COLSPAN="11">Here is a view of three rooms with the highest rate change from the last match.</TD>
        </TR>
        <TR>
          <TD COLSPAN="11"><IMG HEIGHT="5" WIDTH="1" SRC="/i/clear.gif"/></TD>
        </TR>                  
        <TR BGCOLOR="#000033" BACKGROUND="/i/steel_bluebv_bg.gif">
          <TD WIDTH="20" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" HEIGHT="28"><IMG HEIGHT="1" WIDTH="20" SRC="/i/clear.gif"/></TD>
          <TD WIDTH="11%" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" CLASS="statText">Coder<BR/>Handle</TD>
          <TD WIDTH="2" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle"><IMG WIDTH="2" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
          <TD ALIGN="right" WIDTH="11%" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" CLASS="statText">Final<BR/>Points</TD>
          <TD WIDTH="8" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle"><IMG HEIGHT="1" WIDTH="8" SRC="/i/clear.gif"/></TD>
          <TD ALIGN="right" WIDTH="11%" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" CLASS="statText">Old<BR/>Rating</TD>
          <TD ALIGN="right" WIDTH="10" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" CLASS="statText"><IMG WIDTH="10" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/><BR/>+</TD>
          <TD ALIGN="right" WIDTH="11%" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" CLASS="statText">Rating<BR/>&#160;Change</TD>
          <TD ALIGN="right" WIDTH="10" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" CLASS="statText"><IMG WIDTH="10" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/><BR/>=</TD>
          <TD ALIGN="right" WIDTH="11%" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" CLASS="statText">New<BR/>&#160;Rating</TD>
          <TD WIDTH="5" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle"><IMG HEIGHT="1" WIDTH="5" SRC="/i/clear.gif"/></TD>
        </TR>
        <TR>
          <TD COLSPAN="11" WIDTH="1"><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD>
        </TR>
        <TR>
          <TD BGCOLOR="#000033" BACKGROUND="/i/steel_blue_bg.gif" align="left" COLSPAN="11" HEIGHT="11" VALIGN="middle" CLASS="statText"><b>&#160;Room 1</b></TD>
        </TR>
        <TR>
          <TD COLSPAN="11" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
        </TR>
        <TR>
          <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
          <TD align="left" CLASS="coderTexTRed">NDBronson</TD>
          <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
          <TD ALIGN="right" CLASS="statText">1302.61</TD>
          <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
          <TD ALIGN="right" CLASS="statText">2986</TD>
          <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
          <TD ALIGN="right" CLASS="statText">2</TD>
          <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
          <TD ALIGN="right" CLASS="statText">2988</TD>
          <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
        </TR>
        <TR>
          <TD COLSPAN="11" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
        </TR>
        <TR>
          <TD BGCOLOR="#000033" BACKGROUND="/i/steel_blue_bg.gif" align="left" COLSPAN="11" HEIGHT="11" VALIGN="middle" CLASS="statText"><b>&#160;Room 7</b></TD>
        </TR>
        <TR>
          <TD COLSPAN="11" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
        </TR>
        <TR>
          <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
          <TD align="left" CLASS="coderTexTYellow">Logan</TD>
          <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
          <TD ALIGN="right" CLASS="statText">1302.61</TD>
          <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
          <TD ALIGN="right" CLASS="statText">2400</TD>
          <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
          <TD ALIGN="right" CLASS="statText">2</TD>
          <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
          <TD ALIGN="right" CLASS="statText">2402</TD>
          <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
        </TR>
        <TR>
          <TD COLSPAN="11" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
        </TR>
        <TR>
          <TD BGCOLOR="#000033" BACKGROUND="/i/steel_blue_bg.gif" align="left" COLSPAN="11" HEIGHT="11" VALIGN="middle" CLASS="statText"><b>&#160;Room 10</b></TD>
        </TR>
        <TR>
          <TD COLSPAN="11" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
        </TR>
        <TR>
          <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
          <TD align="left" CLASS="coderTexTRed">stevevai</TD>
          <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
          <TD ALIGN="right" CLASS="statText">1302.61</TD>
          <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
          <TD ALIGN="right" CLASS="statText">2214</TD>
          <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
          <TD ALIGN="right" CLASS="statText">2</TD>
          <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
          <TD ALIGN="right" CLASS="statText">2216</TD>
          <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
        </TR>
        <TR>
          <TD COLSPAN="11" WIDTH="1"><IMG HEIGHT="5" WIDTH="1" SRC="/i/clear.gif" BORDER="0"/></TD>
        </TR>
        <TR>
          <TD COLSPAN="11" ALIGN="right" CLASS="statText">.. // <A HREF="/statistics/srm48/results.shtml" CLASS="statText">View All Match Results</A></TD>
        </TR>
        <TR>
          <TD COLSPAN="11" WIDTH="1"><IMG HEIGHT="10" WIDTH="1" SRC="/i/clear.gif" BORDER="0"/></TD>
        </TR>  
</TABLE>  
  </xsl:template>
</xsl:stylesheet>
