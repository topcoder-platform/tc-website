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
						<div align="center"><IMG SRC="/i/pressroom/star_gazette.gif" ALT="" border="0"/></div><BR/>
						<p><span class="bodyTitle">Erin native wins $100,000 in contest</span><BR/></p>
                        </div>
						Friday 6/08/01<BR/>
						By MARGARET COSTELLO<BR/>
						Star-Gazette<BR/>
						mailto:mcostello@stargazette.com<BR/><BR/>
						When it comes to computer programming, Erin native Jason Woolever is tops. The 22-year-old placed first among 16 finalists in a three-day computer programming competition in San Francisco. The victory earned him $100,000.<BR/><BR/>
						"He won, but I'm the one who's shaken," said his mother, Beverly Woolever of Erin. "I just can't believe it."<BR/><BR/>
						Jason Woolever qualified for the semifinals after competing in preliminary rounds on TopCoder Inc.'s Web site. The company is committed to identifying and promoting top-notch computer programming. It uses competitions to attract and rate highly skilled programmers.<BR/><BR/>
						He traveled to San Francisco for the championship rounds earlier this week.<BR/><BR/>
						Woolever beat three competitors Wednesday during semifinals. He received $25,000 and a chance to play in the championship round Thursday.<BR/><BR/>
						Woolever said he was a little nervous going into the final round because he knew the other programmers were strong contenders. "I didn't work as quickly as I did during the semifinal round," Woolever said Thursday evening from his hotel room in San Francisco.<BR/><BR/>
						He finished just a few minutes ahead of the next-fastest competitor. A complex scoring system ranked him third after completing the programming section. However, each competitor then had the chance to challenge others' programs for accuracy and efficiency.<BR/><BR/>
						After testing, Woolever's solutions to the three problems proved to be the best.<BR/><BR/>
						"I was like, 'Wow,' " Woolever said. "This is the first time that I've won something with so much money attached."<BR/><BR/>
						Woolever said he might use the winnings for a down payment on a house in the Silicon Valley area, where he begins work on Monday.<BR/><BR/>
						To compete in the national contest, Jason Woolever had to miss his graduation ceremony at the Massachusetts Institute of Technology in Cambridge, Mass., where he earned his master's in engineering.<BR/><BR/>
						Woolever said he intends to compete in TopCoder's next competition in Las Vegas this fall against collegiate and professional computer programmers.<BR/><BR/>
						"We'll see how I can fare in that," Woolever said.<BR/><BR/>
						His parents, Beverly and Richard Woolever, said they hope at least some of his winnings will go toward a plane ticket home for Christmas.<BR/><BR/>
						They won't have a chance to see him before he starts his job as a senior research and development engineer at the Synopsys in Sunnyvale, Calif., which creates software tools for computer chip designs.<BR/><BR/>
						"We just keep shaking our heads," Beverly Woolever said. "It's been amazing for us. But Jason is the same ole Jason. He just does the best he can. Win or lose."<BR/><BR/>
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
