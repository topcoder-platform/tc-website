<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="calendar">
            <table width="100%" bgcolor="#4A4A4A" cellspacing="0" cellpadding="0" border="0">
                <tr>
                    <td valign="top">
                        <table width="100%" border="0" cellspacing="1" cellpadding="1">
							<tr><td colspan="7" class="statTextBig" nowrap="nowrap" height="18">&#160;Match Dates: April</td></tr>
                            
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
                                <td id="calendarMini">1</td>
                                <td id="calendarSRMMini"><A id="miniSRMDate" href="/?RoundId=6535&amp;t=schedule&amp;c=srm">2</A></td>
                            </tr>
                      
                            <tr> 
                                <td id="calendarMini">3</td>
                                <td id="calendarMini">4</td>
                                <td id="calendarMini">5</td>
                                <td id="calendarSRMMini"><A id="miniSRMDate" href="/?RoundId=6536&amp;t=schedule&amp;c=srm">6</A></td>
                                <td id="calendarMini">7</td>
                                <td id="calendarMini">8</td>
                                <td id="calendarMini">9</td>
                            </tr>
                            
                            <tr> 
                                <td id="calendarMini">10</td>
                                <td id="calendarMini">11</td>
                                <td id="calendarMini">12</td>
                                <td id="calendarMini">13</td>
                                <td id="calendarSRMMini"><A id="miniSRMDate" href="/?RoundId=6537&amp;t=schedule&amp;c=srm">14</A></td>
                                <td id="calendarMini">15</td>
                                <td id="calendarMini">16</td>
                            </tr>
                            
                            <tr> 
                                <td id="calendarMini">17</td>
                                <td id="calendarSRMMini"><A id="miniSRMDate" href="/?RoundId=6538&amp;t=schedule&amp;c=srm">18</A></td>
                                <td id="calendarMini">19</td>
                                <td id="calendarMini">20</td>
                                <td id="calendarMini">21</td>
                                <td id="calendarMini">22</td>
                                <td id="calendarMini">23</td>
                            </tr>
                            
                            <tr> 
                                <td id="calendarMini">24</td>
                                <td id="calendarMini">25</td>
                                <td id="calendarMini">26</td>
                                <td id="calendarMini">27</td>
                                <td id="calendarMini">28</td>
                                <td id="calendarMini">29</td>
                                <td id="calendarSRMMini"><A id="miniSRMDate" href="/?RoundId=6539&amp;t=schedule&amp;c=srm">30</A></td>
                            </tr>
                            

                            <tr><td colspan="7" class="statText" nowrap="nowrap" align="right"><A class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=schedule&amp;c=index</xsl:attribute>More Match Dates&#160;</A></td></tr>
                        </table>
                    </td>
                </tr>
            </table>
  </xsl:template>
</xsl:stylesheet>