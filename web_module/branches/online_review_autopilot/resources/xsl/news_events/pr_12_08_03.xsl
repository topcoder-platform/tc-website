<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>
  <xsl:import href="../includes/pr_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>      

<title>Winners Announced in 2003 TopCoder Open sponsored by Intel&#174;</title>

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
        <td width="180" valign="top">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->	
        <td class="bodyText" width="99%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">press_room</xsl:with-param>
                <xsl:with-param name="title">&#160;Press Release</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                        <div align="center">
                        <p><span class="bodyTitle">Winners Announced in 2003 TopCoder Open sponsored by Intel&#174;</span><br />
                        <span class="bodySubTitle"><em>Coding and Component Tournament winners take home $70,000</em></span></p>
                        </div>
                        
                        <p><strong>GLASTONBURY, Conn., December 8, 2003&#151;</strong>
                        TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, 
                        today announced Tomasz Czajka of Warsaw, Poland, Tim Roberts of Cary, NC, and Rob Nielsen of Carters Ridge, Australia 
                        have won the Coding and Component Tournaments of the 2003 TopCoder Open sponsored by Intel, held at the Mohegan Sun 
                        Casino in Uncasville, CT on December 4-5.  Czajka beat 15 of the world's top computer programmers during the semifinal 
                        and championship rounds for the $50,000 grand prize in the Coding Tournament.  Roberts and Nielsen each took home $10,000 
                        as the Design and Development winners in the Component Tournament.</p>

                        <p>The Coding Tournament was a timed competition where the participants solved complex algorithmic problems using 
                        Java, C++, C# or VB.Net.  The Component Tournament was focused on software development where four participants were 
                        provided general requirements and asked to design and develop re-useable software components.</p>

                        <p>At the start of the Coding tournament, Czajka was the #2 seed and the #2 rated member among more than 34,000 developers 
                        in the TopCoder community.  As a result of his victory, he has secured his spot as the top rated TopCoder member.  Czajka "out-coded" 
                        Jimmy Mardell from Stockholm, Sweden, Bogdan Stanescu from Fairfax, VA, and Jiqing Tang from Hong Kong in the Championship round.  
                        The finalists earned a spot at the event by besting more than 1,000 other programmers from around the world in simultaneous, online 
                        competitions.  Although TopCoder competitions offer competitors the choice of four programming languages, all of the finalists used C++ 
                        in the Championship round.  "I couldn't be more excited about my win," said Czajka.  "TopCoder and Intel hosted a thrilling event, and I 
                        am thankful to have been able to participate and ultimately win $50,000."</p>

                        <p>The Component Tournament was added to the TopCoder Open this year, expanding the scope from knowledge of algorithms to include 
                        more robust software development. Roberts and Nielsen faced stiff competition in this part of the tournament, having to either design 
                        or develop software that will be used in future applications.  Combined, they have contributed twelve individual reusable software 
                        components to TopCoder's component catalogs.  About the competition, Roberts said he was thrilled to be participating in a tournament 
                        where he could measure himself against a group of his peers.  Nielsen, on the other hand, was quite stunned by his victory saying, "The 
                        competition was very tough.  I didn't expect to walk away with $10,000."</p>

                        <p>"Intel congratulates the three winners of the TopCoder Open, and all who participated in the event worldwide" said Monique Torres, 
                        Intel&#174; Developer Services Campaigns and Promotions Manager.  "We are excited to have been part of such an exciting tournament 
                        and to have increased the awareness of Intel Developer Services among TopCoder's member base."</p>

                        <p>The semi-finalists of the Coding Tournament were as follows:</p>

            <table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                  <td class="sidebarText" width="50%">Reid Barton, Arlington, MA, US</td><td class="sidebarText" width="50%">David Pecora, Chapel Hill, NC, US</td>
               </tr>
               <tr>
                  <td class="sidebarText">Nathan Bronson, Chapel Hill, NC, US</td><td class="sidebarText">Tom Sirgedas, Ann Arbor, MI, US</td>
               </tr>
               <tr>
                  <td class="sidebarText">Ambrose Feinstein, Orlando, FL, US</td><td class="sidebarText">Ben Wilhelm, Seattle, WA, US</td>
               </tr>
               <tr>
                  <td class="sidebarText">Oleksandr Grushetskyy, Kiev, Ukraine</td><td class="sidebarText">Mathijs Vogelzang, Groningen, Netherlands</td>
               </tr>
               <tr>
                  <td class="sidebarText">Derek Kisman, Waterloo, Canada</td><td class="sidebarText">Eugene Vasilchenko, North Potomac, MD, US</td>
               </tr>
               <tr>
                  <td class="sidebarText">Michael Haddox-Schatz, Williamsburg, VA, US</td><td class="sidebarText">Steve Newman, Portola Valley, CA, US</td>
               </tr>
            </table>

                        <p>The other two finalists in the Component Tournament were as follows:</p>

            <table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                  <td class="sidebarText" width="50%">Sergey Kalinichenko, San Francisco, CA</td><td class="sidebarText" width="50%">Pavlo Aksonov, Kiev, Ukraine</td>
               </tr>
            </table>

                        <p>The results of TopCoder's major tournaments, weekly competitions and component development projects create a global database of 
                        objectively rated and talent-differentiated student and professional programmers.</p>

                        <p>"The addition of the Component Tournament to the TopCoder Open has increased the significance of this already premier competition," 
                        said Jack Hughes, Founder and Chairman of TopCoder.  "The three champions crowned today are at the top of their fields and should be proud 
                        of their individual accomplishments."</p>

                        <p><span class="bodySubTitle">About TopCoder, Inc.</span><br />
                        TopCoder, Inc. organizes and hosts online and onsite programming competitions for a global community of members.  TopCoder members 
                        extend across all professional and collegiate levels.  The attraction of competition and the associated rewards create a powerful community 
                        of programmers.  Corporate partners access this member base for employment, software development and sponsorship.  For registration 
                        details or information regarding TopCoder Software, TopCoder Employment Services or sponsorship of TopCoder Events, please visit www.topcoder.com 
                        or call toll free 866-TOPCODER.</p>

                        <p>TopCoder is a trademark of TopCoder, Inc. in the United States and other countries.</p>
                        <p>Intel and Intel Developer Services are trademarks of Intel Corporation or its subsidiaries in the United States and other countries.</p>

                        <p><span class="bodySubTitle">Video Information</span></p>

<p>Monday, December 8th Time: 13:00 - 13:30 EST</p>

<p>UNITED STATES:<br/>
Via Fiber: Confirmation # 1566224<br/>
Via Satellite:  Transponder - Galaxy 3C-02 C-band (orbital position 95 degrees, bandwidth 36 MHz, downlink frequency 3740 MHz (V), audio subcarriers 6.2 &amp; 6.8) confirmation # - 12-8-2003-223</p>

<p>EASTERN EUROPE:<br/>
Transponder - NSS-7 NAV6/EUH6 CHANNEL 1 (orbital position 338 degrees east, bandwidth 9 MHz, downlink frequency 11573.750 (H) SYM 6.1113 /FEC 3/4, carrier NEWSKIES)<br/>
Standards will be converted by the originator.</p>

<p>FAR EAST &amp; AUSTRALIA:<br/>
Pacific Television Center will record a backup recording of both feeds. Media outlets may request a complimentary feed at any time within 24 hours by calling Pacific Television Center at 310-287-3800.</p>

<p>In Hong Kong, broadcasters may access a downlink by calling Reach Hong Kong (formerly HK Telecom) at 852-2888-1944.</p>

<p>WESTBOUND POR 180 SATELLITE PARAMETERS<br/>
Satellite: Pacific Ocean Region (POR) 180 degree intelsat satellite.<br/>
Trandsponder: 21/11 upper channel 4<br/>
downlink frequency :  3769 MHz<br/>
Polairty  RHCP<br/>
Digital format: Scientific Atlanta Mpeg 2 PowerVu<br/>
IRD Channel Four<br/>
FEC  7/8<br/>
Symbol Rate 20.0 MBaud<br/>
Color  PAL</p>

<p>Standards will be converted by the originator.</p>

                        <p>###</p>
                        <p><br /></p>
                        

                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170" valign="top"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="pr_right_col"/>       
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
