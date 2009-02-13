<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
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
    <div id="containAll">
    <div id="content">

        <jsp:include page="nav.jsp" >
        <jsp:param name="tabLev1" value="overview"/>
        <jsp:param name="tabLev2" value="roundtable"/>
        <jsp:param name="tabLev3" value=""/>
        </jsp:include>

            <div id="pageBody">

                <h1><span>2007 TopCoder Collegiate Challenge Roundtable</span></h1>
                <div align="right"><a href="http://forums.topcoder.com/?module=Thread&threadID=586767">Discuss this</a></div>
                
                <h2>Designing Software for Reuse</h2>
                
                <p>The TopCoder architecture group has been having a discussion about best strategies and practices for designing software for reuse (TopCoder catalog components in particular). Key points at issue include appropriate use of access control modifiers provided by Java and C# (public / protected / private / internal / (none)), making classes and class members final or sealed, and planning for extensibility. There being disagreement among the architects, we became interested in opening the discussion to the TopCoder community.</p>
                <p>One position being promoted is that TopCoder errs by demanding that class members be private unless otherwise specified; we should instead use protected or public access for all members except where there is explicit justification for restricting access further. Among the advantages espoused for this "Open Interface" position are accessibility of substantially all classes and members for testing, accessibility of substantially all members to subclasses, and more ready reuse of code developed incidentally in the course of implementing TC designs (mainly various helper methods).</p>
                <p>The main alternative position is essentially TopCoder's existing practices requiring narrowly-defined public APIs and encapsulating everything else as private class members / package-protected classes. Among the advantages espoused for this "Planned Interface" position are smaller, easier APIs, protection from bugs introduced by inappropriate overrides in subclasses, and firmer, more specific behavioral guarantees provided by our components.</p>
                <p>Also, as a bit of a tangent, we brought up the question of how much emphasis should be placed on promoting design for reuse by sub-classing existing component classes and leveraging polymorphism. This factors into the discussion based on the proposition that the Open Interface approach would make it easier to employ polymorphism as a mode of reuse.</p>
                <p>So that's where you come in. What do you think? If there are better coding practices or development processes that we can implement, then we want to identify them. This is not a poll, however, nor do we expect a consensus to form (though we're willing to be surprised!). We do hope to foster a discussion that explores the topic, and we will pay careful attention to how we can improve TopCoder based on the results.</p>
                
                <h2>Roundtable Participants</h2>
                <p><strong>Dr. Martin Griss, Associate Dean and Professor at Carnegie-Mellon West</strong><br />
                Dr. Martin Griss is Associate Dean and a Professor of the Practice at Carnegie-Mellon West.  He teaches a software metrics course and leads research in reuse engineering and context-aware software agent systems. He spent two decades as Principal Laboratory Scientist at Hewlett-Packard and as Director of HP's 70 person Software Technology Laboratory. He is a leading authority on software reuse, widely known as HP's "Reuse Rabbi" where he led HP's corporate reuse program, and is co-author of a popular book "Software Reuse: Architecture, Process and Organization for Business Success." At HP Labs he led work on software agents, software tools and process, application managment, UML standards, and component-based software engineering.  He served on the ACM SIGSOFT Executive committee, on the ACM/IEEE "Software Engineering as Profession" taskforce, and numerous program, workshop and tutorial committees. He has lectured widely, and has published over 60 articles, book chapters and tutorials on software engineering, component-based development, software reuse and software agents. He earned his B.Sc in Math/Physics from the Technion and a Ph.D. in Physics from the University of Illinois.</p>
                
                <p><strong>Dave Messinger, TopCoder Chief Architect</strong><br />
                David Messinger is responsible for managing TopCoder's best-in-class component development. He joined the company in January, 2003 after working as a consultant for seven years. Since then he has been instrumental in developing TopCoder's software development culture and offerings. At TopCoder, Messinger has been involved from the ground floor, serving throughout the organization at one time or another as a Project Manager, Architect, and Component Manager. Currently, Messinger serves as Chief Architect focused on developing TopCoder's industry leading best practices for component-based architecture and development.</p>
                <p>Previously he served in various capacities at Tallan and Amentra, both custom software development and consulting companies. At both of these companies, Messinger served as a project manager and architect for companies such as Priceline.com, Kinkos.com, Merck Pharmaceuticals and Pinnacle West. While working as a consultant, Messinger had the opportunity to move across the technology and enterprise spaces of these organizations, gathering a deep insight into enterprise technology including .NET and Java handheld, web and thick client applications.</p>
                
                
                <p style="height:250px;">&nbsp;</p>
                
            </div>
    </div>
    <jsp:include page="footer.jsp" />
    </div>
</div>
</body>
</html>
