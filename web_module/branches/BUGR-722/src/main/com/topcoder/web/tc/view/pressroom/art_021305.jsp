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
                        <p><span class="bodyTitle">Program for life</span><br/>
                        <span class="bodySubTitle"><em>By Pawel Gorecki<br />NewsWeek Poland</em></span></p>
                        </div>

<p>
They get their Ph.D.'s at the age of twenty. At thirty they become
professors in America. Warsaw University graduates are some of the best computer scientists in the world.
<br /><br />
There are millions of computers and millions of computer programmers
at hundreds of different colleges, but only at a select few places in the
world is our future being programmed. Three of them - Massachusetts
Institute of Technology, Stanford University and the California Institute
of Technology - are a surprise to no one. But hardly anyone knows that
the list of the best also includes Warsaw University. This year,
Warsaw's Faculty of Informatics has a good chances to overtake the US
computer science giants. For sure, not by the number of students and
not with the scale of facilities, but by the scientific ability of its best graduates.
<br /><br />
The most prestigious competitions are organized by the computer science
portal TopCoder and by the Association for Computing Machinery (ACM). For
programmers, TopCoder tourneys are like the soccer World Cup. Each of the
few thousand competitors has four elimination rounds to get through. Every
week programmers from Sydney to Vladivostok solve problems over the
Internet. However the most important are the finals, to which the best
contestants go in person. A victory means $25,000 in prize
money and job offers from the best colleges and companies. The other
programming tournament, organized by the ACM, recognizes teams of
programmers. In both, for the last few years Poles are amongst the top
players. Moreover - in the rank list prepared by TopCoder, Warsaw
University was classified amongst the top five of the best computer
science departments in the world. In January CNN, an American news
channel, announced the high rank of the Polish university. In March the
next finals are going to be held in Santa Clara. Where are such successes
coming from in a country in which hard science drags its feet,
universities do not have money for heating and students can't afford books?
</p>
ê                        <p><br /></p>
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
