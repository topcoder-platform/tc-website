<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="calendar">
            <table width="170" bgcolor="#333333" cellspacing="0" cellpadding="0" border="0">
                <tr> 
                    <td valign="top">
                        <table width="100%" border="0" cellspacing="1" cellpadding="1">
                            <tr><td colspan="7" class="statTextBig" nowrap="nowrap" height="18">&#160;Match Dates: APRIL</td></tr>
                            
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
                                <td id="calendarMini">1</td>
                                <td id="calendarMini">2</td>
                                <td id="calendarMini">3</td>
                                <td id="calendarTourneyMini"><a href="/?&amp;t=tournaments&amp;c=tccc03_sched" class="statText">4</a></td>
                                <td id="calendarTourneyMini"><a href="/?&amp;t=tournaments&amp;c=tccc03_sched" class="statText">5</a></td>
                            </tr>
                      
                            <tr> 
                                <td id="calendarMini">6</td>
                                <td id="calendarMini">7</td>
                                <td id="calendarMini">8</td>
                                <td id="calendarMini">9</td>
                                <td id="calendarSRMMini"><a href="/?RoundId=4495&amp;t=schedule&amp;c=srm">10</a></td>
                                <td id="calendarMini">11</td>
                                <td id="calendarMini">12</td>
                            </tr>
                            
                            <tr> 
                                <td id="calendarMini">13</td>
                                <td id="calendarMini">14</td>
                                <td id="calendarSRMMini"><a href="/?RoundId=4500&amp;t=schedule&amp;c=srm">15</a></td>
                                <td id="calendarMini">16</td>
                                <td id="calendarMini">17</td>
                                <td id="calendarMini">18</td>
                                <td id="calendarMini">19</td>
                            </tr>
                            
                            <tr> 
                                <td id="calendarMini">20</td>
                                <td id="calendarSRMMini"><a href="/?RoundId=4505&amp;t=schedule&amp;c=srm">21</a></td>
                                <td id="calendarMini">22</td>
                                <td id="calendarMini">23</td>
                                <td id="calendarMini">24</td>
                                <td id="calendarMini">25</td>
                                <td id="calendarMini">26</td>
                            </tr>
                            
                            <tr> 
                                <td id="calendarMini">27</td>
                                <td id="calendarMini">28</td>
                                <td id="calendarMini">29</td>
                                <td id="calendarSRMMini"><a href="/?RoundId=4515&amp;t=schedule&amp;c=srm">30</a></td>
                                <td id="calendarBlankMini">&#160;</td>
                                <td id="calendarBlankMini">&#160;</td>
                                <td id="calendarBlankMini">&#160;</td>
                            </tr>

                            <tr><td colspan="7" class="statText" nowrap="nowrap" align="right"><a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=index</xsl:attribute>More 2003 Match Dates&#160;</a></td></tr>
                        </table>
                    </td>
                </tr>
            </table>
  </xsl:template>
</xsl:stylesheet>
