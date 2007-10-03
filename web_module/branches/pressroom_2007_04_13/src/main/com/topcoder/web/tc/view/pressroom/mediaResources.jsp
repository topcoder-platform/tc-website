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
<%-- Left Column Begins --%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<%-- Left Column ends --%>

<%-- Center Column begins --%>
        <td width="100%" align="center">
            
            <div class="fixedWidth700Body">
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
        <li id="pr_menuactive"><a href="/tc?module=Static&d1=pressroom&d2=mediaResources" title="Media Resources"><span>Media Resources</span></a></li>
        <li><a href="/tc?module=Static&d1=pressroom&d2=mediaRequestForm" title="Media Request Form"><span>Media Request Form</span></a></li>
        <li><a href="/tc?module=Static&d1=pressroom&d2=art_archive" title="Media Articles Archive"><span>Media Articles Archive</span></a></li>
        </ul>
    </div>
    <%-- pr_menu end --%>
    <div class="pr_clear"></div>
    
    
    <%-- content rounded frame wrapper --%>
    <div id="pr_frame"><div id="pr_frame2"><div id="pr_frame3">
        
        <div id="pr_content">
        
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
                                <td class="pr_video_img"><a href="#linktonews"><img src="/i/pressroom/video_1.jpg" alt="Video Item" /></a></td>
                                <td class="pr_video_space">&nbsp;</td>
                                <td class="pr_video_desc">
                                    <h3><a href="#linktonews">TopCoder featured on public's radio "Open Source"</a></h3>
                                    <p>Lorem ipsum dolor sit amet conseqtetur, adispiscing ut labore et dolore magna aliqua. 
                                    <small>Size: 6.3MB | Format: avi | Player: Windows Media Player</small></p>
                                    
                                    <p><a href="#"><img src="/i/pressroom/btn_view.png" alt="View Video" width="54" height="18"></a>&nbsp;<a href="#"><img src="/i/pressroom/btn_download.png" alt="Download Video" width="87" height="18"></a></p>
                                </td>
                            </tr>
                            
                            <tr>
                                <td class="pr_video_img"><a href="#linktonews"><img src="/i/pressroom/video_1.jpg" alt="Video Item" /></a></td>
                                <td class="pr_video_space">&nbsp;</td>
                                <td class="pr_video_desc">
                                    <h3><a href="#linktonews">TopCoder featured on public's radio "Open Source"</a></h3>
                                    <p>Lorem ipsum dolor sit amet conseqtetur, adispiscing ut labore et dolore magna aliqua. 
                                    <small>Size: 6.3MB | Format: avi | Player: Windows Media Player</small></p>
                                    
                                    <p><a href="#"><img src="/i/pressroom/btn_view.png" alt="View Video" width="54" height="18"></a>&nbsp;<a href="#"><img src="/i/pressroom/btn_download.png" alt="Download Video" width="87" height="18"></a></p>
                                </td>
                            </tr>
                            </table>                        
                            
                            <%-- video item begin --%>
                            <%--
                            <div class="pr_videoitem">
                                <div class="pr_video">
                                    <a href="#linktonews"><img src="/i/pressroom/video_1.jpg" alt="Video Item" /></a>
                                </div>
                                <div class="pr_videodesc">
                                    <h3><a href="#linktonews">TopCoder featured on public's radio "Open Source"</a></h3>
                                    <p>Lorem ipsum dolor sit amet conseqtetur, adispiscing ut labore et dolore magna aliqua. 
                                    <small>Size: 6.3MB | Format: avi | Player: Windows Media Player</small></p>
                                    
                                    <p><a href="#"><img src="/i/pressroom/btn_view.png" alt="View Video" width="54" height="18"></a>&nbsp;<a href="#"><img src="/i/pressroom/btn_download.png" alt="Download Video" width="87" height="18"></a></p>
                                                            
                                </div>
                            </div>
                            --%>
                            <%-- video item end --%>
                            
                        </div>
                        
                    </div>
                    
                </div>
                
                <div class="pr_featured_sub">
                    <a href="#" title="Media Kit"><img src="/i/pressroom/featured_mediakit.png" width="223" height="145"></a><br>
                    <br>
                    <a href="mediaRequestForm.html" title="Public Relations"><img src="/i/pressroom/featured_requestform.png"></a>
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
                    <h3>Division</h3>
                    
                    <dl>
                    <dt>TCO (TopCoder Open)</dt>
                    <dd><a href="#">TopCoder Announced TopCoder Open 2007 Sponsored by AOL. <small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <small>[February 20]</small></a></dd>
                    </dl>
                    
                    <dl>
                    <dt>TCHS (TopCoder High School)</dt>
                    <dd><a href="#">Registration Opens for First TopCoder High School Global Programming Tournament. <small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <small>[February 20]</small></a></dd>
                    </dl>
                    
                    <dl>
                    <dt>TCCC (TopCoder Collegiate Challenge)</dt>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <small>[February 20]</small></a></dd>
                    </dl>
                    
                    <dl>
                    <dt>Corporate</dt>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <small>[February 20]</small></a></dd>
                    </dl>
                    
                    <dl>
                    <dt>Software</dt>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <small>[February 20]</small></a></dd>
                    </dl>
                    
                    <h3>Function</h3>
                    
                    <dl>
                    <dt>Legal</dt>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <small>[February 20]</small></a></dd>
                    </dl>
                    
                    <dl>
                    <dt>Financial</dt>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <small>[February 20]</small></a></dd>
                    </dl>
                    
                    <dl>
                    <dt>Client Wins</dt>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <small>[February 20]</small></a></dd>
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
<%-- Center Column ends --%>

<%-- Right Column begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
        </td>
<%-- Right Column ends --%>

<%-- Gutter --%>
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter ends --%>
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>