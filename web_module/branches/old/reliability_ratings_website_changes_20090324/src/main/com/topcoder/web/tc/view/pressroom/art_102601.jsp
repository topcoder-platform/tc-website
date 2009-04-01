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
						<div align="center"><IMG SRC="/i/pressroom/denver_bizjrnl.gif" ALT="" border="0"/></div><BR/>
						<p><span class="bodyTitle">Colorado native among nation's top programmers</span><BR/></p>
                        </div>
						Industry Wrapups<BR/>
						From the October 26, 2001 print edition<BR/>
						Tech<BR/>
						Lyn Berry-Helmlinger <BR/>
						Daniel Wright composes computer programming code like a champ.<BR/><BR/>
						In fact, the Lafayette native is a favorite among finalists in the championship rounds of the upcoming 2001 TopCoder Invitational tournament, a national competition held in Connecticut.<BR/><BR/>
						Wright -- who is currently a junior at Stanford University majoring in computer science -- is one of 16 contestants who have advanced to the finals of the challenge, which will be held Nov. 2-3 at the Foxwoods Resort Casino in Mashantucket, Conn.<BR/><BR/>
						The tournament has a total prize purse of $250,000. The winner of the invitational will take home $100,000.<BR/><BR/>
						Wright is TopCoder's top-ranked coder and is top seed in the challenge, according to founder and chairman Jack Hughes.<BR/><BR/>
						"We are already familiar with Daniel from the TopCoder Collegiate Challenge," where Wright tied for ninth and won $5,750 last June, he said. "We applaud his ability to make it to the finals for a second time in a row. The competition for the invitational has been fierce."<BR/><BR/>
						A shot at the championship rounds was awarded to Wright based on his scoring in TopCoder's online elimination rounds, which began Sept. 25.<BR/><BR/>
						TopCoder scores contestants based on their ability to use a particular coding language under the pressure of peer-to-peer competition -- known as intensity -- and velocity, which is the ability to write quality code quickly and accurately.<BR/><BR/>
						The organization, which arranges and hosts online and on-site programming competitions for its members, was created in February 2001. TopCoder's goal is to create a community of programmers while setting the industry standard for discerning programming skill. <BR/><BR/>
						So far, the TopCoder competitions have attracted more than 4,300 software developers. <BR/><BR/>
						"We're confident our programming competitions test and reflect real-world coding skills in a way that's valuable to our constituents," Hughes said, adding, "The spirit of competition among these highly rated developers has become palpable." <BR/><BR/>
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
