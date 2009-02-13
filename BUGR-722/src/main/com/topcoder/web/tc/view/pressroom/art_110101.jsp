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
						<div align="center"><IMG SRC="/i/pressroom/ciocom_logo_1201.gif" ALT="" border="0"/></div><BR/>
						<p><span class="bodyTitle">Performance Metrics - Code for Cash</span><BR/></p>
                        </div>
						November 1, 2001<BR/>
						By Daniel J. Horgan<BR/><BR/>
						TOURNAMENT FEVER is on the rise again, but for this particular sport, game play takes place not on the court but rather within the digits of computer code. Competition is driven by the mental agility of the players who, despite their big-league abilities, promise to stick around for their senior year.<BR/><BR/>
						At TopCoder.com, a Glastonbury, Conn.-based coding competition company, programmers participate in semiweekly online programming competitions for cash and, if lucky, qualify for the big dance at either of the two major annual tournaments. The TopCoder Collegiate Challenge premiered in June and lent center stage to the younger hotshots. The TopCoder Invitational Tournament, which is open to all members of the growing TopCoder community, will bring together 16 semifinalists (out of 256 qualifiers) on Nov. 2 and 3 at the Foxwoods Resort and Casino in Mashantucket, Conn., to compete for a $250,000 purse.<BR/><BR/>
						At Foxwoods, semifinal competitions will pit four programmers against one another. They must create a code to satisfy an assigned scenario within a 75-minute time limit. Contestants then spend 15 minutes in the challenge phase scanning opponents' codes, highlighting any flaws in an attempt to oust their rivals. Winners of each round advance to the finals in the tournament championship. Jason Woolever, former MIT grad student and reigning Collegiate Challenge champ, banked $100,000 for his clutch performance last June in San Francisco. He's now a senior research and development engineer for Synopsys in Sunnyvale, Calif.<BR/><BR/>
						Been fantasizing about drafting a superstar such as Woolever onto your IT squad? Companies can either post jobs at www.topcoder.com or take advantage of a matchmaker-style hiring program in which TopCoder fetches a qualified programmer from the member community based on a company's demands. Also useful is a complex rating system that distinguishes one coder from another, allowing employers to evaluate and compare potential employees. "TopCoder was put together to differentiate between [programmers]," says Jack Hughes, founder and chairman. "The programming community is not homogeneous."<BR/><BR/>
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
