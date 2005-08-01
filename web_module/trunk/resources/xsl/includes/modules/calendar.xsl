<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="calendar">
<style type="text/css">
#calendarTCO05Mini
{
	color: #000000;
	font-size: 11px;
	font-weight: bold;
	text-align: center;
	vertical-align: middle;
	background-color: ##FFEA53;;
}
#calendarTCO05Date
{
	color: #000000;
	font-weight: bold;
	text-decoration: none;
}

</style>
            <table width="100%" bgcolor="#4A4A4A" cellspacing="0" cellpadding="0" border="0">
                <tr>
                    <td valign="top">
                        <table width="100%" border="0" cellspacing="1" cellpadding="1">
							<tr><td colspan="7" class="statTextBig" nowrap="nowrap" height="18">&#160;Match Dates: August</td></tr>
                            
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
                                <td id="calendarTCO05Mini"><A id="calendarTCO05Date" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=about">1</A></td>
                                <td id="calendarSRMMini"><A id="miniSRMDate" href="/?RoundId=7992&amp;t=schedule&amp;c=srm">2</A></td>
                                <td id="calendarTCO05Mini"><A id="calendarTCO05Date" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=about">3</A></td>
                                <td id="calendarMini">4</td>
                                <td id="calendarMini">5</td>
                                <td id="calendarMini">6</td>
                            </tr>
                      
                            <tr> 
                                <td id="calendarMini">7</td>
                                <td id="calendarSRMMini"><A id="miniSRMDate" href="/?RoundId=8005&amp;t=schedule&amp;c=srm">8</A></td>
                                <td id="calendarMini">9</td>
                                <td id="calendarSRMMini"><A id="miniSRMDate" href="/?RoundId=7993&amp;t=schedule&amp;c=srm">10</A></td>
                                <td id="calendarMini">11</td>
                                <td id="calendarMini">12</td>
                                <td id="calendarMini">13</td>
                            </tr>
                            
                            <tr> 
                                <td id="calendarMini">14</td>
                                <td id="calendarMini">15</td>
                                <td id="calendarTCO05Mini"><A id="calendarTCO05Date" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=about">16</A></td>
                                <td id="calendarTCO05Mini"><A id="calendarTCO05Date" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=about">17</A></td>
                                <td id="calendarMini">18</td>
                                <td id="calendarMini">19</td>
                                <td id="calendarTCO05Mini"><A id="calendarTCO05Date" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=about">20</A></td>
                            </tr>
                            
                            <tr> 
                                <td id="calendarMini">21</td>
                                <td id="calendarSRMMini"><A id="miniSRMDate" href="/?RoundId=8012&amp;t=schedule&amp;c=srm">22</A></td>
                                <td id="calendarMini">23</td>
                                <td id="calendarTCO05Mini"><A id="calendarTCO05Date" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=about">24</A></td>
                                <td id="calendarMini">25</td>
                                <td id="calendarMini">26</td>
                                <td id="calendarSRMMini"><A id="miniSRMDate" href="/?RoundId=7994&amp;t=schedule&amp;c=srm">27</A></td>
                            </tr>
                            
                            <tr> 
                                <td id="calendarMini">28</td>
                                <td id="calendarMini">29</td>
                                <td id="calendarSRMMini"><A id="miniSRMDate" href="/?RoundId=7995&amp;t=schedule&amp;c=srm">30</A></td>
                                <td id="calendarTCO05Mini"><A id="calendarTCO05Date" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=about">31</A></td>
                                <td id="calendarBlankMini">&#160;</td> 
                                <td id="calendarBlankMini">&#160;</td> 
                                <td id="calendarBlankMini">&#160;</td> 
                            </tr>
                            
                            <tr><td colspan="7" class="statText" nowrap="nowrap" align="right"><A class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=schedule&amp;c=index</xsl:attribute>More Match Dates&#160;</A></td></tr>
                        </table>
                    </td>
                </tr>
            </table>
  </xsl:template>
</xsl:stylesheet>