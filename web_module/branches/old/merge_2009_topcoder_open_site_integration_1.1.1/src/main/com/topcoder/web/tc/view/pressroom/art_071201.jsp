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
						<div align="center"><IMG SRC="/i/pressroom/wpi_banner.gif" ALT="" border="0"/></div><BR/>
						<p><span class="bodyTitle">Marut Competes in Top Coder Contest</span><BR/></p>
                        </div>
						<BR/><BR/>
                        Andrew Marut '04 may not be the Top Coder, but he is a littlie richer for  the experience of participating in the Top Coder Collegiate Challenge in San Francisco last month. Marut was one of 16 finalists from universities around the nation who competed in the programming contest, which sent the winner, a student from MIT, away with a grand prize of $100,000.<BR/><BR/>
                        Marut qualified for the contest by completing an on-line challenge on the Web site www.topcoder.com, a service that helps employers find top-notch programmers. In San Francisco, the semifinalists were divided into groups of four. They completed a three-part challenge in which they first wrote code to solve three problems, critiqued each other's code, and then ran their programs to see how well they worked. The winner in each group advanced to the finals. Marut, who hails from Glastonbury, Conn., came in second in his group, a feat that earned him a prize of $10,000.<BR/><BR/>
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
