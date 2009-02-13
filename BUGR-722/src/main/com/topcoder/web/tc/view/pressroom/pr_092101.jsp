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

<P CLASS="bodyTextBold">09.21.2001 - Updated 2001 Invitational Schedule<BR/></P>
<P>The schedule for the 2001 TopCoder Invitational has been revised. Please note that a new timeslot has been added to the end of the schedule of online rounds. The new schedule is as follows:</P>
<P><SPAN CLASS="bodyTextBold">First Round (online):</SPAN><BR/>Tue. Sept. 25 at 9:30 PM EDT (registration from 7:30 PM EDT through 9:20 PM EDT)</P>
<P><SPAN CLASS="bodyTextBold">Second Round (online):</SPAN><BR/>Wed. Oct. 3 at 9:30 PM EDT</P>
<P><SPAN CLASS="bodyTextBold">Third Round (online):</SPAN><BR/>Wed. Oct. 10 at 9:30 PM EDT</P>
<P><SPAN CLASS="bodyTextBold">On-site Championship Rounds:</SPAN><BR/>The schedule for the championship rounds has not changed. They will be held on November 2nd and 3rd at Foxwoods Resort Casino in Connecticut.  </P>



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
