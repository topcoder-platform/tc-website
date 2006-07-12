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
<p><span class="bodyTitle">TopCoder Software Delivers Component-Based E-Commerce Solution to Stage Stores, Inc.</span><br />
<span class="bodySubTitle"><em>Custom Web Application Enables Online Gift Card Service for Leading Retailer</em></span></p>
</div>

<p><strong>GLASTONBURY, Conn., April 19, 2004&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that Stage Stores, Inc. the Houston, Texas-based regional department store retailer, has successfully upgraded its website to allow online purchasing of gift cards using TopCoder Software, Inc.'s unique competitive development methodology and reusable component catalog.
</p>
<p>
Stage Stores has implemented a high quality enterprise solution to reduce the inconvenience and cost of customers having to call an 800 number to purchase gift cards. The customized web solution is compatible across Apache Web Server, Tomcat Servlet Engine and Oracle RDBMS platforms and was designed and developed by TopCoder Software using the company's unique development methodology and catalog of more than 150 reusable components. With this custom e-commerce application, online purchasing now both reduces the cost in operating call centers and increases Stage Stores' customer satisfaction with a new, easy-to-use interface. 
</p>
<p>
"We undertook this initiative with the goals of providing our customers with a faster and more convenient way of purchasing gift cards, while at the same time lowering our processing costs," said Jeff Kish, Chief Information Officer for Stage Stores, Inc. "TopCoder Software has helped us to meet our goals while providing us with an impressive level of quality and consistency." 
</p>
<p><span class="bodySubTitle">TopCoder Software Methodology</span><br />
Every time a software component or application is required, TopCoder Software developers around the globe compete to design and build the best implementation via a rigorous specification and evaluation process.  For most companies the overhead cost would far outweigh any benefits; however a unique business model of using competition among thousands of TopCoder-qualified members as an evaluation and recruitment method allows TopCoder Software to deliver high quality software components and applications for a fraction of the cost of traditional approaches. The TopCoder Software Application Development Methodology utilizes the TopCoder Software Component Catalog and a distributed member base to create robust, high quality applications. It combines a unique Component Development Methodology with peer review, components customization, and application integration processes." TopCoder Software's lowered fixed-costs and reusable JAVA and .NET infrastructure component catalogs add up to a far superior solution for our clients," said Dave Tanacea, President of TopCoder Software, Inc.  "Our competitive development methodology means the customer always gets the best developers regardless of their location, providing a "best shore" alternative to off-shore development." 
</p>
<p><span class="bodySubTitle">About Stage Stores</span><br />
Stage Stores, Inc. brings nationally recognized brand name apparel, accessories, cosmetics and footwear for the entire family to small towns and communities through 518 stores located in 27 states. The Company operates under the Bealls, Palais Royal and Stage names throughout the South Central states, and under the Peebles name throughout the Mid-Atlantic, Southeastern and Midwestern states. Stage Stores is located on the World Wide Web at http://www.stagestoresinc.com
</p>
<p><span class="bodySubTitle">About TopCoder, Inc.</span><br />
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.
</p>
<p>
TopCoder is a trademark of TopCoder, Inc. in the United States and other countries.
</p>
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
