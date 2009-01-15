<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TopCoder Studio</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
</head>

<body>
<<<<<<< .mine
	<div id="page-wrap">
    	<div align="center">
			<jsp:include page="top.jsp">
            <jsp:param name="section" value="contact" />
        	</jsp:include>
        <br />
=======
    <!-- wrapper -->
    <div id="wrapper">
        <!-- header -->
        <div id="header">
            <jsp:include page="top.jsp"/>
            <jsp:include page="topNav.jsp">
                <jsp:param name="node" value="contactUs"/>
            </jsp:include>
        </div>
>>>>>>> .r74200
        <!-- container -->
        <div id="container">
					<!-- content -->
					<div id="content">
						<div class="contentTop">
							<div class="contentMiddle">
			
								<h1>Contact Us</h1>
		
								<div id="contact">
									<table cellpadding="10" cellspacing="0">
										<tbody>
											<tr>
												<td>
													<strong>Corporate Address</strong><br />
													TopCoder, Inc.<br />
													
													<address>95 Glastonbury Blvd<br />
													Glastonbury, CT 06033 U.S.A.</address>
													
													tel: 860.633.5540<br />
													fax: 860.657.4276
												</td>
											</tr>
											<tr>
												<td>
													<strong>Member Support </strong><br />
													Email:
													<a href="mailto:studioadmin@topcoder.com?subject=TopCoder%20Studio%20General%20Questions">studioadmin@topcoder.com</a>
												</td>
										   </tr>
											<tr>
												<td>
													<strong>Sales</strong><br />
													Email: <a href="mailto:studiosales@topcoder.com">studiosales@topcoder.com</a>
												</td>
											</tr>
										</tbody>
									</table>
								</div>

                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="foot.jsp"/>


</body>
</html>