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
						<div align="center"><IMG SRC="/i/pressroom/paperflag.gif" ALT="" border="0"/></div><BR/>
						<p><span class="bodyTitle">In Depth: High tech survivors</span></p>
                        </div>
						From the November 9, 2001 print edition<BR/>
						Close up on Eric Ellingson<BR/>
						Mark Reilly, Senior Reporter<BR/><BR/>
						Many technology workers claim to be top-notch programmers. Fewer have the winning record to back up such claims.<BR/><BR/>
						Eric Ellingson does. The Prior Lake native and software developer spent last weekend in Connecticut at the national finals of the TopCoder 
						Invitational Tournament, a competition that pits techies against each other in a battle of programming chops. He was finally eliminated in the 
						semifinals, where a 16-person field was narrowed to four, but took away $5,750 in prize money regardless.<BR/><BR/>
						To reach the national championship, Ellingson had to make his way through three preliminary rounds that weeded out the rest of a 256-person 
						field. And before that, he had to outcode hundreds of other developers in weekly online contests held by TopCoder -- a Web-based service 
						created as a way of promoting skilled technical workers and providing a professional league for competition.<BR/><BR/>
						Prior to the championship round, Ellingson had won more than $1,200 in weekly battles that he'd been competing in since May.<BR/><BR/>
						The competitions, begun when TopCoder launched in February, present participating developers with a set of programming challenges that they 
						have to solve within an hour. Contestants are then judged based on their solution's results and on how quickly they were able to finish.<BR/><BR/>
						A particular problem, Ellingson said, might ask a contestant to develop a program to rotate and spin a text message, inputed by a user, and 
						test to see if it remains the same word. A correct program would be able to tell that if you flip "BEE" upside down, for example, it's still 
						"BEE."<BR/><BR/>
						After the coding phase of the contest, there's the challenge phase. "You get the chance to look at other people's solutions and try and break 
						them" by looking for design flaws, Ellingson said. "If you can find mistakes, you'll get bonuses to your own points."<BR/><BR/>
						Ellingson, a fan of online computer games, said he heard about the TopCoder contests from a friend. "I thought, write programs and win money 
						-- sure, I'll check it out."<BR/><BR/>
						He usually ranks in the top half of the weekly contests, which break TopCoder's thousands of subscribers into groups of eight. "The problems 
						are generally fun, and there's a chat function where you get to talk with other developers from around the country," said Ellingson.<BR/><BR/>
						He knew in advance that the finals would be harder, though. "The problems are about the same, but the people you're competing against are much 
						tougher."<BR/><BR/>
						Jack Hughes, TopCoder's chairman, echoed that assessment. "The competition among these ... developers has become palpable," he said in a 
						statement.<BR/><BR/>
						Ellingson said he's been interested in computing since the fifth grade -- though he remembers being introduced to a very bare-bones computer 
						in a third-grade class.<BR/><BR/>
						"The thing didn't even have a screen; there was just a keyboard-connected computer someplace, and it printed out what you typed on paper," he 
						said.<BR/><BR/>
						He's worked at Actual Software for about five years, specializing in emergency notification services for telephone equipment.<BR/><BR/>
						Despite the arcane problems used in the TopCoder contests, Ellingson said the regular, fast-paced tests have helped him in his everyday job, 
						as well.<BR/><BR/>
						"In some ways I've been surprised at the amount of stuff I've picked up," he said. "When you're looking for the answer to the problems, you 
						have to find the quickest, most efficient way of doing common, repetitive tasks -- which helps you in just about all areas."<BR/><BR/>
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
