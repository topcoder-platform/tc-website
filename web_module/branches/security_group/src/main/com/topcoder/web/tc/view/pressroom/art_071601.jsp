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
						<div align="center"><IMG SRC="/i/pressroom/vt_logo.gif" ALT="" border="0"/></div><BR/>
						<p><span class="bodyTitle">Virginia Tech student places 5th in national computer programming competition</span><BR/></p>
                        </div>
						<BR/><BR/>
						BLACKSBURG, July 16, 2001 - When Virginia Tech student Alex Kalita received his undergraduate degree in computer science in May 2001, his plans were to purchase some kind of used car. However, Kalita's plans quickly changed when he took 5th place at the TopCoder Collegiate Challenge held June 5-7 bringing home a $10,000 cash prize.<BR/><BR/>
						The Richmond native Alex Kalita was invited to San Francisco to compete in the final round of the TopCoder Collegiate Challenge, he decided that any prize money would go toward getting a new car. "My old car was a piece of junk and I was eager to replace it, " said Kalita. "The money from TopCoder allowed me to upgrade from getting a used car to getting a new one with all the features." Out of the 128 students who entered the TopCoder Challenge and competed in online preliminary tournaments, only 16 were invited to San Francisco for the semi-final and finals. Alex Kalita tied for 5th in the tournament; in addition, another Virginia Tech student, Nathan Egge, tied for 13th and won $3,000.<BR/><BR/>
						"I had a great time in San Francisco for the TopCoder programming contest," said Kalita. "They even sent limousines to pick us up from the airport. It was quite overwhelming for a college student like myself."<BR/><BR/>
						Kalita has been a member of the Virginia Tech Applied and Computational Mathematics (ACM) programming team for the past two years, including the team that placed 2nd in the world in March 2001. "The TopCoder contest is similar to the ACM contest, except that you compete as individuals and the contest itself is shorter," said Kalita. Students competing in the final rounds of the TopCoder competition were given two hours to solve three algorithmic problems - a relatively simple one for 250 points, a more difficult one for 500 points, and a harder one for 1000 points. They then used Java to design and implement their problem solutions. "I was much more nervous than I was during previous programming contests, since so much money was at stake," Kalita said.<BR/><BR/>
						The event coincided with the launch of the Glastonbury, Conn.-based TopCoder Inc., a company committed to identifying and promoting top-notch computer programming. TopCoder uses these competitions to attract and rate highly skilled programmers while facilitating connections between its members and employees.<BR/><BR/>
						"I had been hoping to get a new car for quite a while now, " said Kalita. "I never dreamed it would be a 2001 white Pontiac Grand Am GT 4-door sedan."<BR/><BR/>
						CONTACT:<BR/>
						Heather McElrath<BR/>
						(540) 231-8508<BR/>
						heatherm@vt.edu<BR/><BR/>
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
