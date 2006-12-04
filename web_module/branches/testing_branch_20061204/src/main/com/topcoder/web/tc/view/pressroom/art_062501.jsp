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
						<div align="center"><IMG SRC="/i/pressroom/univmich.gif" ALT="" border="0"/></div><BR/>
						<p><span class="bodyTitle">EECS Students Winners in TopCoder Collegiate Challenge</span><BR/></p>
                        </div>
						Jun 25, 2001<BR/><BR/>
						University of Michigan students: Andrew Nierman, James Lee and Jason Dillaman won $25,000, $5,750 and $3,000 respectfully in the 2001 TopCoder Collegiate Challenge held in San Francisco on June 5-7.<BR/><BR/>
						These students were three of the sixteen finalists, out of an original group of 128 that competed for a grand prize of $100,000.<BR/><BR/>
						Scoring in TopCoder competitions is based on two factors: intensity, or the ability to use a particular coding language well under the pressure of peer-to-peer competition; and velocity, the ability to write good code quickly and accurately.<BR/><BR/>
						Other finalists were represented from: Stanford University, University of Michigan, Virginia Polytechnic Institute, Iowa State University, MIT, University of California, San Diego, Rensselaer Polytechnic Institute, Rutgers, Worcester Polytechnic Institute.<BR/><BR/>
						TopCoder has several competitions scheduled for the remainder of 2001, including its first professional tournament, the TopCoder Invitational, from September to October. The total purse for that tournament will be $350,000. These initial competitions will be based on the Java programming language, though the company plans to feature other languages in the future. For more information and registration details, visit the Web site, www.topcoder.com.<BR/><BR/>
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
