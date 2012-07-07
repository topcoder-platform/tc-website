<%@  page
 language="java"
 errorPage="/errorPage.jsp"
  import="com.topcoder.common.web.data.Navigation,
          com.topcoder.shared.util.ApplicationServer"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Working at TopCoder</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
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
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="working_tc"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="99%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br>
        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="about_tc"/>
           <jsp:param name="image1" value="white"/>
           <jsp:param name="title" value="Working at TopCoder"/>
        </jsp:include>

        <table border="0" cellspacing="0" cellpadding="0" width="100%">
                  <tr>
                        <td><img src="/i/clear.gif" alt="" width="11" height="10" border="0"/></td>
                     </tr>
                      <tr>
                        <td class="statText" bgcolor="#43515E" height="18" valign="middle">&#160;&#160;<strong>Great Jobs at TopCoder</strong></td>
                     </tr>
                  </table>


            <table border="0" cellspacing="0" cellpadding="0"  width="100%">
                <tr valign="top">
                    <td class="bodyText" width="100%"><br/>

                       <h3>TopCoder Platform Manager</h3>

						<ul>
						    <li>TopCoder is based on innovation. We have created the first ever competitive software development methodology. 
						    We need your help to manage and evolve our process of competitive innovation and software development.</li>
							<li>We are looking for smart, passionate people that are quick learners and can successfully onboard the 
							TopCoder process at enterprise customers.</li>
						</ul>

                        <p><strong>Responsibilities:</strong></p>

             			<ul>
							<li>Work closely with customers to explore and identify business and software needs - educate customers on using tactical and strategic innovation within their organization. </li>
							<li>Guide customers in the use of an innovative, distributed software development methodology in order to add significant value to their business.</li>
							<li>Manage project timelines, budget, and distributed process controls.</li>
							<li>Help to improve TopCoder's innovative, competitive software development methodology and associated processes.</li>
                        </ul>

                        <p><strong>Other Requirements:</strong></p>

             			<ul>
							<li>Bachelor degree.</li>
							<li>Must be willing to travel Monday-Friday within the continental United States.</li>
							<li>Candidates must be US Citizens, have a valid Green Card, or be eligible for a TN visa. </li>
                        </ul>

                        
                        <p>TopCoder is passionate about innovation and building long lasting relationships with companies interested in finding 'a better way' to do things.  To start or continue a management career in a forward-thinking environment that offers a lucrative compensation structure focused on performance,  <a href="mailto:jobs@topcoder.com?subject=Platform Manager">apply for this job<a/>.</p>
                    </td>
                </tr>
            </table>

            <p><br></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="about"/>
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
