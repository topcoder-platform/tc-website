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
						<p><span class="bodyTitle">TopCoders return rich, triumphant</span></p>
                        </div>
						Carolyn Liu<BR/>
						Editorial Staff<BR/><BR/>
						Juniors Jon McAlister and Daniel Wright walked away from Foxwoods Hotel and Casino in Mashantucket, Conn., with $125,000 in their collective pockets Saturday - but it wasn't because they hit a brilliant lucky streak at the roulette wheel or scored the jackpot on the slot machines.<BR/><BR/>
						It was because they had successfully TopCoded.<BR/><BR/>
						The TopCoder Invitational, a computer-programming competition sponsored by TopCoder, Inc., began Sept. 25 with 256 contestants programming in online competitions, according to Adam Loss, TopCoder's director of public relations.<BR/><BR/>
						After several elimination rounds, 16 finalists were flown from across the nation to Foxwoods for the finals, held Nov. 2 and 3.<BR/><BR/>
						McAlister, who was seeded second, won the grand prize of $100,000 and Wright, seeded first, placed second and won $25,000.<BR/><BR/>
						The competition was based on speed and accuracy and included a "Challenge Phase," during which contestants can examine and challenge their opponents' code.<BR/><BR/>
						The "Challenge Phase" was especially critical to the outcome of the invitational, Loss said.<BR/><BR/>
						"During the Challenge Phase, Jon challenged the person in second place's 1000-point code, and he succeeded," he continued.<BR/><BR/>
						"That person lost 627.83 points and dropped to third. Meanwhile the person in fourth challenged Daniel's 250-point code and succeeded. Daniel lost 225.97 points, fell to second, and Jon took the lead and the win," he said.<BR/><BR/>
						"I took more risks in the finals, not thinking everything through because it was quicker to code the first thing that came to mind than to carefully check that it solved the problem first," Wright said.<BR/><BR/>
						McAlister said he actually did have some bugs of his own.<BR/><BR/>
						"In the semi-final round, I was really lucky," he said. "On the third question, the problem that I thought I was solving was not the problem that they were asking. Moreover, I made a typo in my solution," he continued. "However, as luck would have it, these two seemingly independent errors cancelled each other out, so I advanced to the finals."<BR/><BR/>
						McAlister said the "competition was pretty intense."<BR/><BR/>
						"There was an actual audience and the competitors were right next to you," he said. "Also, there were photographers there the whole time."<BR/><BR/>
						Following the competition, Wright and McAlister underwent a round of media interviews and sat down to an awards dinner.<BR/><BR/>
						"There were several interviews [and] many photo sessions," Wright said. "We had the awards dinner that night, and another photo session."<BR/><BR/>
						Wright and McAlister are quickly becoming veteran TopCoders, having both won prize money from the Collegiate Challenge, last year's TopCoder tournament.<BR/><BR/>
						While neither winners have made definitive plans for this year's prize money, McAlister joked that he was "planning on buying a golden couch, but I don't think that the Kimball floor would be able to support the weight. Also, I was told that it would be pretty uncomfortable."<BR/><BR/>
						"So instead, I'm going to get an electric or hybrid car," he continued.<BR/><BR/>
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
