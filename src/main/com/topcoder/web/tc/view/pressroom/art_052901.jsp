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
						<div align="center"><IMG SRC="/i/pressroom/pcmag_logo.gif" ALT="" border="0"/></div><BR/>
						<p><span class="bodyTitle">You Are the Fastest Coder</span><BR/></p>
                        </div>
						By Mary E. Behr, PC Magazine<BR/>
						May 29, 2001 1:58 PM PT<BR/><BR/>
						There will be no eating of rats, no futuristic sets with roving spotlights, and no one snapping, "You are the weakest link." When 16 finalists enter the San Francisco Hilton ballroom on June 6 to compete in the final rounds of TopCoder.com's first contest, the Collegiate Challenge, they will face only computers and the clock.<BR/><BR/>
						These 16 contenders from top schools such as Harvard, MIT, Rensselaer, Stanford, and the University of Michigan will compete for the fun, the chance of catching an employer's eye, and the $100,000 purse. The sponsor, TopCoder.com, is a Web site created for the programming community for exactly those reasons. And they must be good reasons: In the barely four months the site has been up, TopCoder has amassed 1,200 members.<BR/><BR/>
						Survival of the Fittest<BR/>
						Founder Jack Hughes got the idea for the site from his experiences in the business world. For 15 years, he ran a technical consulting firm where one of his biggest problems was identifying top programming talent. So he decided his next job would be creating a Web site to help locate excellent coders. "In society, we identify talent through competition. That idea was the basis for this site," he says.<BR/><BR/>
						A parallel goal of the site is to help programmers get jobs. That's why each player has a ranking. Hughes is lining up corporate sponsors for the tournaments and hoping that the relationships will lead to jobs for the members.<BR/><BR/>
						College Round<BR/>
						Enthusiasm for the Collegiate Challenge was drummed up the old-fashioned way: by hanging posters at universities with good computer science programs. Participants must be members of TopCoder who have downloaded the distributed applet and qualified through online rounds.<BR/><BR/>
						The online competition has three phases. The first requires writing code for three questions of varying degrees of difficulty. This typically takes an hour and a half to two hours. In the second phase, the Challenge Phase, competitors challenge each other's code for errors. The challengers had better be right, or they lose points. During the third phase, called System Test, TopCoder's system tests players' code for accuracy.<BR/><BR/>
						The Collegiate Challenge will operate in much the same way; the only difference is that it will be in person. Players will face each other in groups of four and individually solve the three problems. The winners of those rounds will meet in the final contest to determine the winner. Andrew Nierman, a 27-year-old computer science Ph.D. student at the University of Michigan, is one of the 16 finalists. He's in it for the cash. "My main motivator is the money. But it's fun, too."<BR/><BR/>
						Nierman has a special challenge: One of his good friends is also in the final 16. Is Andrew confident that he will win? "Well, it's going to be pretty tough. There's going to have to be a little luck involved. It's a high-powered group of people."<BR/><BR/>
						Speed Freak<BR/>
						What makes one person's code better than another's? Speed. "The people who can look at simple problems, pick them apart, and solve them quickly are generally the people who can solve the tougher problems as well," says Nierman.<BR/><BR/>
						Hughes says there are plans to add other measures to determine winners. "Right now we're testing three things: accuracy, ability to recognize flaws in someone else's code, and speed. But we're in the process of adding two new metrics: efficiency of code-how fast it runs; and resource usage-how much memory and disk space it uses."<BR/><BR/>
						The next meet, the Invitational, will feature 256 top coders. Held in Las Vegas in November, it will be open to both professionals and college kids, with 128 seeded seats and 128 open seats. The qualifying rounds are taking place now at http://www.topcoder.com.<BR/><BR/>
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
