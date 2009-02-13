<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

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
                        <div align="center">
						<div align="center"><IMG SRC="/i/pressroom/cdssmall2.gif" ALT="" border="0"/></div><BR/>
						<p><span class="bodyTitle">Grad Student Emerges at TopCoder '01</span><BR/>
						<em>Yotov vied last week among world's best programmers</em></p>
                        </div>
						Tuesday, November 6, 2001<BR/>
						By Krishna Raghavan<BR/><BR/>
						Kamen Yotov grad has just returned from the final round of the TopCoder 2001 Invitational Programming Contest with a prize of $250,000. Yotov defeated 4,300 of the world's leading 
						computer programmers to earn the lucrative invitation to the competition.<BR/><BR/>
						"The TopCoder Invitational Programming Tournament is a fiercely competitive, long-lasting endeavor. We're excited to have Cornell's Kamen Yotov in the final elite sixteen," said Rob 
						Hughes, President/COO of TopCoder.<BR/><BR/>
						Yotov's foray into the TopCoder contest came quite by chance.<BR/><BR/>
						"I saw a poster on the third floor bulletin board in Upson Hall advertising the contest," he said.<BR/><BR/>
						The contest sparked Yotov's interest for a variety of reasons.<BR/><BR/>
						"I think everybody who likes programming should try this contest. You meet other bright people, most of whom are students right now," he said.<BR/><BR/>
						"Apart from the fun, you get the money," he added.<BR/><BR/>
						Yotov set to work immediately in the online elimination rounds, which occurred in late September. The TopCoder contest tests a programmer's speed and ability to write high-quality 
						code under intense time pressure and competition.<BR/><BR/>
						His agile, accurate programming skill and ability to find holes in others' code enabled him to advance to the final round, which occurred on Friday and Saturday at the Foxwoods Resort 
						Casino in Mashantucket, CT.<BR/><BR/>
						In the final round last week, Yotov found himself surrounded in intense competition but was still able to benefit financially from the contest. He hopes to participate in the next TopCoder 
						tournament, taking place in April 2002, despite the tough competition of the final rounds.<BR/><BR/>
						"The final round was different from what I had expected -- much different from the other rounds. I will definitely do it again, and encourage other Cornell students to do so," he said. "You 
						can't lose anything by trying."<BR/><BR/>
						A native of Bulgaria, Yotov began writing code at the age of seven and has been testing digital boundaries since then.<BR/><BR/>
						"While programming, you can do whatever you want without worrying about whether you need any external materials or anything else," Yotov said.<BR/><BR/>
						Before arriving at Cornell, Yotov designed a home delivery system for Kentucky Fried Chicken Bulgaria and also worked with the country's nuclear power industry. His main area of interest 
						in computer science is compilers, programs that translate code into machine language so that the program can be executed. Eventually, Yotov aspires to found his own coding business as 
						a chief of research and design. <BR/><BR/>
						Copyright (c) 2001 by The Cornell Daily Sun, Inc. <BR/>
						All rights reserved.<BR/><BR/>
<p><br></p>
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
