<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="calendar">
            <TABLE BGCOLOR="#333333" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="1">
        <TR> 
               <TD VALIGN="top">
                  <TABLE WIDTH="100%" BORDER="0" CELLSPACING="1" CELLPADDING="0">
              <TR> 
                      <TD BGCOLOR="#333333" BACKGROUND="" CLASS="moduleTitle" COLSPAN="7" HEIGHT="17" VALIGN="middle"><IMG SRC="/i/module_labels_sept_date.gif" ALT="September Dates" WIDTH="166" HEIGHT="17" BORDER="0"/></TD>
                   </TR>
                      <TR BGCOLOR="#CC6600"> 
                        <TD BACKGROUND="/i/orangebv_bg.gif" CLASS="moduleTitle" ALIGN="center" WIDTH="16"><FONT COLOR="#FFFFFF">S</FONT></TD>
                        <TD BACKGROUND="/i/orangebv_bg.gif" CLASS="moduleTitle" ALIGN="center" WIDTH="16"><FONT COLOR="#FFFFFF">M</FONT></TD>
                        <TD BACKGROUND="/i/orangebv_bg.gif" CLASS="moduleTitle" ALIGN="center" WIDTH="16"><FONT COLOR="#FFFFFF">T</FONT></TD>
                        <TD BACKGROUND="/i/orangebv_bg.gif" CLASS="moduleTitle" ALIGN="center" WIDTH="16"><FONT COLOR="#FFFFFF">W</FONT></TD>
                        <TD BACKGROUND="/i/orangebv_bg.gif" CLASS="moduleTitle" ALIGN="center" WIDTH="16"><FONT COLOR="#FFFFFF">T</FONT></TD>
                        <TD BACKGROUND="/i/orangebv_bg.gif" CLASS="moduleTitle" ALIGN="center" WIDTH="16"><FONT COLOR="#FFFFFF">F</FONT></TD>
                        <TD BACKGROUND="/i/orangebv_bg.gif" CLASS="moduleTitle" ALIGN="center" WIDTH="16"><FONT COLOR="#FFFFFF">S</FONT></TD>
                      </TR>
                      <TR> <!-- <A HREF="/stat?c=round_stats&amp;rd=4250" CLASS="smallText">1</A> -->
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">1</TD>
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">2</TD>
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">3</TD>
                        <TD BGCOLOR="#990000" BACKGROUND="" CLASS="smallText" ALIGN="center"><A CLASS="smallFoot"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;ContestId=4275&amp;t=schedule&amp;c=srm</xsl:attribute>4</A></TD>
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">5</TD>
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">6</TD>
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">7</TD>
                      </TR>
                      <TR> 
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">8</TD>
                        <TD BGCOLOR="#CCCCCC" BACKGROUND="" CLASS="smallText" ALIGN="center"><A CLASS="smallText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;ContestId=4280&amp;t=schedule&amp;c=srm</xsl:attribute>9</A></TD>
                        <TD BGCOLOR="#990000" BACKGROUND="" CLASS="smallText" ALIGN="center"><A CLASS="smallFoot"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;ContestId=4282&amp;t=schedule&amp;c=srm</xsl:attribute>10</A></TD>
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">11</TD>
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">12</TD>
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">13</TD>
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">14</TD>
                      </TR>
                      <TR> 
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">15</TD>
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">16</TD>
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">17</TD>
                        <TD BGCOLOR="#990000" BACKGROUND="" CLASS="smallText" ALIGN="center"><A HREF="http://sunnetwork.sun.com/sf2002/topcoder/index.jsp" CLASS="smallFoot" TARGET="_blank">18</A></TD>
                        <TD BGCOLOR="#990000" BACKGROUND="" CLASS="smallText" ALIGN="center"><A HREF="http://sunnetwork.sun.com/sf2002/topcoder/index.jsp" CLASS="smallFoot" TARGET="_blank">19</A></TD>
                        <TD BGCOLOR="#990000" BACKGROUND="" CLASS="smallText" ALIGN="center"><A HREF="http://sunnetwork.sun.com/sf2002/topcoder/index.jsp" CLASS="smallFoot" TARGET="_blank">20</A></TD>
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">21</TD>
                      </TR>
                      <TR> 
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">22</TD>
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">23</TD>
                        <TD BGCOLOR="#CCCCCC" BACKGROUND="" CLASS="smallText" ALIGN="center"><A CLASS="smallText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;ContestId=4285&amp;t=schedule&amp;c=srm</xsl:attribute>24</A></TD>
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">25</TD>
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">26</TD>
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">27</TD>
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">28</TD>
                      </TR>
                      <TR> 
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">29</TD>
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">30</TD>
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">&#160;</TD>
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">&#160;</TD>
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">&#160;</TD>
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">&#160;</TD>
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">&#160;</TD>
                      </TR>
                      <!-- <TR> 
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">30</TD>
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">&#160;</TD>
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">&#160;</TD>
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">&#160;</TD>
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">&#160;</TD>
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">&#160;</TD>
                        <TD BGCOLOR="#FFFFFF" BACKGROUND="" CLASS="smallText" ALIGN="center">&#160;</TD>
                      </TR> -->                     
            </TABLE>
            </TD>
        </TR>
        <TR> 
                <TD BGCOLOR="#CCCCCC" BACKGROUND="" HEIGHT="15" ALIGN="right" CLASS="smallText">
                  <SPAN CLASS="smallText">More 
                    <A CLASS="smallText">
                      <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=index</xsl:attribute>
                      2002 match dates
                    </A>
                  </SPAN>
                </TD>
            </TR>
      </TABLE>
  </xsl:template>
</xsl:stylesheet>

