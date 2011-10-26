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
						<div align="center"><IMG SRC="/i/pressroom/me_logo.gif" ALT="" border="0"/></div><BR/>
						<p><span class="bodyTitle">EECS students excel in computing competitions</span><BR/></p>
                        </div>
						2001/07/27 <BR/><BR/>
						Ann Arbor--Michigan Engineering sent two sets of EECS students to competitions this past year, and winners came home each time.<BR/><BR/>
						In February, Michigan Engineers were among the winners for the second year in a row at the Student Design Contest associated with the Design Automation Conference (DAC). In the Operational category, Suhwan Kim and Conrad Ziesler placed first. In the Conceptual category, CoE students won all three awards. Seungbae Lee, Gi-Joon Nam, Junseok Chae, and Hanseup Kim placed first; Li Ding and Yi Li took second; and NamSung Kim, Jiyoun Kim, Mingyu Cho, and Tae-Young Choi finished third.<BR/><BR/>
						The DAC contest judged the design of integrated circuits or electronic systems developed as part of a student's course or research work at a university or college. Judges evaluated originality, soundness of engineering, measured performance, and the quality of the written submission.<BR/><BR/>
						In July, Jason Dillaman, James Lee, and Andrew Nierman were three of 16 student programmers who qualified through online rounds to compete in the Collegiate Challenge tournament hosted by TopCoder.com in San Francisco, California.<BR/><BR/>
						Dillaman and Lee made it to the semifinal rounds of the Java programming competition, while Nierman advanced to the finals, eventually taking fourth place overall. In the contest, programmers were given various algorithmic problems to solve using Java. Winners were determined by how quickly competitors could accurately solve the problems and how well their solutions stood up against peer scrutiny.<BR/><BR/>
						Contact:<BR/>
						Neal Lao<BR/>
						(734) 647-7087<BR/>
						njlao@umich.edu <BR/><BR/>
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
