<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tccc07.css"/>
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
                
                    <div id="pageBody">
                        <div id="breadcrumbs">
                            <a href="" alt="Tournament Overview">Tournament Overview</a> > <a href="" alt="Secondary Section">Secondary Section</a> > <a href="" alt="Tertiary Section">Tertiary Section</a>
                        </div>
                        <h1><span>Title Here</span></h1>
                        <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                        </p>
                        
                        <h2>Subtitle</h2>
                        <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                        </p>
                        
                        <br />
                        <div id="tableNhandles">
                            <table class="stat" width="75%" border="1">
                                <tr>
                                    <th class="stat title">Table Header</th>
                                </tr>
                                <tr class="dark">
                                    <td>Table Row</td>
                                </tr>
                                <tr class="light">
                                    <td>Table Row</td>
                                </tr>
                                <tr class="dark">
                                    <td>Table Row</td>
                                </tr>
                                <tr class="light">
                                    <td>Table Row</td>
                                </tr>
                                <tr class="dark">
                                    <td>Table Row</td>
                                </tr>
                            </table>
                                
                            <div id="handleColors">
                                <ul style="list-style:none;">HANDLE COLORS
                                    <li style="color:#ff9900;">HANDLE 1</li>
                                    <li style="color:#ee0000;">HANDLE 2</li>
                                    <li style="color:#ddcc00;">HANDLE 3</li>
                                    <li style="color:#5959dd;">HANDLE 4</li>
                                    <li style="color:#00a900;">HANDLE 5</li>
                                    <li style="color:#999999;">HANDLE 6</li>
                                    <li style="color:#ffffff;">HANDLE 7</li>
                                </ul>
                            </div>
                        </div>
                        <!--
                        <p align="center" style="margin-top: 40px;">
                        This tournament is brought to you by TopCoder, Inc. (<A href="/">http://www.topcoder.com/</A>) 703 Hebron Avenue, Glastonbury, CT 06033.<br>
                        <span class="small">[SPONSOR is not responsible for any aspect of the Tournament.]</span>
                        </p> -->
                    </div>
                    <img src="/i/tournament/tccc07/stylebar.png" alt="stylebar" width="745px" />
                </td>
                    
                <td id="navSpacer">
                    <jsp:include page="nav.jsp" >
                    <jsp:param name="tabLev1" value="overview"/>
                    <jsp:param name="tabLev2" value="details"/>
                    <jsp:param name="tabLev3" value=""/>
                    </jsp:include>    
                </td>
            </tr>
        </tbody>
        </table>
    
    
            <jsp:include page="footer.jsp" />
        </div>
</div>

</body>

</html>
