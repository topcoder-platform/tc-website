<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="calendar">
            <table width="170" bgcolor="#333333" cellspacing="0" cellpadding="0" border="0">
                <tr> 
                    <td valign="top">
                        <table width="100%" border="0" cellspacing="1" cellpadding="1">
                            <tr><td colspan="7" class="statTextBig" nowrap="nowrap" height="18">&#160;Match Dates: MAY</td></tr>
                            
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
                                <td id="calendarMini">1</td>
                                <td id="calendarMini">2</td>
                                <td id="calendarMini">3</td>
                            </tr>
                      
                            <tr> 
                                <td id="calendarMini">4</td>
                                <td id="calendarMini">5</td>
                                <td id="calendarSRMMini"><a id="miniSRMDate" href="/?RoundId=4530&amp;t=schedule&amp;c=srm">6</a></td>
                                <td id="calendarMini">7</td>
                                <td id="calendarMini">8</td>
                                <td id="calendarMini">9</td>
                                <td id="calendarMini">10</td>
                            </tr>
                            
                            <tr> 
                                <td id="calendarMini">11</td>
                                <td id="calendarMini">12</td>
                                <td id="calendarMini">13</td>
                                <td id="calendarSRMMini"><a id="miniSRMDate" href="/?RoundId=4535&amp;t=schedule&amp;c=srm">14</a></td>
                                <td id="calendarMini">15</td>
                                <td id="calendarMini">16</td>
                                <td id="calendarMini">17</td>
                            </tr>
                            
                            <tr> 
                                <td id="calendarMini">18</td>
                                <td id="calendarMini">19</td>
                                <td id="calendarMini">20</td>
                                <td id="calendarMini">21</td>
                                <td id="calendarSRMMini"><a id="miniSRMDate" href="/?RoundId=4540&amp;t=schedule&amp;c=srm">22</a></td>
                                <td id="calendarMini">23</td>
                                <td id="calendarMini">24</td>
                            </tr>
                            
                            <tr> 
                                <td id="calendarMini">25</td>
                                <td id="calendarMini">26</td>
                                <td id="calendarMini">27</td>
                                <td id="calendarSRMMini"><a id="miniSRMDate" href="/?RoundId=4545&amp;t=schedule&amp;c=srm">28</a></td>
                                <td id="calendarMini">29</td>
                                <td id="calendarMini">30</td>
                                <td id="calendarMini">31</td>
                            </tr>

                            <tr><td colspan="7" class="statText" nowrap="nowrap" align="right"><a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=index</xsl:attribute>More 2003 Match Dates&#160;</a></td></tr>
                        </table>
                    </td>
                </tr>
            </table>
  </xsl:template>
</xsl:stylesheet>
