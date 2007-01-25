<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="csf.tld" prefix="csf" %>
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/main.css"/>
    <link type="text/css" rel="stylesheet" href="/css/stats.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>
    <script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
    <script type="text/javascript"> _uacct = "UA-321688-2";
    urchinTracker(); </script>
    <script type="text/javascript" src="/js/popup.js"></script>
</head>

<body>

<div align="center">
<div id="content">

<jsp:include page="top.jsp"/>

<jsp:include page="primaryNav.jsp">
<jsp:param name="selectedTab" value="home"/>
</jsp:include>

<div id="main">
    <div class="sectionHeader">
        <span class="sectionNumber">01</span>
        | <span class="sectionName">Section Title</span>
    </div>

    <p>
    Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In nisi orci, rhoncus in, sollicitudin quis, lacinia at, nisi. Suspendisse potenti. Maecenas pretium. Vestibulum dapibus dictum nibh. Ut augue ligula, fringilla non, lacinia sit amet, dignissim id, dui. Maecenas vel nulla. Donec quis dolor at mi faucibus iaculis. Morbi a sapien at ligula auctor viverra. Curabitur hendrerit metus ut ligula. Aliquam dignissim ultricies augue.
    </p>
    <p>
    Maecenas leo. Duis convallis malesuada est. Aenean suscipit, nisi non laoreet consequat, est felis cursus turpis, at rutrum quam mi nec massa. Sed eu orci. Quisque nec nisi. Maecenas condimentum pede sagittis libero. Donec dictum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Vestibulum vehicula, metus at laoreet hendrerit, justo nunc aliquam ipsum, sed dictum orci nibh sed nunc. Maecenas rhoncus, eros vel malesuada nonummy, ante nisl consectetuer leo, ut ornare massa urna ut sapien. Ut rhoncus. Mauris a velit quis ligula accumsan tempus. Suspendisse potenti. Mauris diam. Cras felis mauris, egestas quis, bibendum ut, elementum vitae, nisl. Curabitur non lectus. Nulla eget lectus. Aenean et lectus.
    </p>
    <p>
    Morbi nulla. Sed ac nisl. Nulla ultrices, elit viverra accumsan bibendum, urna odio placerat urna, quis facilisis nibh ligula at dolor. Integer nec justo. Aenean vehicula eros at nulla. Cras justo diam, rutrum nec, varius et, pellentesque quis, felis. Praesent cursus, tortor eget pellentesque dictum, turpis risus suscipit magna, eget convallis lacus tellus eget enim. Maecenas auctor. Duis imperdiet leo id lacus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
    </p>
    <p>
    Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Praesent lobortis mollis ante. Quisque lobortis nisi vel quam malesuada egestas. Donec tempus neque ut sem. Donec bibendum, nisl in viverra blandit, tortor lacus viverra mauris, vitae vehicula sapien ligula a leo. Integer sollicitudin egestas odio. Donec et nisi. Vestibulum sit amet eros. Nunc in sem. Nulla facilisi.
    </p>
    <table cellpadding="0" cellspacing="0" class="stat" width="100%">
    <thead>
        <tr>
            <td class="title" colspan="3">
                <span class="title">Title:</span>
                Subtitle
            </td>
        </tr>
        <tr>
            <td class="header">
                Header
            </td>
            <td class="headerC">
                Header
            </td>
            <td class="headerR">
                Header
            </td>
        </tr>
    </thead>
    <tbody>
        <tr class="light">
            <td class="value">
                Value
            </td>
            <td class="valueC">
                Value
            </td>
            <td class="valueR">
                Value
            </td>
        </tr>
        <tr class="dark">
            <td class="value">
                Value
            </td>
            <td class="valueC">
                Value
            </td>
            <td class="valueR">
                Value
            </td>
        </tr>
        <tr class="light">
            <td class="value">
                Value
            </td>
            <td class="valueC">
                Value
            </td>
            <td class="valueR">
                Value
            </td>
        </tr>
    </tbody>
    </table>
    <p>
    Nulla quis risus id lectus aliquet auctor. Fusce posuere pulvinar augue. Aliquam erat volutpat. Nam purus risus, condimentum eu, laoreet id, euismod ac, erat. Nullam eu massa. Sed nonummy tempor enim. Vivamus velit. Mauris euismod sodales quam. Vivamus nisl. Nulla elementum dui nec magna mattis sollicitudin. Sed convallis. Aliquam nec odio et quam sagittis condimentum.
    </p>
    <div align="center">
        <A href="" class="button" style="width: 50px;">Button</A>
        <A href="" class="button" style="width: 50px;">Button</A>
    </div>

</div>
    
<jsp:include page="foot.jsp"/>
</div>
</div>

</body>
</html>