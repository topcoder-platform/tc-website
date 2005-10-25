<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Northface University is a corporate sponsor of the 2003 TopCoder Open coding tournament</title>

<jsp:include page="../../script.jsp" />

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="level1" value="events"/>
                <jsp:param name="level2" value="tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" align="center">
            <table width="510" border="0" cellpadding="0" cellspacing="15">
                <tr align="left">
                    <td  align="left" colspan="2"><A href="http://www.northface.edu/public/welcome?source=topcoder" target="_blank"><img src="/i/sponsor/northface/northface_banner.gif" alt="Northface" width="510" height="67" border="0" /></A></td>
                </tr>

                <tr valign="top">
                    <td align="left" class="bodyText" width="360">
                        <p><img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br/>
                        <img src="/i/sponsor/northface/northface_title_1.gif" alt="Northface" width="360" height="42" border="0" /><br/>
                        <img src="/i/clear.gif" alt="" width="10" height="5" border="0" /><br/>
                        Now there is a university that is dedicated to preparing you for what the U.S. Labor Department says will be the fastest growing field through
                        2010: software development. A field with an average starting salary of $52,000* (U.S. Dept. of Labor's Bureau of Labor Statistics, 2002-03).</p>

                        <p><img src="/i/sponsor/northface/northface_title_2.gif" alt="Northface" width="360" height="42" border="0" /><br/>
                        <img src="/i/clear.gif" alt="" width="10" height="5" border="0" /><br/>
                        Located in Salt Lake City, <A href="http://www.northface.edu/public/welcome?source=topcoder" target="_blank">Northface University</A> offers a B.S. in Computer Science degree
                        and MBA degree.</p>

                        <blockquote>
                        <ul>
                            <li><strong>Bachelor of Science in Computer Science</strong> (on-campus program: 28 month duration) enables students to align IT and business
                            through modeling and business rules.</li>
                            <li><strong>Master of Business Administration in Enterprise Informatics</strong> (online and on-campus program: 24 month duration) provides
                            students with a fast-paced, educational experience with a 70&#37; real-world, project focus.</li>
                        </ul>
                        </blockquote>

                        <p>Graduates earn degrees, and are equipped with a digital portfolio of project work, and the two most respected certifications in the industry:
                        jCert Enterprise Developer for IBM and Microsoft Certified Solution Developer (MCSD). </p>
                    </td>

                    <td width="148"><img src="/i/sponsor/northface/northface_vertical_graphic.gif" alt="Northface" width="148" height="492" border="0" /></td>
                </tr>

                <tr valign="top">
                    <td class="bodyText" align="left" colspan="2">
                        <p><img src="/i/sponsor/northface/northface_title_3.gif" alt="Northface" width="360" height="42" border="0" /><br/>
                        <img src="/i/clear.gif" alt="" width="10" height="5" border="0" /><br/>
                        To prepare the best software developers in the world requires professors of the highest caliber and experience. You will study and learn from some
                        of the most respected thought leaders of our time. Authors who are recognized and are leaders in software development. They've written the textbooks
                        in their field, and worked for the best companies: Microsoft, IBM, NASA, Oracle, and others.</p>

                        <p>Over a two-year period, you and your instructors will work in partnership with IBM, Microsoft, and Unisys on a revolutionary project-driven
                        learning experience. You will graduate with more than just a diploma, you'll graduate with real-world experience on your resume.</p>

                        <p><img src="/i/sponsor/northface/northface_title_4.gif" alt="Northface" width="360" height="42" border="0" /><br/>
                        <img src="/i/clear.gif" alt="" width="10" height="5" border="0" /><br/>
                        You will not find a more high-tech university anywhere. You'll use the latest equipment and programs and get the most leading-edge education and
                        experience. We have designed the classrooms to mirror the kind of working experience you'll encounter. It is a unique and positive place for you to
                        prepare for a successful career in software development.</p>
                    </td>
                </tr>

                <tr valign="top">
                    <td class="bodyText" align="left" colspan="2">
                        <p><img src="/i/sponsor/northface/northface_title_5.gif" alt="Northface" width="360" height="42" border="0" /><br/>
                        <img src="/i/clear.gif" alt="" width="10" height="5" border="0" /><br/>
                        <img src="/i/sponsor/northface/northface_graph.gif" alt="Northface" width="245" height="120" border="0" align="right" />
                        <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br/>
                        Computer science graduates enjoy favorable job prospects and salaries, particularly if they have practical experience.</p>
                    </td>
                </tr>

                <tr valign="top">
                    <td class="promoText" colspan="2" align="left">
                        <p>SCHOLARSHIPS, FINANCIAL AID, AND TEACHING ASSISTANTSHIPS AVAILABLE<br/>
                        Click <A href="http://www.northface.edu/public/welcome?source=topcoder" target="_blank">here</A> for more info.</p>
                    </td>
                </tr>
            </table>

            <p><br/></p>

        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
