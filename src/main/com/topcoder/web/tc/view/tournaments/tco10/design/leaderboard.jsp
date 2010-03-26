<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Design Competition Leaderboard" area="design" menu="leaderboard"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../includes/htmlhead.jsp"/>
</head>

<body>

<div id="wrapper" class="homepage"><!-- the outest whole website wrapper -->

    <jsp:include page="../includes/logo.jsp"/>

    <div id="content">
        <div class="contentInner">

            <jsp:include page="../includes/menu.jsp"/>

            <div id="mainbody" class="singleMainBody"><!-- below menu ,main content -->
                <span class="leftTop"></span><!-- main content left top corner -->
                <span class="rightTop"></span><!-- main content right top corner -->
                <span class="leftBottom"></span><!-- main content left bottom corner -->
                <span class="rightBottom"></span><!-- main conent right bottom corner -->

                <jsp:include page="subMenu.jsp"/>

                <div class="bigColumn">
                    <div class="text">
                        <%@ include file="../includes/comingSoon.jsp" %>
<%--
                        <h2 class="pageTitle">Leaderboard</h2>
                        <div class="legend">
                            <p> 
                                Advanced <img src="/i/tournament/tco10/advanced_ico.png" /> <br />
                                Eliminated <img src="/i/tournament/tco10/eliminated_ico.png" /> <br />
                                Did not compete<img src="/i/tournament/tco10/not_compete_ico.png" />
                            </p>
                        </div>
                        <div class="buttons_bar">
                            <div class="left">
									
                                <a href="#" class="button">Reset Sorting</a> 
                                <a href="#" class="button off">Page View</a>
                                <a href="#" class="button">Full View</a>
									
                            </div>
                            <div class="right">
                                <a href="#" class="button2 off">&lt;&lt; Prev</a>
                                <a href="#" class="button2">Next &gt;&gt;</a>
                            </div>
                        </div>
							
                        <!-- Leader board -->
                    <table cellpadding="0" cellspacing="0" class="leaderboard"><!-- Start table list -->
                        <tr>
                                <th class="first"><span class="left"></span>Seed</th>
                                <th class="handle">Handle<input type="text" /></th>
                                <th class="rating">Rating</th>
                                <th>R1</th>
                                <th>R2</th>
                                <th>R3</th>
                                <th>R4</th>
                                <th>R5</th>
                                <th>Semi</th>
                                <th class="last"><span class="right"></span>Final</th>							
								
                        </tr>
                        <tr>
                            <td>53</td>
                            <td class="handle"><p><span class="red">handle</span></p></td>
                            <td>3645</td>
                            <td><img src="/i/tournament/tco10/advanced_odd_ico.png" /></td>
                            <td><img src="/i/tournament/tco10/advanced_odd_ico.png" /></td>
                            <td><img src="/i/tournament/tco10/advanced_odd_ico.png" /></td>
                            <td><img src="/i/tournament/tco10/advanced_odd_ico.png" /></td>
                            <td><img src="/i/tournament/tco10/advanced_odd_ico.png" /></td>
                            <td><img src="/i/tournament/tco10/advanced_odd_ico.png" /></td>
                            <td><img src="/i/tournament/tco10/prize.gif" /></td>
                        </tr>
                        <tr>
                            <td>53</td>
                            <td class="handle"><p><span class="yellow">handle</span></p></td>
                            <td>3645</td>
                            <td><img src="/i/tournament/tco10/advanced_even_ico.png" /></td>
                            <td><img src="/i/tournament/tco10/advanced_even_ico.png" /></td>
                            <td><img src="/i/tournament/tco10/advanced_even_ico.png" /></td>
                            <td><img src="/i/tournament/tco10/eliminated_even_ico.png" /></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>53</td>
                            <td class="handle"><p><span class="high">handle</span></p></td>
                            <td>3645</td>
                            <td><img src="/i/tournament/tco10/advanced_odd_ico.png" /></td>
                            <td><img src="/i/tournament/tco10/advanced_odd_ico.png" /></td>
                            <td><img src="/i/tournament/tco10/advanced_odd_ico.png" /></td>
                            <td><img src="/i/tournament/tco10/eliminated_odd_ico.png" /></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>		
                        <tr>
                            <td>53</td>
                            <td class="handle"><p><span class="green">handle</span></p></td>
                            <td>3645</td>
                            <td><img src="/i/tournament/tco10/advanced_even_ico.png" /></td>
                            <td><img src="/i/tournament/tco10/advanced_even_ico.png" /></td>
                            <td><img src="/i/tournament/tco10/advanced_even_ico.png" /></td>
                            <td><img src="/i/tournament/tco10/eliminated_even_ico.png" /></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>					
                        <tr>
                            <td>53</td>
                            <td class="handle"><p><span class="gray">handle</span></p></td>
                            <td>3645</td>
                            <td><img src="/i/tournament/tco10/advanced_odd_ico.png" /></td>
                            <td><img src="/i/tournament/tco10/advanced_odd_ico.png" /></td>
                            <td><img src="/i/tournament/tco10/advanced_odd_ico.png" /></td>
                            <td><img src="/i/tournament/tco10/not_compete_odd_ico.png" /></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>													
                    </table>							
						
                    <div class="paging">
                        <div class="show">
                            <p>
                                Show: 
                                <select>
                                    <option>20</option>
                                    <option>30</option>
                                    <option>40</option>
                                </select>
                                &nbsp;Item/Page
                            </p>
                        </div>
							
                        <div class="gopage">
                            <p>Page: <input type="text" /> <a href="#" class="button small">GO</a></p>
                        </div>
							
                        <div class="nextprev">
                            <a href="#" class="button2 off">&lt;&lt; Prev</a>
                            <a href="#" class="button2">Next &gt;&gt;</a>
                        </div>
							
--%>
                    </div>
						
                    </div>
                </div>

                <jsp:include page="../includes/sponsors.jsp"/>

                <div class="clear"></div>
            </div>
            <!--End .mainbody-->

        </div>
        <!--End .contentInner-->
    </div>
    <!--End .content-->

    <jsp:include page="../includes/footer.jsp"/>

</div>
<!--End .wrapper-->

</body>
</html>
