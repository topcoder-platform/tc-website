<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />
<title>2007 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="content">
        <div id="tourneyLogo">
            <a href="/tco07"><img src="/i/tournament/tco07/tco07aollogo.png" alt="2007 TopCoder Open Sponsored by AOL&#174;" /></a>
        </div>
<%--
--%>
        <div id="pageInfo">
            <div style="margin: 4px 10px 4px 10px; text-align: left; color: #FFFFFF;">
                <div style="float: right;">
                    Monday, February 5, 2007
                </div>
                Text
            </div>
        </div>        
        <img src="/i/tournament/tco07/contentN.png" alt="contentN" style="display: block;" />

        <table cellpadding="0" cellspacing="0" style="margin: 82px 20px 0px 13px;">
        <tbody>
            <tr>
                <td style="background: #F4DFB6; padding: 0px; vertical-align: top;">
                    <jsp:include page="nav.jsp" >
                    <jsp:param name="tabLev1" value="algorithm"/>
                    <jsp:param name="tabLev2" value="registrants"/>
                    <jsp:param name="tabLev3" value=""/>
                    </jsp:include>
                </td>
                <td class="" width="100%" style="background: #FFFFFF; vertical-align: top;  padding: 0px;">
                    <div id="pageBody">
                        <p>
                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Quisque eget sem. Donec massa. Nam ligula elit, blandit at, volutpat vitae, euismod ac, lorem. Integer lacus ipsum, sodales sit amet, varius eget, tincidunt a, dui. Vivamus lectus felis, interdum nec, scelerisque vel, fermentum eget, ligula. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec iaculis ultricies turpis. Proin sed dui ac neque iaculis mollis. Pellentesque tempus ornare est. Suspendisse non elit eget libero consequat rhoncus. Duis ut purus. Ut et urna quis neque consequat rhoncus. Aliquam fringilla. Vestibulum quis nunc. Donec sollicitudin auctor felis. Vestibulum suscipit magna pulvinar enim. Aliquam laoreet.
                        </p>
                        <p>
                        Nam volutpat. Mauris euismod. Donec dignissim ipsum ac mi. In ipsum. Vestibulum varius, elit vel sollicitudin hendrerit, augue lacus gravida ante, at vulputate nibh lectus quis lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Morbi sed nisi a nulla pretium vestibulum. Vivamus nisi neque, venenatis ut, pulvinar id, pulvinar vel, orci. Integer adipiscing euismod massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed justo. Sed ac metus eu elit lacinia scelerisque. Curabitur pellentesque volutpat diam. Phasellus condimentum posuere mauris. Sed magna tellus, nonummy quis, lacinia nec, egestas eget, diam. Aliquam non lorem.
                        </p>
                        <p>
                        Nulla vel lacus. Donec ut erat. Nunc justo odio, tristique non, viverra tempor, facilisis at, augue. Integer lacinia suscipit diam. Aenean ultrices neque eu lectus. Mauris ut leo. Ut a ante. Phasellus augue. Nam a nibh. Quisque at sapien et lacus ultrices rhoncus. Mauris velit dui, luctus quis, dignissim eget, facilisis eget, arcu.
                        </p>
                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="footer.jsp" />
    </div>
</div>

</body>

</html>
