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
        <td width="4"><IMG src="/i/table_top_fill.gif" width="4" height="26" border="0" /></td>
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
                                <td class="statTextLarge" width="99%"><font size="3">&#160;October 2003</font></td>
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
                                <td id="calendarBlank">&#160;</td>
                                <td id="calendarBlank">&#160;</td>
                                <td id="calendarBlank">&#160;</td>
                                <td id="calendarSRM">
                                    <span id="calendarSRMDate">1</span><br />
                                    <strong>Match 166</strong><br />
                                    Register: 7:00&#160;PM<br />
                                    Compete: 10:00&#160;PM<br />
                                    Sponsor: <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_northface">Northface</A><br />
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <A href="/?RoundId=4635&amp;t=schedule&amp;c=srm">Details</A></td>
                                <td id="calendarTCO03">
                                    <span id="calendarTCO03Date">2</span><br />
                                    <strong>2003 TCO: Design / Development</strong><br />
                                    Online Round #1<br />
                                    Winners announced<br />
                                    <!-- Sponsor: <A href="/?t=tces&amp;c=index"></A><br /> -->
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_comp_schedule" class="statText">Details</A></td>
                                <td id="calendar">3</td>
                                <td id="calendar">4</td>
                            </tr>
                            
                            <tr> 
                                <td id="calendar">5</td>
                                <td id="calendar">6</td>
                                <td id="calendarTCO03">
                                    <span id="calendarTCO03Date">7</span><br />
                                    <strong>2003 TCO: Coding</strong><br />
                                    Qual. Round #1<br />
                                    Register: 6:00&#160;PM<br />
                                    Compete: 9:00&#160;PM<br />
                                    <!-- Sponsor: <A href="/?t=tces&amp;c=index"></A><br /> -->
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_schedule" class="statText">Details</A><br />
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <strong>2003 TCO: Development</strong><br />
                                    Online Round #2<br />
                                    Projects posted: 12:00&#160;AM<br />
                                    <!-- Sponsor: <A href="/?t=tces&amp;c=index"></A><br /> -->
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_comp_schedule" class="statText">Details</A></td>
                                <td id="calendar">8</td>
                                <td id="calendarTCO03">
                                    <span id="calendarTCO03Date">9</span><br />
                                    <strong>2003 TCO: Coding</strong><br />
                                    Qual. Round #2<br />
                                    Register: 7:00&#160;PM<br />
                                    Compete: 10:00&#160;PM<br />
                                    <!-- Sponsor: <A href="/?t=tces&amp;c=index"></A><br /> -->
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_schedule" class="statText">Details</A><br />
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <strong>2003 TCO: Design</strong><br />
                                    Online Round #2<br />
                                    Projects posted: 12:00&#160;AM<br />
                                    <!-- Sponsor: <A href="/?t=tces&amp;c=index"></A><br /> -->
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_comp_schedule" class="statText">Details</A></td>
                                <td id="calendar">10</td>
                                <td id="calendar">11
                                &#160;<br />
                                &#160;<br />
                                &#160;<br />
                                &#160;<br />
                                &#160;<br /></td>
                            </tr>
                            
                            <tr> 
                                <td id="calendar">12</td>
                                <td id="calendar">13</td>
                                <td id="calendarSRM">
                                    <span id="calendarSRMDate">14</span><br />
                                    <strong>Match 167</strong><br />
                                    Register: 6:00&#160;PM<br />
                                    Compete: 9:00&#160;PM<br />
                                    Sponsor: <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_northface">Northface</A><br />
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <A href="/?RoundId=4640&amp;t=schedule&amp;c=srm">Details</A></td>
                                <td id="calendarTCO03">
                                    <span id="calendarTCO03Date">15</span><br />
                                    <strong>2003 TCO: Coding</strong><br />
                                    Online Round #1<br />
                                    Registration: 6:30-9:25&#160;PM<br />
                                    Compete: 9:30&#160;PM<br />
                                    Sponsor: <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_nvidia" class="statText">NVIDIA</A><br />
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_schedule" class="statText">Details</A></td>
                                <td id="calendar">16</td>
                                <td id="calendarSRM">
                                    <span id="calendarSRMDate">17</span><br />
                                    <strong><font color="#3366cc">G</font><font color="#cc0000">o</font><font color="#ffcc00">o</font><font color="#3366cc">g</font><font color="#339933">l</font><font color="#cc0000">e</font> Code Jam</strong><br />
                                    Qualification Round Starts<br />
                                    8:00 AM<br/>
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <A href="/pl/?&amp;module=Static&amp;d1=google&amp;d2=google_sched">Details</A></td>
                                <td id="calendar">18</td>
                            </tr>
                            
                            <tr> 
                                <td id="calendar">19</td>

                                <td id="calendar">
                                    <span id="calendar">20</span><br />
                                    <table width="100%" cellspacing="1" cellpadding="3">
                                       <tr>
                                       <td id="calendarTCO03">
                                          <strong>2003 TCO: Development</strong><br />
                                          Online Round #2<br />
                                          Deadline: 11:59&#160;PM<br />
                                          <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                          <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_comp_schedule" class="statText">Details</A></td></tr>
                                    </table>
                                    <table width="100%" cellspacing="1" cellpadding="3">
                                       <tr>
                                       <td id="calendarSRM">
                                          <strong><font color="#3366cc">G</font><font color="#cc0000">o</font><font color="#ffcc00">o</font><font color="#3366cc">g</font><font color="#339933">l</font><font color="#cc0000">e</font> Code Jam</strong><br />
                                          Qualification Round Ends<br />
                                          8:00 AM<br/>
                                          <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                          <A href="/pl/?&amp;module=Static&amp;d1=google&amp;d2=google_sched">Details</A></td></tr>
                                    </table></td>

                                <td id="calendarSRM">
                                    <span id="calendarSRMDate">21</span><br />
                                    <strong>Match 168</strong><br />
                                    Register: 5:00&#160;PM<br />
                                    Compete: 8:00&#160;PM<br />
                                    Sponsor: Cryptic &amp; NVIDIA<br />
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <A href="/?RoundId=4645&amp;t=schedule&amp;c=srm">Details</A></td>
                                <td id="calendarTCO03">
                                    <span id="calendarTCO03Date">22</span><br />
                                    <strong>2003 TCO: Coding</strong><br />
                                    Online Round #2<br />
                                    Login by: 9:20&#160;PM<br />
                                    Compete: 9:30&#160;PM<br />
                                    Sponsor: <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_revelation" class="statText">Revelation</A><br />
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_schedule" class="statText">Details</A><br />
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <strong>2003 TCO: Design</strong><br />
                                    Online Round #2<br />
                                    Deadline: 11:59&#160;PM<br />
                                    <!-- Sponsor: <A href="/?t=tces&amp;c=index"></A><br /> -->
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_comp_schedule" class="statText">Details</A></td>
                                <td id="calendar">23</td>
                                <td id="calendarSRM">
                                    <span id="calendarSRMDate">24</span><br />
                                    <strong><font color="#3366cc">G</font><font color="#cc0000">o</font><font color="#ffcc00">o</font><font color="#3366cc">g</font><font color="#339933">l</font><font color="#cc0000">e</font> Code Jam</strong><br />
                                    Online Round 1<br />
                                    Register: 6:00&#160;PM<br />
                                    Compete: 9:00&#160;PM<br />
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <A href="/pl/?&amp;module=Static&amp;d1=google&amp;d2=google_sched">Details</A></td>
                                <td id="calendar">25</td>
                            </tr>
                            
                            <tr> 
                                <td id="calendar">26</td>
                                <td id="calendarSRM">
                                    <span id="calendarSRMDate">27</span><br />
                                    <strong><font color="#3366cc">G</font><font color="#cc0000">o</font><font color="#ffcc00">o</font><font color="#3366cc">g</font><font color="#339933">l</font><font color="#cc0000">e</font> Code Jam</strong><br />
                                    Online Round 2<br />
                                    Login by: 8:55&#160;PM<br />
                                    Compete: 9:00&#160;PM<br />
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <A href="/pl/?&amp;module=Static&amp;d1=google&amp;d2=google_sched">Details</A></td>
                                <td id="calendarSRM">
                                    <span id="calendarSRMDate">28</span><br />
                                    <strong>Match 169</strong><br />
                                    Register: 6:00&#160;PM<br />
                                    Compete: 9:00&#160;PM<br />
                                    Sponsor: <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_revelation">Revelation Software</A><br />
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <A href="/?RoundId=4650&amp;t=schedule&amp;c=srm">Details</A></td>
                                <td id="calendarTCO03">
                                    <span id="calendarTCO03Date">29</span><br />
                                    <strong>2003 TCO: Coding</strong><br />
                                    Online Round #3<br />
                                    Login by: 9:20&#160;PM<br />
                                    Compete: 9:30&#160;PM<br />
                                    Sponsor: <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_northface" class="statText">Northface</A><br />
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_schedule" class="statText">Details</A></td>
                                <td id="calendar">30</td>
                                <td id="calendar">31</td>
                                <td id="calendarBlank">
                                &#160;<br />
                                &#160;<br />
                                &#160;<br />
                                &#160;<br />
                                &#160;<br /></td>
                           </tr>
                            
                        </table>

                        <p><br /></p>
                        
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="10"><IMG src="/i/clear.gif" width="10" height="1" border="0" /></td>
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
