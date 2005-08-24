<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Recruiting, Screening and User Management at TopCoder Employment Services</title>

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
                <jsp:param name="level1" value="placement"/>
                <jsp:param name="level2" value=""/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%" align=center>

        <div class="plmtBody">
		<div align=center>
		<img src="/i/corp/promos/placementBanner.jpg" border=0/>
		</div>

		<p>
		TopCoder attracts the best software developers to our international programming tournaments. Programmers, team leaders, and software architects join TopCoder to demonstrate their prowess in software development. Only through competition can the most talented developers be found. TopCoder provides placement services for those companies looking to hire fulltime employees. TopCoder works with companies to define a position description including geographic location, skill sets desired, special requirements, salary, etc. TopCoder will then contact members directly about the position and determine the most appropriate candidates based on the position description and feedback from the hiring company. To learn more about our placement services, contact us at <A href="mailto:tces@topcoder.com">tces@topcoder.com</A>.
		<br/><br/>
		TopCoder also provides contract programming services utilizing our member base to handle client needs. Through our competition platform, we measure the relevant skills of developers including problem solving skills, programming ability, and quality assurance. TopCoder works with companies to define the requirements for the contract position and then search our member base for the most appropriate candidates. To learn more about our placement services, contact us at <A href="mailto:tces@topcoder.com">tces@topcoder.com</A>.
		</p>

        </div>

        <p><br></p>
		</td>

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column begins -->
                    <jsp:include page="/right.jsp">
                        <jsp:param name="level1" value="tces_home"/>
                    </jsp:include>
<!-- Right Column ends -->

                </tr>
            </table>
        </td>
<!-- Center Column ends -->

    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="/foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
