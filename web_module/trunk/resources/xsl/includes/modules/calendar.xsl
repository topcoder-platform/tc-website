<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="calendar">
            <table width="100%" bgcolor="#4A4A4A" cellspacing="0" cellpadding="0" border="0">
                <tr> 
                    <td valign="top">
                        <table width="100%" border="0" cellspacing="1" cellpadding="1">
                            <tr><td colspan="7" class="statTextBig" nowrap="nowrap" height="18">&#160;Match Dates: November</td></tr>
                            
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
                                <td id="calendarBlankMini">&#160;</td> 
                                <td id="calendarBlankMini">&#160;</td> 
                                <td id="calendarBlankMini">&#160;</td> 
                                <td id="calendarMini">1</td>
                            </tr>
                      
                            <tr> 
                                <td id="calendarMini">2</td>
                                <td id="calendarMini">3</td>
                                <td id="calendarMini">4</td>
                                <td id="calendarTCO03Mini"><A id="miniSRMDate" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_schedule"><span id="calendarTCO03Date">5</span></A></td>
                                <td id="calendarMini">6</td>
                                <td id="calendarMini">7</td>
                                <td id="calendarSRMMini"><A id="miniSRMDate" href="/?RoundId=4655&amp;t=schedule&amp;c=srm">8</A></td>
                            </tr>
                            
                            <tr> 
                                <td id="calendarMini">9</td>
                                <td id="calendarMini">10</td>
                                <td id="calendarCRPFMini"><A id="miniSRMDate" href="/tc?&amp;module=CRPFStatic&amp;d1=crpf&amp;d2=crpf_sched">11</A></td>
                                <td id="calendarSRMMini"><A id="miniSRMDate" href="/?RoundId=4660&amp;t=schedule&amp;c=srm">12</A></td>
                                <td id="calendarMini">13</td>
                                <td id="calendarGoogleMini"><A id="miniSRMDate" href="/pl/?&amp;module=Static&amp;d1=google&amp;d2=google_sched"><span id="calendarGoogleDate">14</span></A></td>
                                <td id="calendarMini">15</td>
                            </tr>
                            
                            <tr> 
                                <td id="calendarMini">16</td>
                                <td id="calendarCRPFMini"><A id="miniSRMDate" href="/tc?&amp;module=CRPFStatic&amp;d1=crpf&amp;d2=crpf_sched">17</A></td>
                                <td id="calendarMini">18</td>
                                <td id="calendarMini">19</td>
                                <td id="calendarSRMMini"><A id="miniSRMDate" href="/?RoundId=4665&amp;t=schedule&amp;c=srm">20</A></td>
                                <td id="calendarMini">21</td>
                                <td id="calendarMini">22</td>
                            </tr>
                            
                            <tr> 
                                <td id="calendarMini">23</td>
                                <td id="calendarMini">24</td>
                                <td id="calendarSRMMini"><A id="miniSRMDate" href="/?RoundId=4670&amp;t=schedule&amp;c=srm">25</A></td>
                                <td id="calendarMini">26</td>
                                <td id="calendarMini">27</td>
                                <td id="calendarMini">28</td>
                                <td id="calendarMini">29</td>
                            </tr>

                            <tr> 
                                <td id="calendarMini">30</td>
                                <td id="calendarBlankMini">&#160;</td> 
                                <td id="calendarBlankMini">&#160;</td> 
                                <td id="calendarBlankMini">&#160;</td> 
                                <td id="calendarBlankMini">&#160;</td> 
                                <td id="calendarBlankMini">&#160;</td> 
                                <td id="calendarBlankMini">&#160;</td> 
                            </tr>

                            <tr><td colspan="7" class="statText" nowrap="nowrap" align="right"><A class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=schedule&amp;c=index</xsl:attribute>More 2003 Match Dates&#160;</A></td></tr>
                        </table>
                    </td>
                </tr>
            </table>
  </xsl:template>
</xsl:stylesheet>
