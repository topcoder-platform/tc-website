<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>DoubleClick</title>

<jsp:include page="../script.jsp" />

<link type="text/css" rel="stylesheet" href="/css/doubleclick.css"/>

</head>
<body align="center">

<jsp:include page="links.jsp" >
   <jsp:param name="tabLev1" value="collegiate"/>
   <jsp:param name="tabLev2" value="schedule"/>
</jsp:include>

<div class="dc_bodyTable">

   <div CLASS="dc_headerPic">
      <img src="/i/events/doubleclick/headers/guyNcode.jpg" border="0" width="163" height="180"/>
   </div>

   <div CLASS="dc_bodyText">
         <p class="pageTitle">Schedule</p>
         
         <table class="sidebarBox" width="500" cellpadding="6" cellspacing="2">
            <tr>
               <td class="sidebarTitle" size="33%">Event</td>
               <td class="sidebarTitle" size="33%">Date</td>
               <td class="sidebarTitle" size="33%">Time</td>
            </tr>
            <tr>
               <td class="sidebarText">Registration Opens</td>
               <td class="sidebarText">Monday, February 9</td>
               <td class="sidebarText">9:00AM</td>
            </tr>
            <tr>
               <td class="sidebarText">Registration Closes</td>
               <td class="sidebarText">Sunday, February 15</td>
               <td class="sidebarText">12:00PM(noon)</td>
            </tr>
            <tr>
               <td class="sidebarText">Qualification Session #1 - unlimited participation</td>
               <td class="sidebarText">Monday, February 16</td>
               <td class="sidebarText">9:00AM - 9:00PM</td>
            </tr>
            <tr>
               <td class="sidebarText">Qualification Session #2 - unlimited participation</td>
               <td class="sidebarText">Wednesday, February 18</td>
               <td class="sidebarText">9:00AM - 9:00PM</td>
            </tr>
            <tr>
               <td class="sidebarText">Main Competition Round - all qualifiers</td>
               <td class="sidebarText">Friday, February 20</td>
               <td class="sidebarText">4:00PM</td>
            </tr>
            <tr>
               <td class="sidebarText">Final Round - 10 finalists</td>
               <td class="sidebarText">Friday, February 27</td>
               <td class="sidebarText">1:00PM</td>
            </tr>
         </table>

   </div>
</div>
   
<jsp:include page="foot.jsp" />

</body>
</html>