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
						<div align="center"><IMG SRC="/i/pressroom/mdj.jpg" ALT="" border="0"/></div><BR/>
						<p><span class="bodyTitle">Georgia Tech computer science major to compete in TopCoder Collegiate Challenge tournament</span></p>
                        </div>
<p>
04/06/02<BR/>
By Michelle Graff<BR/>
Marietta Daily Journal Staff Writer</P>
<P>POWDER SPRINGS : Most people don't question how a computer does what it does, as long as it is working properly.</P>
<P>But that is not the case with 20-year-old Powder Springs resident Trayton Otto, who has won regional recognition for his ability to make computers work.</P>
<P>A computer science major at Georgia Tech, Otto is the southeast regional champion of computer programming and later this month will travel to the 2002 SunMicrosystems and TopCoder Collegiate Challenge in Cambridge, Mass., to compete for national recognition in the field of computer coding and a $100,000 cash prize.</P>
<P>The challenge pits Otto against 16 of the country's best college computer programmers to solve a series of three coding problems in Java or C++ computer languages in 75 minutes or less.</P>
<P>Whoever completes the problems correctly and with the fastest time will be declared the winner, and garner the honor of being TopCoder's top coder in the country.</P>
<P>Founded in Nov. 2000 by software consultant Jack Hughes, TopCoder Inc. organizes and hosts online and onsite programming competitions for its membership base, which includes over 6,000 college students as well as professionals.</P>
<P>And although he proved himself as the best in the Southeast, Otto said he is expecting stiff competition in Massachusetts.</P>
<P>"I don't believe I get any reward for happening to win that particular round," he said of his regional victory. "I believe I am one of the lowest rated coders of the 16."</P>
<P>TopCoder generates ratings by comparing computer programmers from different competitions across the board based on accuracy, speed and the difficulty level of the problems they have solved.</P>
<P>For Otto, his alliance with TopCoder began with his first competition in April 2001, after a flyer on the Georgia Tech campus advertising the company caught his eye.</P>
<P>"Academic competition was always something I enjoyed," said Otto, who was a member of the math team at his alma mater, McEachern High School. "Being able to program competitively was something I was glad to find and something I was very glad to participate in."</P>
<P>He said if he wins the money, he will invest it into a savings or another type of account, recognizing that the full $100,000 will not be coming his way.</P>
<P>"Quite a bit of that will disappear due to taxes, but that's inevitable," he said.</P>
<P>A resident of Powder Springs since 1991, Otto said computers have been a part of his life since he was a toddler.</P>
<P>"I've had a computer in my house ever since I was two years old," he said.</P>
<P>Otto's first computer was a Commodore 64.</P>
<P>What intrigued him about the machine was not the games you could play on it, but how the computer worked to put the games on the screen.</P>
<P>He wrote his first computer program in high school, a blackjack game he wired into his TI83 graphing calculator.</P>
<P>"I really consider that to be my first program," he said.</P>
<P>Now a college sophomore, Otto lives on campus at Tech but returns to Powder Springs to visit his parents and sister Ariel, a junior at McEachern, on the weekends, and holds a part-time job developing applications at the ISX Corporation in Marietta.</P>
<P>After he graduates, he said he wants to get a job as a software developer.</P>
<P>In his spare time, Otto said he enjoys sports, including those teams from his native St. Louis, playing cards and surfing the Internet on occasion.</P>
<P>"Every once in a while, I catch myself looking up [on the Internet] stuff about obscure sports," he said. "I find myself being entertained by things other people would not be interested in."</P>
<br>
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
