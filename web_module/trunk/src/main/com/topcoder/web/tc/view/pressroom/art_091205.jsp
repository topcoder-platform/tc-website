<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

<jsp:include page="../script.jsp" />
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
                <jsp:param name="level1" value="press_room"/>
                <jsp:param name="level2" value=""/>
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
                        <p><span class="bodyTitle">Poland leads TopCoder</span><br />
                        [Translation of IDG.pl article, found <A href="http://www.idg.pl/news/82941.html">here</A>]
                        </p>
                        </div>
                        
                        <p><strong>September 12, 2005&#151;</strong>Poland has just overtaken the United States as first place in the TopCoder country ranking. Warsaw University is first place in university ranking , University of Wroclaw is 13th, and Jagiellonian University is 14th.
<br><br>
TopCoder programming competitions take place every week. At least once a year a huge tournament with onsite finals is held. TopCoder Inc, the company that runs the competitions, has given out over $2 mill in prizes, including $1.3 mill in tournaments and $800,000 in weekly online competitions over the past four years.
<br><br>
Warsaw University has been in first place since February. There are three more Polish universities in the top 25 schools worldwide: University of Wroclaw (13th place), Jagiellonian University (14th place) and Poznan University of Technology (21st place). Ranking is based on performance of the best students from each school.
<br><br>
We are very proud of the excellent results of Polish students, which have put Poland in first place in the TopCoder country ranking, followed by USA, Russia, Canada, and China.
                        </p>
                        <p>###</p>
                        <p><br /></p>
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
