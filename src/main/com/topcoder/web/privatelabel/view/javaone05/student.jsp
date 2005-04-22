<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel=stylesheet href="/css/javaone05.css">
<title>2005 JavaOne Coding Challenge</title>
</head>
<body>
<map name="bannerMap">
<area shape="rect" alt="http://www.sun.com/" coords="697,4,799,72" href="http://www.sun.com/" target="_new">
<area shape="rect" alt="http://java.sun.com/" coords="624,3,694,72" href="http://java.sun.com/" target="_new">
<area shape="rect" alt="http://www.sun.com/javaone" coords="0,7,616,70" href="http://www.sun.com/javaone" target="_new">
</map>

<center>
<table id="main" width="800" cellpadding="0" cellspacing="0" border="0">
            <tr>
               <td colspan="2" align="left" valign="middle">
               <img src="/i/events/javaone05/banner_top.gif" border="0" usemap="#bannerMap" alt="JavaOne - Experiencing Java technology through education, industry, and community">
               </td>
            </tr>
            <tr>
               <td valign="top" width="164"><jsp:include page="links.jsp" /></td>
               <td valign="top" >
                 <table border="0" width="100%" cellpadding="7" cellspacing="0"><tr><td valign="top"><img src="/i/events/javaone05/coding_challenge.gif" width="351" height="27" border="0" /></td>
                 <td align="right" valign="top"><a href="/"><img src="/i/events/javaone05/pbtc_logo.gif" width="130" height="27" border="0" /></a></td></tr></table>
                    <p class="regmiddle">   
                       <a href="/pl/?&module=Static&d1=javaone05&d2=earlybird"><b>Early Bird Discount</b></a>&#160;&#160;|&#160;&#160;
                        <b>Student Discount</b></p>
               <p class ="regmiddle"><strong><font size="4">Student Discount</font></strong></p>
               
                  <p class="regmiddle">JavaOne<sup>SM</sup> Conference: TopCoder students and professors SAVE over $1000 with Academic Pricing!</p>

                  <p class="regmiddle">REGISTER by June 25 as a full-time student or active faculty and save!<br/>
                                 Student Rate: $395<br/>
                                 Faculty Rate: $895</p>

                  <p class="regmiddle">Java&#153; technology is everywhere, improving the digital experience for everyone. It all starts at the 
                  JavaOne Conference, your source for cutting-edge knowledge and proven solutions. </p>

                  <p class="regmiddle">Whether you are a student or a faculty member, the JavaOne Conference offers you an unparalleled 
                  opportunity to tap the sources of innovation for Java technology. </p>

                  <p class="regmiddle"><strong>Discover Real World Solutions</strong><br/>
                  Engaging technical topics, interactive Birds-of-a-Feather sessions and 
                  Hands-on Labs, insightful General Sessions, the hottest new products in the JavaOne Pavilion: These are just a few 
                  reasons why you should be at the Conference. You'll learn how to code simpler and faster, and create dynamic, secure 
                  applications directly from the experts-the masters and creators at the core of Java technology.</p>

                  <p class="regmiddle"><strong>Conference Overview</strong><br/>
                     Hundreds of in-depth technical sessions give you the skills and training you need. This year's topics cover seven 
                     key areas important to you:<br/>
                     Topic 1-Core Platform<br/>
                     Topic 2-Core Enterprise Technologies<br/>
                     Topic 3-Desktop<br/>
                     Topic 4-Web Tier<br/>
                     Topic 5-Tools<br/>
                     Topic 6-Mobility and Devices<br/>
                     Topic 7-Cool Stuff</p>


                  <p class="regmiddle">To register, call 1-888-886-8769 and identify yourself as a student or faculty member from the 
                  TopCoder program.* </p>

                  <p class="regmiddle">Find all your solutions at the 2005 JavaOne conference.</p>

                  <p class="regmiddle">We look forward to seeing you in San Francisco this June!</p>

                  <p class="regmiddle">*This offer is available to full-time students and faculty or staff only. Full-time student 
                  status will be verified with a copy of your valid student identification card from an accredited college or university 
                  and a copy of your current course schedule with no less than eight credits. For faculty or staff, a letter on school 
                  letterhead from your department head or dean must be submitted to verify full-time status.</p>

                  <p class="regmiddle">This offer is not valid for Web-based registration. Be sure to mention Registration Code "TCODER1" when you register. Offer expires June 25, 2005. </p>
               </td>
            <tr>
               <td colspan="2" align="left" valign="middle">
                  <jsp:include page="foot.jsp" />
               </td>
            </tr>
            
         </table>
</center>
   </body>
</html>