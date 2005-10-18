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

<title>Google announces 50 Google Code Jam Finalists</title>

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
                        <p><span class="bodyTitle">Google announces 50 Google Code Jam Finalists</span><br />
                        <span class="bodySubTitle"><em>Programmers from Around the World to Compete in Finals at Google Headquarters</em></span></p>
                        </div>
                        
                        <p><strong>MOUNTAIN VIEW, Calif., October 5, 2004&#151;</strong>
						Google Inc. today announced the 50 finalists in the second annual Google Code Jam, Google's online coding competition consisting of a series of problem-solving challenges that invite participants to select a programming language and use their programming skills to code solutions to the problems. The following finalists will be flown to Google headquarters to compete in the Championship Round on October 15:
						</p>
<ul>
<li>Reid Barton, Arlington, Mass.</li>
<li>Tomasz Czajka, West Lafayette, Ind.</li>
<li>John Dethridge, Glen Iris, Australia</li>
<li>Chuong Do, Richardson, Texas</li>
<li>Tomas Dzetkulic, Michalovce, Slovakia</li>
<li>Bjarke Ebert, Tranbjerg, Denmark</li>
<li>Erling Ellingsen, Trondheim, Norway</li>
<li>Ambrose Feinstein, Orlando, Fla.</li>
<li>Batholomew Furrow, Vancouver, Canada</li>
<li>Dima Germanov, Ufa, Russian Federation</li>
<li>Oyvind Grotmol, Trondheim, Norway</li>
<li>Alexander Grushetsky, Kiev, Ukraine</li>
<li>Lars Hellsten, Toronto, Canada</li>
<li>Hubert Hwang, Brookline, Mass.</li>
<li>Tomasz Idziaszek, Lomianki, Poland</li>
<li>Anders Jonsson, Amherst, Mass.</li>
<li>JongMan Koo, Seoul, Korea</li>
<li>Eryk Kopczynski, Warszawa, Poland</li>
<li>Erik-Jan Krijgsman, Enschede, The Netherlands</li>
<li>Jan Kuipers, Utrecht, The Netherlands</li>
<li>Gilbert Lee, Victoria, Canada</li>
<li>Justin Legakis, Sunnyvale, Calif.</li>
<li>Po-Ru Loh, Pasadena, Calif.</li>
<li>Tim Lovell-Smith, Christchurch, New Zealand</li>
<li>Jimmy Mardell, Stockholm, Sweden</li>
<li>Tim McDonald, Goffstown, N.H.</li>
<li>Joshua Metzler, Ann Arbor, Mich.</li>
<li>Tor Myklebust, Waterloo, Canada</li>
<li>David Narum, Lovenstad, Norway</li>
<li>Steve Newman, Portola Valley, Calif.</li>
<li>Robin Nittka, Ehingen, Germany</li>
<li>Pawel Parys, Kalety, Poland</li>
<li>Martin Pettai, Viljandi, Estonia</li>
<li>David Pritchard, Boston, Mass.</li>
<li>Lovro Puzar, Zagreb, Croatia</li>
<li>Xin Qi, Ithaca, NY</li>
<li>Berinde Radu, Cambridge, Mass.</li>
<li>Sergio Sancho, Capital Federal, Argentina</li>
<li>Aleksandrs Saveljevs, Riga, Latvia</li>
<li>Zheng Shuo, Urbana, Ill.</li>
<li>Jeff Shute, Kitchener, Canada</li>
<li>Bogdan Stanescu, Rockville, Md.</li>
<li>Bolek Szewczyk, Warsaw, Poland</li>
<li>Jeff Tamer, Urbana, Ill.</li>
<li>Peter Tang, Hong Kong</li>
<li>Joris van Rantwijk, Waddinxveen, The Netherlands</li>
<li>Mathijs Vogelzang, Groningen, The Netherlands</li>
<li>Brian Watkins, Salt Lake City, Utah</li>
<li>Jonathan Wills, DeLand, Fla.</li>
<li>You Zhou, Cambridge, Mass.</li>
</ul>

<p>
"The Google Code Jam is one way Google encourages and supports the engineering, programming and computer science communities around the world," said Alan Eustace, vice president, Engineering, Research and Systems Lab, Google Inc.  "We're continually exploring new opportunities to reach out to smart, talented people who enjoy solving problems. This is a fun way of finding, rewarding and potentially recruiting some of those people to Google."
<br/><br/>
This year's Championship Round will be held at Google headquarters in Mountain View, Calif., on October 15, 2004. Finalists will compete for $50,000 in prize money, including $10,000 for the first place winner, $7,000 for the second place winner, and $5,000 for the third place winner. 
<br/><br/>
The Google Code Jam is powered by TopCoder, the leader in online programming competition, skills assessment and competitive software development. Registration for the competition began Sept. 1, and attracted more than 7,500 participants from more than 100 countries.
<br/><br/>
This is the second year of the Google Code Jam.  In 2003, Jimmy Mardell of Stockholm, Sweden, took home the grand prize.  Prior to the first Google Code Jam, Google held a smaller programming contest and hired the winner, who is now part of Google's New York-based engineering team.  More information about Google Code Jam 2004 can be found at http://www.google.com/codejam.  
<br/><br/>
<span class="bodySubtitle">About Google Inc.</span><br/>
Google's innovative search technologies connect millions of people around the world with information every day. Founded in 1998 by Stanford Ph.D.students Larry Page and Sergey Brin, Google today is a top web property in all major global markets. Google's targeted advertising program, which is the largest and fastest growing in the industry, provides businesses of all sizes with measurable results, while enhancing the overall web experience for users. Google is headquartered in Silicon Valley with offices throughout North America, Europe, and Asia. For more information, visit www.google.com.
<br/><br/>
Google is a registered trademark of Google Inc. All other company and product names may be trademarks of the respective companies with which they are associated.
<br/><br/>
<b>Contact:</b><br/>
Barry Schnitt<br/>
650.623.4194<br/>
barry@google.com
<br/><br/>
Eileen Rodriguez<br/>
650.623.4235<br/>
eileen@google.com
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
