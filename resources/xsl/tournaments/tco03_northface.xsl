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
        <td width="180" valign="top">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->	
        <td class="bodyText" align="center">
            <table width="510" border="0" cellpadding="0" cellspacing="15">
                  <tr align="left">
                    <td  align="left" width="510" colspan="2"><A href="http://www.northface.edu" target="_blank"><img src="/i/sponsor/northface/northface_banner.gif" alt="Northface" width="510" height="67" border="0" /></A><br/>
                 </td>
             </tr>
            
            <tr>
                <td align="left" class="bodyText" width="360">
                        
                        <img src="/i/sponsor/northface/northface_title_1.gif" alt="Northface" width="360" height="42" border="0" />
                        <p>Now there is a university that is dedicated to preparing you for what the U.S. Labor Department says will be the fastest growing field through 
                            2010: software development. A field with an average starting salary of $52,000* (U.S. Dept. of Labor's Bureau of Labor Statistics, 2002-03).</p>
                        <img src="/i/sponsor/northface/northface_title_2.gif" alt="Northface" width="360" height="42" border="0" />
                        
                        <p>Located in Salt Lake City, <A href="http://www.northface.edu" target="_blank">Northface University</A> offers B.S. in Computer Science degrees 
                            and MBA degrees.</p>
                            
                            <blockquote>
                            <ul><li><strong>Bachelor of Science in Computer Science</strong> (on-campus program: 28 month duration) enables students to align IT and business 
                            through modeling and business rules.</li>
                            <li><strong>Master of Business Administration in Enterprise Informatics</strong> (online and on-campus program: 24 month duration) provides 
                            students with a fast-paced, educational experience with a 70&#37; real-world, project focus.</li>
                            </ul>
                            </blockquote>
                        
                        <p>Graduates earn degrees, and are equipped with a digital portfolio of project work, and the two most respected certifications in the industry: 
                        jCert Enterprise Developer for IBM and Microsoft Certified Solution Developer (MCSD). </p>
                  </td>
                  
                  <td valign="top">
                        <img src="/i/sponsor/northface/northface_vertical_graphic.gif" alt="Northface" width="148" height="492" border="0" />
                        </td>
                </tr>
                
            <tr valign="top"> 
                <td class="bodyText" align="left" colspan="2" width="510">
                        <img src="/i/sponsor/northface/northface_title_3.gif" alt="Northface" width="360" height="42" border="0" />
                        <p>To prepare the best software developers in the world requires professors of the highest caliber and experience. You will study and learn from some 
                        of the most respected thought leaders of our time. Authors who are recognized and are leaders in software development. They've written the textbooks 
                        in their field, and worked for the best companies: Microsoft, IBM, NASA, Oracle, and others.</p>
                        
                        <p>Over a two-year period, you and your instructors will work in partnership with IBM, Microsoft, and Unisys on a revolutionary project-driven 
                        learning experience. So you will graduate with more than just a diploma, you'll graduate with real-world experience on your resume.</p>
                   
                        <img src="/i/sponsor/northface/northface_title_4.gif" alt="Northface" width="360" height="42" border="0" />
              
                    <p>You will not find a more high-tech university anywhere. You'll use the latest equipment and programs and get the most leading-edge education and 
                        experience. We have designed the classrooms tomorrow the kind of working experience you'll encounter. It is a unique and positive place for you to 
                        prepare for a successful career in software development.</p>
                </td>
            </tr>
       
                <tr valign="top">
                    <td class="bodyText" colspan="2" align="left">
                    <img src="/i/sponsor/northface/northface_title_5.gif" alt="Northface" width="360" height="42" border="0" />
                    </td>
                  </tr>
                  
                 <tr valign="top">
                    <td colspan="2">
                    <table>
                        <tr>
                            <td class="bodyText"> 
                                <p>Computer science graduates enjoy favorable job prospects and salaries, particularly if they have practical experience. </p>
                            </td >
                     
                            <td> <img src="/i/sponsor/northface/northface_graph.gif" alt="Northface" width="245" height="120" border="0"/>
                            </td>
                        </tr>
                        </table>
                    </td>
                </tr>
                        

                <tr valign="top">
                    <td class="promoText" colspan="2" align="left">
                        <p>SCHOLARSHIPS, FINANCIAL AID, AND TEACHING ASSISTANTSHIPS AVAILABLE - Click <A href="http://www.northface.edu" target="_blank">here</A> for info ASAP</p>
                    </td>
                </tr>
            </table>
            
            <p><br/></p>
            
        </td>
<!-- Center Column Ends -->

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
