<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder Press Room</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
    <jsp:param name="key" value="tc_pressroom"/>
    </jsp:include>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
</head>
<body>

<jsp:include page="../top.jsp" >
<jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div align="center">
<%-- YOUR WORK GOES HERE --%>

<%-- pr_wrapper begin --%>
<div id="pr_wrapper">

    <%-- pr_header begin --%>
    <div id="pr_header">
        <h1><a onfocus="this.blur();" href="/tc?module=Static&amp;d1=pressroom&amp;d2=index" name="pr_top">Press Room</a></h1>
    </div>
    <%-- pr_header end --%>
    
    <%-- pr_menu begin --%>
    <div id="pr_menu">
        <ul>
        <li><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=index" title="Current News"><span>Current News</span></a></li>
        <li><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_archive" title="Press Release Archive"><span>Press Release Archive</span></a></li>
        <li><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_archive" title="Articles Archive"><span>Articles Archive</span></a></li>
        <li id="pr_menuactive"><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=mediaResources" title="Media Resources"><span>Media</span></a></li>
        <li><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=mediaRequestForm" title="Media Request Form"><span>Media Request Form</span></a></li>
        </ul>
    </div>
    <%-- pr_menu end --%>
    <div class="pr_clear"></div>
    
    
    <%-- content rounded frame wrapper --%>
    <div id="pr_frame"><div id="pr_frame2"><div id="pr_frame3">
        
        <div id="pr_content" align="left">
        
            <%-- .pr_featured begin --%>
            <div class="pr_featured">
                <div class="pr_featured_main">
                    
                    <div id="pr_promovideo">
                        
                        <div id="pr_promovideo_header">
                        <h2>Featured Videos</h2>
                        </div>
                        
                        <div id="pr_videocontent">
                        
                            <%-- because of floating problem, this data presented using table --%>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="pr_video_img"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=movies"><img src="/i/pressroom/tco08webcast.png" alt="TCO08 webcast" /></a></td>
                                    <td class="pr_video_space">&nbsp;</td>
                                    <td class="pr_video_desc">
                                        <h3><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=movies">2008 TopCoder Open webcast</a></h3>
                                        <p>View the entire TCO08 in 27 separate parts!  Also featuring a Tournament trailer, behind the scenes interviews with Admins, and time-lapse videos.  Requires Flash 7 or higher. 
                                        <br />
                                        <a href="<tc-webtag:linkTracking link='/tc?module=Static&d1=tournaments&d2=tco08&d3=movieStream&clip=tco08_1&title=TC%20Channel%20from%20the%20TCO' refer='mediaResources' />"><small style="margin-left:10px;">Ch 1 time: 00:01:30 | Format: Flash</small></a>
                                        <a href="<tc-webtag:linkTracking link='/tc?module=Static&d1=tournaments&d2=tco08&d3=movieStream&clip=tco08_2&title=Studio%20intros' refer='mediaResources' />"><small style="margin-left:10px;">Ch 2 time: 00:01:58 | Format: Flash</small></a>
                                        <a href="<tc-webtag:linkTracking link='/tc?module=Static&d1=tournaments&d2=tco08&d3=movieStream&clip=tco08_3&title=Marathon%20intr...%20er%20group%20photo' refer='mediaResources' />"><small style="margin-left:10px;">Ch 3 time: 00:00:46 | Format: Flash</small></a></p>
                                        
                                        <div style="height:15px;"><span style="width:70; float:left; padding:5px;"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=movies" class="button">View</a></span></div>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td class="pr_video_img"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=movies"><img src="/i/pressroom/tccc07webcast.png" alt="TCCC07 webcast" /></a></td>
                                    <td class="pr_video_space">&nbsp;</td>
                                    <td class="pr_video_desc">
                                        <h3><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=movies">2007 TopCoder Collegiate Challenge webcast</a></h3>
                                        <p>View the entire TCCC07 in 3 separate parts as well as the Tournament trailer.  Requires Flash 7 or higher. 
                                        <br />
                                        <a href="<tc-webtag:linkTracking link='/tc?module=Static&d1=tournaments&d2=tccc07&d3=movieStream&clip=ep06_part1&title=TC%20Channel%20at%20the%20TCCC07%20Part%201' refer='mediaResources' />"><small style="margin-left:10px;">Ch 1 time: 00:07:03 | Format: Flash</small></a>
                                        <a href="<tc-webtag:linkTracking link='/tc?module=Static&d1=tournaments&d2=tccc07&d3=movieStream&clip=ep06_part2&title=TC%20Channel%20at%20the%20TCCC07%20Part%202' refer='mediaResources' />"><small style="margin-left:10px;">Ch 2 time: 00:10:07 | Format: Flash</small></a>
                                        <a href="<tc-webtag:linkTracking link='/tc?module=Static&d1=tournaments&d2=tccc07&d3=movieStream&clip=ep06_part3&title=TC%20Channel%20at%20the%20TCCC07%20Part%203' refer='mediaResources' />"><small style="margin-left:10px;">Ch 3 time: 00:09:30 | Format: Flash</small></a></p>
                                        
                                        <div style="height:15px;"><span style="width:70; float:left; padding:5px;"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=movies" class="button">View</a></span></div>
                                    </td>
                                </tr>
                            </table>
                            
                        </div>
                        
                    </div>
                    
                </div>
                
                <div class="pr_featured_sub">
                    <a href="/tc?module=Static&amp;d1=media&amp;d2=tcchannel" title="TC Channel"><img src="/i/pressroom/tcchannelPR.png" width="223" height="145"></a><br />
                    <br />
                    <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=mediaRequestForm" title="Public Relations"><img src="/i/pressroom/featured_requestform.png"></a>
                </div>
                
            </div>
            <div class="pr_clear"></div>
            <%-- .pr_featured end --%>
            
            <%-- Yearly Sub Content Container --%>
            <div class="pr_subheader">
                <h2><span>2008</span></h2>
            </div>
            
            <%-- pr_border creation --%>
            <div class="pr_box"><div class="pr_box2"><div class="pr_boxcontent">
                
                <div class="pr_newsarchive">
                    <dl>
                    <dt>&nbsp;</dt>
                    <dd><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=movieStream&clip=tco08_1&title=TC%20Channel%20from%20the%20TCO">TC Channel Reports from TCO08 <br /><small style="margin-left:10px;">[May 12]</small></a></dd>
                    </dl>
                </div>
                
                <p class="pr_backtop"><a href="#pr_top">Back to Top</a></p>
                <div class="pr_clear"></div>
                
            </div></div></div>
            <%-- Yearly Container end --%>
            
            <%-- Yearly Sub Content Container --%>
            <div class="pr_subheader">
                <h2><span>2007</span></h2>
            </div>
            
            <%-- pr_border creation --%>
            <div class="pr_box"><div class="pr_box2"><div class="pr_boxcontent">
                
                <div class="pr_newsarchive">
                    <dl>
                    <dt>&nbsp;</dt>
                    <dd><a href="/tc?module=Static&amp;d1=media&amp;d2=tcchannel&clip=ep07">TC Channel: Episode 7 <br /><small style="margin-left:10px;">[December 31]</small></a></dd>
                    <dd><a target="_blank" href="http://www.youtube.com/watch?v=NadhzzMoMus">Psyho-Analysis <br /><small style="margin-left:10px;">[October 24]</small></a></dd>
                    <dd><a href="http://software.topcoder.com/media/misc3x2.jsp">TopCoder to Join Walt Mossberg and Bill Taylor Speaking at BIF-3 Collaborative Innovation Summit <br /><small style="margin-left:10px;">[October 10-11]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=movieStream&clip=ep06_trailer&title=TC%20Channel%20is%20Going%20to%20Disney%20World">TC Channel Reports from TCCC07 <br /><small style="margin-left:10px;">[October 23]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=media&amp;d2=tcchannel&clip=ep05">TC Channel: Episode 5 <br /><small style="margin-left:10px;">[September 25]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=media&amp;d2=tcchannel&clip=ep04">TC Channel: Episode 4 <br /><small style="margin-left:10px;">[August 27]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=movies">2007 TopCoder Open webcast <br /><small style="margin-left:10px;">[August 3]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=media&amp;d2=misc3x2&clip=foxchicago_20070802&title=Fox%20TV:%20Top%20Computer%20Programmers%20Compete">Fox TV: "Top Computer Programmers Compete" <br /><small style="margin-left:10px;">[August 2]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=media&amp;d2=tcchannel&clip=ep03">TC Channel: Episode 3 <br /><small style="margin-left:10px;">[July 25]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=movieStream&clip=montage&title=Handheld%20camera%20montage">TCO07 highlights video now available <br /><small style="margin-left:10px;">[July 3]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=movieStream&clip=aolCTO&title=Interview%20with%20AOL%20CTO,%20Balan%20Nair">TCO Preview: An Interview with AOL's Balan Nair <br /><small style="margin-left:10px;">[June 26]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=media&amp;d2=tcchannel&clip=ep02">TC Channel: Episode 2 <br /><small style="margin-left:10px;">[June 20]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tchs07&amp;d3=movieStream">TCHS07 Photos &amp; Video now available <br /><small style="margin-left:10px;">[May 23]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=media&amp;d2=tcchannel&clip=ep01">Introducing the new TC Channel! <br /><small style="margin-left:10px;">[May 16]</small></a></dd>
                    <dd><a target="_blank" href="/movies/promotional/TopCoder_software_01.31.07.mov">Building Software through Competition <br /><small style="margin-left:10px;">[January 31]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=movies">Watch the full TCCC06 Webcast <br /><small style="margin-left:10px;">[January 8]</small></a></dd>
                    </dl>
                </div>
                
                <p class="pr_backtop"><a href="#pr_top">Back to Top</a></p>
                <div class="pr_clear"></div>
                
            </div></div></div>
            <%-- Yearly Container end --%>
            
            <%-- Yearly Sub Content Container --%>
            <div class="pr_subheader">
                <h2><span>2006</span></h2>
            </div>
            
            <%-- pr_border creation --%>
            <div class="pr_box"><div class="pr_box2"><div class="pr_boxcontent">
                
                <div class="pr_newsarchive">
                    <dl>
                    <dt>&nbsp;</dt>
                    <dd><a target="_blank" href="/movies/tournament/tccc06/final_webcast_preview.mov">TCCC06 Webcast Highlights <br /><small style="margin-left:10px;">[December 8]</small></a></dd>
                    <dd><a target="_blank" href="/audio/open_source_060928_48kb.mp3">TopCoder featured on public radio's "Open Source" <br /><small style="margin-left:10px;">[October 4]</small></a></dd>
                    <dd><a target="_blank" href="http://media32b.libsyn.com/aHeceJl2a3eTdmd2bHOcq5qkZnaZ/podcasts/dickwall/JavaPosse065.mp3">Java Posse - Interviews from TopCoder and Java One <br /><small style="margin-left:10px;">[July 5]</small></a></dd>
                    <dd><a target="_blank" href="/movies/press/cnbc_051506.mov">CNBC's Jane's Addiction and Squawk Box at the TCO06 <br /><small style="margin-left:10px;">[May 15]</small></a></dd>
                    <dd><a target="_blank" href="http://media41b.libsyn.com/andueJx1nXycfJd1Z3lvpGqtZXqZ/podcasts/dickwall/JavaPosse053.mp3">Java Posse - Listener Feedback and TopCoder Interviews <br /><small style="margin-left:10px;">[May 15]</small></a></dd>
                    <dd><a target="_blank" href="http://media32b.libsyn.com/a3edeJR1nnyUeGx8bXttpWytZHKZ/podcasts/dickwall/JavaPosse054.mp3">Java Posse - Live at the TopCoder Open <br /><small style="margin-left:10px;">[May 11]</small></a></dd>
                    <dd><a target="_blank" href="http://media41b.libsyn.com/mHdxeJp1cXvHfZd5anptq26sZXGb/podcasts/dickwall/JavaPosse052.mp3">Java Posse - Jack Hughes interview <br /><small style="margin-left:10px;">[May 5]</small></a></dd>
                    <dd><a target="_blank" href="/audio/Pat_Conley_03_10_06.mp3">Exclusive: Interview with Pat Conley, VP VeriSign O&amp;I and TopCoder Member <br /><small style="margin-left:10px;">[March 10]</small></a></dd>
                    <dd><a href="http://software.topcoder.com/about/explanationMovie.jsp">How engineering meets manufacturing at TopCoder Software <br /><small style="margin-left:10px;">[February 9]</small></a></dd>
                    <dd><a target="_blank" href="http://www.javaposse.com/media/dickwall/JavaPosse026.mp3">Java Posse - Bill Goggin interview <br /><small style="margin-left:10px;">[January 20]</small></a></dd>
                    </dl>
                </div>
                
                <p class="pr_backtop"><a href="#pr_top">Back to Top</a></p>
                <div class="pr_clear"></div>
                
            </div></div></div>
            <%-- Yearly Container end --%>

            
        </div>
        <%-- pr_content end --%>
        
    </div></div></div>
    <%-- pr_frame_inner pr_frame --%>

</div>
<%-- pr_wrapper end --%>

<%-------------------------%>
            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
    </tbody>
</table>

<jsp:include page="../foot.jsp" />
</body>
</html>