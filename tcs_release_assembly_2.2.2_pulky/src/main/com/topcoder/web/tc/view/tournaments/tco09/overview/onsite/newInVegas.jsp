<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP shows information about what is new in Las Vegas.
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
                                                <jsp:param name="tertiaryTab" value="newInVegas"/>
                                            </jsp:include>
                                            
                                            <div class="bottomAreaContent">
                                                
                                                <div class="mainContent">
                                                    <div id="mainContentInner">
                                                        <div>
                                                            <div class="pageContent">
                                                                <h2 class="title">New In Vegas</h2>
                                                                    <p>It's amazing, but it's true - Las Vegas continues to explode with so many new offerings, it's hard to keep up! Here is just a glimpse of what is new and happening, just in the last year since TopCoder last visited.</p>
                                                                        <div class="subtitle">
                                                                            <p><a href="http://www.encorelasvegas.com/">Encore,</a> the widely anticipated new signature resort in the Wynn collection, has opened. The suite-exclusive hotel includes 1,818 standard suites, 222 larger suites, 70,000 square foot casino,  6 restaurants, 8 bars and lounges, 60,000 square feet of meeting space, 11 world class retail outlets, 2 pools (one that can be seen from the casino floor), and a 50,000 square feet spa with 36 Treatment Rooms. The bathrooms alone are 230 square feet - larger then some old Las Vegas hotel rooms!</p>
                                                                            <p><a href="http://www.palazzolasvegas.com/index.aspx">Palazzo,</a> one of the hottest and newest hotels on the strip, is now open. Palazzo includes over 3,000 new rooms, a 125,000 square foot casino, and much more! Because it is attached to The Venetian, this makes it the world's largest resort with over 7,000 rooms! The shopping, dining, and entertainment complex is over 450,000 square feet, as well as additional meeting space and conference rooms.</p>
                                                                            <p>A new Cirque Du Soleil Show, called <a href="http://www.cirquedusoleil.com/believe/en/intro/intro.asp">BeLIEve,</a> opened up at <a href="http://www.luxor.com/">Luxor,</a> starring famed illusionist Criss Angel.</p>
                                                                            <p><a href="http://www.terryfator.com/">Terry Fator,</a> 2007 winner of America's Got Talent, has opened at <a href="http://www.mirage.com/">The Mirage.</a> The ventriloquist, singer, and comedian joined The Mirage's entertainment palate in February of 2009.</p>
                                                                            <p><a href="http://www.themresort.com/">The M Resort,</a> a full service destination resort, has opened on the southern end of the Las Vegas Strip.</p>
                                                                            <p><a href="http://www.aliantecasinohotel.com/hotel/">Aliante Station Casino &amp; Hotel</a> is now open! Located off the strip in North Las Vegas, the newest of the <a href="http://www.stationcasinos.com/">Station Casinos,</a> this resort features over 200 hotel rooms, a 16-screen movie theater, six restaurants, and a large casino.</p>
                                                                            <p><a href="http://www.eastsidecannery.com/">The Eastside Cannery,</a> located on Boulder Highway, is now open. The new 16-story hotel tower is designed to resemble a silo which is a fun alternative to the standard corporate hotel fare. Ample-sized rooms with plasma TVs fill the tower. It also has 20,000 square feet of meeting space, five restaurants, a bingo hall, spa, pool, and a lounge on the top floor that overlooks the valley.</p>
                                                                            <p>The new condo tower building, <a href="http://www.trumplasvegashotel.com/?gclid=CPT54uSusZcCFQGbnAodoWmBjg">Trump Towers,</a> is now open. This is just the first of two planned buildings by the real estate mogul, and it includes over 1,200 condo units. The tower is clad in glass and contains a real gold layer. The second building is currently in development.</p>
                                                                            <p>Some HOT new restaurants have opened on the strip: <a href="http://www.palazzolasvegas.com/sushisamba.aspx">SushiSamba at the Palazzo,</a> a Brazilian twist of the Japanese traditional specialty; <a href="http://www.luxor.com/dining/dining_luxor_steakhouse.aspx">TENDER Steak and Seafood</a> at Luxor, a relaxing experience away from the noise of the Las Vegas Strip; <a href="http://www.mirage.com/restaurants/blt-burger.aspx">BLT Burger</a> at The Mirage, a casual dining experience of burgers and milkshakes that is sure to make your mouth water; the celebrity favorite <a href="http://www.planethollywoodresort.com/din_koi.php">Koi at Planet Hollywood,</a> and <a href="http://www.mandalaybay.com/dining/bordergrill.aspx">Border Grill at Mandalay Bay</a> where you can be sure to enjoy a delicious margarita and authentic Mexican meal, just to name a few.</p>
                                                                            <p>The sequel to Tao, <a href="http://www.lavolv.com/">Lavo at the Palazzo</a> is a world class nightclub sure to leave you wanting to return. All entrances to this nightclub, sitting atop the fine dining restaurant, lead to a bridge lined with Turkish water basins guiding guests into the 4,500 square foot nightclub.</p>
                                                                            <p><a href="http://www.goldennugget.com/entertainment/gordie.asp">Gordie Brown has returned to the Golden Nugget!</a> After touring with Celine Dion for the last year, Gordie Brown has come home to Las Vegas once again. See this amazing impressionist, singer, and entertainer perform five nights a week at the Golden Nugget.</p>
                                                                            <p>Performing nightly in the Variety Theatre inside the Miracle Mile shops at Planet Hollywood you will find <a href="http://www.varietytheater.com/scarlett.htm">Scarlett Princess of Magic,</a> the hottest new magician in Vegas. Check out her amazing review <a href="http://shop.vegas.com/shows/showtimes2.jsp?event_id=17139&amp;cm_mmc=google-_-Shows-_-Scarlett+Princess+of+Magic-_-scarlett+-+princess+of+magic|-|100000000000000028160&amp;cm_guid=1-_-100000000000000028160-_-1192137144&amp;gclid=CPb3xonisZcCFQE0xgodC11-iQ#showdeta">here.</a></p>
                                                                            <p>Just 15 minutes away from the Las Vegas strip, you will find <a href="http://specialoffers.starwoodhotels.com/Element_Las_Vegas/so.htm?PS=PS_aa_SW_Google_element_las_vegas_102008_NAD_FM">Summerlin's Element,</a> an eco-friendly Westin Starwood boutique. Surrounded by fine dining, golf, and shopping, you'll discover inviting, multi-purpose public spaces suited to both productivity and relaxation. Easily accessible technology that's at the ready whenever your needs demand. Healthy food and fitness options that complement your schedule and lifestyle. All in an open, airy, smoke-free environment flooded with natural light that enlivens and energizes. So breathe a sigh of relief and ease into a stay that is sure to rejuvenate.</p>
                                                                            <p>Party like a rock star at <a href="http://www.rokvegasnightclub.com/flash/">ROK Vegas</a> at <a href="http://www.nynyhotelcasino.com/">New York-New York.</a> A new nightclub for club-goers looking for rock and roll music mixed with lighting effects and vivid images guaranteed to leave you wanting more.</p>
                                                                            <p>If you know fashion, you know Christian Audigier, best known for his fashion line Ed Hardy. He has opened a new club at Treasure Island called<a href="http://www.audigierlv.com/"> Christian Audigier; The Nightclub.</a> Accented by huge canvases of tattoo art, crocodile skin tables and crystal-like mirrors and skulls, this club includes an ample patio, with a separate DJ, overlooking the T.I.'s signature Sirens pirate lagoon.</p>
                                                                            <p>In December, <a href="http://www.mirage.com/">The Mirage</a> revealed their brand new remodel of the volcano show in front of their hotel. Known the world over for its iconic Strip-front feature, <a href="http://www.mirage.com/">The Mirage</a> has joined forces with legendary Grateful Dead drummer Mickey Hart, Indian tabla sensation Zakir Hussain, and Fountains of Bellagio design firm WET to create an all-new audio/visual spectacle. This is one you have to be sure to not miss while enjoying your stay for the TCO! </p>
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
