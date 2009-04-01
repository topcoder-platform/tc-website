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
						<div align="center"><IMG SRC="/i/pressroom/ideamarketers.gif" ALT="" border="0"/></div><BR/>
						<p><span class="bodyTitle">Programmers Compete For Cash and Recognition</span><BR/></p>
                        </div>
						by Beth Sunny<BR/><BR/>
						The New Economy has created a paradigm shift in the role of computer programmers and the essential role they play in advancing the daily lives of tomorrow's businesses, governments and people. As a result, programmers are in high demand in today's economy.<BR/><BR/>
						But despite this reality, no mechanism has been developed to qualify programmers' skills to prospective employers. Furthermore, no value system or accreditation has emerged that effectively credentials elite programmers as true professionals like doctors or accountants.<BR/><BR/>
						TopCoder, Inc. hopes to change that. They have introduced a new category built on placing high value on skilled programmers. Specifically, the company hosts on-and off-line "tournaments" where programmers compete for cash. Using its unique objective rating system, TopCoder showcases real-world talent before the industries top IT firms. The concept was created earlier this year by Jack Hughes, co-founder and former chairman of Tallan, Inc., an application development professional services firm that was purchased in 2000 by CMGI.<BR/><BR/>
						[Beth] Jack, you have an interesting concept here. What is the history of TopCoder?<BR/><BR/>
						[Jack] TopCoder was founded on the premise that talent and skill are the determinant factors in the quality and utility of software - and software has become central to the global economy. In my capacities as both a programmer and an executive, I've worked on successful projects that were driven by superior programming skills, yet that talent goes unqualified and, for the most part, unrecognized. TopCoder's mission is to create objective ratings that place high value on the programming industry's best and brightest. The company will build opportunity and community for programmers through computer programming tournaments and employer connections.<BR/><BR/>
						[Beth] So how exactly do you qualify and identify the industry's best programmers?<BR/><BR/>
						[Jack] At www.topcoder.com our members compete online in real-time. Choosing Java or C++, contestants write solutions to algorithmic problems under tight time constraints. Scoring in TopCoder competitions is based on two factors: intensity, or the ability to use a particular coding language well under the pressure of peer-to-peer competition; and velocity, the ability to write good code quickly and accurately. Contest scores are calculated using TopCoder's objective assessment model then factored into the contestant's overall rating using a set of formulae created by TopCoder to fairly and accurately gauge a contestant's performance. Winners are the fastest among their peers to solve the problems with code that withstands the scrutiny of other contestants, and then our system test. <BR/><BR/>
						[Beth] What does it cost to participate?<BR/><BR/>
						[Jack] It costs our members nothing to compete but each gets a performance-based rating, a chance to win prize money, and an opportunity to get connected with companies that partner with TopCoder in the form of sponsorships. <BR/><BR/>
						[Beth] That explains the "qualifying" part. How do you help to identify and promote competitors? <BR/><BR/>
						[Jack] TopCoder leverages the results of its competitions to create a national database of talent-differentiated student and professional programmers. This database, coupled with TopCoder's rating system, provides prospecting companies a means to efficiently and cost-effectively source, evaluate and access talent. Companies gain access to the TopCoder database through sponsorships of its single round matches and major tournaments. <BR/><BR/>
						[Beth] What types of companies do you normally attract?<BR/><BR/>
						[Jack] IT companies have expressed the most interest in partnering with us. They are looking for exposure in front of an elite group of programmers who are the decision-makers and future decision-makers responsible for purchasing corporate technology products and services. Sponsors can utilize member profile and statistical information to make informed hiring and marketing decisions. <BR/><BR/>
						[Beth] What types of competitions are available for programmers and how much is at stake?<BR/><BR/>
						[Jack] While we host single round matches twice a week, where members can win anywhere from $25-$300, we also run full-blown tournaments. At our $250,000 Collegiate Challenge in June, an MIT Graduate Student won $100,000. Our next major tournament is the TopCoder Invitational, which is open to college students and professionals, and begins in September. It also has a $250,000 total purse, and will once again pay the winner $100,000.<BR/><BR/>
						[Beth] Overall, do you feel your program is a success?<BR/><BR/>
						[Jack] We're confident our programming competitions test and reflect real-world coding skills in ways that are valuable to our constituents. Our fast-growing membership base is already proof of that. Since our introduction in March, we have added over 2,600 members, for the month of August we've been averaging 18 new members a day. Such an online assembly of developers is an invaluable resource for companies whose business depends on accessing these top technologists.<BR/><BR/>
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
