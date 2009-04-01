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

<P CLASS="bodyTextBold">04.24.2001 - TopCoder Names Jack Hughes Chairman of the Board<BR/></P>
<P>GLASTONBURY, CT, April 24, 2001 - TopCoder Inc., a Glastonbury, Connecticut-based company committed to identifying top-notch computer programming talent, has named Jack Hughes as chairman of the board.</P>
<P>Mr. Hughes, 39, was the co-founder and former chairman of Tallan, Inc., an application development professional services firm. In 2000, CMGI, Inc. acquired a majority ownership of the company. Mr. Hughes founded TopCoder late last year.</P>
<P>"I am very excited about joining TopCoder full-time," commented Hughes, a former computer programmer himself. "TopCoder was founded on the premise that talent and skill are the determinant factors in the quality and utility of software - and software has become central to the global economy."</P>
<P>"In my capacities as both a programmer and an executive, I've worked on successful projects that were driven by superior programming skills, yet that talent goes unqualified and, for the most part, unrecognized," Mr. Hughes added. "TopCoder's mission is to create objective ratings that place high value on the programming industry's best and brightest. The company will build opportunity and community for programmers through computer programming tournaments and employer connections."</P>
<P>Under Mr. Hughes' tenure as chairman, Tallan, Inc. was recognized as one of the fastest-growing technology companies in North America four years in a row by consultancy firm Deloitte &amp; Touche. It was also recognized by Inc. magazine and the Connecticut Technology Council for outstanding performance. Mr. Hughes graduated from Boston College with a B.S. degree in computer science. He is director and vice chair of the executive committee and chair of the strategy committee for the Christopher Reeve Paralysis Foundation.</P>
<P>Mr. Hughes lives in Connecticut with his wife and three children.</P>
<P CLASS="smallText">About TopCoder, Inc.<BR/>TopCoder, Inc. organizes and runs programming competitions for its members. Through its Web site, www.topcoder.com, the company has effectively combined attributes of online gaming, recruiting and IT certification. By offering substantial membership incentives, including cash awards, and a unique objective rating model, TopCoder brings together highly qualified, talent-differentiated programmers and acts as a conduit for companies seeking access to such a group. As a commercial site, TopCoder establishes partnerships with organizations in the form of subscriptions and sponsorships.  </P> 



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
