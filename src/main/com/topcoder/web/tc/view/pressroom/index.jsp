<%--
  - Author: TCSASSEMBER
  - Version: 1.1
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page is the current news page in press room.
  -
  - Version 1.1 (Central content management generating JSP pages automatically Assembly) changes:
  - Use AJAX to get RSS feed dynamic and render the data to JSP page.
--%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.tc.Constants" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder Press Room</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
    <jsp:param name="key" value="tc_pressroom"/>
    </jsp:include>
    <script type="text/javascript" src="/js/home/jquery-1.2.6.min.js"></script>
    <script type="text/javascript" src="/js/rssArticles.js"></script>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    
    <script type="text/javascript">
    $(document).ready(function() {
        getRssArticles('<%=Constants.CURRENT_NEWS_RSS%>', renderCurrentNews, '<%=Constants.CURRENT_NEWS_CATEGORY%>', 12);
    });
    </script>
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
        <h1><a onFocus="this.blur();" href="/tc?module=Static&amp;d1=pressroom&amp;d2=index" name="pr_top">Press Room</a></h1>
    </div>
    <%-- pr_header end --%>
    
    <%-- pr_menu begin --%>
    <div id="pr_menu">
        <ul>
            <li id="pr_menuactive"><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=index" title="Current News"><span>Current News</span></a></li>
            <li><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_archive" title="Press Release Archive"><span>Press Release Archive</span></a></li>
            <li><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_archive" title="Articles Archive"><span>Articles Archive</span></a></li>
            <li><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=mediaResources" title="Media Resources"><span>Media</span></a></li>
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
                    <%-- old version
                    <span style="padding-left:125px;"><a href="#linktonews"><img src="/i/pressroom/featured_tco07.png" width="440" height="136" ></a></span>
                    --%>
                    <div style="padding-left:90px;">
                        <%-- PromoBanner --%><%-- 
                        <a href="<tc-webtag:linkTracking link='http://www.topcoder.com/tco09' refer='pr_index' />"><img src="/i/tco09/536x121_banner.jpg" alt="2009 TopCoder Open" /></a>--%>
                        
                    </div>
                </div>
                <%--
                <div class="pr_featured_sub">
                    <div class="pr_subscribe_form">
                        <h3>Newsletter Sign Up</h3>
                        <form>
                        <input type="text" name="email" size="15" class="pr_email_text">&nbsp;<a href="#"><img src="/i/pressroom/btn_go.png" height="20" align="absmiddle"></a><br>
                        <input type="radio" name="subs_type" value="articles" id="pr_cek_articles">&nbsp;<label for="pr_cek_articles">Articles</label>&nbsp;<input type="radio" name="subs_type" value="press" id="pr_cek_press">&nbsp;<label for="pr_cek_press">Press Release</label>
                        </form>
                    </div>
                </div>
                --%>
                <div class="pr_clear"></div>
            </div>
            <%-- .pr_featured end --%>

            <div id="loading"><img src="/i/loading.gif" /></div>
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