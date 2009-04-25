<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Tournaments</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<script language="JavaScript">
function changeImage(image, newImage) {
document[image].src=newImage;
return;
}
function open_window(url) {
mywin =
window.open(url,"win",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=433,height=288');
}
</script>
</head>

<body>

<jsp:include page="/top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div style="margin: 0px 10px 0px 10px;">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="press_room"/>
    <jsp:param name="title" value="TopCoder Press Release"/>
</jsp:include>

<P CLASS="bodyTextBold">08.01.2001 - Rating System Updated<BR/></P>
<P>The following changes were made to the rating system on August 1st. The ratings were recalculated retroactively for all rated events that have taken place at TopCoder.</P>
<P>* The volatility factor no longer directly affects the rating. However, the volatility factor is still calculated for each member, and used to calculate expected rank.</P>
<P>* In the rating calculation, the weight of the most recent competition has been decreased. The floor (after infinity rated events) used to be 25% - it is now 18% - however, for yellow members (rating between 2000 and 2499) the weight will be reduced by an additional 10%, and for red members (2500-3000) the weight will be reduced by an additional 20%.</P>
<P>* There is now a dynamic cap on the number of rating points a coder can gain or lose in a rated event. The cap is calculated as: 150 + 1500 / (1+NumTimesRated).</P>
<P>* New members who have never competed will now have no rating (a rating of zero). Their performance will not affect the rating of others in the competition, and after their first competition they are given a rating based on how they did relative to the rated members in the competition.</P>



   <br><br>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
