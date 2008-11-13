<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.aolicq.Constants" %>
<%@ page import="com.topcoder.web.aolicq.controller.request.Login" %>
<%@ page import="java.util.Map" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="aolicq.tld" prefix="aolicq" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ribbit - $100,000 Killer App Challenge - Home :: Powered by TopCoder</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_aolicq"/>
    </jsp:include>

</head>
<body>
	  
	 <jsp:include page="topNav.jsp">
        <jsp:param name="active_page" value="home"/>
    </jsp:include>
<div id="wrapper">
<jsp:include page="aolicqTop.jsp"/>
      <%-- Front Page Body Content --%>  
        <div id="left-content">
        	
            <div id="about-banner">
            	<h2>Show Us What You've Got!</h2>
                <p>We want to challenge the top developers out there. Give us your best submissions and you might be a big winner.</p>
                <h3>Up to $100,000.00 in Prizes</h3>
            </div>
            
            <div id="about-text">
            	<div id="contest-stats">
                	<h2>Latest Contest Statistics</h2>
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <th class="first">Registered Competitors</th>
                            <th>Number of Submitted Apps</th>
                            <th class="last">Days Remaining</th>
                        </tr>
                        <tr>
                        	<td class="first">111</td>
                            <td>222</td>
                            <td class="last">333</td>
                        </tr>
                        <tr>
                        	<td class="table-foot" colspan="3"></td>
                        </tr>
                    </table>
                </div>
            	<h2>What is a Killer App?</h2>
                <p>Lorem ipsum dolor sit amet, sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur.</p>
            </div>
            
            <div id="register-steps">
            	<h2>Steps to Register</h2>
                <p>Participation in the Ribbit Killer App Challenge is completely FREE! Just follow the simple steps below and you'll be on your way to possibly claiming some of our $100,000 in prize money! Here's a quick overview:</p>
            	<ol>
                	<li><strong>Register for a developer id at ribbit.com.</strong></li>
                    <li class="two"><strong>Sign up to become a Topcoder member (select at least the &quot;Competition Registration&quot; checkbox)</strong><br />Etiam congue, sapien mollis aliquam ullamcorper, purus elit adipiscing eros, sed molestie tellus sem vel quam. Nullam et metus. Duis blandit. Vivamus sed mauris eu nisi iaculis facilisis. Phasellus lobortis, nulla sit</li>
                    <li class="three"><strong>Register for the Ribbit Killer App Challenge now!</strong><br />Etiam congue, sapien mollis aliquam ullamcorper, purus elit adipiscing eros, sed molestie tellus sem vel quam. Nullam et metus. Duis blandit. Lorem ipsum dolor sit amet lobortis, nulla sit amet molistie vehicula, eros arcu egestas nunct, sit amet lobortis diam erat ac eros. Aliquam erat volutpat.</li>
                    <li class="four"><strong>Submit your application</strong><br />Etiam congue, sapien mollis aliquam ullamcorper, purus elit adipiscing eros, sed molestie tellus sem vel quam. Nullam et metus. Duis blandit. Vivamus sed mauris eu nisi iaculis facilisis. Phasellus lobortis, nulla sit amet molistie vehicula, eros arcu egestas nunct, sit amet lobortis diam erat ac eros. Aliquam erat volutpat.</li>
                </ol>
            </div>
        
        </div>
        
        <div id="right-sidebar">
        	
            <div id="blog-posts-sidebar">
                <h3>Latest Blog Posts</h3>
          		
                <ul>
                    <li id="blogsidebar"></li>
        		 <script>
						var rss = "/blog/?feed=rss2";
			
						//A sample URL to get Template
						var template = "/js/killerapp/blogTemplate.txt";
			
						var processor = new js.topcoder.rss.template.RSSProcessor(false, template);
						document.getElementById("blogsidebar").innerHTML = (processor.transformRSSFeed(rss));
       			 </script>
                    
                    
                    <li>
                    	 <a href="#" class="view-all" title="Learn More">Learn More</a>
                    </li>
                </ul>
            </div>
            
            <div id="forum-posts-sidebar">
                <h3>Latest Forum Posts</h3>
                
                <ul>
                    <li id="forumssidebar"> </li>
                    <li>
                    	 <a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/forums" class="view-all" title="Learn More">Learn More</a>
                    </li>
                </ul>
               <script>
						var rss = "/forums?module=RSS&forumID=2";
			
						//A sample URL to get Template
						var template = "/js/killerapp/forumTemplate.txt";
			
						var processor = new js.topcoder.rss.template.RSSProcessor(false, template);
						document.getElementById("forumssidebar").innerHTML = (processor.transformRSSFeed(rss));
       			 </script>
            </div>
        </div>
        <p style="clear:both;"></p>
        </div>
        </div>
	<div id="footer"></div>
</body>
</html>