<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Student Representatives<title>

<jsp:include page="../../script.jsp" />

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="level1" value="home"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td class="bodyText" align="center">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr><td height="15"><img src="/i/clear.gif" alt="" width="10" height="15" border="0" /></td></tr>
                <tr><td align="center"><img src="/i/about/student_rep_header.gif" alt="Represent TopCoder on your College Campus." width="545" height="32" border="0" /></td></tr>
    </table>

    <table width="545" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="bodyText">
                        <strong>It's that time of year again - time to start advertising for the 2004 TopCoder Collegiate Challenge.   We want participation in the 
                        2004 TCCC to reach record levels, and we need your help in order to make that happen.   We are in need of a Student Representative from 
                        your school and we'd like to give you the opportunity.</strong><br/>
                        <img src="/i/clear.gif" alt="" width="10" height="10" border="0" />
                    </td>
                </tr>
            </table>
                        
            <table border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="360" class="bodyText">
                        <p>What would your responsibilities be as a Student Rep?</p>

                        <p>Your sole responsibility would be to increase the number of participants in the 2004 TCCC from your school. To help you achieve that goal, 
                        TopCoder will provide you with posters to hang around campus.</p>
                        
                        <p>What do you get for being a Rep? Pretty cool stuff, if you ask us!</p>
                        
                        <p>We will send a Limited Edition 2004 TopCoder Collegiate Challenge Student Rep t-shirt to each Rep who gets at 
                        least one person from his/her school to register as a TopCoder member and compete in the Qualifying Round of the 2004 TCCC. 
                        That person must state either your handle or "Poster" as the reason for registering at TopCoder.</p>
                        
                        <p>For the Reps who get over 30 people to register at TopCoder and compete in the Qualifying Round of the 2004 TCCC, we will also 
                        send a $50 gift certificate to be used at the TopCoder Online Store, which will feature exclusive TopCoder apparel.</p>
                        
                        <p>If you are interested in being a Student Rep, here's what you need to do:</br>
                            1.  <a href="mailto:mluce@topcoder.com?subject=TopCoder Student Reps">Contact us</a> that you're willing to take the position for your campus.</br>
                            2.  Include your mailing address in the e-mail.  This will be the address where the posters are sent.</br>
                            3.  Include how many posters you want - they come in packages of 10.</p>
                    </td>
                        

                    <td width="175" class="bodyText">
                        <table border="0" cellpadding="3" cellspacing="0" class="sidebarFrame" width="175">
                            <tr><td class="sidebarTitle">Upcoming Events</td></tr>

                            <tr valign="top">
                                <td class="sidebarText">
                                    <p>The 2004 TopCoder Collegiate Challenge is on the way! We are looking for student reps to help increase 
                                    the number of participants in the 2004 TCCC from your school. To help you achieve that goal, 
                                    TopCoder will provide you with posters to hang around campus. </p>

                                    <strong>If you get at least one student to register:</strong>
                                    <ul>
                                        <li>You will recieve a Limited Edition 2004 TopCoder Collegiate Challenge Student Rep t-shirt</li>
                                    </ul>
                         
                                    <strong>If you get 30 students to register:</strong>
                                    <ul>
                                        <li>You will recieve a $50 gift certificate to be used at the TopCoder Online Store, which will feature exclusive TopCoder apparel</li>
                                    </ul>

                                    <strong>How to get started:</strong>
                                    <ul>
                                        <li><a href="mailto:mluce@topcoder.com?subject=TopCoder Student Reps">Contact us</a>  that you're willing to take the position for your campus.</li>
                                        <li>Include your mailing address in the e-mail.  This will be the address where the posters are sent.</li>
                                        <li>Include how many posters you want - they come in packages of 10.<li>
                                    </ul>

                                    
                                </td>
                            </tr>
                        </table>
                        
                        <img src="/i/clear.gif" alt="" width="175" height="1" border="0" />

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
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
