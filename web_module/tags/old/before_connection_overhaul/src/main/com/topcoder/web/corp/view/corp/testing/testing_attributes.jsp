<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>A complete explanation of the TopCoder Employment Services Testing Program</title>

<jsp:include page="../includes/css.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>

</head>

<body>

<!-- Top begins -->
<jsp:include page="../includes/top.jsp" >
    <jsp:param name="level1" value="employment_services"/>
</jsp:include>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170">
            <jsp:include page="../includes/left.jsp">
                <jsp:param name="level1" value="testing"/>
                <jsp:param name="level2" value="attributes"/> 
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
        <td valign="top" width="7"><img src="/i/corp/title_brackets.gif" width="7" height="47" alt="[ ]" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top"><td id="corpTitle" width="100%" colspan="3"><img src="/i/corp/header_topcoder_testing.gif" alt="" width="546" height="41" border="0"></td></tr>
                
                <tr valign="top">
                    <td class="bodyText" width="99%">
                        <img src="/i/corp/clear.gif" width="1" height="7" alt="" border="0"><br>

                        <h2 class="corpHead">Testing Attributes</h2>
                        
                        <p>At the highest level, the TopCoder Application tests candidates in the following areas:</p>
                        
                        <ul>
                            <li>Problem Statement Comprehension<br>
                            - Understanding of elements, the relationship between elements, variables and goals</li>
                            <li>Logical Design<br>
                            - Conceive and design logical structure for problem solving</li>
                            <li>Physical Implementation<br>
                            - Write and test detailed instructions to solve problem<br>
                            - Compile and debug code by utilizing the functionality of a programming language compiler</li>
                        </ul>
                        
                        <div align="center"><img src="/i/corp/testing_screen_2.gif" alt="Coding Environment and Problem Statement" width="418" height="289" border="0"></div>

                        <h2 class="corpHead">Private Candidate Testing Application</h2>

                        <ul>
                            <li>Web-based application used during interview process</li>
                            <li>Candidates solve complex algorithmic problems</li>
                            <li>Measures programming ability</li>
                            <li>Candidates code in Java, C++ or C#</li>
                            <li>Systematically tests for accuracy and basic level of efficiency</li>
                            <li>Results available via Management Tool website</li>
                        </ul>

                        <p><br></p>
                    </td>

<!-- Gutter -->
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column begins -->
                    <jsp:include page="../../right.jsp">
                        <jsp:param name="level1" value="testing"/>
                        <jsp:param name="level2" value="attributes"/> 
                    </jsp:include>
<!-- Right Column ends -->

                </tr>
            </table>
        </td>
<!-- Center Column ends -->
    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="../../foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
