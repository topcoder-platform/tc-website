<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Student Representatives</title>

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
                <jsp:param name="level1" value="about"/>
                <jsp:param name="level2" value="student_rep"/>
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
                <tr><td align="center"><img src="/i/about/student_rep_header.gif" alt="Represent TopCoder on your College Campus." width="545" height="53" border="0" /></td></tr>
    </table>

    <table width="545" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="bodyText">
                    <img src="/i/clear.gif" alt="" width="10" height="5" border="0" /><br/>

                            <p> <img src="/i/clear.gif" alt="" width="10" height="10" border="0" align="left"/><img src="/i/about/student_rep_students.jpg" alt="Represent TopCoder on your College Campus." width="131" height="100" border="0" align="left" style="padding-left: 0px; padding-top: 0px; padding-right: 15px; padding-bottom: 7px;"/><strong>It's that time of year again - time to start advertising for the 2004 TopCoder Collegiate Challenge.   We want participation in the 
                            2004 TCCC to reach record levels, and we need your help in order to make that happen. TopCoder needs Student Representatives from hundreds of colleges and universities world wide!</strong></p>

                        
                        
                    </td>
                </tr>
           </table>
                        
            <table border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="545" class="bodyText">
                    <img src="/i/clear.gif" alt="" width="10" height="10" border="0" />
                        <p><strong>What would your responsibilities be as a Student Rep?</strong></p>

                        <p><A href="Javascript:openWin('/tc?module=Static&d1=about&d2=student_rep_poster','comp',310,425);"><img src="/i/about/student_rep_poster_sm.gif" alt="View the poster" width="109" height="77" border="0" align="right" /></A>Your sole responsibility would be to help increase the number of participants in the 2004 TopCoder Collegiate Challenge. To help you achieve that goal, 
                            TopCoder will provide you with posters to hang around your campus. </p>
                        
                        <p><strong>What do you get for being a Rep?</strong></p>
                        
                        <p><A href="Javascript:openWin('/tc?module=Static&d1=about&d2=student_rep_tshirt','comp',800,600);"><img src="/i/about/student_rep_tshirt_sm.gif" alt="View the poster" width="100" height="70" border="0" align="left" style="padding-left: 0px; padding-top: 0px; padding-right: 7px; padding-bottom: 0px;"/></A>We will send a Limited Edition 2004 TopCoder Collegiate Challenge Student Rep t-shirt to each Rep who gets at 
                        least one person from his/her school to register as a TopCoder member <strong><i>and</i></strong> compete in the Qualifying Round of the 2004 TCCC. 
                        That person must state either your handle or "Poster" as the reason for registering at TopCoder.</p>
                        

                        <p><strong>How to get started:</strong></p>
                                    <ol>
                                        <li><a href="mailto:mluce@topcoder.com?subject=TopCoder Student Reps">Contact us</a>  that you're willing to take the position for your campus.</li>
                                        <li>Include your mailing address in the e-mail.  This will be the address where the posters are sent.</li>
                                        <li>Include how many posters you want - they come in packages of 10.</li>
                                    </ol>
                       <p>There can only be one Rep at each school. Positions will be filled on a first come, first served basis, so act fast!</p>
                
                        
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
               <jsp:param name="level1" value="about"/>
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
