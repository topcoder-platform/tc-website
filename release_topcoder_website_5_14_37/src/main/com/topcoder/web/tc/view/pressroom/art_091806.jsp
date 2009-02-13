<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
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
                        <jsp:param name="title" value=""/>
                    </jsp:include>

<div align="center"><span class="bodyTitle">In memoriam: victor_lxd</span><br/></div>
                        
<p>
We are deeply saddened to share the news that TopCoder member Xiao Dong Li - <tc-webtag:handle coderId="13377493" /> - passed away last week at the age of 26, due to injuries sustained in a car accident. He is survived by his wife, Cynthia Li, and his parents.
<br><br>
While a member for less than two years, Victor made an extraordinary contribution during his time in the TopCoder community. Among his other accomplishments, he attended three on-site tournaments, twice as a member of the review board and once as a design finalist. More importantly, he was dedicated and considerate, and a wonderful person to work with and know.
<br><br>
If you wish to send a gift to help Victor's family, you may direct monetary gifts to Cynthia's cousin Cindy Lee, who is managing the family finance's while Cynthia recovers from injuries she sustained in the accident. Please make checks payable to:
<br><br>
Cindy Lee<br>
25981 Hinckley Street<br>
Loma Linda, CA 92354
<br><br>
Or, if you wish, you may donate a portion of your outstanding TopCoder winnings to Victor's family between now and October 15. Please email <A href="mailto:donations@topcoder.com">donations@topcoder.com</A> for more information.
</p>
                        <p><br /><br /></p>
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
