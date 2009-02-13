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
						<p><span class="bodyTitle">TopCoder Inc. offers challenge to top programmers</span><BR/></p>
                        </div>
						09/04/2001 08:05 AM<BR/>
						By Matthew French<BR/><BR/>
						Think you've got the right stuff to be named the top coder in all the land? A Connecticut company would like you to step up to the plate and give it a shot, and will be giving away a quarter million dollars in prize money.<BR/><BR/>
						TopCoder Inc. of Glastonbury, a company that hosts regular online-programming competitions, announced recently its first annual Invitational Programming Tournament, which starts later this month.<BR/><BR/>
						"The object of this was simple: We want to attract the top developers out there," said Jack Hughes, the founder and chief executive of TopCoder. "We need a benchmark for assessing talent and we think this could be it. We are hoping that finding the top programmers like this will benefit recruiters and companies who are looking for that elite 1 percent. But there were two major factors driving this: To drive up our membership numbers, and to increase the awareness not only of TopCoder, but the talent that is out there."<BR/><BR/>
						TopCoder hosts a twice-weekly online-programming competition that is open to anybody who registers. From that core list of participants, the company determined who the top 256 are and have invited them to participate in the tournament.<BR/><BR/>
						"Each member registers with information such as professional experience and education, just to give us a feel for who they are and what they can do," said Hughes. "They pick a handle and are referred to by that throughout. They will remain as anonymous as possible. The invitations we have sent out to this are based on an internal rating system of our existing members."<BR/><BR/>
						The actual competition is a cutthroat affair, where each of the contestants is given the opportunity to find the flaws in their fellow competitors' lines of code. The contestants will be divided up into 32 rooms of eight programmers each. They will be given three real-world type problems for which they are to write the code to solve. Points are awarded to those who finish first. At the end of an allotted period of time, the competitors are then given time to look at their opponent's solutions and challenge them. <BR/><BR/>
						If a competitor challenges and is correct, the author of the code loses all points for that code. If the challenge is proven incorrect, the challenger loses points.<BR/><BR/>
						All programmers must write their code in either Java or C++.<BR/><BR/>
						After the first round is over, the top code writer from each room and 32 "wild card" selections make it to the second round, where the problems get more difficult. Much like the NCAA March Madness bracket, individuals are eliminated until only 16 remain. Those 16 will be invited to the on-site finals at Foxwoods Resort and Casino in Connecticut.<BR/><BR/>
						"We had a collegiate challenge in June and will have another invite-only competition next year," Hughes said. "Our member base has grown so much we're even considering about having regional divisions."<BR/><BR/>
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
