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
						<div align="center"><IMG SRC="/i/pressroom/sfbiztimes.gif" ALT="" border="0"/></div><BR/>
						<p><span class="bodyTitle">Geekletes descend upon programming contest</span><BR/></p>
                        </div>
						Industry Wrapups<BR/>
						From the October 12, 2001 print edition<BR/>
						Net Business <BR/><BR/>
						Daniel S. Levine <BR/><BR/>
						While the Bay Area focused its attention on whether Barry Bonds would break Mark McGwire's single season home run record, my thoughts drifted instead to whether Jason Woolever would be able to repeat.<BR/><BR/>
						Woolever, 23, took the top prize of $100,000 in TopCoder's first collegiate competition at the Hilton Towers in San Francisco in June. Now Woolever, who works as a research and development engineer for Synopsys Inc. in Sunnyvale, is moving to the big leagues. He is one of 32 finalists -- about six of whom come from the Bay Area -- in TopCoder's Invitational this November at Foxwoods Resort Casino in Mashantucket, Conn.<BR/><BR/>
						(Note to readers: There is no need to send this columnist a note about his need to get a life. He is painfully aware of this already.)<BR/><BR/>
						Glastonbury, Conn.-based TopCoder provides an ongoing competition that allows geekletes like Woolever to flex their gray matter through a series of programming competitions. Each round consists of three programming challenges -- an easy, moderate and difficult programming task. Contestants have their choice of using C++ or the Java programming language.<BR/><BR/>
						An easy problem might be to write a program that will rearrange the words in a sentence so they appear in reverse order. A difficult challenge might take a whale-watching scenario where contestants are asked to write a program that would determine in a field of whales, how many could be seen from each position. The programmer that solves the problem the fastest wins.<BR/><BR/>
						If all this sounds a little frivolous, there is more to it. Behind the swaggering pocket protectors is an attempt to develop a new means for businesses to find the programming talent they need.<BR/><BR/>
						TopCoder is the brainchild of Jack Hughes, a one-time programmer and technology consultant, who wanted to find a better way to determine if the programmers he hired were any good.<BR/><BR/>
						"I had the same problem everyone else did," he said. "How do you find and differentiate top talent in that skill set? Instead of certifications and tests, I thought of something more analogous to a sports competition. That was the idea behind TopCoder."<BR/><BR/>
						All of TopCoder's participants get rated based on their performance in competition throughout the year. Eventually, Hughes hopes to use the ratings to help employers find the talent they need by serving as a conduit for helping participants find work. <BR/><BR/>
						In the meantime, Hughes swept through the Bay Area this month meeting with several top tech firms in hopes of winning their sponsorship. That's so when the invitational ends, the total $250,000 in prize money won't have to come out of his checkbook.<BR/><BR/>
						As for Woolever, he's still got his prize money sitting in a brokerage account. He hasn't decided what he's going to do with it, but has thought about using it as a down payment on a house.<BR/><BR/>
						For the collegiate finals, he didn't think he had much of a chance of winning and didn't do much in the way of preparation. Now, though, he's taking it seriously.<BR/><BR/>
						"I guess I really have a chance," he said. "So I may spend a considerable amount of time brushing up on Java in certain areas."<BR/><BR/>
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
