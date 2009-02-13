<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="join_us"/>
<jsp:param name="tabLev3" value="to_do"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<span class="bigTitle">What to do in San Diego</span>
<br><br>
TopCoder is thrilled to bring our first tournament to sunny San Diego, California.  From its ideal weather to the pristine beaches, San Diego is a wonderful place to experience.   Here are some attractions that you shouldn't miss if you're attending the TCCC as a spectator or a finalist:
<ul>
<li><A href="/?t=sponsor&c=link&link=http://www.sandiegozoo.org" target="_blank">San Diego Zoo</A>.&#160; The San Diego Zoo is home to 4,000 rare and endangered animals and more than 700,000 exotic plants.  It is also home to the only giant panda bears held in captivity in the United States.  This 100 acre zoo is full of exciting animals and activities for anyone to enjoy.</li>
<li><A href="/?t=sponsor&c=link&link=http://www.buschgardens.com/seaworld/ca/default.aspx" target="_blank">Sea World San Diego</A>.&#160; Experience the underwater world at its best at Sea World.  Feed dolphins, watch <A href="/?t=sponsor&c=link&link=http://www.buschgardens.com/seaworld/ca/as_the_shamu_adventure.aspx" target="_blank">Shamu</A>, encounter rescued manatees, and get transported to the South Pole observing the penguins.  Sea World definitely worth a visit when you are in San Diego.</li>
<li><A href="/?t=sponsor&c=link&link=http://www.sandiego.org/article_set/Visitors/5" target="_blank">The Beaches</A>.&#160; Visiting a beach in San Diego is essential.  The beautiful sand and palm trees make for a picturesque view of the Pacific Ocean.  Whether you're into surfing, swimming, sun tanning, biking or just relaxing, you'll thoroughly enjoy the beaches all around.</li>
<li><A href="/?t=sponsor&c=link&link=http://www.seaportvillage.com" target="_blank">Seaport Village</A>.&#160; Walk along the marina and visit tons of fun shops and eateries.  Enjoy the sail boats and local musicians at their best.</li>
</ul>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>

        </div>
      </td>
        
         
<!-- Right Column-->
        <td width="170" align="right">
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
