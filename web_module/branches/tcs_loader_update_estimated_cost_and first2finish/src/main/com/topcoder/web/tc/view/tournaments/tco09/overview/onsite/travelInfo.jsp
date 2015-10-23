<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP shows travel information.
 *
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
--%>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
        
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>TCO 09 : Tournament Overview</title>

<!-- Meta Tags -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- External CSS -->
<link rel="stylesheet" href="css/tournaments/tco09.css" media="all" type="text/css" />
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" media="screen" href="css/screen-ie6.css" />
<![endif]-->

<!-- External JavaScripts -->
<script type="text/javascript" src="/js/tournaments/tco09/jquery-1.2.6.js"></script>
<script type="text/javascript" src="/js/tournaments/tco09/jquery.backgroundPosition.js"></script>
<script type="text/javascript" src="/js/tournaments/tco09/scripts.js"></script>
<script type="text/javascript" src="/js/arena.js"></script> 
<style type="text/css">
<!--
.style2 {color: #FF0000}
-->
</style>
</head>

<body id="page">

    <div id="wrapper">
        <div id="wrapperInner">
            <div id="wrapperContent">
                
                <div id="wrapperContentInner">
                
                    <jsp:include page="../../header.jsp"/>
                    
                    <jsp:include page="../../mainNav.jsp" >
                        <jsp:param name="mainTab" value="overview"/>
                    </jsp:include>
                    
                    <div id="content">
                            <div class="contentTopLeft"><div class="contentTopRight">
                                <div class="contentTopInner"></div>
                            </div></div>
                            
                            <div id="contentInner" class="contentInner">
                            
                                <div id="contentInnerInner">

                                    <jsp:include page="../topArea.jsp"/>
                                        
                                    <div class="bottomArea">
                                        <div class="bottomLeft"><div class="bottomRight">
                                            
                                            <jsp:include page="../../secondaryNav.jsp" >
                                                <jsp:param name="mainTab" value="overview"/>
                                                <jsp:param name="secondaryTab" value="onsite"/>
                                            </jsp:include>

                                            <jsp:include page="../../tertiaryNav.jsp" >
                                                <jsp:param name="mainTab" value="overview"/>
                                                <jsp:param name="secondaryTab" value="onsite"/>
                                                <jsp:param name="tertiaryTab" value="travelInfo"/>
                                            </jsp:include>
                                            
                                            <div class="bottomAreaContent">
                                                
                                                <div class="mainContent">
                                                    <div id="mainContentInner">
                                                        <div>
                                                            <div class="pageContent">
                                                                <h2 class="title">Travel Information to the TCO</h2>
                                                                    <p>Want to attend the 2009 TopCoder Open? Here's some information to help you with your plans.</p>
                                                                        <div class="subtitle">
                                                                            <h3 class="subtitle">Transportation</h3>
                                                                                <p><strong>Air Travel</strong><br />Las Vegas is home to <a href="http://www.mccarran.com/">McCarran International Airport.</a> There are many flights into and out of this airport.</p>
                                                                                <p><strong>Bus Travel</strong><br />You can get to Las Vegas by bus. There is a Greyhound Station in the city. See more information <a href"http://www.greyhound.com/home/TicketCenter/en/terminal.asp?city=870177">here.</a></p>
                                                                                <p><strong>Car Travel</strong><br />If you're driving to Las Vegas, you can get directions <a href="http://maps.google.com/maps?hl=en&amp;client=firefox-a&amp;rls=org.mozilla:en-US:official&amp;q=mirage%2C%20las%20vegas&amp;um=1&amp;ie=UTF-8&amp;sa=N&amp;tab=wl">here.</a></p>
                                                                            <h3 class="subtitle">Hotels</h3>
                                                                                <p>There are a plethora of hotels in Las Vegas that you can choose from. Here are a few that are affordable and in the vicinity of the 2008 TopCoder Open.</p>
                                                                                <p><strong>Mirage Hotel and Casino</strong><br />
                                                                                    800-374-9000 | Room rates:  $95*<br />
                                                                                    The event will take place at the Mirage* so it is the most convenient for attending the event. Rooms at the Mirage can be reserved with a TopCoder group rate. In order to receive the TopCoder group rate, please mention TopCoder upon calling. Alternatively, you can book online <a href="https://reservations.mgmmirage.com/bookingengine.aspx?host=group&amp;pid=160&amp;code=topcoder">here.</a><br />
                                                                                    <br />
                                                                                    <em>*All finalists' rooms will be booked by TopCoder. If you are attending as a competitor, please do not book a room through this link.</em></p>
                                                                                <p><strong>Treasure Island</strong><br />
                                                                                    800-288-7206 | Room rate:   $79*<br />
                                                                                    Treasure Island is next door to the Mirage. There is a tram connecting the two hotels. Book online <a href="http://www.treasureisland.com/">here</a> or call the number above.<br /></p>
                                                                                <p><strong>Harrah's</strong><br />
                                                                                    800-HARRAHS (800-427-7247) | Room rate: $70*<br />
                                                                                    Harrah's is across the street from the Mirage and a quick walk. Book online <a href="http://www.harrahslasvegas.com/casinos/harrahs-las-vegas/hotel-casino/property-home.shtml">here</a> or call the number above.<br /></p>
                                                                                <p><strong>Flamingo</strong><br />
                                                                                    888-902-9929 | Room rate:   $70*<br />
                                                                                    The Flamingo Hotel is across the street from the Mirage and also a quick walk. Book online <a href="http://www.flamingolasvegas.com/casinos/flamingo-las-vegas/hotel-casino/property-home.shtml">here</a> or call the number above.<br />
                                                                          <em>*Rate does not include taxes or fees and is subject to change at any time.</em></p>
                                                                            <h3 class="subtitle">Additional Resources</h3>
                                                                                <p>Take a look at this <a href="http://www.vegas.com/lounge/map.html">Las Vegas Strip map</a> for a more detailed list of hotels and proximity to the Mirage (number 16 on the map).</p>
                                                                          <p><strong>Some good resources for you to utilize when booking travel:</strong><br />
                                                                              <a href="http://www.lasvegas.com">www.lasvegas.com</a><br />
                                                                                    <a href="http://www.atozvegas.com">www.atozvegas.com</a><br />
                                                                                    <a href="http://www.vegas.com">www.vegas.com</a><br />
                                                                              <a href="http://www.visitlasvegas.com">www.visitlasvegas.com</a></p>
                                                                        </div>
                                                            </div>
                                                        </div>
                                                    </div><!-- End #mainContentInner -->
                                                </div><!-- End #mainContent -->                                                 
                                                
                                                <jsp:include page="../../sponsors.jsp"/>
                                                
                                            </div><!-- End .bottomAreaContent -->
                                        
                                        </div></div>
                                    </div><!-- End .bottomArea -->
                                    
                                </div><!-- End #contentInnerInner -->
                            
                            </div><!-- End #contentInner -->
                            
                            <div class="contentBottomLeft"><div class="contentBottomRight">
                                <div class="contentTopInner"></div>
                            </div></div>
                            
                    </div><!-- End #content -->
                
                </div><!-- End #wrapperContentInner -->
                
            </div>
        </div><!-- End #wrapperInner -->
    </div><!-- End #wrapper -->

<jsp:include page="../../footer.jsp"/>
</body>
</html>
