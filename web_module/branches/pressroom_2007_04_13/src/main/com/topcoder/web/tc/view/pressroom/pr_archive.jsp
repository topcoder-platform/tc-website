<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

<jsp:include page="../script.jsp" />
<jsp:include page="../style.jsp">
    <jsp:param name="key" value="tc_pressroom"/>
</jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="center">
            
            <!-- Press Room Banner -->
            <div id="pressRoom">
                <img src="/i/pressroom/press_banner.png" alt"Press Room Banner" />
            </div>
            
            <!-- Navigation Tabs -->
            <div id="tabHeader">
                <ul>
                    <li><a href="/tc?module=Static&d1=pressroom&d2=index">Current News</a></li>
                    <li id="tabCurrent"><a href="/tc?module=Static&d1=pressroom&d2=pr_archive">Press Releases Archive</a></li>
                    <li><a href="/tc?module=Static&d1=pressroom&d2=media_resources">Media Resources</a></li>
                    <li><a href="/tc?module=Static&d1=pressroom&d2=media_request_form">Media Request Form</a></li>
                    <li><a href="/tc?module=Static&d1=pressroom&d2=art_archive">Media Articles Archive></a></li>
                </ul>
            </div>
            
            <!-- Press Releases Archive -->
            <div>
                <!-- 2007 begins -->
                <div>
                    <div>
                        <img src="/i/pressroom/header_2007.png" alt"2007 Header image" />
                    </div>
                    <div>
                        <!-- Division begins -->
                        <p><span>>> </span>Division</p>
                        <ul>TCO (TopCoder Open)
                            <li><a href="">TopCoder Announces TopCoder Open 2007 Sponsored by AOL</a> [February 22]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 20]</li>
                        </ul>
                        <ul>TCHS (TopCoder High School)
                            <li><a href="">Registration Opens for First TopCoder High School Global Programming Tournament</a> [February 13]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 11]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 9]</li>
                        </ul>
                        <ul>TCCC (TopCoder Collegiate Challenge)
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 22]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 20]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 18]</li>
                        </ul>
                        <ul>Corporate
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 15]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 14]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 13]</li>
                        </ul>
                        <ul>Software
                            <li><a href="">Connected Services Sandbox Launches</a> [February 12]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 10]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 8]</li>
                        </ul>
                        <!-- Division ends -->

                        <!-- Function begins -->
                        <p><span>>> </span>Function</p>
                        <ul>Legal
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 9]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 8]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 7]</li>
                        </ul>
                        <ul>Financial
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 6]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 5]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 4]</li>
                        </ul>
                        <ul>Client Wins
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 3]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 2]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 1]</li>
                        </ul>
                        <!-- Function ends -->
                    </div>
                    <div>
                        <img src="/i/pressroom/year_footer.png" alt"Year footer" />
                        <div>
                            <a href=""><img src="/i/pressroom/top_button.png" alt="Back to Top" /></a>
                        </div>
                    </div>
                </div>
                <!-- 2007 ends -->
                
                <!-- 2006 Begins -->
                <div>
                    <div>
                        <img src="/i/pressroom/header_2006.png" alt"2006 Header image" />
                    </div>
                    <div>
                        <!-- Division Begins -->
                        <p><span>>> </span>Division</p>
                        <ul>TCO (TopCoder Open)
                            <li><a href="">TopCoder Announces TopCoder Open 2007 Sponsored by AOL</a> [February 22]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 20]</li>
                        </ul>
                        <ul>TCHS (TopCoder High School)
                            <li><a href="">Registration Opens for First TopCoder High School Global Programming Tournament</a> [February 13]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 11]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 9]</li>
                        </ul>
                        <ul>TCCC (TopCoder Collegiate Challenge)
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 22]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 20]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 18]</li>
                        </ul>
                        <ul>Corporate
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 15]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 14]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 13]</li>
                        </ul>
                        <ul>Software
                            <li><a href="">Connected Services Sandbox Launches</a> [February 12]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 10]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 8]</li>
                        </ul>
                        <!-- Division Ends -->

                        <!-- Function Begins -->
                        <p><span>>> </span>Function</p>
                        <ul>Legal
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 9]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 8]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 7]</li>
                        </ul>
                        <ul>Financial
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 6]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 5]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 4]</li>
                        </ul>
                        <ul>Client Wins
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 3]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 2]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 1]</li>
                        </ul>
                        <!-- Function Ends -->
                    </div>
                    <div>
                        <img src="/i/pressroom/year_footer.png" alt"Year footer" />
                        <div>
                            <a href=""><img src="/i/pressroom/top_button.png" alt="Back to Top" /></a>
                        </div>
                    </div>
                </div>
                <!-- 2006 Ends -->
                
                <!-- 2005 Begins -->
                <div>
                    <div>
                        <img src="/i/pressroom/header_2005.png" alt"2005 Header image" />
                    </div>
                    <div>
                        <!-- Division Begins -->
                        <p><span>>> </span>Division</p>
                        <ul>TCO (TopCoder Open)
                            <li><a href="">TopCoder Announces TopCoder Open 2007 Sponsored by AOL</a> [February 22]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 20]</li>
                        </ul>
                        <ul>TCHS (TopCoder High School)
                            <li><a href="">Registration Opens for First TopCoder High School Global Programming Tournament</a> [February 13]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 11]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 9]</li>
                        </ul>
                        <ul>TCCC (TopCoder Collegiate Challenge)
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 22]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 20]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 18]</li>
                        </ul>
                        <ul>Corporate
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 15]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 14]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 13]</li>
                        </ul>
                        <ul>Software
                            <li><a href="">Connected Services Sandbox Launches</a> [February 12]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 10]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 8]</li>
                        </ul>
                        <!-- Division Ends -->

                        <!-- Function Begins -->
                        <p><span>>> </span>Function</p>
                        <ul>Legal
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 9]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 8]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 7]</li>
                        </ul>
                        <ul>Financial
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 6]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 5]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 4]</li>
                        </ul>
                        <ul>Client Wins
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 3]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 2]</li>
                            <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 1]</li>
                        </ul>
                        <!-- Function Ends -->
                    </div>
                    <div>
                        <img src="/i/pressroom/year_footer.png" alt"Year footer" />
                        <div>
                            <a href=""><img src="/i/pressroom/top_button.png" alt="Back to Top" /></a>
                        </div>
                    </div>
                </div>
                <!-- 2005 Ends -->
            </div>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>