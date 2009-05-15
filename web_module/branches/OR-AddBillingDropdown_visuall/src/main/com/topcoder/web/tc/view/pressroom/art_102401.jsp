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
						<div align="center"><IMG SRC="/i/pressroom/stanforddaily.gif" ALT="" border="0"/></div><BR/>
						<p><span class="bodyTitle">TopCoders battle for top prize</span><BR/></p>
                        </div>
						Cynthia H. Cho<BR/><BR/>
						Within the next two weeks, either Jon McAlister or Daniel Wright could be $100,000 richer. McAlister and Wright, both juniors majoring in computer science, will be competing in the TopCoder Invitational Tournament, to be held Nov. 2nd and 3rd at the Foxwoods Resort &amp; Casino in Mashantucket, Conn.<BR/><BR/>
						The tournament has a grand prize of $100,000 and a total prize package of $250,000.<BR/><BR/>
						McAlister and Wright are two of the 16 finalists who have advanced to the championship rounds based on their scores from online elimination rounds. Going into these rounds, McAlister is seeded second and Wright is seeded first.<BR/><BR/>
						This is not the first appearance for either in a TopCoder tournament; last June, McAlister finished second and won $25,000 in TopCoder's Collegiate Challenge, while Wright tied for ninth and won $5,570.<BR/><BR/>
						"It is particularly noteworthy that both have been able to make to both the finals of [the Collegiate Challenge] and the current TopCoder Invitation," said Jack Hughes, the founder and chairman of TopCoder, Inc.<BR/><BR/>
						"The competition for the invitational has been fierce," Hughes said. "We applaud their ability to make it to the finals for a second time in a row and wish them the best of luck in the finals."<BR/><BR/>
						McAlister has been competing in computer programming tournaments since high school.<BR/><BR/>
						"My high school teacher. . . organized student teams every year for local, state and national math and programming contests, and with my interest in math and computer science, it wasn't long until our paths intersected," he said.<BR/><BR/>
						He started competing in TopCoder tournaments after he saw a flyer on a bulletin board in the Gates Computer Science Building and has continued since then.<BR/><BR/>
						McAlister said he is looking forward to the upcoming invitational.<BR/><BR/>
						"I'm excited. I get a free trip to Connecticut . . . and I have a chance to earn another year's worth of tuition at Stanford," he said.<BR/><BR/>
						"Also, I've met some other cool contestants through my participation and I hope to meet some more," he said.<BR/><BR/>
						Wright said he has been coding since early elementary school.<BR/><BR/>
						"I've liked to write small programs that do cool tricks for ages - it became a hobby that ultimately led to my major because I really enjoyed doing it," he said.<BR/><BR/>
						Like McAlister, Wright has also been competing in computer programming tournaments since he was in high school.<BR/><BR/>
						"In high school, I did some math competitions, and the people I met there told me about the computer programming competitions, so I tried entering them and did well [the] first time, so I carried on," he said.<BR/><BR/>
						Even as the highest-ranked competitor going into the invitational, Wright admitted that he is a little nervous.<BR/><BR/>
						"There is a large element of randomness in each contest, so while I've done quite well recently in other TopCoder [competitions], there's a very high chance that I'll have a bad day at this tournament," he said.<BR/><BR/>
						While Wright may be nervous about this tournament, both he and McAlister are the heavy favorites.<BR/><BR/>
						"Based on their performance in the Collegiate Challenge and their success [thus far] in the invitational, which is open to professionals as well as collegians, they are arguably two of the top programmers in the country," said Adam Loss, TopCoder's director of public relations.<BR/><BR/>
						The tournament is comprised of three parts.<BR/><BR/>
						First is the "Coding Phase," during which the competitors have 75 minutes to code a solution to three different algorithmic problems using either Java or C++.<BR/><BR/>
						This is followed by the "Challenging Phase," during which the competitors can open their opponents' coded solutions and challenge their answers.<BR/><BR/>
						The competition closes with the "System Test Phase," during which TopCoder's main computer figures out who has most successfully coded the algorithms.<BR/><BR/>
						The goal of the tournament, as well as of TopCoder, Inc., is to identify and promote the best computer programmers in the country, according to Loss.<BR/><BR/>
						"By hosting competitions, providing the forum for a national event, and awarding significant prizes, TopCoder provides a means for the most talented individuals to be recognized," he said.<BR/><BR/>
						"Our hope is that these individuals will garner the attention and praise they deserve," Loss said.<BR/><BR/>
						With the tournament only two weeks away, Wright has been competing in weekly single-round contests in preparation.<BR/><BR/>
						"I find them to be good practice, in addition to being a good source of income - each pays $300 if I'm lucky," he said.<BR/><BR/>
						McAlister, on the other hand, has a different approach.<BR/><BR/>
						"When I can, I will play the song 'Car Wash' repeatedly before [the] contest. It's a high school tradition that has worked well to calm anxiety."<BR/><BR/>
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
