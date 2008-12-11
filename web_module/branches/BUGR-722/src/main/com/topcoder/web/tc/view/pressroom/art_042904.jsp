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
                        <p><span class="bodyTitle">And The Champion Coders Are...</span></p>
                        </div>
                        
<p>
In software, no country is hotter than India. But at the Apr. 16 TopCoder Collegiate Challenge, software's world championship in Boston, the programming powerhouse was all but invisible. A 22-year-old Pole, Tomasz Czajka, won the $25,000 prize for the second year in a row, edging out rivals from the U.S., Canada, and Australia.
</p>
<p>
Indians barely ranked as also-rans: 58 Indian students were among 705 competitors in the early rounds, but none made it into the 24-person programming final.
</p>
<p>
The country consistently trails. Officials at TopCoder, the Glastonbury (Conn.) company that runs the contests, have ranked competition results of 36,000 programmers over three years. University of Warsaw ranks highest, with its students in the 97th percentile. Massachusetts Institute of Technology students finish, on average, in the 86th. Indian Institute of Technology is far behind, in the 56th percentile. Topcoder officials say the contests reflect pure math skills. But G. Sivakumar, head of computer science at IIT Bombay, says students need training for the contests because they're races against the clock. He says the Chinese already provide courses, and that India will likely follow.
</p>
<p>
Companies such as Yahoo! (YHOO) and Intel (INTC) sponsor the contest and use it as a recruiting tool. While India is sure to keep landing its share of software jobs, look for recruiters to keep banging on doors in places such as Boston and Warsaw, too.
</p>
<p>By Stephen Baker</p>
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
