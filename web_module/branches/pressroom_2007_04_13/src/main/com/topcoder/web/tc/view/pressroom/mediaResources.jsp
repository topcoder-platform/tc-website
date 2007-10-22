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
        <h1><a href="/tc?module=Static&d1=pressroom&d2=index" name="pr_top">Press Room</a></h1>
    </div>
    <%-- pr_header end --%>
    
    <%-- pr_menu begin --%>
    <div id="pr_menu">
        <ul>
        <li><a href="/tc?module=Static&d1=pressroom&d2=index" title="Current News"><span>Current News</span></a></li>
        <li><a href="/tc?module=Static&d1=pressroom&d2=pr_archive" title="Press Release Archive"><span>Press Release Archive</span></a></li>
        <li id="pr_menuactive"><a href="/tc?module=Static&d1=pressroom&d2=mediaResources" title="Media Resources"><span>Media</span></a></li>
        <li><a href="/tc?module=Static&d1=pressroom&d2=mediaRequestForm" title="Media Request Form"><span>Media Request Form</span></a></li>
        <li><a href="/tc?module=Static&d1=pressroom&d2=art_archive" title="Articles Archive"><span>Articles Archive</span></a></li>
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
                                <td class="pr_video_img"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=movies"><img src="/i/pressroom/tco07webcast.png" alt="TCO07 webcast" /></a></td>
                                <td class="pr_video_space">&nbsp;</td>
                                <td class="pr_video_desc">
                                    <h3><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=movies">2007 TopCoder Open webcast</a></h3>
                                    <p>View the entire TCO07 in 3 separate parts.  Also featuring a Tournament trailer, an interview with AOL CTO Balan Nair, and a handheld camera montage.  Requires Flash 7 or higher. 
                                    <br /><small style="margin-left:10px;">Ch 1 time: 01:03:55 | Format: Flash</small></p>
                                    
                                    <div style="height:15px;"><span style="width:70; float:left; padding:5px;"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=movies" class="button">View</a></span></div>
                                </td>
                            </tr>
                            
                            <tr>
                                <td class="pr_video_img"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=movies"><img src="/i/pressroom/video_1.jpg" alt="TCCC06 webcast" /></a></td>
                                <td class="pr_video_space">&nbsp;</td>
                                <td class="pr_video_desc">
                                    <h3><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=movies">2006 TopCoder Collegiate Challenge webcast</a></h3>
                                    <p>View the entire TCCC06 in 8 separate parts.  Requires Flash 7 or higher. 
                                    <br /><small style="margin-left:10px;">Ch 1 time: 00:26:27 | Format: Flash</small></p>
                                    
                                    <div style="height:15px;"><span style="width:70; float:left; padding:5px;"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=movies" class="button">View</a></span></div>
                                </td>
                            </tr>
                            </table>
                            
                        </div>
                        
                    </div>
                    
                </div>
                
                <div class="pr_featured_sub">
                    <a href="/tc?module=Static&d1=media&d2=tcchannel" title="TC Channel"><img src="/i/pressroom/tcchannelPR.png" width="223" height="145"></a><br />
                    <br />
                    <a href="/tc?module=Static&d1=pressroom&d2=mediaRequestForm" title="Public Relations"><img src="/i/pressroom/featured_requestform.png"></a>
                </div>
                
            </div>
            <div class="pr_clear"></div>
            <%-- .pr_featured end --%>
            
            <%-- Yearly Sub Content Container --%>
            <div class="pr_subheader">
                <h2><span>2007</span></h2>
            </div>
            
            <%-- pr_border creation --%>
            <div class="pr_box"><div class="pr_box2"><div class="pr_boxcontent">
                
                <div class="pr_newsarchive">
                    <dl>
                    <dt>&nbsp;</dt>
                    <dd><a href="/tc?module=Static&d1=media&d2=tcchannel&clip=ep05">TC Channel: Episode 5 <br /><small style="margin-left:10px;">[September 25]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=media&d2=tcchannel&clip=ep04">TC Channel: Episode 4 <br /><small style="margin-left:10px;">[August 27]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=movies">2007 TopCoder Open webcast <br /><small style="margin-left:10px;">[August 3]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=media&d2=misc3x2&clip=foxchicago_20070802&title=Fox%20TV:%20Top%20Computer%20Programmers%20Compete">Fox TV: "Top Computer Programmers Compete" <br /><small style="margin-left:10px;">[August 2]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=media&d2=tcchannel&clip=ep03">TC Channel: Episode 3 <br /><small style="margin-left:10px;">[July 25]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=movieStream&clip=montage&title=Handheld%20camera%20montage">TCO07 highlights video now available <br /><small style="margin-left:10px;">[July 3]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=movieStream&clip=aolCTO&title=Interview%20with%20AOL%20CTO,%20Balan%20Nair">TCO Preview: An Interview with AOL's Balan Nair <br /><small style="margin-left:10px;">[June 26]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=media&d2=tcchannel&clip=ep02">TC Channel: Episode 2 <br /><small style="margin-left:10px;">[June 20]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=movieStream">TCHS07 Photos &amp; Video now available <br /><small style="margin-left:10px;">[May 23]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=media&d2=tcchannel&clip=ep01">Introducing the new TC Channel! <br /><small style="margin-left:10px;">[May 16]</small></a></dd>
                    <dd><a target="_blank" href="/movies/promotional/TopCoder_software_01.31.07.mov">Building Software through Competition <br /><small style="margin-left:10px;">[January 31]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=movies">Watch the full TCCC06 Webcast <br /><small style="margin-left:10px;">[January 8]</small></a></dd>
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