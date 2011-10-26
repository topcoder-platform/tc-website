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
                        <p><span class="bodyTitle">Google holds coding contest</span></p>
                        </div>

						<p>
By Michael Bazeley
<br/><br/>
Some people like to play tennis or golf to blow off steam after a hard day.
<br/><br/>
Bolek Szewcyzk likes to pound out line after line after line of code on his computer, solving complex problems or just exulting in the art of creation.
<br/><br/>
"It's a ton of fun," said the 23-year-old college student from Warsaw, Poland. "It's like a game. Once you start you can't stop."
<br/><br/>
Szewcyzk was definitely in his element Friday, surrounded by 49 of the world's top computer programmers at Google's Mountain View headquarters. The event was the Google Code Jam, a digital shootout to see which programmer could solve a series of progressively harder programming puzzles.
<br/><br/>
The winner - Sergio Sancho of Argentina - took home $10,000 and a chance to impress Google engineers and perhaps land a job with the world's most famous search engine.
<br/><br/>
The contest is both a recruiting tool for Google and a way for the company to nurture programmers it will need to draw on as it continues to grow.
<br/><br/>
"We have hired people out of it," said Alan Eustace, vice president of resources and systems engineering at Google. "But I don't think that's what is most important. We're trying to appeal to the community of problem-solvers. The more actively you support the community, the more active it becomes, and the more chances you'll have people you want to hire."
<br/><br/>
The competition started in September, with a qualification round that winnowed the group of 5,000 entrants. Successive competitions narrowed the field to 50 competitors who received expenses-paid trips to the finals.
<br/><br/>
Contestants came from 17 countries and many of the top schools in the country, including MIT and the California Institute of Technology.
<br/><br/>
Google lined up the programmers at rows of Dell computers in a large, high-ceilinged meeting room. About a fourth brought their own keyboards; some propped good luck charms such as stuffed animals next to their tubes.
<br/><br/>
The group had a little over an hour to tackle three problems. One involved organizing information to make it easily accessible. Another required the coders to order elements on a matrix. The third problem involved a game and required contestants to write a program that makes a series of moves until just one peg is left on a board.
<br/><br/>
"The first two seemed pretty easy," said 19-year-old Hubert Hwang from Brookline, Mass. "The third one was just plain hard."
<br/><br/>
The programmers were judged on speed and accuracy, and had to pass through a challenge round in which others could challenge their results.
<br/><br/>
The event was organized by TopCoder, a 4-year-old Connecticut company that holds similar competitions around the world and helps connect recruiters with potential employees.
<br/><br/>
True to the stereotype of the nerdy male programmer, there were no women in the contest.
<br/><br/>
Eustace handed the winners their trophies, made out of Legos. (In their early days, Google's founders crafted hard disk drives out of Lego-like toys called Duplo.)
<br/><br/>
The programmers came from varied backgrounds and have different ambitions. One wrote his first program at age 6 on a Macintosh Plus computer. Some were there to impress Google recruiters. Others want to pursue careers in academia. All of them share a passion for beautiful and functional code.
<br/><br/>
"I guess I enjoy the thrill of problem-solving," Hwang said. "It's kind of a strange thing, I suppose. But it's what I do."
                        <p><br /></p>
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
