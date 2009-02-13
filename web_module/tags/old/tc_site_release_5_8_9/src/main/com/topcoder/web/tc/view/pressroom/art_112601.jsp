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
						<div align="center"><IMG SRC="/i/pressroom/houston_chron.gif" ALT="" border="0"/></div><BR/>
						<p><span class="bodyTitle">College student outpaces rivals to win contest</span></p>
                        </div>
						Nov. 26, 2001, 10:53AM<BR/>
						FOCUS: COMPETITION<BR/>
						By ED ASHER<BR/>
						&copy; 2001 Houston Chronicle<BR/><BR/>
						Like the tortoise in the Aesop fable, Jon McAlister of Houston outdistanced two competitors to win a national computer programing contest and a $100,000 prize.<BR/><BR/>
						The 20-year-old Stanford University student, a graduate of Langham Creek High School, won the first TopCoder Invitational earlier this month. The competition was sponsored by TopCoder Inc., a new company that recruits computer programmers for high-tech corporations.<BR/><BR/>
						Seeded No. 3 in a field that began with 256 contestants, McAlister entered the final round at a casino resort in Mashantucket, Conn., on Nov. 3.<BR/><BR/>
						"I was not rated as high as the other two guys, so they didn't worry about me and just competed against each other," McAlister said of the top two seeds, one a professional programmer, the other a college student.<BR/><BR/>
						Speed is a factor in the competition, which involves contestants writing computer codes to solve complex problems.<BR/><BR/>
						The faster a contestant solves a problem, the more points he or she is awarded. However, errors in the code costs points.<BR/><BR/>
						McAlister's father, Don McAlister, said, "The top two seeds were head to head against each other. They were trying to impress each other too much, trying to see who could solve the problems the fastest."<BR/><BR/>
						"And that's why they made mistakes. Jon was just going steady, refusing to rush anything and making sure he got the problem correct. That's why he won."<BR/><BR/>
						Typical challenges in computer competitions include problems such as solving a Y2K bug or determining the maximum point of flow in a pipe system, all within a certain time limit.<BR/><BR/>
						In Jon McAlister's case, he and the other contestants were given 80 minutes to solve three problems using either the Java or C++ language.<BR/><BR/>
						One problem involved several imaginary telephone circuits supposedly connecting two buildings. The contestants were given a set of probabilities on whether each circuit was either "live" or inactive and then asked to write a program that would determine which circuit was the active circuit between the buildings.<BR/><BR/>
						"You have to solve all the probabilities of each line. It was just a combination of experience and luck," McAlister said.<BR/><BR/>
						He has plenty of experience.<BR/><BR/>
						He got his first computer when he was in the eighth grade and has been programing since.<BR/><BR/>
						As a teen-ager, he competed nationally and internationally in some of the most rigorous and respected computer contests for high school students. With teams and also individually, he traveled to places such as Chicago, Wisconsin, Washington, D.C., and the European country of Latvia.<BR/><BR/>
						In Latvia, he was the only Texan among four American students whose team took first place at the Eastern European Computing Olympiad, a prestigious contest that drew teen-agers from around the globe.<BR/><BR/>
						As for his plans, McAlister hasn't yet decided whether he wants to do software research for the government or for a university.<BR/><BR/>
						But he already has plans for the money.<BR/><BR/>
						"I'm going to buy an electric/gas hybrid car. It may be slower, but it's more economical," he said.<BR/><BR/>
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
