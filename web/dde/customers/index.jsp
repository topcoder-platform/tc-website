<%@ page import="javax.naming.*" %>
<%@ page import="javax.ejb.CreateException" %>
<%@ page import="java.io.*" %>
<%@ page import="java.rmi.*" %>
<%@ page import="javax.rmi.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.reflect.*" %>

<%@ include file="/includes/util.jsp" %>
<%@ include file="/includes/session.jsp" %>
<%@ include file="/includes/formclasses.jsp" %>


<%
    // STANDARD PAGE VARIABLES
    String page_name = "s_definition.jsp";
    String action = request.getParameter("a");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Software Components form the basis of the applications built by TopCoder Software</title>
    <link rel="stylesheet" type="text/css" href="/includes/tcs_style.css" />
    <script language="JavaScript" type="text/javascript" src="/scripts/javascript.js"></script>
</head>

<body class="body">

<!-- Header begins -->
<jsp:include page="/includes/top.jsp"/>
<jsp:include page="/includes/menu.jsp" >
    <jsp:param name="isSoftwarePage" value="true"/>
</jsp:include>
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" class="middle">
    <tr valign="top">

<!-- Left Column begins -->
        <td width="180" class="leftColumn">
        <jsp:include page="/includes/left.jsp" >
            <jsp:param name="level1" value="customers"/>
        </jsp:include>
        </td>
<!-- Left Column ends -->

<!-- Gutter 1 begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 1 ends -->

<!-- Middle Column begins -->
        <td width="99%">
            <img src="/images/clear.gif" width="1" height="15" alt="" border="0"><br>
            <img src="/images/headCustomers.gif" alt="Customers" width="545" height="32" border="0" /><br>


            <hr width="100%" size="1px" noshade>

<!-- StageStores begins -->
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr valign="top">
                    <td width="170"><img src="/images/clients/stagestores_logo.gif" alt="Stagestores" border="0" /></td>
                    <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
                    <td width="99%" class="bodyText">StageStores, Inc. brings nationally recognized brand name apparel, accessories, cosmetics and footwear for the entire family to small and mid-size towns and communities with over 520 stores in 27 states.<br><br>
                    <A href="http://www.stagestores.com/" target="_blank">homepage</A>&#160;|&#160;
                     <A href="http://www.topcoder.com/?t=sponsor&c=link&link=/i/downloads/Gift_Card_Case_Study.pdf&refer=homepage" target="_blank">case study</A>
                     </td>
                </tr>
            </table>
<!-- StageStores ends -->

             <hr width="100%" size="1px" noshade>

<!-- ABB begins -->
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr valign="top">
                    <td width="170"><img src="/images/clients/abb_logo.gif" alt="ABB" border="0" /></td>
                    <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
                    <td width="99%" class="bodyText">A leader in power and automation technologies that enable customers to improve performance while lowering environmental impact.<br><br>
                    <A href="http://www.abb.com/" target="_blank">homepage</A>
                     </td>
                </tr>
            </table>
<!-- ABB ends -->

             <hr width="100%" size="1px" noshade>

<!-- Borders begins -->
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr valign="top">
                    <td width="170"><img src="/images/clients/borders_logo.gif" alt="Borders" border="0" /></td>
                    <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
                    <td width="99%" class="bodyText">With more than 32,000 employees worldwide, this company provides its customers with the books, music, movies, and other entertainment items they love.<br><br>
                    <A href="http://www.amazon.com/exec/obidos/tg/browse/-/577394/103-3590679-6259839" target="_blank">homepage</A>
                     </td>
                </tr>
            </table>
<!-- Borders ends -->

             <hr width="100%" size="1px" noshade>

<!-- Burlington begins -->
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr valign="top">
                    <td width="170"><img src="/images/clients/burlington_logo.gif" alt="Burlington Coat Factory" border="0" /></td>
                    <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
                    <td width="99%" class="bodyText">Burlington Coat Factory Warehouse Corporation is a national department store retail chain offering current, high quality, designer merchandise at up to 60% less than other department store prices.<br><br>
                    <A href="http://corporate.burlingtoncoatfactory.com/" target="_blank">homepage</A>
                     </td>
                </tr>
            </table>
<!-- Burlington ends -->

             <hr width="100%" size="1px" noshade>

<!-- Caliper begins -->
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr valign="top">
                    <td width="170"><img src="/images/clients/caliper_logo.gif" alt="Caliper" border="0" /></td>
                    <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
                    <td width="99%" class="bodyText">Caliper has advised more than 25,000 companies - including FedEx, Avis and some of the fastest growing smaller firms - on Employee Selection, Employee Development, Team Building and Organizational Development. <br><br>
                    <A href="http://www.calipercorp.com/" target="_blank">homepage</A>
                     </td>
                </tr>
            </table>
<!-- Caliper ends -->

             <hr width="100%" size="1px" noshade>

<!-- Detroit Edison begins -->
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr valign="top">
                    <td width="170"><img src="/images/clients/detroit_edison_logo.gif" alt="Detroit Edison" border="0" /></td>
                    <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
                    <td width="99%" class="bodyText">Founded in 1903, this investor-owned electric utility generates, transmits, and distributes electricy to 2.1 million customers in Southeastern Michigan.<br><br>
                    <A href="http://my.dteenergy.com/main/index.do" target="_blank">homepage</A>
                     </td>
                </tr>
            </table>
<!-- Detroit Edison ends -->

             <hr width="100%" size="1px" noshade>

<!-- Ferguson begins -->
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr valign="top">
                    <td width="170"><img src="/images/clients/ferguson_logo.gif" alt="Ferguson" border="0" /></td>
                    <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
                    <td width="99%" class="bodyText">Ferguson distributes plumbing, pipe, valves and fittings, heating and cooling, and waterworks products to the construction industry through a coast-to-coast network of showrooms, counters and distribution centers.<br><br>
                    <A href="http://www.ferguson.com/" target="_blank">homepage</A>
                     </td>
                </tr>
            </table>
<!-- Ferguson ends -->

             <hr width="100%" size="1px" noshade>

<!-- Franklin Mortgage begins -->
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr valign="top">
                    <td width="170"><img src="/images/clients/frankin_mortgage_logo.gif" alt="Franklin Mortgage" border="0" /></td>
                    <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
                    <td width="99%" class="bodyText">Acquiring and selling non-conforming mortgage loans on residential properties, this firm is one of the largest privately held lenders in the nation.<br><br>
                     </td>
                </tr>
            </table>
<!-- Franklin Mortgage ends -->

             <hr width="100%" size="1px" noshade>

<!-- Oxford begins -->
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr valign="top">
                    <td width="170"><img src="/images/clients/oxford_logo.gif" alt="Oxford" border="0" /></td>
                    <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
                    <td width="99%" class="bodyText">Learn about Oxford programs, products and services including Access to Care, Preventive and Practical resources.<br><br>
                    <A href="https://www.oxhp.com/" target="_blank">homepage</A>
                     </td>
                </tr>
            </table>
<!-- Oxford ends -->

             <hr width="100%" size="1px" noshade>

<!-- Philip Morris begins -->
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr valign="top">
                    <td width="170"><img src="/images/clients/philipmorris_logo.gif" alt="Philip Morris" border="0" /></td>
                    <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
                    <td width="99%" class="bodyText">Hiring the best people, producing the highest quality products, and giving back to the community helped grow this 101-year-old company into the leading manufacturer of cigarettes in the United States.<br><br>
                    <A href="http://www.philipmorrisusa.com/en/home.asp" target="_blank">homepage</A>
                     </td>
                </tr>
            </table>
<!-- Philip Morris ends -->

             <hr width="100%" size="1px" noshade>

<!-- Praxair begins -->
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr valign="top">
                    <td width="170"><img src="/images/clients/praxair_logo.gif" alt="Praxair" border="0" /></td>
                    <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
                    <td width="99%" class="bodyText">With annual sales of $5.6 billion, Praxair, Inc. is a global, Fortune 500 company that supplies atmospheric, process and specialty gases, high-performance coatings, and related services and technologies.<br><br>
                    <A href="http://www.praxair.com/" target="_blank">homepage</A><%--&#160;|&#160;
                     <A href="/" target="_blank">case study</A>--%>
                     </td>
                </tr>
            </table>
<!-- Praxair ends -->

             <hr width="100%" size="1px" noshade>

<!-- Rodale begins -->
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr valign="top">
                    <td width="170"><img src="/images/clients/rodale_logo.gif" alt="Rodale" border="0" /></td>
                    <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
                    <td width="99%" class="bodyText">Rodale today is a global leader in healthy, active living information. Rodale's nine magazine properties, all veteran publications in their categories, include the brands Prevention, Men's Health and Runner's World, which are published in 36 countries.<br><br>
                    <A href="http://www.rodale.com/" target="_blank">homepage</A>
                     </td>
                </tr>
            </table>
<!-- Rodale ends -->

             <hr width="100%" size="1px" noshade>

<!-- Talbots begins -->
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr valign="top">
                    <td width="170"><img src="/images/clients/talbots_logo.gif" alt="Talbots" border="0" /></td>
                    <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
                    <td width="99%" class="bodyText">With hundreds of locations in the US, Canada, and the UK, Talbots is a leading specialty retailer, cataloger, and e-tailer of women's classic apparel.<br><br>
                    <A href="http://www1.talbots.com/talbotsonline/index.asp" target="_blank">homepage</A>
                     </td>
                </tr>
            </table>
<!-- Talbots ends -->

             <hr width="100%" size="1px" noshade>

            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td colspan="2" class="bodyText" align="center">
                        <p><font size="3"><strong><a href="http://www.topcoder.com/?t=contacts&c=index">Contact us</a> today so we can get started developing your next application.</strong></font></p>
                    </td>
                </tr>
            </table>
            <p><br></p>
        </td>
<!-- Middle Column ends -->

<!-- Gutter 2 begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 2 ends -->

<!-- Right Column begins -->
        <td width="170">
        <jsp:include page="/includes/right.jsp" >
            <jsp:param name="level1" value="customers"/>
        </jsp:include>
        </td>
<!--Right Column ends -->

<!-- Gutter 3 begins -->
        <td width="10"><img src="/images/clear.gif" alt="" width="10" height="10" border="0" /></td>
<!-- Gutter 3 ends -->

    </tr>
</table>

<!-- Footer begins -->
<jsp:include page="/includes/foot.jsp" flush="true" />
<!-- Footer ends -->

</body>
</html>
