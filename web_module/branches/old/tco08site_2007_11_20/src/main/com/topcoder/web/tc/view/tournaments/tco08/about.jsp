<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>2008 TopCoder Open</title>
<link href="css/tco08.css" rel="stylesheet" type="text/css" />
<script src="js/minmax.js" language="javascript" type="text/javascript"></script>
<script src="js/tco08.js" language="javascript" type="text/javascript"></script>
</head>
<body id="page_home">

<div id="wrapper">

    <jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="overview"/>
    <jsp:param name="tabLev2" value="details"/>
    <jsp:param name="tabLev3" value=""/>
    </jsp:include>

<div id="mainmiddle"><div id="mainwrapper"><div id="main">

    <div id="content">
    
        <div id="front_pic"><img src="i/front_pic.jpg" alt="Who will be the next TCO Champions?" width="440" height="260" /></div>
    
        <%--
        <div id="menuwrap">
            <div id="menu">
                <ul id="menunav">
                    <li><a href="#">Secondary Nav Off</a></li>
                    <li><a href="#">Secondary Nav Off</a></li>
                    <li class="active"><a href="#">Secondary Nav On</a>
                        <ul>
                            <li><a href="#">Tertiary Nav Off</a></li>
                            <li class="active"><a href="#">Tertiary Nav On</a></li>
                            <li><a href="#">Tertiary Nav Off</a></li>
                            <li><a href="#">Tertiary Nav Off</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Secondary Nav Off</a></li>
                </ul>
            </div>
            <div class="clearleft"></div>
        </div> #menuwrap --%>
        
        
        <h2>Title</h2>
        
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

        <div class="sub_content">
        
            <h3>Subtitle</h3>
            
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
    
            <div id="sample_handles">
                
                <p><strong>Sample Handles:</strong></p>
                
                <p>
                    <span class="handle_01">FF9900</span><br />
                    <span class="handle_02">EE0000</span><br />
                    <span class="handle_03">DDCC00</span><br />
                    <span class="handle_04">6666FF</span><br />
                    <span class="handle_05">00A900</span><br />
                    <span class="handle_06">999999</span><br />
                    <span class="handle_07">FFFFFF</span><br />
                </p>
            </div><%-- #sample_handles --%>
            
            <div id="sample_table">
            
                <p><strong>Sample Table:</strong></p>
                <table width="100%" cellpadding="0" cellspacing="0">
                <tr>
                    <th>Table Header</th>
                </tr>
                <tr>
                    <td>Table row</td>
                </tr>
                <tr class="alt">
                    <td>Table row</td>
                </tr>
                <tr>
                    <td>Table row</td>
                </tr>
                <tr class="alt">
                    <td>Table row</td>
                </tr>
                <tr>
                    <td>Table row</td>
                </tr>
                <tr class="alt">
                    <td>Table row</td>
                </tr>
                </table>
            </div><%-- #sample_table --%>
            
            
        
        </div><%-- .sub_content --%>
        
    </div><%-- #content --%>

</div></div></div><%-- #mainwrapper + #main --%>

<jsp:include page="footer.jsp" >

</div><%-- #wrapper --%>

</body>
</html>
