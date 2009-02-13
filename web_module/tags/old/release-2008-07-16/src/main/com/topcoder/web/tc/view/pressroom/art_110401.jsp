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
						<div align="center"><IMG SRC="/i/pressroom/ctnow_logo.gif" ALT="" border="0"/></div><BR/>
						<p><span class="bodyTitle">'TopCoder' Outwits His Rivals</span><BR/></p>
                        </div>
						November 4, 2001<BR/>
						By AL LARA, Courant Staff Writer<BR/><BR/>
						Several dozen spectators strained to watch as four tournament finalists, separated by scant point margins, competed for a $100,000 purse Saturday afternoon in the Tahoe room at the Foxwoods Resort and Casino.<BR/><BR/>
						"This is all about strategy now," said an observer in a hushed tone.<BR/><BR/>
						"The suspense is killing me," said another.<BR/><BR/>
						"How long will it take the computer to compile the program?" asked a third.<BR/><BR/>
						It felt like a high stakes poker game, but instead of dealing out deuces these competitors were typing in code - computer program code - to find the best computer programmer among them.<BR/><BR/>
						After 80 minutes of furtive code writing, three lead changes, and ultimately using a clever ploy to knock a classmate out of the lead, 19-year-old Stanford University computer science major Jon McAlister emerged as the "top coder."<BR/><BR/>
						Whittled down since April from 256 professional and student programmers competing online and in person, 16 semifinalists were flown to Connecticut this weekend to compete for $250,000 in prizes at the two-day "TopCoder" tournament.<BR/><BR/>
						TopCoder is the brainchild of Jack Hughes, a program developer and software entrepreneur from Hebron who sought to search out the best programmers and bring them attention.<BR/><BR/>
						Even in a down economy for technology, the competition attracted sponsorship and visiting representatives from Sun Microsystems, Motorola, and Apple Computer Inc.<BR/><BR/>
						"You look at what's happening here, and it's a sport," Hughes said. "You win by inches and it gets nerve wracking. And everyone has their favorite" competitor.<BR/><BR/>
						Four matches Friday produced four finalists for Saturday's last heat. Sitting at computer workstations separated by mesh enclosures that obscured what they could see on each other's screens, each had 80 minutes to write a computer program in the programming language of Java, with points awarded to working programs.<BR/><BR/>
						They then had 20 minutes to review and, if desired, discredit each other's work. A successful challenge, tested on a computer, won the person issuing it 50 points and took away from the other any points awarded for the question.<BR/><BR/>
						Both the questions and the answers were arcane to non-programmers. But even they could follow information on several monitors about who had answered their questions in time, who challenged, and who led in point totals.<BR/><BR/>
						Each answer verified by a computer, McAlister initially finished third in a tight race. But he successfully challenged another programmer's answer, elevating himself to second place.<BR/><BR/>
						To knock Stanford classmate and friend Daniel Wright from the lead, McAlister took advantage of a competition rule requiring each program to run completely within 6 seconds. Fed a question from McAlister designed to fluster it, Wright's program failed the time limit.<BR/><BR/>
						"His girlfriend was mad at me, but I would expect him to do the same to me," said McAlister, a Texas native who wrote his first piece of computer code at age 12. He said he would buy a car and pay down his tuition with his winnings.<BR/><BR/>
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
