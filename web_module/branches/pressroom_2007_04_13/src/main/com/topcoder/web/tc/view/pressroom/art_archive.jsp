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
<!-- Left Column ends -->

<!-- Center Column begins -->
        <td width="100%" align="center">
            
            <div id="pressContainer">
                <!-- Press Room Banner -->
                <div id="pressRoom">
                    <img src="/i/pressroom/press_banner.png" alt="Press Room Banner" />
                </div>
                
                <div id="pressContainer2">
                    <!-- Navigation Tabs -->
                    <div id="tabHeader">
                        <ul>
                            <li><a href="/tc?module=Static&d1=pressroom&d2=index">Current News</a></li>
                            <li><a href="/tc?module=Static&d1=pressroom&d2=pr_archive">Press Releases Archive</a></li>
                            <li><a href="/tc?module=Static&d1=pressroom&d2=media_resources">Media Resources</a></li>
                            <li><a href="/tc?module=Static&d1=pressroom&d2=media_request_form">Media Request Form</a></li>
                            <li id="tabCurrent"><a href="/tc?module=Static&d1=pressroom&d2=art_archive">Media Articles Archive></a></li>
                        </ul>
                    </div>
                    
                    <!-- Media Articles Archive -->
                    <div>
                        <!-- 2007 begins -->
                        <div id="pressContainer3">
                            <div>
                                <img src="/i/pressroom/header_2007.png" alt="2007 Header image" />
                            </div>
                            <div id="pressContainer4">
                                <!-- Division begins -->
                                <p><span>>> </span>Division</p>
                                <ul>TCO (TopCoder Open)
                                    <li><a href="">TopCoder Announces TopCoder Open 2007 Sponsored by AOL</a> [February 22]</li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 20]</li>
                                </ul>
                                <ul>TCHS (TopCoder High School)
                                    <li><a href="">Registration Opens for First TopCoder High School Global Programming Tournament</a> [February 13]</li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 11]</li>
                                </ul>
                                <ul>TCCC (TopCoder Collegiate Challenge)
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 22]</li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 20]</li>
                                </ul>
                                <ul>Corporate
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 15]</li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 14]</li>
                                </ul>
                                <ul>Software
                                    <li><a href="">Ideagora, a Marketplace for Minds</a> [February 15 - BusinessWeek]</li>
                                    <li><a href="">Microsoft launches 'mashup' competition for developers</a> [February 14 - ComputerWorld]</li>
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
                                <img src="/i/pressroom/year_footer.png" alt="Year footer" />
                                <div>
                                    <a href=""><img src="/i/pressroom/top_button.png" alt="Back to Top" /></a>
                                </div>
                            </div>
                        </div>
                        <!-- 2007 ends -->
                        
                        <!-- 2006 begins -->
                        <div id="pressContainer3">
                            <div>
                                <img src="/i/pressroom/header_2006.png" alt="2006 Header image" />
                            </div>
                            <div id="pressContainer4">
                                <!-- Division begins -->
                                <p><span>>> </span>Division</p>
                                <ul>TCO (TopCoder Open)
                                    <li><a href="">TopCoder Announces TopCoder Open 2007 Sponsored by AOL</a> [February 22]</li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 20]</li>
                                </ul>
                                <ul>TCHS (TopCoder High School)
                                    <li><a href="">Registration Opens for First TopCoder High School Global Programming Tournament</a> [February 13]</li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 11]</li>
                                </ul>
                                <ul>TCCC (TopCoder Collegiate Challenge)
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 22]</li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 20]</li>
                                </ul>
                                <ul>Corporate
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 15]</li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 14]</li>
                                </ul>
                                <ul>Software
                                    <li><a href="">Ideagora, a Marketplace for Minds</a> [February 15 - BusinessWeek]</li>
                                    <li><a href="">Microsoft launches 'mashup' competition for developers</a> [February 14 - ComputerWorld]</li>
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
                                <img src="/i/pressroom/year_footer.png" alt="Year footer" />
                                <div>
                                    <a href=""><img src="/i/pressroom/top_button.png" alt="Back to Top" /></a>
                                </div>
                            </div>
                        </div>
                        <!-- 2006 ends -->
                        
                        <!-- 2005 begins -->
                        <div id="pressContainer3">
                            <div>
                                <img src="/i/pressroom/header_2005.png" alt="2005 Header image" />
                            </div>
                            <div id="pressContainer4">
                                <!-- Division begins -->
                                <p><span>>> </span>Division</p>
                                <ul>TCO (TopCoder Open)
                                    <li><a href="">TopCoder Announces TopCoder Open 2007 Sponsored by AOL</a> [February 22]</li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 20]</li>
                                </ul>
                                <ul>TCHS (TopCoder High School)
                                    <li><a href="">Registration Opens for First TopCoder High School Global Programming Tournament</a> [February 13]</li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 11]</li>
                                </ul>
                                <ul>TCCC (TopCoder Collegiate Challenge)
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 22]</li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [February 20]</li>
                                </ul>
                                <ul>Corporate
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 15]</li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a> [January 14]</li>
                                </ul>
                                <ul>Software
                                    <li><a href="">Ideagora, a Marketplace for Minds</a> [February 15 - BusinessWeek]</li>
                                    <li><a href="">Microsoft launches 'mashup' competition for developers</a> [February 14 - ComputerWorld]</li>
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
                                <img src="/i/pressroom/year_footer.png" alt="Year footer" />
                                <div>
                                    <a href=""><img src="/i/pressroom/top_button.png" alt="Back to Top" /></a>
                                </div>
                            </div>
                        </div>
                        <!-- 2005 ends -->
                    </div>
                </div>
            </div>
        </td>
<!-- Center Column ends -->

<!-- Right Column begins -->
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
        </td>
<!-- Right Column ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>