<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>TopCoder :: Education Platform</title>
    <meta http-equiv="content-type" 
        content="text/html;charset=utf-8" />
    <meta http-equiv="Content-Style-Type" content="text/css" />
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_ep"/>
    </jsp:include>
    <%-- each school requires its own stylesheet, linked in here --%>
    <link type="text/css" rel="stylesheet" href="/css/ep/default.css" />
</head>

<body>

<div align="center">
    <div id="widther">
        <img src="/i/ep/widtherN.png" alt="" style="display:block;" />
        <div id="pageFrame">

            <jsp:include page="header.jsp">
                <jsp:param name="section" value="no_login"/>
            </jsp:include>

            <div id="pageContent" align="left">
                <div class="N">
                    <img src="/i/ep/contentNW.png" alt="" class="NW" />
                    <img src="/i/ep/contentNE.png" alt="" class="NE" />
                </div>
                <div class="spacer">

<%-- CONTENT BEGINS --%>

<div class="window" align="left">
    <div class="spacer">

        <div align="center" style="margin-bottom: 20px;">
            <img src="/i/ep/banner.jpg" alt="TopCoder Educational Platform" />
        </div>
    
        <p align="justify">
            The Education Platform extends the TopCoder Algorithm Arena to aid you in teaching computer science and programming at your university.  You can assign problems for your students to complete that will help reinforce the concepts that you are teaching in the classroom.  Additionally, you will be able to see your students' results, including the actual code written.  We at TopCoder hope you find this tool useful and informative.
        </p>

        <div style="float: left; width: 350px; margin: 20px 0;">
            <p align="center">
                <strong>Ready to get started?</strong>
            </p>
            <p align="center" class="small">
                First thing you need to do is register<br />with TopCoder as a professor.
            </p>
            <div align="center">
                <a href="/reg/?module=Main&amp;rt=7"><img src="/i/ep/buttons/registerProf.png" alt="Register as a professor" /></a>
            </div>
        </div>

        <div style="float: right; width: 350px; margin: 20px 0;">
            <p align="center">
                <strong>Done with professor registration?</strong>
            </p>
            <p align="center" class="small">
                Now you just need to email TopCoder to get<br />authorization to use the Educational Platform.
            </p>
            <div align="center">
                <a href="mailto:education@topcoder.com?subject=Educational%20Platform%20Authorization"><img src="/i/ep/buttons/talkTCRep.png" alt="Talk to a TopCoder rep" /></a>
            </div>
        </div>

        <br clear="all"/>

    </div>
</div>

<%-- CONTENT ENDS --%>

                </div>
                <div class="S">
                    <img src="/i/ep/contentSW.png" alt="" class="SW" />
                    <img src="/i/ep/contentSE.png" alt="" class="SE" />
                </div>
            </div>

            <jsp:include page="footer.jsp"/>

        </div>
        <img src="/i/ep/widtherS.png" alt="" style="display:block;" />
    </div>
</div>

</body>
</html>