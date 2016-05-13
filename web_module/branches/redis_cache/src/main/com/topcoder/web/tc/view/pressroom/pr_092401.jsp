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

<P CLASS="bodyTextBold">09.24.2001 - Foxwoods to Host $250,000 TopCoder Invitational Tournament<BR/></P>
<P>Glastonbury, Conn. - September 24, 2001 - TopCoder's top-16 computer programmers will descend upon the Foxwoods Resort Casino in Mashantucket, CT on November 2 and 3, to take part in the 2001 TopCoder Invitational Tournament. The total prize purse for the tournament is $250,000, with the winner walking away with $100,000.</P>
<P>"We welcome TopCoder and all the participants in this exciting competition to Foxwoods," said Bob DeSalvio, Foxwoods' Executive Vice President of Marketing. "It's an honor to host such a group of top quality programming professionals."</P>
<P>The Invitational, which begins on September 25, consists of three online elimination rounds. TopCoder's top-256 competitors are invited to participate based on their TopCoder rating, which is determined by their performance in previous competitions throughout the year. The online elimination rounds reduce the field to 16 finalists. In all TopCoder competitions, contestants have the option of writing solutions to algorithmic problems in one of two programming languages, Java or C++.</P>
<P>"TopCoder serves to bring excellent programmers together with leading companies in search of high-tech talent," said TopCoder founder and Chairman Jack Hughes, a veteran programmer. "We're confident our programming competitions test and reflect real-world coding skills in a way that's valuable to our constituents. Our fast-growing membership base is already proof of that. By hosting these competitions, TopCoder will provide the means for leading companies to access the upper echelon of computer programmers."</P>
<P CLASS="smallText">About TopCoder, Inc.<BR/>
TopCoder, Inc. organizes and hosts online and onsite programming competitions for its members. Since the introduction of TopCoder in February, these competitions have attracted over 3,600 software developers, with the month of September averaging 30 new members per day. The attraction of competition and the associated rewards create a powerful community of programmers. Access to this community is granted to corporate partners who both promote and profit from the relationship. For more information and registration details, visit the Web site, http://www.topcoder.com/?r=11.</P> 



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
