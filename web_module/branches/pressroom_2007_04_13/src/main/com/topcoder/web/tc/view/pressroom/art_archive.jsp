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
                    <img class="floatR" src="/i/pressroom/press_banner_newspaper.png" alt="Press Room Banner Newspaper" />
                    <div id="pressRoom2">
                        <img class="floatL" src="/i/pressroom/press_banner_logo.png" alt="Press Room Banner Logo" />
                    </div>
                </div>
                
                <div id="pressContainer2">
                    <!-- Navigation Tabs -->
                    <div id="tabHeader">
                        <ul>
                            <li><a href="/tc?module=Static&d1=pressroom&d2=index">Current News</a></li>
                            <li><a href="/tc?module=Static&d1=pressroom&d2=pr_archive">Press Releases Archive</a></li>
                            <li><a href="/tc?module=Static&d1=pressroom&d2=media_resources">Media Resources</a></li>
                            <li><a href="/tc?module=Static&d1=pressroom&d2=media_request_form">Media Request Form</a></li>
                            <li id="tabCurrent"><a href="/tc?module=Static&d1=pressroom&d2=art_archive">Media Articles Archive</a></li>
                        </ul>
                    </div>
                    
                    <!-- Media Articles Archive -->
                    <div>
                        <!-- 2007 begins -->
                        <div id="pressContainer3">
                            <div id="headerYear">
                                <img class="floatR" src="/i/pressroom/header_right.png" alt="Right Header" />
                                <div id="headerYear2">
                                    <img class="floatL" src="/i/pressroom/header_2007_left.png" alt="2007 Header" />
                                </div>
                            </div>
                            <div id="pressContainer4">
                                <!-- DIVISION begins -->
                                <p class="chevronHeader"><span class="maroon">>> </span>DIVISION</p>
                                <ul><span class="maroonHeader">TCO (TopCoder Open)</span>
                                    <li><a href="">TopCoder Announces TopCoder Open 2007 Sponsored by AOL</a><span class="dateBracket">&nbsp;&nbsp;[February 22]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[February 20]</span></li>
                                </ul>
                                <ul><span class="maroonHeader">TCHS (TopCoder High School)</span>
                                    <li><a href="">Registration Opens for First TopCoder High School Global Programming Tournament</a><span class="dateBracket">&nbsp;&nbsp;[February 13]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[February 11]</span></li>
                                </ul>
                                <ul><span class="maroonHeader">TCCC (TopCoder Collegiate Challenge)</span>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[February 22]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[February 20]</span></li>
                                </ul>
                                <ul><span class="maroonHeader">Corporate</span>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 15]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 14]</span></li>
                                </ul>
                                <ul><span class="maroonHeader">Software</span>
                                    <li><a href="">Ideagora, a Marketplace for Minds</a><span class="dateBracket">&nbsp;&nbsp;[February 15 - BusinessWeek]</span></li>
                                    <li><a href="">Microsoft launches 'mashup' competition for developers</a><span class="dateBracket">&nbsp;&nbsp;[February 14 - ComputerWorld]</span></li>
                                </ul>
                                <!-- DIVISION ends -->
        
                                <!-- FUNCTION begins -->
                                <p class="chevronHeader"><span class="maroon">>> </span>FUNCTION</p>
                                <ul><span class="maroonHeader">Legal</span>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 9]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 8]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 7]</span></li>
                                </ul>
                                <ul><span class="maroonHeader">Financial</span>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 6]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 5]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 4]</span></li>
                                </ul>
                                <ul><span class="maroonHeader">Client Wins</span>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 3]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 2]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 1]</span></li>
                                </ul>
                                <!-- FUNCTION ends -->
                            </div>
                            <!-- Back to Top Button begins -->
                            <div class="topButton">
                                <a href=""><img src="/i/pressroom/top_button.png" alt="Back to Top" /></a>
                            </div>
                            <!-- Back to Top Button ends-->
                            
                            <div id="headerYearFooter">
                                <img class="floatR" src="/i/pressroom/year_footer_right.png" alt="Right Footer" />
                                <div id="headerYearFooter2">
                                    <img class="floatL" src="/i/pressroom/year_footer_left.png" alt="Left Footer" />
                                </div>
                            </div>
                        </div>
                        <!-- 2007 ends -->
                        
                        <!-- 2006 begins -->
                        <div id="pressContainer3">
                            <div id="headerYear">
                                <img class="floatR" src="/i/pressroom/header_right.png" alt="Right Header" />
                                <div id="headerYear2">
                                    <img class="floatL" src="/i/pressroom/header_2006_left.png" alt="2006 Header" />
                                </div>
                            </div>
                            <div id="pressContainer4">
                                <!-- DIVISION begins -->
                                <p class="chevronHeader"><span class="maroon">>> </span>DIVISION</p>
                                <ul><span class="maroonHeader">TCO (TopCoder Open)</span>
                                    <li><a href="">TopCoder Announces TopCoder Open 2007 Sponsored by AOL</a><span class="dateBracket">&nbsp;&nbsp;[February 22]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[February 20]</span></li>
                                </ul>
                                <ul><span class="maroonHeader">TCHS (TopCoder High School)</span>
                                    <li><a href="">Registration Opens for First TopCoder High School Global Programming Tournament</a><span class="dateBracket">&nbsp;&nbsp;[February 13]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[February 11]</span></li>
                                </ul>
                                <ul><span class="maroonHeader">TCCC (TopCoder Collegiate Challenge)</span>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[February 22]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[February 20]</span></li>
                                </ul>
                                <ul><span class="maroonHeader">Corporate</span>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 15]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 14]</span></li>
                                </ul>
                                <ul><span class="maroonHeader">Software</span>
                                    <li><a href="">Ideagora, a Marketplace for Minds</a><span class="dateBracket">&nbsp;&nbsp;[February 15 - BusinessWeek]</span></li>
                                    <li><a href="">Microsoft launches 'mashup' competition for developers</a><span class="dateBracket">&nbsp;&nbsp;[February 14 - ComputerWorld]</span></li>
                                </ul>
                                <!-- DIVISION ends -->
        
                                <!-- FUNCTION begins -->
                                <p class="chevronHeader"><span class="maroon">>> </span>FUNCTION</p>
                                <ul><span class="maroonHeader">Legal</span>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 9]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 8]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 7]</span></li>
                                </ul>
                                <ul><span class="maroonHeader">Financial</span>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 6]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 5]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 4]</span></li>
                                </ul>
                                <ul><span class="maroonHeader">Client Wins</span>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 3]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 2]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 1]</span></li>
                                </ul>
                                <!-- FUNCTION ends -->
                            </div>
                            <!-- Back to Top Button begins -->
                            <div class="topButton">
                                <a href=""><img src="/i/pressroom/top_button.png" alt="Back to Top" /></a>
                            </div>
                            <!-- Back to Top Button ends-->
                            
                            <div id="headerYearFooter">
                                <img class="floatR" src="/i/pressroom/year_footer_right.png" alt="Right Footer" />
                                <div id="headerYearFooter2">
                                    <img class="floatL" src="/i/pressroom/year_footer_left.png" alt="Left Footer" />
                                </div>
                            </div>
                        </div>
                        <!-- 2006 ends -->
                        
                        <!-- 2005 begins -->
                        <div id="pressContainer3">
                            <div id="headerYear">
                                <img class="floatR" src="/i/pressroom/header_right.png" alt="Right Header" />
                                <div id="headerYear2">
                                    <img class="floatL" src="/i/pressroom/header_2005_left.png" alt="2005 Header" />
                                </div>
                            </div>
                            <div id="pressContainer4">
                                <!-- DIVISION begins -->
                                <p class="chevronHeader"><span class="maroon">>> </span>DIVISION</p>
                                 <ul><span class="maroonHeader">TCO (TopCoder Open)</span>
                                    <li><a href="">TopCoder Announces TopCoder Open 2007 Sponsored by AOL</a><span class="dateBracket">&nbsp;&nbsp;[February 22]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[February 20]</span></li>
                                </ul>
                                <ul><span class="maroonHeader">TCHS (TopCoder High School)</span>
                                    <li><a href="">Registration Opens for First TopCoder High School Global Programming Tournament</a><span class="dateBracket">&nbsp;&nbsp;[February 13]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[February 11]</span></li>
                                </ul>
                                <ul><span class="maroonHeader">TCCC (TopCoder Collegiate Challenge)</span>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[February 22]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[February 20]</span></li>
                                </ul>
                                <ul><span class="maroonHeader">Corporate</span>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 15]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 14]</span></li>
                                </ul>
                                <ul><span class="maroonHeader">Software</span>
                                    <li><a href="">Ideagora, a Marketplace for Minds</a><span class="dateBracket">&nbsp;&nbsp;[February 15 - BusinessWeek]</span></li>
                                    <li><a href="">Microsoft launches 'mashup' competition for developers</a><span class="dateBracket">&nbsp;&nbsp;[February 14 - ComputerWorld]</span></li>
                                </ul>
                                <!-- DIVISION ends -->
        
                                <!-- FUNCTION begins -->
                                <p class="chevronHeader"><span class="maroon">>> </span>FUNCTION</p>
                                <ul><span class="maroonHeader">Legal</span>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 9]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 8]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 7]</span></li>
                                </ul>
                                <ul><span class="maroonHeader">Financial</span>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 6]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 5]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 4]</span></li>
                                </ul>
                                <ul><span class="maroonHeader">Client Wins</span>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 3]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 2]</span></li>
                                    <li><a href="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at neque.</a><span class="dateBracket">&nbsp;&nbsp;[January 1]</span></li>
                                </ul>
                                <!-- FUNCTION ends -->
                            </div>
                            <!-- Back to Top Button begins -->
                            <div class="topButton">
                                <a href=""><img src="/i/pressroom/top_button.png" alt="Back to Top" /></a>
                            </div>
                            <!-- Back to Top Button ends-->
                            
                            <div id="headerYearFooter">
                                <img class="floatR" src="/i/pressroom/year_footer_right.png" alt="Right Footer" />
                                <div id="headerYearFooter2">
                                    <img class="floatL" src="/i/pressroom/year_footer_left.png" alt="Left Footer" />
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