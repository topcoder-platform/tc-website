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
						<div align="center"><IMG SRC="/i/pressroom/xutmhead_ucf.gif" ALT="" border="0"/></div><BR/>
						<p><span class="bodyTitle">Computer Wizard a Finalist for $100,000 Prize</span><BR/></p>
                        </div>
						October 19 , 2001<BR/>
						By Dean McFall<BR/><BR/>
						<P>A $100,000 payday awaits a 20-year-old UCF computer science major if he can outsmart 15 other competitors next month at an invitational computer programming tournament that 
						has drawn the nation's top coding wizards -- collegians and professionals alike -- in their quest for fame and fortune.</P>
						<P>Ambrose Feinstein, a senior and member of UCF's first-place finishing computer team in a five-state programming competition this month, will test his individual skills against the 
						nation's premier coders -- and perhaps start a personal fortune -- on Nov. 2-3 at the 2001 TopCoder Invitational Tournament at the Foxwood Resort Casino in Mashahtucket, Conn. A 
						first-place prize of $100,000 goes to the winner out of a $250,000 purse.</P>
						<P>Programmers from such schools as Stanford, California Institute of Technology, Cornell, Massachusetts Institute of Technology and the University of California at Berkeley are heavily 
						represented in the finalist field.</P>
						<P>Feinstein, an Orlando resident, qualified for the championship based on his scoring in on-line elimination rounds. Scoring was based on ability to use a particular coding language 
						well and on writing good code quickly and accurately. The same scoring criteria will be used in the championship round.</P>
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
