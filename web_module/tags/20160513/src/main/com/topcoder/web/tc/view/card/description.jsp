<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Member Card</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="myHome">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="my_topcoder"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->


       <c:choose>
           <c:when test="${not empty isNewStyle && isNewStyle}">
               <!-- Center Column Begins -->
               <td class="cardCell" width="100%" align="center">

                   <!-- card-body -->
                   <section id="card-body">

                       <h2>topcoder Member Badges & Cards</h2>

                       <span class="subtitle">Now you're a pro...</span>


                       <h3>Show your skills</h3>

                       <p>Ever wanted to show off your TopCoder skills on your personal site? Want that ace in the hole at your next job interview? The TopCoder Member Badges and Cards are the answer, and they're <strong>free</strong>!</p>

                       <h3>Member Badges</h3>
                       <a href="/card?module=Downloads"><img src="/i/reskin/rated-member-badge.png" alt="Rated Member Badge"></a>
                       <p>A TopCoder Badge is the perfect seal of approval for anyone trying to make their experience stand out.  Just place one of the TopCoder Badge images on your resume or website and you're sure to grab some attention.  Each graphic shows that you are a TopCoder rated member, signifying your skill as one of the best programmers around.  On our downloads page we have several sizes and variations for you to choose from.  So go pick your favorite and start showing off.</p>

                       <p><a href="/card?module=Downloads">Go to the TopCoder Badges downloads page</a></p>

                       <h3>Member Cards</h3>
                       <p>
                           Like collectible cards?  How about a digital card that never gets worn out?  How about a card with statistics that are always up-to-the-second accurate?  Now how about a card where <strong>you</strong> are the star?  Sound good?<br><br>

                           That is exactly what the TopCoder Member Card is.  It is a digital tool that lets you show off your skills at coding and software development anywhere on your personal website, and it does it in a stylish way.  Covered with member statistics and always accurate, the TopCoder Member Card is truly something no TopCoder should be without. Click below to see a preview of what your card will look like!<br><br>

                           Know any other TopCoder Members? Why not build a TopCoder Member Card collection. You could have a site to represent your college where anyone can go to see every member's card on your campus.  You could build a site where you and all your coworkers can compare stats, see who else they work with, and find out who is the best in the company. It's all possible with the TopCoder Member Cards.</p>

                       <p><a href="/card?module=Preview">See your TopCoder Card preview</a></p>

                   </section>
                   <!-- End card-body -->
                   <p><br></p>
               </td>
               <!-- Center Column Ends -->
           </c:when>
           <c:otherwise>
               <!-- Center Column Begins -->
               <td class="cardCell" width="100%" align="center">

                   <div class="cardBody">

                       <div align="center"><img src="/i/card/banner.gif" border="0" usemap="#cards"/></div>
                       <map name="cards">
                           <area shape="rect" alt="" coords="0,50,135,135" href="/card?module=Preview" />
                       </map>


                       <h2>Show your skills</h2>

                       <p>Ever wanted to show off your TopCoder skills on your personal site? Want that ace in the hole at your next job interview? The TopCoder Member Badges and Cards are the answer, and they're <strong>free</strong>!</p>

                       <p><span class="bodySubtitle">Member Badges</span><br/>
                           <a href="/card?module=Downloads"><img src="/i/card/badge1_150x50.gif" border="0" align="right" hspace="5" vspace="5"/></a>
                           A TopCoder Badge is the perfect seal of approval for anyone trying to make their experience stand out.  Just place one of the TopCoder Badge images on your resume or website and you're sure to grab some attention.  Each graphic shows that you are a TopCoder rated member, signifying your skill as one of the best programmers around.  On our downloads page we have several sizes and variations for you to choose from.  So go pick your favorite and start showing off.</p>

                       <p>Go to the <a href="/card?module=Downloads">TopCoder Badges downloads page</a></p>

                       <p><span class="bodySubtitle">Member Cards</span><br/>
                           Like collectible cards?  How about a digital card that never gets worn out?  How about a card with statistics that are always up-to-the-second accurate?  Now how about a card where <strong>you</strong> are the star?  Sound good?<br/><br/>

                           That is exactly what the TopCoder Member Card is.  It is a digital tool that lets you show off your skills at coding and software development anywhere on your personal website, and it does it in a stylish way.  Covered with member statistics and always accurate, the TopCoder Member Card is truly something no TopCoder should be without. Click below to see a preview of what your card will look like!<br/><br/>

                           Know any other TopCoder Members? Why not build a TopCoder Member Card collection. You could have a site to represent your college where anyone can go to see every member's card on your campus.  You could build a site where you and all your coworkers can compare stats, see who else they work with, and find out who is the best in the company. It's all possible with the TopCoder Member Cards.</p>

                       <p>See <a href="/card?module=Preview">your TopCoder Card preview</a></p>

                   </div>
                   <p><br/></p>
               </td>
               <!-- Center Column Ends -->
           </c:otherwise>
       </c:choose>



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
