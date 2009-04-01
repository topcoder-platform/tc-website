<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Report Widget</title>
    <link href="/css/widgets/cost_report/reportStyles.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin-top:12px;">

<% 

    if (!((com.topcoder.web.common.SessionInfo) request.getAttribute(com.topcoder.web.common.BaseServlet.SESSION_INFO_KEY)).isAdmin()) {
%>
You need to be logged as an admin in order to access Report Widget.<br>
<a href="http://<%= request.getServerName() %>/tc?module=Login">Login<br>
<%
     
     
    } else {

%>



<div id="wrapper">
    <div class="brand-reports">
        <div class="controls">
            <ul>
                <li>
                    <a href="#"><img src="/i/widgets/cost_report/icon_minimize.gif" alt="Minimize" border="0" /></a>
                </li>
                <li>
                    <a href="#"><img src="/i/widgets/cost_report/icon_play.gif" alt="Play" border="0" /></a>
                </li>
                <li>
                    <a href="#"><img src="/i/widgets/cost_report/icon_close.gif" alt="Close" border="0" /></a>
                </li>
            </ul>
        </div>
    </div>
<!-- End Branding -->
    <div class="wrapper-content">
        <div class="wrapper-sub">
            <div class="frame"><iframe src="/tc?module=Static&d1=report_jsp&d2=widgetprototype&d3=main_report" name="frame" frameborder="0" marginheight="0" marginwidth="0" scrolling="auto" height="400" width="568"></iframe></div>
        </div>
        <div class="footer">
            <div class="footer-btn">
                <a href="index_yearly.html"><img src="/i/widgets/cost_report/btn_back.gif" alt="Back" border="0" /></a>
            </div>
        </div>
<!-- End Footer -->
    </div>
<!-- End Wrapper-Content -->
</div>
<!-- End Wrapper -->
 
 <% } %>
 
 
</body>
 </html>
