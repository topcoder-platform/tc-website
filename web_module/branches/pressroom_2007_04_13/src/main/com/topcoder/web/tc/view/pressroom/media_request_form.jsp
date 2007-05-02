<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
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
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            
            <div id="pressContainer">
                <!-- Press Room Banner -->
                <div id="pressRoom">
                    <img src="/i/pressroom/press_banner.png" alt="Press Room Banner" />
                </div>
                
                <div id="pressContainer2">
                    <!-- Navigation Tabs -->
                    <div id="tabHeader">
                        <ul>
                            <li><a href="/tc?module=Static&d1=pressroom&d2=index">Current News</a></li>
                            <li><a href="/tc?module=Static&d1=pressroom&d2=pr_archive">Press Releases Archive</a></li>
                            <li><a href="/tc?module=Static&d1=pressroom&d2=media_resources">Media Resources</a></li>
                            <li id="tabCurrent"><a href="/tc?module=Static&d1=pressroom&d2=media_request_form">Media Request Form</a></li>
                            <li><a href="/tc?module=Static&d1=pressroom&d2=art_archive">Media Articles Archive</a></li>
                        </ul>
                    </div>
                    

                    <!-- Media Request Form -->
                    <div align="center">

                        <p>Please use the following form to request information from our Public Relations department.</p>

                        <table cellpadding="4" cellspacing="0" style="clear: both; width:500px; border: 1px solid green;">
                            <tr>
                                <td nowrap="nowrap">First Name</td><td width="100%"><input name="first" size="20" maxlength="15" value="" type="text"></td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap">Last Name</td><td><input name="last" size="20" maxlength="15" value="" type="text"></td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap">Email address</td><td><input name="email" size="20" maxlength="15" value="" type="text"></td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap">Phone number</td><td><input name="phone" size="20" maxlength="15" value="" type="text"></td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap">Fax</td><td><input name="fax" size="20" maxlength="15" value="" type="text"></td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap">Type of Media</td>
                                <td>
                                    <select name="cc">
                                    <option value=""></option>
                                    <option value="01">Bla 1</option>
                                    <option value="02">Bla 2</option>
                                    <option value="03">Bla 3</option>
                                    <option value="04">Bla 4</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap">Media Outlet</td><td><input name="mediaoutlet" size="20" maxlength="15" value="" type="text"></td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap">Your Title</td><td><input name="title" size="20" maxlength="15" value="" type="text"></td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap">Are you on assignment?</td><td><input name="onassignment" size="20" maxlength="15" value="" type="text"></td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap">Comments or Questions:</td><td><textarea cols="40" rows="6" name="comments"></textarea></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td><td><a href="" class="button" style="width: 60px;">Submit</a></td>
                            </tr>
                        </table>

                        <img src="/i/pressroom/year_footer.png" alt="Year footer" />
                        <div align="left">
                            <a href=""><img src="/i/pressroom/top_button.png" alt="Back to Top" /></a>
                        </div>
                    </div>
                </div>
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