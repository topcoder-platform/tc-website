<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="calendar">
            <table width="100%" bgcolor="#4A4A4A" cellspacing="0" cellpadding="0" border="0">
                <tr> 
                    <td valign="top">
                        <table width="100%" border="0" cellspacing="1" cellpadding="1">
                            <tr><td colspan="7" class="statTextBig" nowrap="nowrap" height="18">&#160;Match Dates: October</td></tr>
                            
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
                                <td id="calendarSRMMini"><A id="miniSRMDate" href="/?RoundId=4635&amp;t=schedule&amp;c=srm">1</A></td>
                                <td id="calendarTCO03Mini"><A id="miniSRMDate" href="/?t=tournaments&amp;c=tco03_comp_sched"><span id="calendarTCO03Date">2</span></A></td>
                                <td id="calendarMini">3</td>
                                <td id="calendarMini">4</td>
                            </tr>
                      
                            <tr> 
                                <td id="calendarMini">5</td>
                                <td id="calendarMini">6</td>
                                <td id="calendarTCO03Mini"><A id="miniSRMDate" href="/?t=tournaments&amp;c=tco03_comp_sched"><span id="calendarTCO03Date">7</span></A></td>
                                <td id="calendarMini">8</td>
                                <td id="calendarTCO03Mini"><A id="miniSRMDate" href="/?t=schedule&amp;c=index"><span id="calendarTCO03Date">9</span></A></td>
                                <td id="calendarMini">10</td>
                                <td id="calendarMini">11</td>
                            </tr>
                            
                            <tr> 
                                <td id="calendarMini">12</td>
                                <td id="calendarMini">13</td>
                                <td id="calendarSRMMini"><A id="miniSRMDate" href="/?RoundId=4640&amp;t=schedule&amp;c=srm">14</A></td>
                                <td id="calendarTCO03Mini"><A id="miniSRMDate" href="/?t=tournaments&amp;c=tco03_comp_sched"><span id="calendarTCO03Date">15</span></A></td>
                                <td id="calendarMini">16</td>
                                <td id="calendarGoogleMini"><A id="miniSRMDate" href="/pl/?&amp;module=Static&amp;d1=google&amp;d2=google_sched"><span id="calendarGoogleDate">17</span></A></td>
                                <td id="calendarMini">18</td>
                            </tr>
                            
                            <tr> 
                                <td id="calendarMini">19</td>
                                <td id="calendarSRMMini"><A id="miniSRMDate" href="/?t=schedule&amp;c=index">20</A></td>
                                <td id="calendarSRMMini"><A id="miniSRMDate" href="/?RoundId=4645&amp;t=schedule&amp;c=srm">21</A></td>
                                <td id="calendarTCO03Mini"><A id="miniSRMDate" href="/?t=schedule&amp;c=index"><span id="calendarTCO03Date">22</span></A></td>
                                <td id="calendarMini">23</td>
                                <td id="calendarGoogleMini"><A id="miniSRMDate" href="/pl/?&amp;module=Static&amp;d1=google&amp;d2=google_sched"><span id="calendarGoogleDate">24</span></A></td>
                                <td id="calendarMini">25</td>
                            </tr>
                            
                            <tr> 
                                <td id="calendarMini">26</td>
                                <td id="calendarGoogleMini"><A id="miniSRMDate" href="/pl/?&amp;module=Static&amp;d1=google&amp;d2=google_sched"><span id="calendarGoogleDate">27</span></A></td>
                                <td id="calendarSRMMini"><A id="miniSRMDate" href="/?RoundId=4650&amp;t=schedule&amp;c=srm">28</A></td>
                                <td id="calendarTCO03Mini"><A id="miniSRMDate" href="/?t=tournaments&amp;c=tco03_sched"><span id="calendarTCO03Date">29</span></A></td>
                                <td id="calendarMini">30</td>
                                <td id="calendarMini">31</td>
                                <td id="calendarBlankMini">&#160;</td>
                            </tr>

                            <tr><td colspan="7" class="statText" nowrap="nowrap" align="right"><A class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=schedule&amp;c=index</xsl:attribute>More 2003 Match Dates&#160;</A></td></tr>
                        </table>
                    </td>
                </tr>
            </table>
  </xsl:template>
</xsl:stylesheet>
