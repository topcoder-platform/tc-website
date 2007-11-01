<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
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

        <jsp:include page="../nav.jsp" >
        <jsp:param name="tabLev1" value="<%=EventType.COMPONENT_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="development"/>
        <jsp:param name="tabLev3" value="summary"/>
        </jsp:include>

            <div id="pageBody">
                <h1><span>Component Development Summary</span></h1>
                    <div style="float:right;">
                        <A HREF="http://forums.topcoder.com/?module=ThreadList&amp;forumID=518024">Discuss this</A><br />
                    </div>

                    <p>Thursday, November 1, 2007<br />
                    by <span><strong>the Development Review Board</strong></span><br />
                    <span><em>TopCoder Members</em></span></p>

                    <%-- Round 1 --%>
                    <p>Wednesday, October 31, 2007<br />
                    <span style="font-size:14px;"><strong>Round 1</strong></span><br />
                    by <tc-webtag:handle coderId="7210680" context="development" darkBG="true" /></p>
                    
                    <p>On the development side, the first component of this year's TCCC was very similar for .NET and Java. Although the .NET developers faced a few Java-isms in the UML docs, both designs fit well into their respective environment. Hence, the choice was totally a matter of developer preference, and maybe to some degree a desire to win the per-component prize. The fact that Java 5 is now used in many components also makes the differences smaller, with things like generics and enums.</p>
                    <p>The actual scope of the component was to provide an object model and convenient access to the contents of files for SVN authorization settings. For an SVN server handling multiple source code repositories and projects with granular security access, maintaining the associated flat text files of permissions and group structure can be a horror. The requirements and the design put a lot of effort into maintaining the specific structure of the file read, even when it contains semi-illegal or redundant information. Even whitespace should be preserved perfectly! Together with the fact that comments are allowed just about anywhere in the file, what might seem like a straightforward line-by-line read is suddenly far from trivial.</p>
                    <p>The real "killer" in this component, however, was another aspect: the huge and very flexible frontend for performing CRUD (create, read/retrieve, update, delete) operations on the basic entities of users, groups, and repository paths. The design also included indexing for faster lookups. All modifying operations need to be carefully implemented to update or rebuild the index properly, and also make sure that the index is in a consistent state, even if the operation should fail.</p>
                    <p>Yet, the main problem for several of the submitters was just the sheer number of similar, but not identical, methods to implement in the frontend. Several of those who did submit at all still had remaining rough edges, or even unimplemented methods. Personally, I'm reminded of the "Conversion Factory 1.0" component I did back in 2004 where the list of methods for the single main class needs to be zoomed out to 25 % to fit on a 1600x1200 display... The key to that component, as well as this one, was for the developer to figure out the best way to reduce the redundancy in the actual implementation.</p>
                    <br />
                    
                    <%-- Round 2 --%>
                    <p>Thursday, November 1, 2007<br />
                    <span style="font-size:14px;"><strong>Round 2</strong></span><br />
                    by <tc-webtag:handle coderId="7360309" context="development" darkBG="true" /></p>
                    
                    <p>The Ant (NAnt) Dependency Versions component is a custom Ant task (NAnt function) for finding the best fit version of a dependency jar file (dll file) within a specified path and a version expression. The version of the dependency file will be determined through a pluggable algorithm.  Two implementations are provided:  one that relies on the TopCoder directory structure, and one that determines version from META-INF/MANIFEST.MF for java archives or metadata in .NET assemblies.  The best fit version will be selected by "last version" and "last build date" pluggable algorithms according the version expression.  This component is very useful for the application to find the best fit Java archives (.NET assemblies) by build script automatically.</p>
                    <p>This component is the easiest of the three TCCC07 final development components. It had 5 submissions and almost all of them implemented the functionalities correctly. But the developers should pay special attention to the exception handling. They should consider the invalid/non-existing files, invalid version expressions, invalid version format of the files, etc.  Two submissions did a good job on it and the others missed some required exceptions.</p>


            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>