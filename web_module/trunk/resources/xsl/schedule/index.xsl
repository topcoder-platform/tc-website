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

<STYLE TYPE="text/css"> 
<!-- Additional Styles for CRPF Event --> 
#calendarCRPF { color: #FFF; font-size: 11px; font-weight: normal; text-align: left; vertical-align: top; background-color: #4C9ED8; } 
#calendarCRPFDate  { 	color: #012B62; font-weight: bold; } 
</STYLE> 

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
                                <td class="statTextLarge" width="99%"><font size="3">&#160;November 2003</font></td>
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
                                &#160;<br /></td>
                                <td id="calendarBlank">&#160;</td>
                                <td id="calendarBlank">&#160;</td>
                                <td id="calendarBlank">&#160;</td>
                                <td id="calendarBlank">&#160;</td>
                                <td id="calendarBlank">&#160;</td>
                                <td id="calendar">1</td>
                            </tr>
                            
                            <tr> 
                                <td id="calendar">2</td>
                                <td id="calendar">3</td>
                                <td id="calendar">4</td>
                                <td id="calendarTCO03">
                                    <span id="calendarTCO03Date">5</span><br />
                                    <strong>2003 TCO: Coding</strong><br />
                                    Online Round #4<br />
                                    Login by: 9:20&#160;PM<br />
                                    Compete: 9:30&#160;PM<br />
                                    Sponsor: <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_artifact" class="statText">Artifact</A><br />
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_schedule" class="statText">Details</A></td>
                                <td id="calendar">6</td>
                                <td id="calendar">7</td>
                                <td id="calendarSRM">
                                    <span id="calendarSRMDate">8</span><br />
                                    <strong>Match 170</strong><br />
                                    Register: 9:00&#160;AM<br />
                                    Compete: 12:00&#160;PM<br />
                                    Sponsor: <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_northface">Northface</A><br />
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <A href="/?RoundId=4655&amp;t=schedule&amp;c=srm">Details</A></td>
                            </tr>
                            
                            <tr> 
                                <td id="calendar">9</td>
                                <td id="calendar">10</td>
                                <td id="calendarCRPF">
                                    <span id="calendarCRPFDate">11</span><br />
                                    <strong>CRPF Charity Challenge</strong><br />
                                    Online Round #1<br />
                                    Register: 6:00&#160;PM<br />
                                    Compete: 9:00&#160;PM<br />
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <A href="/tc?module=CRPFStatic&amp;d1=crpf&amp;d2=crpf_sched">Details</A></td>
                                <td id="calendarSRM">
                                    <span id="calendarSRMDate">12</span><br />
                                    <strong>Match 171</strong><br />
                                    Register: 6:00&#160;PM<br />
                                    Compete: 9:00&#160;PM<br />
                                    Sponsor: <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_intel">Intel</A><br />
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <A href="/?RoundId=4660&amp;t=schedule&amp;c=srm">Details</A></td>
                                <td id="calendar">13</td>
                                <td id="calendarSRM">
                                    <span id="calendarSRMDate">14</span><br />
                                    <strong><font color="#3366cc">G</font><font color="#cc0000">o</font><font color="#ffcc00">o</font><font color="#3366cc">g</font><font color="#339933">l</font><font color="#cc0000">e</font> Code Jam</strong><br />
                                    Championship Round<br />
                                    Compete: 5:00&#160;PM<br />
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <A href="/pl/?&amp;module=Static&amp;d1=google&amp;d2=google_sched">Details</A></td>
                                <td id="calendar">15</td>
                            </tr>
                            
                            <tr> 
                                <td id="calendar">16</td>
                                <td id="calendarCRPF">
                                    <span id="calendarCRPFDate">17</span><br />
                                    <strong>CRPF Charity Challenge</strong><br />
                                    Online Round #3<br />
                                    Login by: 8:50&#160;PM<br />
                                    Compete: 9:00&#160;PM<br />
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <A href="/tc?module=CRPFStatic&amp;d1=crpf&amp;d2=crpf_sched">Details</A></td>
                                <td id="calendar">18</td>
                                <td id="calendar">19</td>
                                <td id="calendarSRM">
                                    <span id="calendarSRMDate">20</span><br />
                                    <strong>Match 172</strong><br />
                                    Register: 5:00&#160;PM<br />
                                    Compete: 8:00&#160;PM<br />
                                    Sponsor: NVIDIA &amp; Google<br />
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <A href="/?RoundId=4665&amp;t=schedule&amp;c=srm">Details</A><br/><br/></td>
                                <td id="calendar">21</td>
                                <td id="calendar">22</td>
                            </tr>
                            
                            <tr> 
                                <td id="calendar">23</td>
                                <td id="calendar">24</td>
                                <td id="calendarSRM">
                                    <span id="calendarSRMDate">25</span><br />
                                    <strong>Match 173</strong><br />
                                    Register: 7:00&#160;PM<br />
                                    Compete: 10:00&#160;PM<br />
                                    Sponsor: <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_revelation">Revelation Software</A><br />
                                    <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
                                    <A href="/?RoundId=4670&amp;t=schedule&amp;c=srm">Details</A><br/><br/></td>
                                <td id="calendar">26</td>
                                <td id="calendar">27</td>
                                <td id="calendar">28</td>
                                <td id="calendar">29</td>
                           </tr>
                            
                            <tr> 
                                <td id="calendar">30</td>
                                <td id="calendarBlank">&#160;</td>
                                <td id="calendarBlank">&#160;</td>
                                <td id="calendarBlank">&#160;</td>
                                <td id="calendarBlank">&#160;</td>
                                <td id="calendarBlank">&#160;</td>
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
