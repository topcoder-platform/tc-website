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
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
         <td width="100%" align="center">


            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                    <jsp:include page="../page_title.jsp" >
                        <jsp:param name="image" value="press_room"/>
                        <jsp:param name="title" value="Press Release"/>
                    </jsp:include>
                    
<div align="right"><tc-webtag:forumLink forumID="520017" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">World's Elite High School Programmers to Compete in Live TopCoder High School Tournament</span><br />
<span class="bodySubTitle"><em>49 Students Earn Tournament Berth after Months of Online Competition - Finalists to be Flown to<br />Purdue University for Live Finals March 15</em></span></p>
</div>
      
<p>
<strong>GLASTONBURY, CONN., February 28, 2008 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced the 49 finalists from around the world who have earned a spot in the TopCoder High School Tournament finals (finalist names and countries below). The TopCoder High School Tournament is the premier computer programming tournament for high school-aged math and science students, ages 13 to 18, enrolled in secondary schools or equivalent programs world-wide. Competition began online in December 2007, challenging math and computer science students to demonstrate their problem-solving skills by unraveling complex word problems by writing computer programs that solve the problems. TopCoder's tournament finals will bring together 49 of the most talented high school programmers from 16 countries, in quest of bragging rights, scholarships and cash prizes worth more than $50,000.
</p>

<p>
"The competitive technical nature of today's world makes it more important than ever to encourage, reward and recognize those who possess the skills to shape tomorrow's software innovations," said Marybeth Luce, vice president of Operations at TopCoder. "TopCoder's High School and College tournaments provide students from around the world with a fun and competitive learning environment to build and showcase their talent, and see how they rate compared to other top technical minds of their generation."
</p>

<p>
TopCoder High School Tournament participants are provided problems and challenges similar to those that are used in actual TopCoder competitions to build real software for many of the world's most recognized brands, such as AOL, ESPN and VeriSign. This provides an unprecedented real-world learning environment that introduces high school students to algorithm, design and development practices. The TopCoder competitions cultivate software design and development skills that are in the highest demand, showcasing individuals for college admissions and job recruitment by top employers like Eli Lilly, Deutsche Bank and the U.S. National Security Agency.
</p>

<p>
The 2008 TopCoder High School Tournament, an annual competition, will take place on March 15, 2008 at the Lawson Building on the campus of Purdue University in West Lafayette, IN, USA. More information, including a tournament program, on-site schedule and profiles of this year's finalists, visit: <a href="/tchs08">www.topcoder.com/tchs08</a> .
</p>

<table align="center" class="stat" style="width: 700px;" cellpadding="0" cellspacing="0">
    <thead>
        <tr>
            <td class="header" colspan="2">2008 TopCoder High School Tournament Finalists</td>
        </tr>
    </thead>
    <tr class="light">
        <td>Maciej Andrejczuk (Bialystok, Poland)</td>
        <td>Spencer Liang (Cupertino, CA, United States)</td>
    </tr>
    <tr class="dark">
        <td>Marcin Andrychowicz (Gr&oacute;jec, Poland)</td>
        <td>Sergey Melnikov (Vologda, Russian Federation)</td>
    </tr>
    <tr class="light">
        <td>Filip Barl (Zagreb, Croatia)</td>
        <td>Miroslaw Michalski (Gdynia, Poland)</td>
    </tr>
    <tr class="dark">
        <td>Mikita Belahlazau (Minsk, Belarus)</td>
        <td>Florian Moga (Sacele, Romania)</td>
    </tr>
    <tr class="light">
        <td>Anton Bogatyy (Moscow, Russian Federation)</td>
        <td>Leo Osvald (Zagreb, Croatia)</td>
    </tr>
    <tr class="dark">
        <td>Miroslav Bogdanovic (Beograd, Serbia)</td>
        <td>Filip Pavetic (Kriz , Croatia)</td>
    </tr>
    <tr class="light">
        <td>Wenyu Cao (Belle Mead, NJ, United States)</td>
        <td>Bruno Rahle (Zagreb, Croatia)</td>
    </tr>
    <tr class="dark">
        <td>Alexey Cherepanov (Stavropol, Russian Federation)</td>
        <td>Marek Rogala (Gdansk, Poland)</td>
    </tr>
    <tr class="light">
        <td>Ziheng Deng (Zhongshan City, China)</td>
        <td>Vidya Sagar (Chennai, India)</td>
    </tr>
    <tr class="dark">
        <td>Ivaylo Enchev (Shumen, Bulgaria)</td>
        <td>Hayk Saribekyan (Yerevan, Armenia)</td>
    </tr>
    <tr class="light">
        <td>Valentin Fondaratov (St. Petersburg, Russian Federation)</td>
        <td>Jonathan Schneider (Toronto, Canada)</td>
    </tr>
    <tr class="dark">
        <td>Yan Gu (Zhongshan, Guangdong, China)</td>
        <td>Sergey Serebryakov (Petrozavodsk, Russian Federation)</td>
    </tr>
    <tr class="light">
        <td>Prashanth Guru (Scarborogh, Canada)</td>
        <td>Marcel Stockli Contreras (Guanajuato, Mexico)</td>
    </tr>
    <tr class="dark">
        <td>Sibo He (Zhongshan, China)</td>
        <td>Szilveszter Szebeni (Buda&ouml;rs, Hungary)</td>
    </tr>
    <tr class="light">
        <td>Rumen Hristov (Shumen, Bulgaria)</td>
        <td>Momchil Tomov (Pleven, Bulgaria)</td>
    </tr>
    <tr class="dark">
        <td>Petar Ivanov (Shumen, Bulgaria)</td>
        <td>Timur Valiev (Kazan, Russian Federation)</td>
    </tr>
    <tr class="light">
        <td>Igor Jerkovic (Zagreb, Croatia)</td>
        <td>Levan Varamashvili (Tbilisi, Georgia)</td>
    </tr>
    <tr class="dark">
        <td>Adam Karczmarz (Stalowa Wola, Poland)</td>
        <td>Hanson Wang (Toronto, Canada)</td>
    </tr>
    <tr class="light">
        <td>Michal Karpinski (Jaslo, Poland)</td>
        <td>Ye Wang (Wuhu, China)</td>
    </tr>
    <tr class="dark">
        <td>Ivica Kicic (Zagreb, Croatia)</td>
        <td>Nathan Watson (Lubbock, TX, United States)</td>
    </tr>
    <tr class="light">
        <td>Maciej Klimek (Gorz&oacute;w Wielkopolski, Poland)</td>
        <td>Neal Wu (Baton Rouge, LA, United States)</td>
    </tr>
    <tr class="dark">
        <td>Pawel Klimek (Radom, Poland)</td>
        <td>Yi Yang (Wuhu, China)</td>
    </tr>
    <tr class="light">
        <td>Frane Kurtovic (Zagreb, Croatia)</td>
        <td>Arman Yessenamanov (Ekibastuz, Kazakhstan)</td>
    </tr>
    <tr class="dark">
        <td>Nikolay Kuznetsov (Saratov, Russian Federation)</td>
        <td>Dong Zhou (Wuhu, China)</td>
    </tr>
    <tr class="light">
        <td>&nbsp;</td>
        <td>Goran Zuzic (Zagreb, Croatia)</td>
    </tr>
</table>

<p>
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the world's largest competitive software development community with over 140,000 developers representing more than 200 countries.  TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available.   The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology.   This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development.  TopCoder makes this large library of software components built through competition available to all of our clients.  Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about utilizing TopCoder's software services or sponsoring TopCoder events, visit <a href="/">http://www.topcoder.com/</a>.
</p>
<p>
TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.
</p>
                        <p>###</p>
                        <p><br /></p>
                    </td>
                </tr>
            </table>
        </td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
