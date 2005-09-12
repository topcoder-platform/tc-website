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
                        <p><span class="bodyTitle">Poland Takes the Lead</span><br />
                        [Translation of PC World Komputer Poland article, found <A href="http://www.pcworld.pl/news/82941.html">here</A>]
                        </p>
                        </div>
                        
                        <p><strong>September 12, 2005&#151;</strong>Poland has just left the US behind and taken first place in TopCoder's country ranking. Warsaw University occupies the first place in university ranking (University of Wroclaw is 13th, Jagiellonian University is 14th).
<br><br>
TopCoder programming competitions take place every week. At least once a year a huge tournament with onsite finals is held. TopCoder, Inc, the company that runs the competitions, has given out over $2 Million in prizes, including $1.3 Million in tournaments and $800,000 in weekly online competitions since its beginning four years ago.
<br><br>
The first place ranking of Warsaw University is no surprise - the school has been number one since February. There are three more Polish universities in the top 25 school worldwide: University of Wroclaw, (13th place), Jagiellonian University, (14th place) and Poznan University of Technology, (21st place). Ranking is based on the performance of the best students from each school.
<br><br>
Now we have a new reason to be proud - thanks to the excellent results of Polish students, Poland has just taken the first place in country ranking. We are followed by the US, Russia, Canada and China.
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
