<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>Careers at TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <jsp:include page="/script.jsp" />
    <jsp:include page="/style.jsp">
    <jsp:param name="key" value="tc_main"/>
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
                <jsp:param name="node" value="working_tc"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div align="center">
<%-- YOUR WORK GOES HERE --%>

<%-- jobs_wrapper begin --%>
<div id="jobs_wrapper">

    <%-- jobs_header begin --%>
    <div id="jobs_header">
        <h1><a onfocus="this.blur();" href="/tc?module=Static&amp;d1=about&amp;d2=jobs" name="jobs_top">Careers at TopCoder</a></h1>
    </div>
    <%-- jobs_header end --%>
    
    <%-- jobs_menu begin --%>
    <div id="jobs_menu">
        <ul>
            <li><a href="/tc?module=Static&amp;d1=about&amp;d2=jobs" title="Great Jobs at TopCoder"><span>Great Jobs at TopCoder</span></a></li>
            <li id="jobs_menuactive"><a href="/tc?module=Static&amp;d1=about&amp;d2=jobsAboutTC" title="About TopCoder"><span>About TopCoder</span></a></li>
        </ul>
    </div>
    <%-- jobs_menu end --%>
    <div class="jobs_clear"></div>
    
    
    <%-- content rounded frame wrapper --%>
    <div id="jobs_frame"><div id="jobs_frame2"><div id="jobs_frame3">
        
        <div id="jobs_content" align="left">
        
            <%-- .jobs_featured begin --%>
            <div class="jobs_featured">
                <div class="jobs_featured_main">
                    <div>
                        <br />
                        <h3>About TopCoder</h3>
                        <br />
                        <p><img src="/i/about/man_computer.jpg" alt="man_computer" style="margin: 0px 10px 10px 0px; float:left; width:200px; height:151px; border: 1px solid #999999;" />
                        TopCoder, Inc. provides a variety of service offerings.  We are the recognized leader in organizing and hosting online and onsite programming 
                        competitions for a global community of members.  Our software development methodology is building cutting edge enterprise software solutions 
                        for Fortune 500 clients by utilizing the largest and most diverse global workforce on the market, and our recruiting operation provides corporations 
                        with an unparalleled level of talent which is evaluated through our programming competitions.</p>
                        <br />
                        <p>TopCoder members extend across all professional and collegiate levels. The attraction of competition and the associated rewards create the most 
                        powerful community of programmers in the world. Corporate partners access this member base for value in terms of employment, software development 
                        and sponsorship.</p>
                        <br />
                        <p>Incorporated in 2001, TopCoder, Inc. has become the standard by which talent and software are measured. Our small staff is young, enthusiastic 
                        and welcomes the challenges of charting new territory within the industry. The Company has been built with integrity as our cornerstone, and we value 
                        professional and ethical standards at every level - from our employees and our clients alike.</p>
                        <br />
                        <p>Through our revolutionary software development methodology, cutting-edge recruiting offerings, and world-renowned programming tournaments, we are 
                        committed to excellence. We expect the same commitment and drive from our current and future employees.</p>
                        <br />
                        <p>If you are interested in joining this fast growing company, please view our open positions below and apply <a href="mailto:jobs@topcoder.com">here</a>.</p>
                    </div>
                </div>
                <div class="jobs_clear"></div>
            </div>
            <%-- .jobs_featured end --%>

        </div>
        <%-- jobs_content end --%>

    </div></div></div>
    <%-- jobs_frame_inner jobs_frame --%>

</div>
<%-- jobs_wrapper end --%>

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