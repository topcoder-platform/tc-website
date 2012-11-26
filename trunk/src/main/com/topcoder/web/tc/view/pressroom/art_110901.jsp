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
						<div align="center"><IMG SRC="/i/pressroom/ga_technique.gif" ALT="" border="0"/></div><BR/>
						<p><span class="bodyTitle">Tech student makes TopCoder semifinals</span></p>
                        </div>
						By Sriram Narasimhan<BR/>
						Contributing Writer<BR/>
						ATLANTA<BR/>
						November 9, 2001<BR/><BR/>
						Perhaps what the computer programmer needed most, excluding, of course, more processing power, was a company with a simple and sound mission statement demonstrating its desire to reverse the traditional stereotypes encapsulating the profession.<BR/><BR/>
						That desire for social change became a reality in 2000, when a man named Jack Hughes founded TopCoder, a Connecticut-based company that regularly runs tournaments that bring the most skilled computer programmers in the country together. Contestants compete against one another to solve a variety of tasks in either the Java or C++ programming language.<BR/><BR/>
						This past Friday and Saturday, TopCoder hosted the first-ever $250,000 TopCoder Invitational Computer Programming Tournament in Foxwoods Resort Casino in Mashantucket, CT. It was just one of numerous rounds of tournaments in which members of the always expanding company compete. However, what makes this particular competition especially significant is that one of the finalists in the competition, Trayton Otto, is a student at Georgia Tech.<BR/><BR/>
						"TopCoder gave me an avenue to tackle problems that I could not tackle in a classroom. It's brought my programming to a whole new level," Trayton Otto, a second year Computer Science major, said. "I've learned rapidly as a result of classes and TopCoder combined...I'd recommend it to anyone who's interested in programming to expand their abilities."<BR/><BR/>
						Otto was one of 15 finalists in the competition that not only included students from other prestigious colleges in the country, but also professional computer programmers.<BR/><BR/>
						Otto's task in the finalist round was divided into three computer problems of increasing difficulty which he chose to solve using Java. The first asked Otto to calculate the least number of moves that could be taken to move a red checker piece from one side of a checkerboard to the other, while still moving past the black pieces. The second program enabled a user to input a single, arbitrary string into the interface and receive as an output, a series of multiple strings. The final, as well as the most difficult, required the competitor to design a program that would perform the basic mathematics functions on inputs containing very large numerical values.<BR/><BR/>
						Although Trayton Otto was not the winner of the $100,000 grand prize, he still won $3,000 for making it to the semifinalist level. John McAlister from Stanford University, won the tournament.<BR/><BR/>
						"It was definitely a good group who came to the contest. A lot of the programming skill came from their innate ability," said McAlister, whose computer program aimed to investigate some of the mathematical representations in residential telephone lines.<BR/><BR/>
						The starting point for Otto, McAlister, and every other programmer, is TopCoder's website, www.topcoder.com, which is not only the hub to forums where programmers such as Otto discuss solutions to various problems, but also where anyone interested can take a look at the company's mission statement and the rationale for its existence.<BR/><BR/>
						In addition, there are links directly on the website to documents concerning equal economic status compared to other professions in the United States. Long-term goals such as these were the impetus for the founding of the company.<BR/><BR/>
						"Programmers are looked at as a community as a whole, where it is difficult to differentiate between one and the next...it doesn't specify in terms of skills, as do the various professions in tween one and the next as do the various professions in medicine. TopCoder gives [programmers] a name," Rob Hughes, the COO of the company, said.<BR/><BR/>
						"This was a great way to show potential employers their skills, much more than one could in a traditional interview. Programmers must be compensated accordingly for the work they perform."<BR/><BR/>
						In addition, TopCoder frequently allows companies to sponsor their tournaments, both reducing the cost of the competitions as well as providing a name to potential employers.<BR/><BR/>
						Over 125 people sign up on the website daily as new members. Experienced members have been known to average nearly five hours a week either competing in small tournaments, or collectively discussing solutions to problems in TopCoder.<BR/><BR/>
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
