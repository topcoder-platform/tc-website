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
						<div align="center"><IMG SRC="/i/pressroom/mhtlogo.gif" ALT="" border="0"/></div><BR/>
						<p><span class="bodyTitle">Code warrior hits big time</span><BR/></p>
                        </div>
						6/18/2001<BR/>
						By Jeff Miller<BR/><BR/>
						Jason Woolever is $100,000 richer thanks to his coding ability.<BR/><BR/>
						It's not a monster signing bonus. The recent MIT computer science graduate student came out on top in the first-ever programming competition put on by a Glastonbury, Conn. startup called TopCoder Inc.<BR/><BR/>
						The TopCoder Collegiate Challenge initially took place online over several months. About 130 college students participated. Earlier this month, the 16 finalists converged on San Francisco to compete in-person for a $250,000 total purse.<BR/><BR/>
						The finals consisted of five rounds, each of which was broken down into three phases. In the first phase, contestants have a limited amount of time to complete three programming assignments, which vary in difficulty. The more difficult problems are worth more points, and the faster a contestant programs, the higher the score.<BR/><BR/>
						In the second phase, the coders peer at their opponents' code, searching for bugs. Contestants who find bugs see their scores increase; programmers with buggy code lose points they gained in the first phase.<BR/><BR/>
						Finally, in the third phase, TopCoder's system bangs away at the remaining code; if the code breaks, the contestant loses points.<BR/><BR/>
						"TopCoder emphasizes a different way of programming," Woolever said. "They focus on speed and you don't have time for comments, which aren't useful anyway, since you're going to run it right away. It's kind of the hacker philosophy."<BR/><BR/>
						Woolever, 22 and from the town of Erin in upstate New York, heard about the competition from a friend at Stanford University, who knew that Woolever had participated in other programming competitions.<BR/><BR/>
						When he heard how much money was at stake, his interest was piqued.<BR/><BR/>
						"That's a lot of money involved," Woolever said.<BR/><BR/>
						There were some tight moments when it looked as if the $100,000 prize might slip away. In the semifinals, for example, Woolever finished the most difficult, and most valuable, problem in the round with nearly an hour to spare - earning him important points for speed.<BR/><BR/>
						Afterward, however, he realized he'd left out a small, vital piece of code. His program would fail. His stomach sank.<BR/><BR/>
						"As it turned out, though, I made it up by challenging other people's code," Woolever said.<BR/><BR/>
						Woolever had worked out a system for tearing apart his opponents' programs. Previously, when he simply dove straight into the code, he discovered that he began to think like the programmer and, therefore, missed bugs.<BR/><BR/>
						"Before you look at the code," Woolever said, "if you look for specific problems, you can find them and nail them."<BR/><BR/>
						Even more impressive, Woolever's specialties are C and C++ rather than Java, the computer language used in the competition.<BR/><BR/>
						"Oh, I can get along in Java," Woolever quipped.<BR/><BR/>
						Woolever's not sure what he'll do with his money, yet. Maybe a car, maybe a downpayment on a house. Right now he's consumed with starting his new job as a senior research and development engineer at Synopsys in Sunnyvale, Calif.<BR/><BR/>
						TopCoder isn't finished with competitions. In fact, it's just getting started. <BR/><BR/>
						Individual rounds of competition take place weekly with prizes up to $300.<BR/><BR/>
						Its next large tournament, the TopCoder Invitational, will be open to college students and professionals alike. The competition will probably include both Java and C/C++.<BR/><BR/>
						Online initial rounds have already begun, although there's still room for new contestants. Finalists will compete in November in Las Vegas for a $350,000 purse, with a grand prize of $100,000.<BR/><BR/>
						"The idea of the company," said Jack Hughes, chairman of TopCoder, "is that employers are looking for high-talent entrepreneurs."<BR/><BR/>
						TopCoder plans to make money through competition sponsorships and subscriptions, through which companies can gain access to participants. There is no charge to competing programmers.<BR/><BR/>
						"It's still early," Hughes said of his angel-backed company. "There's not a lot of revenue yet, but we're growing. In March, when we started recruiting (participants) we had 20 to 30. Now, we've had 1,574 programmers registered as members for our contests."<BR/><BR/>
            </TD></TR>                                                                 
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
