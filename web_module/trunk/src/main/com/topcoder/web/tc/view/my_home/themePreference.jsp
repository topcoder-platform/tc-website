<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="com.topcoder.web.tc.Constants"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
    <title>TopCoder - My TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <script language="JavaScript" type="text/javascript" src="/js/jquery.cookie.js"></script>
    <script type="text/javascript">

        // initialize the preference value
        $(document).ready(function() {
            if($.cookie('oldTheme')) {
                // old skin
                $("#oldTheme").attr('checked', 'checked');
            } else {
                // new skin
                $("#newTheme").attr('checked', 'checked');
            }
        });

        function saveTheme() {
            if($('#oldTheme').is(":checked")) {
                $.cookie('oldTheme', 'true', { expires: 9999, path: '/', domain: 'topcoder.com' });
            } else {
                $.removeCookie('oldTheme', { path: '/', domain: 'topcoder.com' });
            }

            location.reload();
        }
    </script>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="myHome">
    <tbody>
    <tr valign="top">
        <%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="my_topcoder"/>
            </jsp:include>
        </td>
        <%-- Left Column Ends --%>

        <%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn" id="theme-preference">
            <div class="maxWidthBody" align="left">

                <jsp:include page="../page_title.jsp" >
                    <jsp:param name="image" value="my_tc"/>
                    <jsp:param name="title" value="Theme Preference"/>
                </jsp:include>

                <p align="center" class="note">
                    Please choose the theme
                </p>

                    <table cellpadding="0" cellspacing="0" class="stat" width="100%">
                        <tbody>
                        <tr>
                            <td class="title">
                                Theme Preference
                            </td>
                        </tr>
                        <tr>
                            <td><input type="radio" name="theme" id="oldTheme"/> &nbsp;&nbsp; old TopCoder theme (black and red)</td>
                        </tr>
                        <tr>
                            <td><input type="radio" name="theme" id="newTheme"/> &nbsp;&nbsp; new topcoder Theme</td>
                        </tr>
                        </tbody>
                    </table>
                </form>

                <%
                    Boolean isNewStyle = request.getAttribute("isNewStyle") == null ? false : (Boolean) request.getAttribute("isNewStyle");
                %>

                <% if(isNewStyle) { %>
                <div>
                    <table class="controls">
                        <tbody>
                        <tr>
                            <td>
                                <a class="btn" href="javascript:saveTheme()">Save</a>
                            </td>
                            <td>
                                <a class="btn btnBlue" href="/tc?module=MyHome">Cancel</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <% } else { %>


                <div align="center">
                    <table cellpadding="0" cellspacing="0" style="margin: 20px;">
                        <tbody>
                        <tr>
                            <td>
                                <a href="javascript:saveTheme()" class="button" style="width: 60px; margin-right: 10px;">Save</a>
                            </td>
                            <td>
                                <a href="/tc?module=MyHome" class="button" style="width: 60px;">Cancel</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <% } %>


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