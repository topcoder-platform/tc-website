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
<td align="center">	
<table border="0" cellspacing="10" cellpadding="0" width="510">

            <tr>
                <td  align="left" width="510" colspan="2"><A href="http://www.northface.edu" target="_blank"><img src="/i/sponsor/northface/northface_banner.gif" alt="Northface" width="510" height="67" border="0" /></A><br/>
                 </td>
             </tr>
                  
                 
            <tr>
                    <td align="left">
                        <img src="/i/sponsor/northface/northface_title_1.gif" alt="Northface" width="360" height="42" border="0" />
                        </td>  
                        
                        <td valign="top" rowspan="4">
                        <img src="/i/sponsor/northface/northface_vertical_graphic.gif" alt="Northface" width="148" height="492" border="0" />
                        </td>
                </tr>
                        
               <tr valign="top">
                    <td class="bodyText">
                        <p>Now there is a university that is dedicated to preparing you for what the U.S. Labor Department says will be the fastest growing field through 
                        2010: software development. A field with an average starting salary of $52,000* (U.S. Dept. of Labor's Bureau of Labor Statistics, 2002-03).</p>
                        </td>
                    </tr>
                        
                     <tr valign="top"> <td align="left">
                        <img src="/i/sponsor/northface/northface_title_2.gif" alt="Northface" width="360" height="42" border="0" /></td>
                    </tr>   
                        
		<tr valign="top"> 
		    <td align="left" class="bodyText">
                            <p>Located in Salt Lake City, <A href="http://www.northface.edu" target="_blank">Northface University</A> offers B.S. in Computer Science degrees 
                            and MBA degrees.</p>
=======
        <td class="bodyText" align="center">
            <table width="540" border="0" cellpadding="0" cellspacing="15">
                  <tr align="left">
                    <td colspan="2"><A href="/?&amp;t=sponsor&amp;c=link&amp;link=http://www.northface.edu&amp;refer=tco03_northface" target="_blank"><img src="/i/sponsor/northface/northface_banner.gif" alt="Northface" width="510" height="67" border="0" /></A></td>
                  </tr>
                            
                <tr valign="top">
                    <td class="bodyText" width="360">
                        <p><A href="/?&amp;t=sponsor&amp;c=link&amp;link=http://www.northface.edu&amp;refer=tco03_northface" target="_blank">Northface University</A> is establishing the finest university in the world
                        for software developers. Our educational programs focus on the latest advancements in modeling, business rules, data management and 
                        systems integration. The courses are  fast-paced, utilize leading edge technologies and reinforce best practice skills for the 
                        implementation of real-world projects.</p>

                        <p><img src="/i/sponsor/northface/northface_title_1.gif" alt="Northface" width="360" height="42" border="0" /></p>

                        <p><A href="/?&amp;t=sponsor&amp;c=link&amp;link=http://www.northface.edu&amp;refer=tco03_northface" target="_blank">Northface University's</A> students are mentored by some of the most
                        well-respected thought leaders in the software industry. The Northface University programs provide:</p>
>>>>>>> 1.19
                        
                        <ul>
<<<<<<< tco03_northface.xsl
                        <li><strong>Bachelor of Science in Computer Science</strong> (on-campus program: 28 month duration) enables students to align IT and business 
                        through modeling and business rules.</li>
                        <li><strong>Master of Business Administration in Enterprise Informatics</strong> (online and on-campus program: 24 month duration) provides 
                        students with a fast-paced, educational experience with a 70&#37; real-world, project focus.</li>
                       </ul>
                        </blockquote>
                        
                        <p>Graduates earn degrees, and are equipped with a digital portfolio of project work, and the two most respected certifications in the industry: 
                        jCert Enterprise Developer for IBM and Microsoft Certified Solution Developer (MCSD). </p>
                  </td>
                </tr>
                
            <tr valign="top"> 
                <td align="left" colspan="2">
                        <img src="/i/sponsor/northface/northface_title_3.gif" alt="Northface" width="360" height="42" border="0" />
                 </td>
            </tr>   
                        
            <tr valign="top">
                    <td colspan="2"  class="bodyText">
                        <p>To prepare the best software developers in the world requires professors of the highest caliber and experience. You will study and learn from some 
                        of the most respected thought leaders of our time. Authors who are recognized and are leaders in software development. They've written the textbooks 
                        in their field, and worked for the best companies: Microsoft, IBM, NASA, Oracle, and others.</p>
                        
                        <p>Over a two-year period, you and your instructors will work in partnership with IBM, Microsoft, and Unisys on a revolutionary project-driven 
                        learning experience. So you will graduate with more than just a diploma, you'll graduate with real-world experience on your resume.</p>
=======
                            <li>An experiential learning environment</li>
                            <li>An accelerated, focused program</li>
                            <li>Competency in key development areas</li>
                            <li>World-class mentoring</li>
                        </ul>
                        
                        <p>The following degree programs are currently offered by <A href="/?&amp;t=sponsor&amp;c=link&amp;link=http://www.northface.edu&amp;refer=tco03_northface" target="_blank">Northface University</A>:</p>
>>>>>>> 1.19
                        
<<<<<<< tco03_northface.xsl
=======
                        <ul>
                            <li><strong>Bachelor of Science in Computer Science</strong> (on-campus program: 28 month duration) enables students to align 
                            IT and business through modeling and business rules. </li>
                            <li><strong>Master of Business Administration in Enterprise Informatics</strong> (online and on-campus program: 24 month 
                            duration) provides students with a fast-paced, educational experience with a 70% real-world, project focus.</li>
                        </ul>

                        <p><A href="/?&amp;t=sponsor&amp;c=link&amp;link=http://www.northface.edu&amp;refer=tco03_northface" target="_blank">Northface University</A> offers unique  value through the knowledge base
                        of its faculty , its Global 1000 corporate partnerships , and its hands-on approach to learning. (The Northface Advantage)</p>
>>>>>>> 1.19
                    </td>
<<<<<<< tco03_northface.xsl
               </tr>
                        
            <tr valign="top"> 
                <td align="left" colspan="2">
                        <img src="/i/sponsor/northface/northface_title_4.gif" alt="Northface" width="360" height="42" border="0" />
                </td>
            </tr>  
                         
            <tr valign="top">
                <td class="bodyText" colspan="2">
                    <p>You will not find a more high-tech university anywhere. You'll use the latest equipment and programs and get the most leading-edge education and 
                        experience. We have designed the classrooms tomorrow the kind of working experience you'll encounter. It is a unique and positive place for you to 
                        prepare for a successful career in software development.</p>
                </td>
            </tr>
            
            <tr valign="top"> 
                <td align="left">
                        <img src="/i/sponsor/northface/northface_title_5.gif" alt="Northface" width="360" height="42" border="0" />
                </td>
            </tr>  
=======
>>>>>>> 1.19
                        
<<<<<<< tco03_northface.xsl
                         
                <tr valign="top">
                    <td class="bodyText" align="left">
                          <p>Computer science graduates enjoy favorable job prospects and salaries, particularly if they have practical experience. </p>
                     </td>
                    <td align="left">  <img src="/i/sponsor/northface/northface_graph.gif" alt="Northface" width="245" height="120" border="0" />
                    </td>
                </tr>
                      
=======
                    <td><img src="/i/sponsor/northface/northface_vertical_graphic.gif" alt="Northface" width="148" height="492" border="0" /></td>
                </tr>

>>>>>>> 1.19
                <tr valign="top">
<<<<<<< tco03_northface.xsl
                    <td class="promoText" colspan="2" align="left">
                        <p>SCHOLARSHIPS, FINANCIAL AID, AND TEACHING ASSISTANTSHIPS AVAILABLE - Click <A href="http://www.northface.edu" target="_blank">here</A> for info ASAP</p>
                    </td>
                </tr>
    </table>    
    <p><br/></p>
</td>
=======
                    <td colspan="2" class="bodyText">
                        <p><img src="/i/sponsor/northface/northface_title_2.gif" alt="Northface" width="360" height="42" border="0" /></p>
                        
                        <p>U.S. Labor Department Statistics project that computer software engineering will be the fastest-growing occupation through 2010.* 
                        Northface University was founded to meet the industry demand for graduates with hands-on project and team collaboration skills. Our 
                        misson is to give the next generation of software developers the real-world training they need to succeed on the job from day one. 
                        Northface University's model-driven program gets you out of the classroom and into a high-paying job in just 28 months. *U.S. 
                        Dept of Labor's Bureau of Labor Statistics, 2002-03</p>
                        
                        <p><img src="/i/sponsor/northface/northface_title_3.gif" alt="Northface" width="360" height="42" border="0" /></p>

                        <p>If you attend Northface University, you'll graduate in 28 months an have an average starting salary of $52,000/yr.* That gives 
                        you three and a half years to work, and earn  approximately $156,000. That's enough to pay back your tuition plus $96,000, all before 
                        your friends at a tradtional university even graduate. *National Association of Colleges and Employers</p>

                        <p><img src="/i/sponsor/northface/northface_title_4.gif" alt="Northface" width="360" height="42" border="0" /></p>

                        <p><img src="/i/sponsor/northface/northface_graph.gif" alt="Northface" width="245" height="120" border="0" align="right" />
                        Computer science graduates enjoy favorable job prospects and salaries, particularly if they have practical experience.</p>                        
                    </td>
                </tr>
            </table>
            
            <p><br/></p>
            
        </td>
>>>>>>> 1.19
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
