<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

    <jsp:include page="/script.jsp" />
    <jsp:include page="/style.jsp">
      <jsp:param name="key" value="tc_main"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">


            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                    <jsp:include page="../page_title.jsp" >
                        <jsp:param name="image" value="press_room"/>
                        <jsp:param name="title" value="Press Release"/>
                    </jsp:include>
                    
<div align="right"><tc-webtag:forumLink forumID="506155" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">Semifinalists Announced for 2006 TopCoder Collegiate Challenge Sponsored by AOL</span><br />
<span class="bodySubTitle"><em>Collegiate Coding Talent from 19 Countries to Meet at World Championship of <br>Programming Scheduled for November 17th in San Diego, CA</em></span></p>
</p>
</div>
      
<p><strong>Glastonbury, Conn., October 23, 2006 &#151;</strong>TopCoder, Inc.,  the leader in online programming competition, skills assessment and competitive software development, today announced the 63 International onsite semifinalists who have advanced to the Championship rounds of the 2006 TopCoder Collegiate Challenge sponsored by AOL. This annual TopCoder tournament is open to college students worldwide and will award cash prizes totaling $200,000. The tournament's Championship round will be held November 17th at the San Diego Marriott in San Diego, CA. Full details are provided at: <A href="http://www.topcoder.com/tccc06">http://www.topcoder.com/tccc06</A>. 
<br><br>
"TopCoder programming tournaments are recognized globally throughout academia and business as the standard for performance in competition," said Rob Hughes, President and COO of TopCoder, Inc. "We are excited to provide the greatest arena in the world for these outstanding young people to shine." 
<br><br>
The 48 finalists in the Algorithm Coding Competition, representing 18 nationalities, are: 
 
<div align="center" style="margin: 20px">
<table cellpadding="0" cellspacing="0" class="stat" width="450">
<tbody>
    <tr>
        <td class="header" colspan="2" align="center">Algorithm Competitors</td>
    </tr>
    <tr class="light">
        <td class="value" width="225">Erik-Jan Krijgsman, The Netherlands</strong></td>
        <td class="value" width="225">Tomasz Czajka, Poland</td>
    </tr>
    <tr class="light">
        <td class="value">Michal Forisek, Slovak Republic</td>
        <td class="value">Aleksander Piotrowski, Poland</td>
    </tr>
    <tr class="light">
        <td class="value">Ivan Krasilnikov  Russian Federation</td>
        <td class="value">Bruce Merry, South Africa</td>
    </tr>
     <tr class="light">
        <td class="value">Alexey Zhevak, Russian Federation</td>
        <td class="value">Denis Nazarov, Russian Federation</td>
    </tr>
    <tr class="light">
        <td class="value">Andrey Khalyavin, Russian Federation</td>
        <td class="value">Dmitry Gozman, Russian Federation</td>
    </tr>
    <tr class="light">
        <td class="value">Adrian Kuegel, Germany</td>
        <td class="value">Brian Jacokes, USA</td>
    </tr>
    <tr class="light">
        <td class="value">Andrey Lopatin, Russian Federation</td>
        <td class="value">Egor Kulikov, Russian Federation</td>
    </tr>
    <tr class="light">
        <td class="value">Eryk Kopczynski, Poland</td>
        <td class="value">Igor Naverniouk, Canada</td>
    </tr>
    <tr class="light">
        <td class="value">Mathijs Vogelzang, The Netherlands</td>
        <td class="value">Kaisuke Nakajima, Japan</td>
    </tr>
    <tr class="light">
        <td class="value">Andrey Stankevich, Russian Federation</td>
        <td class="value">Kirill Vedensky, Ukraine</td>
    </tr>
    <tr class="light">
        <td class="value">Ardian Kristanto Poernomo, Singapore</td>
        <td class="value">Konstantin Azarov, Russian Federation</td>
    </tr>
    <tr class="light">
        <td class="value">Benson Joeris, USA</td>
        <td class="value">Luca Barbieri, Italy</td>
    </tr>
    <tr class="light">
        <td class="value">Marcus Isaksson, Sweden</td>
        <td class="value">Michael Mirzayanov, Russian Federation</td>
    </tr>
    <tr class="light">
        <td class="value">Mircea Pasoi, Romania</td>
        <td class="value">Mikhail Dvorkin, Russian Federation</td>
    </tr>
    <tr class="light">
        <td class="value">Minghao Pan, China</td>
        <td class="value">Nathan Claus, USA</td>
    </tr>
    <tr class="light">
        <td class="value">Nicholas Jimsheleishvili, Georgia</td>
        <td class="value">Nikolay Archak, Russian Federation</td>
    </tr>
    <tr class="light">
        <td class="value">Petr Mitrichev, Russian Federation</td>
        <td class="value">Przemyslaw Debiak, Poland</td>
    </tr>
    <tr class="light">
        <td class="value">Reid Barton, USA</td>
        <td class="value">Ricardo Martin, Spain</td>
    </tr>
    <tr class="light">
        <td class="value">Roman Satyukov, Russian Federation</td>
        <td class="value">Rune Fevang, Norway</td>
    </tr>
    <tr class="light">
        <td class="value">Sergey Bankevich, Russian Federation</td>
        <td class="value">Simon Benjamin Orion Parent, Canada</td>
    </tr>
    <tr class="light">
        <td class="value">TianCheng Lou, China</td>
        <td class="value">Tomas Lloret Llinares, Spain</td>
    </tr>
    <tr class="light">
        <td class="value">Vitaly Valtman, Russian Federation</td>
        <td class="value">Volodymyr Kachurovskyi, Ukraine</td>
    </tr>
    <tr class="light">
        <td class="value">Wenbin Tang, China</td>
        <td class="value">Yifei Zhang, China</td>
    </tr>
    <tr class="light">
        <td class="value">Ying Wang, China</td>
        <td class="value">Yiqiang Mao, China</td>
    </tr>
</tbody>
</table>
</div>
The 15 finalists in the Component Design and Development Competitions, representing 8 countries are: 
<div align="center" style="margin: 20px">
<table cellpadding="0" cellspacing="0" class="stat" width="450">
<tbody>
    <tr>
        <td class="header" width="225">Design Competitors</td>
        <td class="header" width="225">Development Competitors</td>
    </tr>
    <tr class="light">
        <td class="value">Yiqiang Mao, China</strong></td>
        <td class="value">Ninghai Huang, China</td>
    </tr>
    <tr class="light">
        <td class="value">Nikolay Archak, Russian Federation</strong></td>
        <td class="value">Nathan Kuchta, USA</td>
    </tr>
    <tr class="light">
        <td class="value">Marijn Kruisselbrink, Netherlands</strong></td>
        <td class="value">Jian Qiang Zheng, China</td>
    </tr>
    <tr class="light">
        <td class="value">Patrick Coleman, Australia</strong></td>
        <td class="value">Tianpeng Jin, China</td>
    </tr>
    <tr class="light">
        <td class="value">Hubert Hwang, USA</strong></td>
        <td class="value">Wenbin Dai, China</td>
    </tr>
    <tr class="light">
        <td class="value">Radu Ioanitescu, Romania</strong></td>
        <td class="value">Keren Dong, China</td>
    </tr>
    <tr class="light">
        <td class="value">Rostyslav Slipetskyy, Ukraine</strong></td>
        <td class="value">Ronghui Zhu, China</td>
    </tr>
    <tr class="light">
        <td class="value">Filip Sieczkowski, Poland</strong></td>
        <td class="value">&#160;</td>
    </tr>
</tbody>
</table>
</div>

More than 3,300 students from around the world began competing in qualifying rounds of the TCCC06 in August. Through a series of online rounds, this field has been narrowed down to 63 final competitors comprised of 48 Algorithm and 15 Component competitors. These finalists will now compete in face-to-face competition at the San Diego Marriot in California on November 17th to determine the winners of all competitions. 
<br><br>
<span class="bodySubtitle">About TopCoder, Inc.</span><br>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit <A href="/">http://www.topcoder.com/</A>.
<br><br>
TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.
</p>
                                                
                        <p>###</p>
                        <p><br /></p>
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
