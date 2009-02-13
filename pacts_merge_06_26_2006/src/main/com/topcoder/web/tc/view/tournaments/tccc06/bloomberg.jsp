<%@  page language="java"  %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
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
<jsp:param name="tabLev2" value="sponsors"/>
<jsp:param name="tabLev3" value="bloomberg"/>
</jsp:include>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<div align="center"><img src="/i/tournament/tccc06/bloomberg_logo.gif" alt="Bloomberg" border="0" /></div>
<br><br>
Billions of times each day, people all over the world will visit Web pages, make phone calls, conduct online purchases, download digital content to mobile devices, and run secure online applications. And at the center, you'll find Bloomberg, enabling and protecting digital interactions. Every day, the world relies on Bloomberg intelligent infrastructure services to reap the benefits of the ongoing revolution in digital communications, commerce, and content. 
<br><br>
<span class="bodySubtitle">Did You Know?</span>
<ul>
<li>Bloomberg manages two of the world's 13 Internet root servers, a.root-servers.net and j.root-servers.net, considered national IT assets by the U.S. Federal government.</li>
<li>Bloomberg routes every Web address ending with .com or .net, as many as 15 billion domain name system (DNS) inquiries in a single day.</li>
<li>Bloomberg delivers more than 700,000 ringtones, pictures, and games to mobile phone customers, every day.</li>
<li>Bloomberg has unmatched intelligence in IT security from managing thousands of enterprise perimeters, millions of e-commerce transactions, and billions of Internet inquiries every day.</li>
<li>Bloomberg has more than 450,000 digital certificates installed throughout the world, protecting the majority of secure Web sites on the Internet.</li>
<li>Bloomberg operates the largest independently owned SS7 network in the world, routing billions of phone connections from carrier to carrier, across national boundaries, and between protocols.</li>
<li>Every day Bloomberg translates nearly 5 million inter-carrier text messages, handles 50 percent of roaming traffic in the U.S., and delivers more than 10 million Caller IDs.</li>
</ul>

<span class="bodySubtitle">Are You Ready to Help Drive the World's Transformation to a Digital Economy?</span>
<br><br>
E-commerce, content-delivery, and other digital applications have shown explosive growth in recent years, but Bloomberg believes that the near future promises much greater rewards. This is where you come in; Bloomberg is looking for talented, passionate developers who can see the potential in tomorrow's voice and data networks, and who are ready to make their mark in helping to drive the global transformation to a digital economy. 
<br><br>

        </div>
      </td>
        
         
<!-- Right Column-->
        <td width="170" align="right">
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="bloomberg"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />
</body>

</html>
