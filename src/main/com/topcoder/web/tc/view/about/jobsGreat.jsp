<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>Working at TopCoder</title>
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
        <h1><a onfocus="this.blur();" href="/tc?module=Static&amp;d1=pressroom&amp;d2=index" name="jobs_top">Press Room</a></h1>
    </div>
    <%-- jobs_header end --%>
    
    <%-- jobs_menu begin --%>
    <div id="jobs_menu">
        <ul>
            <li><a href="/tc?module=Static&amp;d1=about&amp;d2=jobs" title="Overview"><span>Overview</span></a></li>
            <li id="jobs_menuactive"><a href="/tc?module=Static&amp;d1=about&amp;d2=jobsGreat" title="Great Jobs at TopCoder"><span>Great Jobs at TopCoder</span></a></li>
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
                        <p>If you're reading this you already know that TopCoder is an exciting company full of talented people on a mission to revolutionize the software industry - and have a lot of fun doing it. We work hard, we play hard. We pay well, offer flexible schedules and benefits and now's your chance to be part of the team. If you think you're right for TopCoder and TopCoder is right for you, check out our open positions and <a href="mailto:jobs@topcoder.com">apply today</a>.</p>
                        <br />
                    </div>
                </div>
                <div class="jobs_clear"></div>
            </div>
            <%-- .jobs_featured end --%>
            
            <%-- Current Openings Content Container --%>
            <div class="jobs_subheader">
                <h2><span>Current Openings</span></h2>
            </div>
            
            <%-- jobs_border creation --%>
            <div class="jobs_box"><div class="jobs_box2"><div class="jobs_boxcontent">
                
                <%-- Deployment Engineer begin --%>
                <div class="jobs_newsitem">
                    <div class="jobs_img">
                        &nbsp;
                    </div>
                    <div class="jobs_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=about&amp;d2=deployment_engineer">Deployment Engineer</a></h3>
                        <p>The Deployment Engineer will work with TopCoder Project Managers and Software Architects in configuring, installing, and running applications created through the TopCoder competition process. This opportunity seeks a candidate who has prior experience in running a diverse...  <small><a href="/tc?module=Static&amp;d1=about&amp;d2=deployment_engineer">[read full description]</a></small></p>
                    </div>
                    <div class="jobs_imgR">
                        <a href="/tc?module=Static&amp;d1=about&amp;d2=deployment_engineer"><img src="/i/about/jobs/arrow.png" alt="arrow" border="0" /></a>
                    </div>
                    <div class="jobs_clear"></div>
                </div>
                <%-- Deployment Engineer end --%>
                
                <%-- Software Project Manager begin --%>
                <div class="jobs_newsitem">
                    <div class="jobs_img">
                        &nbsp;
                    </div>
                    <div class="jobs_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=about&amp;d2=project_manager">Software Project Manager</a></h3>
                        <p>Work closely with TopCoder Software customers to identify business needs. Manage all phases of the TopCoder Software Application Development Methodology to deliver high quality software applications that add significant business value to our customers...  <small><a href="/tc?module=Static&amp;d1=about&amp;d2=project_manager">[read full description]</a></small></p>
                    </div>
                    <div class="jobs_imgR">
                        <a href="/tc?module=Static&amp;d1=about&amp;d2=project_manager"><img src="/i/about/jobs/arrow.png" alt="arrow" border="0" /></a>
                    </div>
                    <div class="jobs_clear"></div>
                </div>
                <%-- Software Project Manager end --%>
                
                <%-- Software Application Architect begin --%>
                <div class="jobs_newsitem">
                    <div class="jobs_img">
                        &nbsp;
                    </div>
                    <div class="jobs_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=about&amp;d2=software_application_architect">Software Application Architect</a></h3>
                        <p>Work closely with TopCoder Software project managers to break applications down into functional areas for concurrent development. Break down customer applications into components using the TopCoder Component Catalog for existing components and the TopCoder...  <small><a href="/tc?module=Static&amp;d1=about&amp;d2=software_application_architect">[read full description]</a></small></p>
                    </div>
                    <div class="jobs_imgR">
                        <a href="/tc?module=Static&amp;d1=about&amp;d2=software_application_architect"><img src="/i/about/jobs/arrow.png" alt="arrow" border="0" /></a>
                    </div>
                    <div class="jobs_clear"></div>
                </div>
                <%-- Software Application Architect end --%>
                
                <%-- Information Architect begin --%>
                <div class="jobs_newsitem">
                    <div class="jobs_img">
                        &nbsp;
                    </div>
                    <div class="jobs_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=about&amp;d2=frontend_designer">Information Architect</a></h3>
                        <p>We are seeking a creative candidate who has a strong design background and experience developing web sites/web applications using standards. The ideal designer will be capable of producing a web project through all stages of development using information architecture, design, hand- coding HTML and CSS and performing any one of these functions...  <small><a href="/tc?module=Static&amp;d1=about&amp;d2=frontend_designer">[read full description]</a></small></p>
                    </div>
                    <div class="jobs_imgR">
                        <a href="/tc?module=Static&amp;d1=about&amp;d2=frontend_designer"><img src="/i/about/jobs/arrow.png" alt="arrow" border="0" /></a>
                    </div>
                    <div class="jobs_clear"></div>
                </div>
                <%-- Information Architect end --%>
                
                <%-- Salesperson begin --%>
                <div class="jobs_newsitem">
                    <div class="jobs_img">
                        &nbsp;
                    </div>
                    <div class="jobs_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=about&amp;d2=tcs_salesdirector">Salesperson</a></h3>
                        <p>TopCoder, Inc. is a rapidly growing and progressive company looking to build a sales team that is motivated, has the proven ability and desire to sell to Fortune 1000 C-Level executives, and that can articulate the TopCoder value. TopCoder markets application development services to Fortune 1000 companies...  <small><a href="/tc?module=Static&amp;d1=about&amp;d2=tcs_salesdirector">[read full description]</a></small></p>
                    </div>
                    <div class="jobs_imgR">
                        <a href="/tc?module=Static&amp;d1=about&amp;d2=tcs_salesdirector"><img src="/i/about/jobs/arrow.png" alt="arrow" border="0" /></a>
                    </div>
                    <div class="jobs_clear"></div>
                </div>
                <%-- Information Architect end --%>
                
                <p class="jobs_backtop"><a href="#jobs_top">Back to Top</a></p>
                <div class="jobs_clear"></div>
                
            </div></div></div>
            <%-- Current Openings Container end --%>

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