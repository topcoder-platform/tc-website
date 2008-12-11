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
						<div align="center"><IMG SRC="/i/pressroom/techrepublic.gif" ALT="" border="0"/></div><BR/>
						<p><span class="bodyTitle">Test your mettle at TopCoder.com</span><BR/></p>
                        </div>
						Jun 26, 2001<BR/>
						Lamont Adams<BR/>
						Copyright 2001 TechRepublic, Inc. <BR/><BR/>
						You may have heard of TopCoder by virtue of its recently concluded college programming competition, which netted the winner, an MIT student, a cool $100,000 prize. But college competitions aren't the only thing at TopCoder. The site also sponsors regular programming "tournaments" that registered members can compete in for real cash prizes.<BR/><BR/>
						Are you ready to rumble?<BR/>
						At any given time, there are several programming competitions, or tournaments, taking place on TopCoder. The tournaments may involve hundreds of contestants broken into small groups or "rooms" and consist of multiple coding rounds. In each round, participants must write Java code that solves a particular set of algorithmic problems and then subject their solutions to review by other competitors and system testing by TopCoder's tournament server.<BR/><BR/>
						Each coding round is timed. Coders have about one hour to solve three programming problems of varying degrees of difficulty: one easy, one medium, and one hard. Participants are awarded points for each completed problem based on the proportion of the round's time they spent on the problem. Of course, difficult problems are worth more points than easy problems but take more time to complete.<BR/><BR/>
						Each problem specifies a method declaration, what the code is supposed to accomplish, the conditions that will be met before a call to the participant's code is made, and a set of test cases. These are not simple business problems by any means, being more akin to the brainteaser algorithm problems programming professors like to throw at their students. (Remember the Towers of Hanoi?) As an example, one of the medium difficulty problems I saw when I visited the TopCoder site involved creating an algorithm to trace from top to bottom through a triangle-shaped matrix of numbers and find the path that would result in the highest total if all numbers in the path were added together.<BR/><BR/>
						Participants enter their code into an editor provided by TopCoder's competition applet. The editor window contains a clock that counts down the time remaining in the round, making for some tense moments when the clock nears zero and you still have a few lines to write. The applet also provides a compiler, lets you run your code, and has simple search/replace functionality, but that's about it. No online help, no syntax prompting; you are on your own. To advance from the coding phase, you must submit compilable code for at least one problem.<BR/><BR/>
						Withstanding the challenge<BR/>
						At the end of the timed coding phase, contestants move on to the challenge phase, where other coders review their code for potential logic problems. If a contestant sees a problem with another contestant's code, he or she may challenge it by supplying a set of input parameters that will break it. The TopCoder server then tests the challenged code with the challenger's parameters. The challenger is awarded bonus points and the challenged coder loses points if the code breaks or produces an invalid result. An unsuccessful challenge results in a point loss for the challenger.<BR/><BR/>
						In the final phase in a round, system testing, the TopCoder server tests each contestant's code with a predefined number of test cases. Any code that generates an incorrect result is disqualified, and its author receives no points for that submission.<BR/><BR/>
						The competitors with the highest scores from each tournament room may continue onto the next round with a new set of problems to solve. The advancement process varies with the tournament, but the winner is the coder with the highest point total at the end of the tournament. The top three scorers usually receive cash prizes, so there's definitely an incentive, beyond simple pride, to compete.<BR/><BR/>
						So where's the catch?<BR/>
						TopCoder is free to join and doesn't charge entry fees for the various tournaments. Its stated mission is to increase the perceived value of programmers by providing an objective rating system for them. Evidently, the company hopes to make money from contest sponsors and by providing the profiles and contest ratings of its members to subscriber companies that are looking for new development talent.<BR/><BR/>
						Indeed, if you've ever set up a profile on an online job service before, registering on TopCoder will seem very familiar: Rate yourself on these skills, what's your educational background, will you relocate, and so on. Fortunately, TopCoder comes out and asks whether you're looking for work instead of automatically assuming that you are. So you're free to join and compete in a few tournaments, or just look around, without inciting hordes of recruiters to descend upon you.<BR/><BR/>
						There's no word yet on whether this rather novel recruiting system works. TopCoder just launched in March and doesn't plan to have the subscriber/sponsor side of the site live until the end of June. Of course, even if it doesn't really land anyone a job, TopCoder offers an interesting diversion and a chance to hone your Java skills, and it provides some value simply by feeding the competitive urges of the propeller-head in us all.<BR/><BR/>
						Tell us what you think<BR/>
						Do you think programming competitions are useful? Are they an accurate way of comparing several programmers' skill levels? Send the editors an e-mail or post to the discussion with your thoughts.<BR/><BR/>
						Copyright 1999-2001 TechRepublic, Inc.<BR/>
						Visit us at http://www.techrepublic.com/<BR/><BR/>
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
