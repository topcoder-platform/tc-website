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
						<div align="center"><IMG SRC="/i/pressroom/brandweek_logo_white.gif" ALT="" border="0"/></div><BR/>
						<p><span class="bodyTitle">Sun Microsystems Named Exclusive Sponsor of Computer Challenge</span></p>
                        </div>
						December 10, 2001<BR/>
						Barry Janoff<BR/><BR/>
						NEW YORK - Sun Microsystems Monday announced that it will be the exclusive sponsor of the second annual TopCoder Collegiate Challenge, in 
						which college students nationwide are asked to code solutions to real-world technology problems.<BR/><BR/>
						Beginning February 2002, 512 student programmers, narrowed down from an initial field of thousands, will participate in a series of online 
						elimination rounds, culminating with the Sun/TopCoder finals on April 19-20, 2002 at the Massachusetts Institute of Technology (MIT), 
						Cambridge. The competition offers $150,000 in prize purses, of which $100,000 will be awarded to the tournament champion.<BR/><BR/>
						"Collegiate programmers are a driving force within the IT community and are an important group for Sun by way of resources, marketing and 
						recruitment," said Stans Kleijnen, vice president, Sun Developer Network, Sun Microsystems. "The challenge enables Sun to show its support 
						for this talented community and its development, as well as provide an exciting, new way for Sun to reach such a critical target audience."<BR/><BR/>
						Hartford, Conn.-based TopCoder organizes and hosts online and onsite programming competitions for its members year-round.
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
