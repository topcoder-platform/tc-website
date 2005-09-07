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

<title>Champions Announced In 2004 TCCC Sponsored by Yahoo!&#174;</title>

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
                        <p><span class="bodyTitle">Champions Announced In 2004 TopCoder&#174; Collegiate Challenge Sponsored by Yahoo!&#174;</span><br />
                        <span class="bodySubTitle"><em>Coding and Component Tournament Winners Take Home $100,000</em></span></p>
                        </div>
                        
<p><strong>BOSTON, MA., April 19, 2004&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that Tomasz Czajka of Warsaw, Poland, Pavlo Aksonov of the Ukraine and Roman Koshlyak, also of the Ukraine, have won the Coding, Design and Development Component tournaments of the 2004 TopCoder Collegiate Challenge sponsored by Yahoo!, held at the Boston Park Plaza Hotel &amp; Towers in Boston, MA on April 16th. Czajka beat 23 of the world's top computer programmers during the onsite semifinal and Championship rounds for the $25,000 grand prize in the Coding tournament.  Aksonov and Koshlyak took home $25,000 and $15,000 respectively as the Design and Development winners in the Component tournament. 
</p>
<p>
The Coding tournament was a timed competition where the participants solved complex algorithmic problems using Java, .Net, C++ or C#.  The Component tournament was focused on software design and development where the participants in each tournament were provided general requirements and asked to design or develop re-useable software components.   
</p>
<p>
At the start of the Coding tournament, Czajka, known by the handle 'tomek', was the Number 1 seed and the Number 1 rated member among more than 38,000 members worldwide. Czajka's winning strategy of a measured approach to the problems combined with a limited challenge phase paid off well as he recorded a final score of 417.22, beating out second place finisher Ben Wilhelm of Seattle, WA, US with 397.16 points, and second runner up John Dethridge of Melbourne, Australia and fourth place finalist Reid Barton, of Arlington, MA, US. As a result of his victory, Czajka remains the Number 1 rated TopCoder member. The finalists earned a spot at the event by besting almost 1,000 other programmers from around the world in simultaneous, online competitions.  
</p>
<p>
"It was a hard fought victory and the competition was strong," said Czajka. "I have a great deal of respect for the other finalists and look forward to the next competition!" 
</p>
<p>
Aksonov and Koshlyak battled to win their contests in Design and Development respectively. After the results were announced, Aksonov said he was excited to be put to the test by such a collection of coding talent. Koshlyak intends to use part of his prize to start his own software company.
</p>
<p>
"Yahoo! salutes each and every competitor who made this event such a great success," said Libby Sartain, Senior Vice President, Human Resources and Chief People Yahoo, "Their passion, creativity and ability to perform in a challenging arena is a great credit to them all."
</p>
<p>
The Championship Round finalists of the Coding tournament were as follows:
</p>

<table width="500" cellspacing="2" cellpadding="6" class="formFrame" align="center">
<tr><td class="sidebarTitle" colspan="2" align="center">Algorithm Competitors</td></tr>
<tr><td class="sidebarText" width="50%">Reid Barton, Arlington, MA, US</td><td class="sidebarText" width="50%">Adrian Kuegel, Ulm, Germany</td></tr>
<tr><td class="sidebarText">Tomasz Czajka, Warsaw, Poland</td><td class="sidebarText">Alexander Neubeck, Germany</td></tr>
<tr><td class="sidebarText">Ben Wilhelm, Seattle, WA, US</td><td class="sidebarText">Hubert Hwang, US</td></tr>
<tr><td class="sidebarText">Bogdan Stanescu, Fairfax, VA US</td><td class="sidebarText">Geir Engdahl, Oslo, Norway</td></tr>
<tr><td class="sidebarText">Aleksandr Grushetskyy, Kiev, Ukraine</td><td class="sidebarText">Jiqing Tang, Hong Kong</td></tr>
<tr><td class="sidebarText">Lars Hellsten, Waterloo, Canada</td><td class="sidebarText">David Rydh, Sweden</td></tr>
<tr><td class="sidebarText">Erik Kopczynski, Warsaw, Poland</td><td class="sidebarText">Oeyvind Grotmol, Spain</td></tr>
<tr><td class="sidebarText">Zheng Shao, Il, US</td><td class="sidebarText">Jan Kuipers, Utrecht, The Netherlands</td></tr>
<tr><td class="sidebarText">John Dethridge, Melbourne, Australia</td><td class="sidebarText">David Narum, Oslo, Norway</td></tr>
<tr><td class="sidebarText">Petko Minkov, Sofia, Bulgaria</td><td class="sidebarText">Benjamin Mickle, US</td></tr>
<tr><td class="sidebarText">Ralph Furmaniak, Waterloo, Canada</td><td class="sidebarText">Bartholomew Furrow, Canada</td></tr>
<tr><td class="sidebarText">Ryan Pai, TX, US</td><td class="sidebarText">Sebastian Kanthak, BC, Canada</td></tr>
</table>

<p>The finalists in the Design and Development Component tournament were as follows:</p>

<table width="500" cellspacing="2" cellpadding="6" class="formFrame" align="center">
<tr><td class="sidebarTitle" colspan="2" align="center">Design Competitors</td></tr>
<tr><td class="sidebarText" width="50%">Pavlo Aksonov, Kiev, Ukraine</td><td class="sidebarText" width="50%">Adrian Carcu, Romania</td></tr>
<tr><td class="sidebarText">Mihai Pasca, Romania</td><td class="sidebarText">Changxi Zheng, Shanghai, China</td></tr>
</table>
<br/>
<table width="500" cellspacing="2" cellpadding="6" class="formFrame" align="center">
<tr><td class="sidebarTitle" colspan="2" align="center">Development Competitors</td></tr>
<tr><td class="sidebarText" width="50%">Roman Koshlyak, Ukraine</td><td class="sidebarText">Harsh Jain, India</td></tr>
<tr><td class="sidebarText">Gary Linscott, Canada</td><td class="sidebarText">Preben Solheim, Norway</td></tr>
</table>

<p>
The results of TopCoder's major tournaments, weekly competitions and component development projects create a global database of objectively rated and talent-differentiated student and professional programmers.  
</p>
<p>
"With an international field of the highest caliber students representing 15 countries from around the world, it's readily apparent that coding talent knows no geographic boundaries," said Rob Hughes, President and COO of TopCoder.  "We extend our congratulations to our TopCoder Collegiate Champions along with forward-looking sponsors like Yahoo! who recognize that TopCoder Competitions is where global development talent lives."
</p>
<p><span class="bodySubTitle">About TopCoder, Inc.</span><br/>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.
</p>
<p>
TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries.
</p>
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
