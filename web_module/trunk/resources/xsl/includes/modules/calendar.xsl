<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="calendar">
            <table width="100%" bgcolor="#4A4A4A" cellspacing="0" cellpadding="0" border="0">
                <tr>
                    <td valign="top">
                        <table width="100%" border="0" cellspacing="1" cellpadding="1">
                            <tr><td colspan="7" class="statTextBig" nowrap="nowrap" height="18">&#160;Match Dates: September</td></tr>
                            
                            <tr> 
                                <td id="calendarDays" width="15%">S</td>
                                <td id="calendarDays" width="14%">M</td>
                                <td id="calendarDays" width="14%">T</td>
                                <td id="calendarDays" width="14%">W</td>
                                <td id="calendarDays" width="14%">T</td>
                                <td id="calendarDays" width="14%">F</td>
                                <td id="calendarDays" width="15%">S</td>
                            </tr>
                        
                            <tr>
                                <td id="calendarBlankMini">&#160;</td> 
                                <td id="calendarBlankMini">&#160;</td> 
                                <td id="calendarBlankMini">&#160;</td> 
                                <td id="calendarSRMMini"><A id="miniSRMDate" href="/?RoundId=5856&amp;t=schedule&amp;c=srm">1</A></td>
                                <td id="calendarMini">2</td>
                                <td id="calendarMini">3</td>
                                <td id="calendarMini">4</td>
                            </tr>
                      
                            <tr> 
                                <td id="calendarMini">5</td>
                                <td id="calendarMini">6</td>
                                <td id="calendarTCO04Mini"><A id="miniSRMDate" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco04&amp;d3=about">7</A></td>
                                <td id="calendarTCO04Mini"><A id="miniSRMDate" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco04&amp;d3=about">8</A></td>
                                <td id="calendarMini">9</td>
                                <td id="calendarMini">10</td>
                                <td id="calendarTCO04Mini"><A id="miniSRMDate" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco04&amp;d3=about">11</A></td>
                            </tr>
                            
                            <tr> 
                                <td id="calendarMini">12</td>
                                <td id="calendarMini">13</td>
                                <td id="calendarTCOSRM"><A id="miniSRMDate" href="/?RoundId=5857&amp;t=schedule&amp;c=srm">1</A><A id="miniSRMDate" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco04&amp;d3=about">4</A></td>
                                <td id="calendarMini">15</td>
                                <td id="calendarMini">16</td>
                                <td id="calendarMini">17</td>
                                <td id="calendarMini">18</td>
                            </tr>
                            
                            <tr> 
                                <td id="calendarMini">19</td>
                                <td id="calendarMini">20</td>
                                <td id="calendarMini">21</td>
                                <td id="calendarTCO04Mini"><A id="miniSRMDate" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco04&amp;d3=about">22</A></td>
                                <td id="calendarMini">23</td>
                                <td id="calendarMini">24</td>
                                <td id="calendarSRMMini"><A id="miniSRMDate" href="/?RoundId=5858&amp;t=schedule&amp;c=srm">25</A></td>
                            </tr>
                            
                            <tr> 
                                <td id="calendarMini">26</td>
                                <td id="calendarMini">27</td>
                                <td id="calendarSRMMini"><A id="miniSRMDate" href="/?RoundId=5859&amp;t=schedule&amp;c=srm">28</A></td>
                                <td id="calendarTCO04Mini"><A id="miniSRMDate" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco04&amp;d3=about">29</A></td>
                                <td id="calendarMini">30</td>
                                <td id="calendarBlankMini">&#160;</td> 
                                <td id="calendarBlankMini">&#160;</td> 
                            </tr>

                            <tr><td colspan="7" class="statText" nowrap="nowrap" align="right"><A class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=schedule&amp;c=index</xsl:attribute>More 2004 Match Dates&#160;</A></td></tr>
                        </table>
                    </td>
                </tr>
            </table>
  </xsl:template>
</xsl:stylesheet>