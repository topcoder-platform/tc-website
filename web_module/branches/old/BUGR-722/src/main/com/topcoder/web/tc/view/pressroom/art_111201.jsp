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
						<p><span class="bodyTitle">Chips &amp; Drivers: It's a digital shootout at Java corral<br>as programmers vie for coding title</span></p>
                        </div>
						11/12/2001 08:29 AM <BR/>
						By Matthew French<BR/><BR/>
						At first, it was much like watching a chess tournament. The room was dead quiet. Enthusiasts commented in hushed whispers on each move. Everyone was asking the same question: Who is the TopCoder in all the land?<BR/><BR/>
						Glastonbury, Conn.-based TopCoder Inc. this weekend held its first Invitational Programming Tournament, bringing together the best of the best, the strongest of the strong, and the quickest of the quick . . . code slingers.<BR/><BR/>
						The tournament actually had a much larger following than I had anticipated. About 75 people gathered to watch the four finalists - none of whom were from New England - duke it out, as it were, by writing the best code. Three MIT students - two undergraduates and one grad student - did make it to the final field of 16 contestants, winning several thousand dollars for their trouble.<BR/><BR/>
						The format of the tournament was much like March Madness, where a large field is narrowed down to a Final Four. But instead of having a championship face-off between two coders, all four competed against one another for a purse of $250,000, with the grand prize of $100,000.<BR/><BR/>
						Each participant had an hour and 20 minutes to solve three problems, coding in either Java or C++. The participants were broken down into groups of four, with each vying against the others in his group.<BR/><BR/>
						At the end of the coding time came the challenge phase, where the coders examined the work of their three fellow participants, trying to find errors to gain points.<BR/><BR/>
						And the crowd loved it. Those gathered, mostly friends and family of the four participants, were really into the event, following each player's move in real time on one of several flat screens TopCoder had set up. <BR/><BR/>
						I wouldn't venture so far as to call it the Geek Olympics, but these guys knew a little too much about code. One of the questions asked in the biography section of each participant was "How old were you when you wrote your first piece of code?"<BR/><BR/>
						The most common answer among the 16 participants was six.<BR/><BR/>
						In the finals, held Saturday afternoon at Foxwoods Resort and Casino, two college juniors, one recent college grad and a 27-year-old professional programmer vied for the top prize. The 27-year-old, Nathan Bronson, was the heavy favorite, having many years of experience under his belt. And it looked as if Bronson would emerge victorious after the coding round.<BR/><BR/>
						But then, much like in last week's magical Game 7 of the World Series, the underdog snatched the victory, discovering a flaw in his opponent's code that cost the favorite all points for that problem.<BR/><BR/>
						In the end, the winner was Jon McAlister, a young Texan in his third year of college at Stanford University. Looking very much the part of a code writer, he accepted his check for $100,000 while his parents beamed proudly.<BR/><BR/>
						As this was the first year of the tournament, TopCoder, a programmer development organization, promoted and sponsored the event out of its own coffers.<BR/><BR/>
						The popularity of the event, as well as the proficiency of the invitees (all part of TopCoder's member base), has already led to a major systems manufacturer signing on as the exclusive sponsor of next year's event.<BR/><BR/>
						The collegiate tournament will be held in the spring at MIT and the Invitational toward the end of the year. If you think you've got what it takes to code with the best, try your luck.<BR/><BR/>
						If you didn't start writing BASIC code while in nursery school, stick to the amateur stuff. These guys are probably out of your league.<BR/><BR/>
						Matthew French reports on software and hardware. He can be reached at mfrench@masshightech.com.<BR/><BR/>
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
