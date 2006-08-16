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
						<div align="center"><IMG SRC="/i/pressroom/subLogoNdx.gif" ALT="" border="0"/></div><BR/>
						<p><span class="bodyTitle">Oberlin College Student Competes in TopCoder Tournament</span><BR/></p>
                        </div>
						October 18, 2001<BR/>
						by Alex Pfeifer<BR/><BR/>
						Oberlin College physics major Ben Wilhelm '04, is one of 16 finalists in the TopCoder Invitational Tournament. TopCoder is a company that 
						identifies and promotes computer-programming talent through its tournament web site. Wilhelm will be flown out to Connecticut for the championship 
						rounds November 2-3 at the Foxwoods Resort Casino. He has already won $900 and is guaranteed to win an additional $3000 for advancing to the 
						championships.<BR/><BR/>
						Wilhelm, a native of Seattle, Washington, is the underdog of the tournament. He was ranked 92 when the online tournament began, and is the lowest 
						remaining seed. TopCoder founder and chairman Jack Hughes said in a press release that Wilhelm "has scaled steep odds to get to this point. Out of 
						over 500 of the country's best [code] developers he has made it to the final 16. The competition has been fierce."<BR/><BR/>
						Wilhelm has been competing in the online tournament since September 25. He has spent approximately two hours per week competing in elimination 
						rounds against other programmers. Points are awarded for generating code written in the programming language C++ and Java language to solve problems 
						quickly and accurately. Fellow competitors then scour one another's code for errors and inaccuracies. <BR/><BR/>
						Other schools represented in the tournament's finals include Stanford, MIT, Virginia Tech, Berkeley, Cornell University, the University of Central 
						Florida and Georgia Tech. The winner of the tournament will receive $100,000. However, the real prize will be job offers from the software giants 
						who take notice of the competition's winner.<BR/>
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
