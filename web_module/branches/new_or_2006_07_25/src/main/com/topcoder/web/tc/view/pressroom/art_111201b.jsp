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
						<div align="center"><IMG SRC="/i/pressroom/lafayetteflagnew.gif" ALT="" border="0"/></div><BR/>
						<p><span class="bodyTitle">Wright second in TopCoder event</span></p>
                        </div>
						By DOUG PIKE<BR/>
						Staff writer<BR/><BR/>
						When a friend brought a TopCoder flyer to Daniel Wright's Stanford University residence nine months ago, the 20-year-old computer science major was intrigued.<BR/><BR/>
						The organization, which conducts biweekly on-line computer programming competitions, provided the opportunity for Wright to branch out in his chosen field of study and the chance to compete with his peers across the country.<BR/><BR/>
						Saturday, Nov. 3, it also gave him a shot at $100,000.<BR/><BR/>
						Wright, whose family relocated from South Africa to Lafayette following his high school graduation in 1999, was one of four finalists in the TopCoder $250,000 Invitational tournament in Mashantucket, Conn. Saturday. The Stanford junior walked away with a second-place finish and $25,000 in his pocket for two days' work in front of a monitor.<BR/><BR/>
						"When I started competing in TopCoder, I didn't expect anything of this sort," said Wright, who competed in his first programming competition as a high school sophomore. "I was quite surprised by my success. The U.S. has quite a reputation for these kinds of things."<BR/><BR/>
						For the national invite, TopCoder, which has recruited nearly 50,000 members since its inception in February, pitted its top 256 members in the early rounds of the competition, which were contested online.<BR/><BR/>
						The first round whittled the field down to 64. Then next round dropped that number to 32, with the following round reducing the remaining hackers to an elite group of 16.<BR/><BR/>
						Wright, TopCoder's top-ranked programmer coming into the competition, easily made the final cut and was seeded sixth for the finals.<BR/><BR/>
						TopCoder flew each finalist and a guest to Connecticut's Foxwoods Resort Casino for the final two days of competition.<BR/><BR/>
						Instead of the informal on-line format, competitors waged war with their keyboards on stage in a gameshow atmosphere provided by the casino. But the event didn't exactly allow for the showmanship of the Price is Right or Wheel of Fortune.<BR/><BR/>
						"What they're given is three algorithms; 250-, 500-, and 1000-point questions in an 80-minute decoding phase," explained TopCoder representative Adam Loss. "They code solutions to the algorithms using Java or C++ (programming languages) with more points for a faster completion time."<BR/><BR/>
						At the end of the initial 80-minute period, contestants receive points for the amount of the work they were able to solve. The hard part for contestants is knowing whether or not they have completed an algorithm, and where their opponents are in the process.<BR/><BR/>
						"There are a whole bunch of things that let you know how you're doing individually, but you never know if you've completely solved the problem," Wright said. "And you don't know how your opponents have done until it's over."<BR/><BR/>
						That's where the second phase of competition comes into play.<BR/><BR/>
						In the second phase, opponents are allowed to review and compare codes with one another to look for mistakes. Correctly challenging an opponents' code results in an additional 50 points.<BR/><BR/>
						Finally, codes are sent to the main computer in a "system test phase" to check for accuracy.<BR/><BR/>
						In the finals, Wright was edged out only by fellow Stanford junior Jon McAlister. McAlister's 1,143 points barely exceeded Wright's 1,072, but both were well beyond third-place finisher Nathan Bronson who ended the day with 650. In addition to his $25,00 check for winning in the semifinal round, McAlister was also paid $75,000 for the finals win - a grand total of $100,000.<BR/><BR/>
						Wright, who won TopCoder's collegiate competition this spring, has collected $37,950 from programming competitions this year alone. But he said the money won't be splurged.<BR/><BR/>
						"I'm going to try to be reasonable with it," Wright said. "I'll put some of it toward my education - Stanford isn't exactly inexpensive."<BR/><BR/>
						Neither will Wright's services after graduation. One of the main attractions associated with programming competitions is the corporate recognition the top achievers are able to generate.<BR/><BR/>
						"That's what TopCoder is ultimately for - employment purposes," Wright said. "This will definitely go on my resume."<BR/><BR/>
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
