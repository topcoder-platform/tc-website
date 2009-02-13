<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="../script.jsp" />
<jsp:include page="../style.jsp">
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
                        <jsp:param name="title" value="Article"/>
                    </jsp:include>

<div align="right"><tc-webtag:forumLink forumID="518118" message="Discuss this article" /></div>
                        
<div align="center">
<p><span class="bodyTitle">Russian programmer twice the best worldwide</span><br />
<span class="bodySubTitle"><em>Having won Peter Mitrichev is now the first in the TopCoder world rating</em><br />
<a target="_blank" href="<tc-webtag:linkTracking link='http://www.cnews.ru/news/top/index.shtml?2007/11/07/273856' refer='art_110807' />">[original CNews article in Russian]</a></span></p>
</div>
                        
<p><strong>The Moscow student Peter Mitirichev leaded the Algorithm Section at the world championship TopCoder-2007. He repeated his last year's success. Another Russian student Nikolai Archak from New York won in the section Applied Software Development. The guys were awarded $25 thousand each. Having won Peter Mitrichev is now the first in the TopCoder world rating.</strong></p>
<p style="height:100px; width:100px; float:left; margin:0px 10px 0px 0px; "><img src="/i/pressroom/Petr_coder2.jpg" /></p>
<p><strong>Peter Mitrichev</strong> (<tc-webtag:handle coderId="10574855" context="algorithm"/>), a student of the Faculty of Mechanics and Mathematics, Lomonosov Moscow State University, has won the Championship TopCoder Collegiate Challenge (TCCC) for the second time. This year the Championship was held in the US Orlando. 120 students out of 26 countries participated in TCCC-2007 Finals. The given championship is considered a highly prestigious individual competition of student programmers. Peter leads in the most popular section Algorithm. Such skills as solving complicated problems and writing a code resistant to cracking were estimated in the given section. The winner was awarded $25 thousand.</p>
<p>Last year Peter Mitrichev made a unique achievement having won not only TopCoder Collegiate Challenge, but TopCoder Open and Google Code Jam, thus he became the first participant, who managed to win the three largest world individual championships on spots programming at once. At TopCoder Open-2007 held in June Peter was not able to get into the semi-final, but he confirmed his skills at TopCoder Collegiate Challenge, as he was the only one of eight finalists, who solved all the proposed problems. He has been participating in programming competitions since the sixth form and has won the international programming competitions for pupils three times. Having entered Lomonosov Moscow State University Peter continued participating in competitions and became the world vice champion in programming twice (in 2003 and 2005) in championships for students being a member of two various MSU teams.</p>
<p>It should be noted, the Russian representatives have generally performed rather well at TCCC-2007: 2 of 6 semi-finalists, who entered the final, and 2 of 12 participants of the transitional competition represented Russia. Two participants from Russia and Poland, one from Holland, China, Romania and Japan participated in the final. <strong>Vitaly Valtman</strong> (<tc-webtag:handle coderId="21822659" context="algorithm"/>), a student of the Faculty of Mechanics and Mathematics at St. Petersburg State University, being the fourth (he was awarded $2500) has got into the final of the largest programming championship for the second time. Vitaly was also the fourth at TopCoder Open-2007 held in June, his results were the best among the Russian participants. While the second and third places in TCCC Algorithm section were taken by Dutch and Polish students, relatively.</p>
<p><strong>Nikolay Archak</strong> (<tc-webtag:handle coderId="293874" context="design"/>) has won the competition in Applied Software Development for the second time like Peter Mitrichev. He studies in New York University. The Chinese student won the section Software Component Development and was awarded $15 thousand. The students from Indonesia and US headed the other TopCoder 2007 sections - Studio Design &amp; Marathon Match.</p>
<p>It should be noted the Russian students were also the best at the worldwide team championship on programming, held in Tokyo. The Russians won one gold, two silver and one bronze medals. When meeting with students the first VP <strong>Dmitry Medvedev</strong> and RF Minister of Communications <strong>Leonid Reiman</strong> promised to facilitate to organizing programming competitions in Russia.</p>
                        <p><br /><br /></p>
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
