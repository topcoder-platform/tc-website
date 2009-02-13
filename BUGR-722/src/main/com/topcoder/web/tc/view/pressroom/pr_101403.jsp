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

<div align="center">
<p><span class="bodyTitle">Talbots Licenses .NET Component Catalog From TopCoder Software</span><br />
<span class="bodySubTitle"><em>Leading Specialty Retailer Takes Advantage of Competitive Software Development Methodology</em></span></p>
</div>

<p><strong>GLASTONBURY, Conn., October 14, 2003&#151;</strong>
TopCoder, Inc., the leader in on-line programming competition, skills assessment and competitive software development today announced 
that Talbots, a large clothing and specialty retailer, has subscribed to the TopCoder Software .NET Component Catalog (<A href="http://www.topcodersoftware.com">www.topcodersoftware.com</A>).  
Licensing TopCoder Software's .NET components will complement Talbots' internal development efforts allowing them to build applications more 
efficiently.</p>

<p>TopCoder Software's .NET and Java Component Catalogs include more than 90 re-usable software components.  Through TopCoder Software's 
competition-based methodology, each component has gone through an intensive design, development, and testing process before being published 
in the catalogs.</p>

<p>"TopCoder is pleased to provide Talbots with leading .NET components.  We continue to leverage our highly skilled member base as a distributed 
development resource to create software and provide programming services for our customers," said David Tanacea, president of TopCoder Software.  
"The reason the catalog is so powerful is that we are the manufacturer.  Our competition based development approach allows us to develop high quality 
software components at a very low cost."</p>

<p><span class="bodySubTitle">About Talbots</span><br />
Talbots was founded in 1947 in a 17th-century colonial frame house in Hingham, Massachusetts, a suburb of Boston.  The following year, the 
Company launched its direct mail business by distributing 3,000 black-and-white flyers to names obtained from The New Yorker magazine.</p>

<p>Today, Talbots is a leading national specialty retailer, cataloger and e-tailer of classic apparel, shoes and accessories.  At the end of fiscal year 
2002, Talbots operated 886 stores throughout the U.S., Canada and the United Kingdom and its catalog operation circulated approximately 50 million 
catalogs worldwide.  Talbots online shopping site is located at <A href="http://www.talbots.com">www.talbots.com</A>.  Each of its three sales channels offers the classic, high quality 
merchandise that has been Talbots' trademark for more than 50 years.</p>

<p><span class="bodySubTitle">About TopCoder Software</span><br />
TopCoder Software harnesses the talent of the internationally ranked TopCoder member base to design, develop and implement cost-effective, high 
quality software.  Through a unique competition-based development methodology, TopCoder Software leverages its catalogs of re-usable components 
to develop and deliver commercial applications and services.  For more information regarding TopCoder Software, please visit 
<A href="http://www.topcodersoftware.com">www.topcodersoftware.com</A>.</p>

<p>TopCoder is a trademark of TopCoder, Inc. in the United States and other countries.</p>

<p>###</p>



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
