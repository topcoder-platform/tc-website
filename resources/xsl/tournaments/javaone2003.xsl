<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>      

<title>Sun Microsystems JavaOne Coding Challenge, June 10-12, San Francisco, CA, Powered by [TopCoder]&#174;</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<!-- Header begins -->
<xsl:call-template name="Top"/>
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC" valign="top">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="5" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->	
        <td class="promoText" width="100%">
            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="promoText" width="100%">      
                        <table width="100%" border="0" cellpadding="4" cellspacing="0">

<!-- 2003 JavaOne Conference -->
                            <tr><td colspan="2" align="center"><img src="/i/private_label/javaone_landing_logo.gif" alt="2003 JavaOne Conference" width="247" height="75" /></td></tr>
                            
                            <tr><td class="statTextBig" bgcolor="#333399" colspan="2"><p style="font-family: Verdana; font-size: 15px;">2003 JavaOne Conference in San Francisco</p></td></tr>
                            
                            <tr valign="top">
                                <td class="promoText" width="99%">
                                    <p>Everywhere you look, Java<span class="super">TM</span> technology is at work; 
                                    powering businesses, enabling mobile devices, and defining 
                                    the future of Web services. The Java platform unifies the computing landscape, from the smallest smart card to the 
                                    most massive data center. Today, the power of Java technology translates into unlimited opportunities to build and 
                                    develop solutions that integrate networking systems across all business functions.</p>

                                    <p>The JavaOne<span class="super">sm</span> conference is the source for the 
                                    unparalleled opportunity to learn from the creators and foremost 
                                    experts in Java technology. Interact with peers and share success stories and innovative ideas. Gain the knowledge you 
                                    need to solve your most pertinent problems and advance your critical projects. </p>

                                    <p><A href="http://javaone.key3media.com/sf2003/registration/" target="_blank"><strong>Register for the conference</strong></A></p><br />
                                </td>

                                <td class="promoText" width="225">
                                    <table width="225" border="0" cellpadding="8" cellspacing="0" bgcolor="#FFFFCC">
                                        <tr valign="top">
                                            <td class="sidebarText" width="100%">
                                                <strong>Choose from more than 200 technical sessions, 175 Birds-of-a-Feather sessions, or test drive real-world Java 
                                                technology solutions in one of the following topics:</strong>
                                                <ul>
                                                    <li>Java Core Technology</li>
                                                    <li>Java Technology in Mobility</li>
                                                    <li>Core Enterprise</li>
                                                    <li>Java Technology in the Web Tier</li>
                                                    <li>Web Services</li>
                                                    <li>Java Technology on the Desktop</li>
                                                    <li>Java Technology Products and Success Stories</li>
                                                    <li>Advanced Network Technologies</li>
                                                </ul>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>

<!-- JavaOne Coding Challenge -->
                            <tr valign="bottom">
                                <td class="statTextBig" bgcolor="#333399"><p style="font-family: Verdana; font-size: 15px;">JavaOne Coding Challenge</p></td>
                                <td class="statTextSmall" bgcolor="#333399" nowrap="nowrap" align="right">Powered by [TopCoder]&#174;</td>
                            </tr>
                            
                            <tr>
                                <td class="promoText" colspan="2">
                                    <br /><font size="4" color="#333399"><strong>Code &#151; Compete &#151; Win!</strong></font>

                                    <p>
                                    <table border="0" cellpadding="5" cellspacing="2" align="right">
                                        <tr><td rowspan="9" width="1"><img src="/i/clear.gif" width="1" height="1" border="0"/></td></tr>
                                        <tr><td class="sidebarText" colspan="3" align="center" bgcolor="#CCCC99"><strong>COMPETITION SCHEDULE</strong></td></tr>
                                        <tr valign="top">
                                            <td class="sidebarText" bgcolor="#FFFFCC"><strong>Date</strong></td>
                                            <td class="sidebarText" bgcolor="#FFFFCC"><strong>Time</strong> (Pacific)</td>
                                            <td class="sidebarText" bgcolor="#FFFFCC"><strong>Track</strong></td>
                                        </tr>
                                        <tr valign="top">
                                            <td class="sidebarText" bgcolor="#FFFFCC">Tue, June 10</td>
                                            <td class="sidebarText" bgcolor="#FFFFCC">11:00am - 4:00pm</td>
                                            <td class="sidebarText" bgcolor="#FFFFCC">Web Services<br />Qualification</td>
                                        </tr>
                                        <tr valign="top">
                                            <td class="sidebarText" bgcolor="#FFFFCC">Tue, June 10</td>
                                            <td class="sidebarText" bgcolor="#FFFFCC">5:00pm - 6:30pm</td>
                                            <td class="sidebarText" bgcolor="#FFFFCC">Web Services<br />Competition</td>
                                        </tr>
                                        <tr valign="top">
                                            <td class="sidebarText" bgcolor="#FFFFCC">Wed, June 11</td>
                                            <td class="sidebarText" bgcolor="#FFFFCC">10:00pm - 4:00pm</td>
                                            <td class="sidebarText" bgcolor="#FFFFCC">Enterprise Applications<br />Qualification</td>
                                        </tr>
                                        <tr valign="top">
                                            <td class="sidebarText" bgcolor="#FFFFCC">Wed, June 11</td>
                                            <td class="sidebarText" bgcolor="#FFFFCC">5:00pm - 6:30pm</td>
                                            <td class="sidebarText" bgcolor="#FFFFCC">Enterprise Applications<br />Competition</td>
                                        </tr>
                                        <tr valign="top">
                                            <td class="sidebarText" bgcolor="#FFFFCC">Thu, June 12</td>
                                            <td class="sidebarText" bgcolor="#FFFFCC">10:00pm - 4:00pm</td>
                                            <td class="sidebarText" bgcolor="#FFFFCC">Mobility<br />Qualification</td>
                                        </tr>
                                        <tr valign="top">
                                            <td class="sidebarText" bgcolor="#FFFFCC">Thu, June 12</td>
                                            <td class="sidebarText" bgcolor="#FFFFCC">5:00pm - 6:30pm</td>
                                            <td class="sidebarText" bgcolor="#FFFFCC">Mobility<br />Competition</td>
                                        </tr>
                                        <tr><td colspan="4"><img src="/i/clear.gif" width="1" height="1" border="0"/></td></tr>
                                    </table>
                                    Attendees will use the Java programming language to solve real-world problems  in Mobility, Enterprise 
                                    Applications and Web Services</p>

                                    <p>The 2003 JavaOne conference is the ultimate experience for Java technology  developers to learn about the 
                                    Java platform. This year, Sun Microsystems, Inc.  brings you a JavaOne Coding Challenge. The event will bring 
                                    Java technology  programmers together for coding, competition and fun. Sun has teamed up with  TopCoder<span class="super">TM</span> 
                                    to provide a unique hands-on Java technology experience to  Conference Attendees. If you are a Java technology 
                                    developer, you do not want  to miss this event.</p>
                                </td>
                            </tr>

                            <tr>
                                <td class="promoText" colspan="2">
                                    <p><font size="3"><strong>Let the Coding Begin!</strong></font></p>

                                    <ul>
                                        <li>All registered attendees of JavaOne may participate </li>
                                        <li>All competition takes place at the JavaOne Coding Challenge exhibit area </li>
                                        <li>Code, compile, test, and submit solutions to real-world programming problems </li>
                                        <li>All participants will be awarded a prize</li>
                                    </ul>
                                    
                                    <p>Some of the prizes for the "top" coders include a Nokia&#174; 3650 cell phone, a complete volume of SMI Press books, and a 
                                    pass to next year's JavaOne conference. These prizes will not be available anywhere else at the conference and will be a 
                                    "badge of honor" for those who participate</p>

                                    <p><font size="3"><strong>Bring it On!</strong></font><br />
                                    <img src="/i/private_label/javaone_landing_photo.jpg" alt="" width="227" height="244" align="right" />
                                    Throughout each day, TopCoder will objectively score each competitor's  submission for accuracy and time to complete t
                                    he problem of all participants,  and top scorers will be invited back for head-to-head competition in the  afternoon where 
                                    they will battle it out in the online Competition Arena.</p>
                                    
                                    <p>The points are calculated based on accuracy and speed. Scores are automatically determined 
                                    as the TopCoder system runs code submitted by the competitors through a battery of test cases. The person who writes a 
                                    correct piece of code in the shortest amount of time will win the top prize. Runner-up prizes will be awarded as well. 
                                    <strong>There are no judges for the competition as the system tells the tale.</strong></p>

                                    <p><font size="3"><strong>Be Recognized</strong></font><br />
                                    The winners of each day's competition will be featured at the JavaOne Coding Challenge area, on the JavaOne web site, 
                                    on the TopCoder web site and in press materials. Some attendees are going to walk away as winners of valuable, exciting 
                                    prizes and bragging rights. Will it be you?</p>
                                </td>
                            </tr>
                        </table>

                        <p><br /></p>

                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170" valign="top"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="public_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
<xsl:call-template name="Foot"/>
<!-- Footer ends -->

</body>

</html>

  </xsl:template>
</xsl:stylesheet>
