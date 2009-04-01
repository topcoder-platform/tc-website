<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>TopCoder High School 2008</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tchs08.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<div id="wrapper">

    <jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="purdue"/>
    <jsp:param name="tabLev2" value=""/>
    <jsp:param name="tabLev3" value=""/>
    </jsp:include>
    
    
    
        <div id="title">
            <h2>Purdue University: Dept. of Computer Science</h2>
        </div><%-- #title --%>
        
        <div id="content">
            <p>The Department of Computer Science at Purdue University, West Lafayette was formed in 1962 and today it is recognized as one of the top computer science programs in the country. Our mission is to advance the frontiers of computer science, to expand the pool of qualified individuals working in the discipline, and to reach out both within and beyond the university to apply computational principles to technical and societal problems.</p>
            <p>The department offers the degrees of Bachelor of Science, Master of Science, and Ph.D. in Computer Science. Currently, we have about 454 undergraduate majors and 120 graduate students working toward their degrees.</p>
            <p>In September 2006, the Computer Science department moved to a new home in the <a target="_blank" href="<tc-webtag:linkTracking link='http://www.cs.purdue.edu/about_us/lawson/' refer='tchs08_purdue' />">Richard and Patricia Lawson Computer Science Building</a>. Construction of the 100,000 square foot, $20 million building started in October 2004. The building provides students and faculty with five state-of-the-art instructional labs, and four new research labs. The Lawson Building is also wired with special 10-gigabit high-speed cable, 100 times faster than the standard Ethernet available throughout most of Purdue's campus.</p>
            
        </div><%-- #content --%>
        
        <jsp:include page="footer.jsp" />


</div><%-- #wrapper --%>

</body>
</html>