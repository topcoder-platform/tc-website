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
            <li id="pr_menuactive"><a href="/tc?module=Static&d1=pressroom&d2=index" title="Current News"><span>Current News</span></a></li>
            <li><a href="/tc?module=Static&d1=pressroom&d2=pr_archive" title="Press Release Archive"><span>Press Release Archive</span></a></li>
            <li><a href="/tc?module=Static&d1=pressroom&d2=mediaResources" title="Media Resources"><span>Media Resources</span></a></li>
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
                    <a href="#linktonews"><img src="/i/pressroom/featured_tco07.png" width="440" height="136" ></a>
                </div>
                <div class="pr_featured_sub">
                    <div class="pr_subscribe_form">
                        <h3>Newsletter Sign Up</h3>
                        <form>
                        <input type="text" name="email" size="15" class="pr_email_text">&nbsp;<a href="#"><img src="/i/pressroom/btn_go.png" height="20" align="absmiddle"></a><br>
                        <input type="radio" name="subs_type" value="articles" id="pr_cek_articles">&nbsp;<label for="pr_cek_articles">Articles</label>&nbsp;<input type="radio" name="subs_type" value="press" id="pr_cek_press">&nbsp;<label for="pr_cek_press">Press Release</label>
                        </form>
                    </div>
                </div>
                <div class="pr_clear"></div>
            </div>
            <%-- .pr_featured end --%>
            
            <div class="pr_subheader">
                <h2><span>2007</span></h2>
            </div>
            
            <%-- pr_border creation --%>
            <div class="pr_box"><div class="pr_box2"><div class="pr_boxcontent">
                
                <%-- news item begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="#linktonews"><img src="/i/pressroom/headline_tco07.png" alt="TCO07" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="#linktonews">TopCoder Announces TopCoder Open 2007 Sponsored by AOL</a></h3>
                        <p>Top 80 Programmers from Around the World to Compete for $260,000 in Prizes June 27th through 29th at The Mirage, Las Vegas. 
                        <small><a href="#linktonews">[February 22]</a></small></p>
                                                
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- news item end --%>
                
                <%-- news item begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="#linktonews"><img src="/i/pressroom/headline_bizweek.png" alt="Business Week" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="#linktonews">Ideagora, a Marketplace for Minds</a></h3>
                        <p>Companies seeking solutions to seemingly insoluble problems can tap the insights of hundreds of thousands of enterprising scientists without having to employ everybody full-time. This shift is rippling through Corporate America and changing the way companies invent and develop products and services. <small><a href="#linktonews">[February 15]</a></small></p>
                                                
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- news item end --%>
                
                <%-- news item begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="#linktonews"><img src="/i/pressroom/headline_compworld.png" alt="Computer World" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="#linktonews">Microsoft launches 'mashup' competition for developers</a></h3>
                        <p>Microsoft Corp. and BT Group PLC launched a competition to encourage developers to create "network mashups" that merge telecommunications features such as voice and text messaging with Web 2.0 applications like mapping and search... TopCoder Inc., which runs several competitions for programmers, will manage the Microsoft/BT event.  <small><a href="#linktonews">[February 14]</a></small></p>
                                                
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- news item end --%>
                
                <%-- news item begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="#linktonews"><img src="/i/pressroom/headline_tchs.png" alt="TopCoder High School" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="#linktonews">Registration Opens for First TopCoder High School Global Programming Tournament</a></h3>
                        <p>The TopCoder High School Tournament follows in the full tradition of the company's flagship TopCoder Open and TopCoder Collegiate Challenge professional and collegiate events by providing a world class platform for high school students.  <small><a href="#linktonews">[February 13]</a></small></p>
                                                
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- news item end --%>
                
                <%-- news item begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="#linktonews"><img src="/i/pressroom/headline_sandbox.png" alt="MS Sandbox" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="#linktonews">Connected Services Sandbox Launches</a></h3>
                        <p>TopCoder has announced the launch of the Connected Services Sandbox competition series for Microsoft and BT. TopCoder will manage the competitions to help promote the development of innovative customer solutions that merge traditional telecommunications offerings. <small><a href="#linktonews">[February 12]</a></small></p>
                                                
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- news item end --%>
                
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