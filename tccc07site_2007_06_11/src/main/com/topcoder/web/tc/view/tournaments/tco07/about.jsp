<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="bodySpacer" width="100%">
                    <img src="/i/tournament/tccc07/competitorsbanner.jpg" alt="Competitors" />
                    <div id="pageBody">


                    <h1><span>Title</span></h1>
                    <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                    </p>
                    
                    <h2>Subtitle</h2>
                    <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                    </p>
                    
                    <table>
                        <tr>
                            <td>Table Header</td>
                        </tr>
                        <tr>
                            <td>Table Row</td>
                        </tr>
                        <tr>
                            <td>Table Row</td>
                        </tr>
                        <tr>
                            <td>Table Row</td>
                        </tr>
                        <tr>
                            <td>Table Row</td>
                        </tr>
                        <tr>
                            <td>Table Row</td>
                        </tr>
                    </table>
                    
                    <ul style="list-style:none;">Handle Colors
                        <li>Handle 1</li>
                        <li>Handle 2</li>
                        <li>Handle 3</li>
                        <li>Handle 4</li>
                        <li>Handle 5</li>
                        <li>Handle 6</li>
                        <li>Handle 7</li>
                    </ul>
                    
                    <p align="center" style="margin-top: 40px;">
                    This tournament is brought to you by TopCoder, Inc. (<A href="/">http://www.topcoder.com/</A>) 703 Hebron Avenue, Glastonbury, CT 06033.<br>
                    <span class="small">[SPONSOR is not responsible for any aspect of the Tournament.]</span>
                    </p>


                    </div>
                </td>
                <td id="navSpacer">

                    <jsp:include page="nav.jsp" >
                    <jsp:param name="tabLev1" value="overview"/>
                    <jsp:param name="tabLev2" value="details"/>
                    <jsp:param name="tabLev3" value=""/>
                    </jsp:include>

                </td>
            </tr>
        </table>


        <jsp:include page="footer.jsp" />
    </div>
</div>

</body>

</html>
