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

<title>Northface University is a corporate sponsor of the 2003 TopCoder Open coding tournament</title>

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
        <td width="170" valign="top">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
<!-- Gutter Ends -->

<!-- Center Column Begins -->	
        <td class="promoText" width="100%">
            <table width="100%" border="0" cellpadding="0" cellspacing="15">

                  <tr align="left"><td colspan="2"><A href="http://www.northface.edu" target="_blank"><img src="/i/sponsor/northface/northface_banner.gif" alt="Northface" width="510" height="67" border="0" /></A><br/>
                  </td></tr>
                            
                <tr valign="top">
                    <td class="promoText" width="99%">
                        <p><A href="http://www.northface.edu" target="_blank">Northface University</A> is establishing the finest university in the world for software developers. 
                        Our educational programs focus on the latest advancements in modeling, business rules, data management and systems integration. The courses are  fast-paced, utilize leading edge technologies 
                        and reinforce best practice skills for the implementation of real-world projects.</p>
                        </td>
                        
                        <td rowspan="3">
                        <img src="/i/sponsor/northface/northface_vertical_graphic.gif" alt="Northface" width="148" height="492" border="0" />
                        </td></tr>
                        
               	<tr valign="top"> <td align="left">
                        <img src="/i/sponsor/northface/northface_title_1.gif" alt="Northface" width="360" height="42" border="0" />
                        </td></tr>
                        
                        
                        
                        
		<tr valign="top"> <td align="left" class="bodyText">
                        <p><A href="http://www.northface.edu" target="_blank">Northface University's</A> students are mentored by some of the most well-respected thought leaders in the software industry. The Northface University programs 
                        provide:</p>
                        
                        <blockquote>
                        <ul>
                        <li>An experiential learning environment</li>
                        <li>An accelerated, focused program</li>
                        <li>Competency in key development areas</li>
                        <li>World-class mentoring</li>
                        </ul>
                        </blockquote>
                        
                        <p>The following degree programs are currently offered by <A href="http://www.northface.edu" target="_blank">Northface University</A>:</p>
                        <ul>
                        <li><strong>Bachelor of Science in Computer Science</strong> (on-campus program: 28 month duration) enables students to align IT and business through modeling and business rules. </li>
                        <li><strong>Master of Business Administration in Enterprise Informatics</strong> (online and on-campus program: 24 month duration) provides students with a fast-paced, 
                        educational experience with a 70% real-world, project focus. </li>
                        </ul>

                        <p><A href="http://www.northface.edu" target="_blank">Northface University</A> offers unique  value through the knowledge base of its faculty , its Global 1000 corporate partnerships , and its hands-on approach 
                        to learning. ( The Northface Advantage )</p>
                    </td>
                </tr>
                
                <tr valign="top"> <td align="left">
                        <img src="/i/sponsor/northface/northface_title_2.gif" alt="Northface" width="360" height="42" border="0" />
                        </td></tr>
                        
                        <tr valign="top">
                    <td class="promoText" width="99%">
                        <p>U.S. Labor Department Statistics project that computer software engineering will be the fastest-growing occupation through 2010.* Northface University was founded to meet the industry 
                        demand for graduates with hands-on project and team collaboration skills. Our misson is to give the next generation of software developers the real-world training they need to succeed on the 
                        job from day one. Northface University's model-driven program gets you out of the classroom and into a high-paying job in just 28 months. </p> 
                        <br/> <p>
                        *U.S. Dept of Labor's Bureau of Labor Statistics, 2002-03</p>
                        </td></tr>
                        
                <tr valign="top"> <td align="left">
                        <img src="/i/sponsor/northface/northface_title_3.gif" alt="Northface" width="360" height="42" border="0" />
                        </td></tr>
                        
                        <tr valign="top">
                    <td class="promoText" width="99%">
                        <p>If you attend Northface University, you'll graduate in 28 months an have an average starting salary of $52,000/yr.* That gives you three and a half years to work, and earn 
                        approximately $156,000. That's enough to pay back your tuition plus $96,000, all before your friends at a tradtional university even graduate. 
                        </p>
                        <br/><p>*National Association of Colleges and Employers</p>
                        </td></tr>
                        
                        
                <tr valign="top"> <td colspan="2" align="left">
                        <img src="/i/sponsor/northface/northface_title_4.gif" alt="Northface" width="360" height="42" border="0" />
                        </td></tr>
                        
                <tr valign="top">
                    <td class="promoText" width="99%">
                        <p>Computer science graduates enjoy favorable job prospects and salaries, particularly if they have practical experience. </p></td>
                        
                        <td colspan="2" align="left">
                        <img src="/i/sponsor/northface/northface_graph.gif" alt="Northface" width="245" height="120" border="0" />
                       </td></tr>
            </table>
            
            <p><br/></p>
            
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <xsl:call-template name="public_right_col">
                <xsl:with-param name="sectionName">tourny</xsl:with-param>
            </xsl:call-template>
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
