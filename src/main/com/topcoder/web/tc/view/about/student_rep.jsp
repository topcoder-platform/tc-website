<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Student Representatives<title>

<jsp:include page="../../script.jsp" />

</head>

<body onLoad="timer(1);">

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="level1" value="events"/>
                <jsp:param name="level2" value="tournaments"/>
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
                <tr><td class="normal"><img src="/i/headComponents.gif" alt="Components" width="545" height="32" border="0" /></td></tr>
                <tr><td align="center"><img src="/i/header_look_under_hood.gif" alt="Look under the hood. Kick the tires." width="442" height="53" border="0" /></td></tr>
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
                            1.  Contact us that you're willing to take the position for your campus.</br>
                            2.  Include your mailing address in the e-mail.  This will be the address where the posters are sent.</br>
                            3.  Include how many posters you want - they come in packages of 10.</p>
                    </td>
                        

                    <td width="175" class="bodyText">
                        <table border="0" cellpadding="3" cellspacing="0" class="sidebarFrame" width="175">
                            <tr><td class="sidebarTitle">Upcoming Events</td></tr>

                            <tr valign="top">
                                <td class="sidebarText">
                                    <p>TopCoder Components are built using the TopCoder Software Component Development Methodology. The <a href="/components/methodology.jsp">methodology</a> 
                                    requires that all components have the following consistent and standard deliverables:</p>

                                    <strong>Documentation:</strong>
                                    <ul>
                                        <li>Component Specification</li>
                                        <li>Use Case Diagrams</li>
                                        <li>Class Diagrams</li>
                                        <li>Sequence Diagrams</li>
                                    </ul>
                         
                                    <strong>Test Suite:</strong>
                                    <ul>
                                        <li>Unit Test Cases</li>
                                        <li>Accuracy Test Cases</li>
                                        <li>Failure Test Cases</li>
                                        <li>Stress Test Cases</li>
                                    </ul>

                                    <strong>Source:</strong>
                                    <ul>
                                        <li>Documented Source Code</li>
                                        <li>Documented Test Suite Source Code</li>
                                    </ul>

                                    <strong>Build Environment:</strong>
                                    <ul>
                                        <li>Build script for compiling, testing and deploying</li>
                                        <li>Common directory structure for component source, libraries, documentation, test suite reports and configuration files</li>
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
