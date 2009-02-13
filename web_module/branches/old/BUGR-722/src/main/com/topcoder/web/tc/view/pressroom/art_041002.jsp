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
						<div align="center"><IMG SRC="/i/pressroom/contratimes.jpg" ALT="Contra Costa Times" border="0"/></div><BR/>
						<p><span class="bodyTitle">Computer wiz takes on high on-line stakes</span></p>
                        </div>
						<P>Posted on Wed, Apr. 10, 2002<BR/>
						By Jackie Burrell<BR/>
						STAFF WRITER
						</P>
						<p>
						The garb runs more toward college sweatshirts than leather flight jackets, but the competition at TopCoder is as real as anything Tom Cruise faced at Miramar. And Top Gun's Maverick and Goose wouldn't stand a chance against Zorbat Hut or Orinda's Bigg_nate in the battle for coding supremacy.
						<br><br>
						For 12,000 young computer programmers, TopCoder.com offers a chance to test one's programming skills against some of the best and brightest. There is prestige. There is money. And down the road, there may be lucrative job offers.
						<br><br>
						TopCoder is Jack Hughes' latest nom de Web, an on-line vehicle for computer programming competition that pits hundreds of young software coders against each other in semi-weekly challenges. The real action is at MIT later this month when 16 national finalists go head-to-head for the Collegiate Challenge championship and $125,000 in prize money.
						<br><br>
						It's a tantalizing proposition for Miramonte graduate Nate Paymer, a math and computer science major at Cal Tech. Seeded sixth in the Western region, Paymer is one of those vying for the title of TopCoder.
						<br><br>
						Paymer is, in TopCoder parlance, a Cinderella : a star who appeared out of nowhere last fall.
						<br><br>
						With a computer programmer father and math teacher mother, Paymer was probably genetically destined for math wizardry. At Miramonte, he blended academics with sports and music, but it wasn't until the jazz drummer hit Cal Tech that his interest in computer science surfaced. On a lark, Paymer entered his first TopCoder match last November. And the rest has been as easy as, well, pi.
						<br><br>
						Those semi-weekly matches consist of solving three programming problems, ranging in difficulty. Puzzles might involve sending gladiators through a maze or reversing a series of randomly expressed letters from upper to lower case and vice-versa, so that "AbcDeFghiJ" becomes "aBCdEfGHIj."
						<br><br>
						With a 75-minute deadline, 500 or so programmers vie to solve the puzzles by writing code in C++ or Java programming languages, and submitting the results on-line. Their program must complete the maze or flip the letters in eight seconds or less, flawlessly, and points are awarded for speed and accuracy.
						<br><br>
						"It's mostly the intellectual challenge. I really like the feeling when it works. It's satisfying," says Paymer.
						<br><br>
						In the second round, the programming solutions : the code : is tested by all the other contestants. Anyone can challenge another contestant's code, find the flaws and disqualify his opponent. Successful challenges bring additional points, faulty challenges cost points : and points are everything.
						<br><br>
						"We look at each other's code and try to break it. I think that part's really fun," says Paymer. "You're trying to understand code you've never seen before. There are many different ways to solve a problem and some people try a completely new or different approach."
						<br><br>
						For the players, it's not just the beauty of the algorithm. There is intellectual challenge, serious prize money and future prospects. Collegiate Challenge sponsor Sun Microsystems and other high tech, TopCoder supporters are keeping an eye on this next generation of programmers, and Hughes calls these 16 finalists "the future leaders of software development and the technology industry."
						<br><br>
						Paymer left the novice ranks behind many months ago. Now, the Cal Tech junior eyes next week's finals with just a hint of trepidation, despite his designation as "one of the most impressive coders in the 2002 Collegiate Challenge," according to the Web site.
						<br><br>
						One star will emerge from the big challenge next week, garnering hoopla and prize money. Then the cycle begins again. Another match, another puzzle, and yet more high tech pi in the sky.
						<br><br>
						------------------------------------------------------------------------
						<BR/>
						&copy; 2001 cctimes and wire service sources. All Rights Reserved.<BR/>
						<A href="http://www.bayarea.com">http://www.bayarea.com</A>
						<br><br>
						</p>
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
