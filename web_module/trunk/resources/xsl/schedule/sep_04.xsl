<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/calendar_view_pulldown.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>   
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>      

<title>Schedule of upcoming Single Round Matches for computer programming competitions at TopCoder</title>

<!-- Include External CSS file -->
<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<!-- Top begins -->
<xsl:call-template name="Top"/>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">

            <xsl:call-template name="global_left"/>

        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->	
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">schedule</xsl:with-param>
                <xsl:with-param name="title"></xsl:with-param>
            </xsl:call-template>			
            
            <table border="0" cellspacing="10" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText" width="100%">

                        <table width="100%" cellspacing="0" cellpadding="3" border="0" bgcolor="#999999">
                            <tr valign="middle"><form name="selectform">
                                <td class="statTextLarge" width="99%"><font size="3">&#160;September 2004</font></td>
                                <td align="right" width="1%">
<!-- Calendar Pulldown Begins -->	
                        <xsl:call-template name="calendar_view_pulldown"/>
<!-- Calendar Pulldown Ends -->	  
                                </td></form>
                            </tr> 
                        </table>

                        <table width="100%" cellspacing="1" cellpadding="3" id="calendarFrame">
                            <tr> 
                                <td id="calendarDays" width="14%">Sun</td>
                                <td id="calendarDays" width="14%">Mon</td>
                                <td id="calendarDays" width="14%">Tues</td>
                                <td id="calendarDays" width="14%">Wed</td>
                                <td id="calendarDays" width="14%">Thurs</td>
                                <td id="calendarDays" width="14%">Fri</td>
                                <td id="calendarDays" width="14%">Sat</td>
                            </tr>
                          
                            <tr> 
                                <td id="calendarBlank">
                                    &#160;<br />
                                    &#160;<br />
                                    &#160;<br />
                                    &#160;<br />
                                    &#160;<br />
                                    &#160;</td>
                                <td id="calendarBlank"></td>
                                <td id="calendarBlank"></td>
                                <td id="calendarSRM">
                                    <span id="calendarSRMDate">1</span><br />
                                    <strong>Match 210</strong><br />
                                    Register: 6:00&#160;PM<br />
                                    Compete: 9:00&#160;PM<br />
                                    Sponsor: <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco04&amp;d3=intel">Intel</A><br />
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <A href="/?RoundId=5856&amp;t=schedule&amp;c=srm">Details</A><br/><br/></td>
                                <td id="calendar">2</td>
                                <td id="calendar">3</td>
                                <td id="calendar">4</td>
                            </tr>
                            
                            <tr> 
                                <td id="calendar">5
                                    &#160;<br />
                                    &#160;<br />
                                    &#160;<br />
                                    &#160;<br />
                                    &#160;<br />
                                    &#160;</td>
                                <td id="calendar">6</td>
                                <td id="calendarTCO04">
                                    <span id="calendarTCO04Date">7</span><br/>
                                    <strong>2004 TopCoder Open</strong><br/>
                                    Registration Closes: 9:00 AM ET<br/>
                                    Qualification Round<br/>
                                    START: 12:00 PM ET (noon)<br/>
                                    &#160;<br />
                                    &#160;<br />
                                    <img src="/i/clear.gif" width="50" height="1" border="0"/><br/>
                                    <A class="calendarTCO04Link" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco04&amp;d3=alg_schedule">Details</A>
                                    </td>
                                <td id="calendarTCO04">
                                    <span id="calendarTCO04Date">8</span><br/>
                                    <strong>2004 TopCoder Open</strong><br/>
                                    Qualification Round<br/>
                                    END: 12:00 PM ET (noon)<br/>
                                    &#160;<br />
                                    &#160;<br />
                                    <img src="/i/clear.gif" width="50" height="1" border="0"/><br/>
                                    <A class="calendarTCO04Link" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco04&amp;d3=alg_schedule">Details</A>
                                    </td>
                                <td id="calendar">9</td>
                                <td id="calendar">10</td>
                                <td id="calendarTCO04">
                                    <span id="calendarTCO04Date">11</span><br/>
                                    <strong>2004 TopCoder Open</strong><br/>
                                    Online Round #1<br/>
                                    Registration: 9:00AM - 11:55AM ET<br/>
                                    Compete: 12:00 PM(noon)<br/>
                                    &#160;<br />
                                    <img src="/i/clear.gif" width="50" height="1" border="0"/><br/>
                                    <A class="calendarTCO04Link" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco04&amp;d3=alg_schedule">Details</A>
                                    </td>
                            </tr>
                            
                            <tr> 
                                <td id="calendar" rowspan="2">12</td>
                                <td id="calendar" rowspan="2">13</td>
                                <td id="calendarSRM">
                                    <span id="calendarSRMDate">14</span><br />
                                    <strong>Match 211</strong><br />
                                    Register: 6:00&#160;AM<br />
                                    Compete: 9:00&#160;AM<br />
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <A href="/?RoundId=5857&amp;t=schedule&amp;c=srm">Details</A></td>
                                <td id="calendar" rowspan="2">15</td>
                                <td id="calendar" rowspan="2">16</td>
                                <td id="calendar" rowspan="2">17</td>
                                <td id="calendar" rowspan="2">18</td>
                            </tr>
                            
                            <tr>
                                <td id="calendarTCO04">
                                    <strong>2004 TopCoder Open</strong><br/>
                                    Online Round #2<br/>
                                    Registration: 6:30PM - 9:25PM ET<br/>
                                    Compete: 9:30 PM<br/>
                                    &#160;<br />
                                    <img src="/i/clear.gif" width="50" height="1" border="0"/><br/>
                                    <A class="calendarTCO04Link" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco04&amp;d3=alg_schedule">Details</A>
                                    </td>
							</tr>                            	
                            
                            <tr> 
                                <td id="calendar">19</td>
                                <td id="calendar">20</td>
                                <td id="calendar">21</td>
                                <td id="calendarTCO04">
                                    <span id="calendarTCO04Date">22</span><br/>
                                    <strong>2004 TopCoder Open</strong><br/>
                                    Online Round #3<br/>
                                    Registration: 6:30PM - 9:25PM ET<br/>
                                    Compete: 9:30 PM<br/>
                                    &#160;<br />
                                    <img src="/i/clear.gif" width="50" height="1" border="0"/><br/>
                                    <A class="calendarTCO04Link" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco04&amp;d3=alg_schedule">Details</A>
                                    </td>
                                <td id="calendar">23</td>
                                <td id="calendar">24</td>
                                <td id="calendarSRM">
                                    <span id="calendarSRMDate">25</span><br />
                                    <strong>Match 212</strong><br />
                                    Register: 9:00&#160;AM<br />
                                    Compete: 12:00&#160;PM<br />
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <A href="/?RoundId=5858&amp;t=schedule&amp;c=srm">Details</A><br/><br/></td>
                            </tr>
                            
                            <tr> 
                                <td id="calendar">26</td>
                                <td id="calendar">27</td>
                                <td id="calendarSRM">
                                    <span id="calendarSRMDate">28</span><br />
                                    <strong>Match 213</strong><br />
                                    Register: 6:00&#160;PM<br />
                                    Compete: 9:00&#160;PM<br />
									Sponsored by: <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco04&amp;d3=microsoft">Microsoft</A><br/>
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <A href="/?RoundId=5859&amp;t=schedule&amp;c=srm">Details</A><br/><br/></td>
                                <td id="calendarTCO04">
                                    <span id="calendarTCO04Date">29</span><br/>
                                    <strong>2004 TopCoder Open</strong><br/>
                                    Online Round #4<br/>
                                    Registration: 6:30PM - 9:25PM ET<br/>
                                    Compete: 9:30 PM<br/>
                                    &#160;<br />
                                    <img src="/i/clear.gif" width="50" height="1" border="0"/><br/>
                                    <A class="calendarTCO04Link" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco04&amp;d3=alg_schedule">Details</A>
                                    </td>
                                <td id="calendar">30</td>
                                <td id="calendarBlank"></td>
                                <td id="calendarBlank">
                                    &#160;<br />
                                    &#160;<br />
                                    &#160;<br />
                                    &#160;<br />
                                    &#160;<br />
                                    &#160;</td>
                            </tr>

                        </table>

                        <p><br/></p>
                        
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer Begins -->
    <xsl:call-template name="Foot"/>
<!-- Footer ends -->

</body>
</html>

  </xsl:template>
</xsl:stylesheet>
