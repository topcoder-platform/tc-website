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

<title>TopCoder | Schedule</title>

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
        <td width="170" bgcolor="#CCCCCC">

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
                <xsl:with-param name="title">Monthly View - July 2003</xsl:with-param>
            </xsl:call-template>			
            
            <table border="0" cellspacing="10" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText" width="100%">

<!-- Calendar Pulldown Begins -->	
                        <xsl:call-template name="calendar_view_pulldown"/>
<!-- Calendar Pulldown Ends -->	   

                        <table width="100%" cellspacing="1" cellpadding="3" id="calendarFrame">
                            <tr> 
                                <td id="calendarDays" width="12%">Sun</td>
                                <td id="calendarDays" width="15%">Mon</td>
                                <td id="calendarDays" width="15%">Tues</td>
                                <td id="calendarDays" width="15%">Wed</td>
                                <td id="calendarDays" width="15%">Thurs</td>
                                <td id="calendarDays" width="15%">Fri</td>
                                <td id="calendarDays" width="13%">Sat</td>
                            </tr>
                          
                            <tr> 
                                <td id="calendarBlank">&#160;</td>
                                <td id="calendarBlank">&#160;</td>
                                <td id="calendarSRM">
                                    <span id="calendarSRMDate">1</span><br/>
                                    <strong>Match 153</strong><br/>
                                    Register: 6:00&#160;PM<br/>
                                    Compete: 9:00&#160;PM<br/>
                                    <!-- Sponsored by: Sun<br/> -->
                                    <img src="/i/clear.gif" width="50" height="1" border="0"/><br/>
                                    ..//<a href="/?RoundId=4570&amp;t=schedule&amp;c=srm">Details</a></td>
                                <td id="calendar">2</td>
                                <td id="calendar">3</td>
                                <td id="calendar">4</td>
                                <td id="calendar">5</td>
                            </tr>
                            
                            <tr> 
                                <td id="calendar">6</td>
                                <td id="calendar">7</td>
                                <td id="calendar">8</td>
                                <td id="calendarSRM">
                                    <span id="calendarSRMDate">9</span><br/>
                                    <strong>Match 154</strong><br/>
                                    Register: 6:00&#160;PM<br/>
                                    Compete: 9:00&#160;PM<br/>
                                    <!-- Sponsored by: Sun<br/> -->
                                    <img src="/i/clear.gif" width="50" height="1" border="0"/><br/>
                                    ..//<a href="/?RoundId=4570&amp;t=schedule&amp;c=srm">Details</a></td>
                                <td id="calendar">10</td>
                                <td id="calendar">11</td>
                                <td id="calendar">12</td>
                            </tr>
                            
                            <tr> 
                                <td id="calendar">13</td>
                                <td id="calendar">14</td>
                                <td id="calendar">15</td>
                                <td id="calendar">16</td>
                                <td id="calendarSRM">
                                    <span id="calendarSRMDate">17</span><br/>
                                    <strong>Match 155</strong><br/>
                                    Register: 7:00&#160;PM<br/>
                                    Compete: 10:00&#160;PM<br/>
                                    Sponsored by: Nvidia<br/>
                                    <img src="/i/clear.gif" width="50" height="1" border="0"/><br/>
                                    ..//<a href="/?RoundId=4580&amp;t=schedule&amp;c=srm">Details</a></td>
                                <td id="calendar">18</td>
                                <td id="calendar">19</td>
                            </tr>
                            
                            <tr> 
                                <td id="calendar">20</td>
                                <td id="calendar">21</td>
                                <td id="calendar">22</td>
                                <td id="calendarSRM">
                                    <span id="calendarSRMDate">23</span><br/>
                                    <strong>Match 156</strong><br/>
                                    Register: 6:00&#160;PM<br/>
                                    Compete: 9:00&#160;PM<br/>
                                    Sponsored by: Intel<br/>
                                    <!-- Sponsored by: Nvidia<br/> -->
                                    <img src="/i/clear.gif" width="50" height="1" border="0"/><br/>
                                    ..//<a href="/?RoundId=4585&amp;t=schedule&amp;c=srm">Details</a></td>
                                <td id="calendar">24</td>
                                <td id="calendar">25</td>
                                <td id="calendar">26</td>
                            </tr>
                            
                            <tr> 
                                <td id="calendar">27</td>
                                <td id="calendarSRM">
                                    <span id="calendarSRMDate">28</span><br/>
                                    <strong>Match 156</strong><br/>
                                    Register: 5:00&#160;PM<br/>
                                    Compete: 8:00&#160;PM<br/>
                                    <!-- Sponsored by: Nvidia<br/> -->
                                    <img src="/i/clear.gif" width="50" height="1" border="0"/><br/>
                                    ..//<a href="/?RoundId=4590&amp;t=schedule&amp;c=srm">Details</a></td>
                                <td id="calendar">29</td>
                                <td id="calendar">30</td>
                                <td id="calendar">31</td>
                                <td id="calendarBlank">&#160;</td>
                                <td id="calendarBlank">
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
