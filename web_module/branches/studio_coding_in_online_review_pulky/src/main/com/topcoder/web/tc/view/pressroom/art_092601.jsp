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
						<div align="center"><IMG SRC="/i/pressroom/masthead.gif" ALT="" border="0"/></div><BR/>
						<p><span class="bodyTitle">Students compute, compete for dollars on Web site</span><BR/></p>
                        </div>
						September 26, 2001<BR/>
						By Melissa Lee<BR/>
						Try figuring out the combined volume of four rectangles, given their coordinates in space. <BR/><BR/>
						According to Ken Bayer, a senior computer science major, this is "one of the easier problems" from the topcoder.com computer programming competition.<BR/><BR/>
						TopCoder is an Internet-based competition that invites students to design codes and programs to solve computer programming problems of varying difficulty.<BR/><BR/>
						The twice-weekly competitions last one hour and 40 minutes, said Joel Gompert, a senior computer engineering major.<BR/><BR/>
						First, the 100 or so competitors are divided into groups of eight. These eight will compete only against each other for that night.<BR/><BR/>
						TopCoder begins with an 80-minute coding phase, during which each competitor is given three problems of escalating difficulty.<BR/><BR/>
						Students are asked to write program solutions for each problem and are scored based on speed and accuracy, Gompert said.<BR/><BR/>
						After this, there is a five-minute break, and then begins the 15-minute challenge phase. Competitors can look at each other's solutions and correct them for more points.<BR/><BR/>
						Then, according to Gompert, they "sit back and wait for the system to solve them."<BR/><BR/>
						Whoever has the most points at the end of the night is the winner.<BR/><BR/>
						Gompert and Bayer are among several UNL students competing on the TopCoder Web site. They found out about it earlier this year through a mass e-mail from someone who thought they'd be interested.<BR/><BR/>
						And interested they were - for a few reasons.<BR/><BR/>
						Take, for example, the cash prizes. To date, topcoder.com has given away $376,133 in prizes, and hundreds more dollars are awarded each week.<BR/><BR/>
						In Division I, the most difficult division, first prize is worth $300; second prize is $150; and third prize is $75, Gompert said.<BR/><BR/>
						For Division II, the prizes are $150, $75, and $25, he said.<BR/><BR/>
						Gompert has won several competitions and is planning on participating in a tournament that began Monday night.<BR/><BR/>
						After Monday's opening round, he said, 64 people remain. This group will be reduced to 32, and then to 16, before the finalists are flown to Connecticut to compete in the final rounds.<BR/><BR/>
						The grand prize is $100,000, and even the 16th-place finisher will receive $3,000, Gompert said.<BR/><BR/>
						Topcoder.com is independent of the university, and therefore students have no sponsors, said Bayer. Anyone over 18 can enter, although a strong knowledge of computers is clearly necessary.<BR/><BR/>
						And even if you don't win big, Bayer said, it still provides good experience.<BR/><BR/>
						"It's really good practice, if nothing else. It keeps you sharp on your programming skills," he said.<BR/><BR/>
						Gompert said he'd been to job interviews where, instead of an actual interview, he was simply presented with a programming problem and asked to solve it. His TopCoder experience was helpful to him then.<BR/><BR/>
						"I think this is really great practice for being under time pressure and having to come up with a solution," Gompert said.<BR/><BR/>
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
