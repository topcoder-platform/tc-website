<%@ page import="com.topcoder.shared.util.ApplicationServer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Studio Home</title>
        <script type="text/javascript" src="/js/regReskin20080904.js"></script>
        <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
        <jsp:include page="style.jsp">
            <jsp:param name="key" value="tc_reg"/>
        </jsp:include>
    </head>
    
    <body>
        
        <div id="wrapper">
        
            <div id="box-head">
                <jsp:include page="header.jsp" />
                <div id="page-head">
                    <h3><strong>Studio Home</strong></h3>
                </div>
            </div>
            
            <div id="box-body">
            
                <p class="padded center">
                    <a href="profile_view_personal_information.jsp">Update Profile</a> | 
                    <a href="signup_personal_information_1.jsp">Register Now</a>
                </p>
            
            </div>
            <jsp:include page="footer.jsp" />
            
        </div>
        
    </body>
</html>
