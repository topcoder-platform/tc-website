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
                <h1><span>PE is the new Component Development Champion!</span></h1>
                    <div style="float:right;">
                        <A HREF="http://forums.topcoder.com/?module=ThreadList&amp;forumID=518024">Discuss this</A><br />
                    </div>

                    <p>Friday, November 2, 2007<br />
                    by <span><strong>the Development Review Board</strong></span><br />
                    <span><em>TopCoder Members</em></span></p>
                    
                    <p style="float:right; width:200px; 350px; margin-left:10px;"><img src="/i/tournament/tccc07/compDev.jpg"></p>
                    <br /><br />
                    <p>After three days of on-site finals, <tc-webtag:handle coderId="9998760" context="development" darkBG="true" /> emerged as the winner of the 2007 TopCoder Collegiate Challenge Component Development competition, taking home the top prize of $15,000. <tc-webtag:handle coderId="21075542" context="development" darkBG="true" /> came in second, and <tc-webtag:handle coderId="20937270" context="development" darkBG="true" /> took home the third.</p>
                    
                    <p style="font-size:14px; font-weight:bold;">Component Development Final Scores</p>
                    <table cellspacing="0" cellpadding="0" class="stat" style="width: 50%">
                        <thead>
                            <tr class="sidebarTitle" nowrap="nowrap">
                                <td class="header" colspan="1">Handle</td>
                                <td class="headerC" colspan="1">Total Points</td>
                            </tr>
                        </thead> 
                        <%-- PE --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="9998760" darkBG="true" context="development" /></td>
                                <td class="valueC">100</td>
                            </tr>
                        </tbody>
                        <%-- lyt --%>
                        <tbody>
                            <tr class="dark">
                                <td class="value"><tc-webtag:handle coderId="21075542" darkBG="true" context="development" /></td>
                                <td class="valueC">47</td>
                            </tr>
                        </tbody>
                        <%-- serine --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="20937270" darkBG="true" context="development" /></td>
                                <td class="valueC">37</td>
                            </tr>
                        </tbody>
                        <%-- enefem21 --%>
                        <tbody>
                            <tr class="dark">
                                <td class="value"><tc-webtag:handle coderId="20092786" darkBG="true" context="development" /></td>
                                <td class="valueC">32</td>
                            </tr>
                        </tbody>
                        <%-- Yeung --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="15604762" darkBG="true" context="development" /></td>
                                <td class="valueC">24</td>
                            </tr>
                        </tbody>
                        <%-- catcher --%>
                        <tbody>
                            <tr class="dark">
                                <td class="value"><tc-webtag:handle coderId="10063132" darkBG="true" context="development" /></td>
                                <td class="valueC">22</td>
                            </tr>
                        </tbody>
                        <%-- fanse --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="20095099" darkBG="true" context="development" /></td>
                                <td class="valueC">22</td>
                            </tr>
                        </tbody>
                    </table>
                    <br /><br />

                    <%-- Round 1 --%>
                    <p>Wednesday, October 31, 2007<br />
                    <span style="font-size:14px;"><strong>Round 1: Subversion Path-Based Authorization Development</strong></span><br />
                    by <tc-webtag:handle coderId="7210680" context="development" darkBG="true" /></p>
                    
                    <p>On the development side, the first component of this year's TCCC was very similar for .NET and Java. Although the .NET developers faced a few Java-isms in the UML docs, both designs fit well into their respective environment. Hence, the choice was totally a matter of developer preference, and maybe to some degree a desire to win the per-component prize. The fact that Java 5 is now used in many components also makes the differences smaller, with things like generics and enums.</p>
                    <p>The actual scope of the component was to provide an object model and convenient access to the contents of files for SVN authorization settings. For an SVN server handling multiple source code repositories and projects with granular security access, maintaining the associated flat text files of permissions and group structure can be a horror. The requirements and the design put a lot of effort into maintaining the specific structure of the file read, even when it contains semi-illegal or redundant information. Even whitespace should be preserved perfectly! Together with the fact that comments are allowed just about anywhere in the file, what might seem like a straightforward line-by-line read is suddenly far from trivial.</p>
                    <p>The real "killer" in this component, however, was another aspect: the huge and very flexible frontend for performing CRUD (create, read/retrieve, update, delete) operations on the basic entities of users, groups, and repository paths. The design also included indexing for faster lookups. All modifying operations need to be carefully implemented to update or rebuild the index properly, and also make sure that the index is in a consistent state, even if the operation should fail.</p>
                    <p>Yet, the main problem for several of the submitters was just the sheer number of similar, but not identical, methods to implement in the frontend. Several of those who did submit at all still had remaining rough edges, or even unimplemented methods. Personally, I'm reminded of the "Conversion Factory 1.0" component I did back in 2004 where the list of methods for the single main class needs to be zoomed out to 25 % to fit on a 1600x1200 display... The key to that component, as well as this one, was for the developer to figure out the best way to reduce the redundancy in the actual implementation.</p>
                    <br />
                    
                    <%-- Round 2 --%>
                    <p>Thursday, November 1, 2007<br />
                    <span style="font-size:14px;"><strong>Round 2: Ant Dependency Versions / NAnt Dependency Versions</strong></span><br />
                    by <tc-webtag:handle coderId="7360309" context="development" darkBG="true" /></p>
                    
                    <p>The Ant (NAnt) Dependency Versions component is a custom Ant task (NAnt function) for finding the best fit version of a dependency jar file (dll file) within a specified path and a version expression. The version of the dependency file will be determined through a pluggable algorithm.  Two implementations are provided:  one that relies on the TopCoder directory structure, and one that determines version from META-INF/MANIFEST.MF for java archives or metadata in .NET assemblies.  The best fit version will be selected by "last version" and "last build date" pluggable algorithms according the version expression.  This component is very useful for the application to find the best fit Java archives (.NET assemblies) by build script automatically.</p>
                    <p>This component is the easiest of the three TCCC07 final development components. It had 5 submissions and almost all of them implemented the functionalities correctly. But the developers should pay special attention to the exception handling. They should consider the invalid/non-existing files, invalid version expressions, invalid version format of the files, etc.  Two submissions did a good job on it and the others missed some required exceptions.</p>
                    <br />
                    
                    <%-- Round 3 --%>
                    <p>Friday, November 2, 2007<br />
                    <span style="font-size:14px;"><strong>Round 3: Subversion Path-Based Authorization Web Interface</strong></span><br />
                    by <tc-webtag:handle coderId="347569" context="development" darkBG="true" /></p>
                    
                    <p>The Subversion Path-Based Authorization Web Interface component provides a web-based GUI to a subset of API of the Subversion Path-Based Authorization component, which is the first project of development finals. The .NET version provides a WCF service.</p>
                    <p>To finish this project, developers have to write mock implementations for the Subversion Path-Based Authorization component, which is very large, contains lots of methods. Few people finished it in week 1. Fortunately, not all of them are required, but I believe it is still not an easy job. There was no submission in the .NET version. On the Java side, three developers submitted, but one of them is not completed.</p>
                    <p>The servlets in Java version and the panels in .NET version are not difficult to implement, the designs are rather clear, but in-container tests for them should be provided. And since this is a GUI component, a clear demo is also required.</p>
                    <br /><br />
                    
                    <p style="font-size:14px; font-weight:bold;">Component Development: Scores &amp; Wagers</p>
                    <table cellspacing="0" cellpadding="0" class="stat" style="width: 100%">
                        <%-- Round 1 --%>
                        <thead>
                            <tr class="sidebarTitle" nowrap="nowrap">
                                <td class="headerC" colspan="1">&nbsp;</td>
                                <td class="headerC" colspan="5">Subversion Path-Based Authorization Development<br />
                                    <A href="https://software.topcoder.com/catalog/c_component.jsp?comp=26939455&ver=1"><img src="/i/interface/java.gif" alt="Java" border="0" /></A>
                                    <A href="https://software.topcoder.com/catalog/c_component.jsp?comp=26939464&ver=1"><img src="/i/interface/dotnet.gif" alt=".NET" border="0" /></A></td>
                                <td class="headerC" colspan="2">&nbsp;</td>
                            </tr>
                            <tr class="sidebarTitle" nowrap="nowrap">
                                <td class="headerC" colspan="1">&nbsp;</td>
                                <td class="headerC" colspan="5">Round 1</td>
                                <td class="headerC" colspan="2">&nbsp;</td>
                            </tr>
                            <tr class="sidebarTitle" nowrap="nowrap">
                                <td class="header">Competitor</td>
                                <td class="headerC">initial score</td>
                                <td class="headerC">final score</td>
                                <td class="headerC">place</td>
                                <td class="headerC">wager</td>
                                <td class="headerC">points</td>
                                <td class="headerC">link</td>
                                <td class="headerC">rd1 total</td>
                            </tr>
                        </thead> 
                        <%-- catcher --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="10063132" context="development" darkBG="true" /></td>
                                <td class="valueC">N/A</td>
                                <td class="valueC">N/A</td>
                                <td class="valueC">5</td>
                                <td class="valueC">20</td>
                                <td class="valueC">4</td>
                                <td class="valueC">N/A</td>
                                <td class="headerC">4</td>
                            </tr>
                        </tbody>
                        <%-- enefem21 --%>
                        <tbody>
                            <tr class="dark">
                                <td class="value"><tc-webtag:handle coderId="20092786" context="development" darkBG="true" /></td>
                                <td class="valueC">62.22</td>
                                <td class="valueC">62.89</td>
                                <td class="valueC">3</td>
                                <td class="valueC">30</td>
                                <td class="valueC">10</td>
                                <td class="valueC"><a href="http://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=63322"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                                <td class="headerC">10</td>
                            </tr>
                        </tbody>
                        <%-- fanse --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="20095099" context="development" darkBG="true" /></td>
                                <td class="valueC">N/A</td>
                                <td class="valueC">N/A</td>
                                <td class="valueC">5</td>
                                <td class="valueC">10</td>
                                <td class="valueC">2</td>
                                <td class="valueC">N/A</td>
                                <td class="headerC">2</td>
                            </tr>
                        </tbody>
                        <%-- lyt --%>
                        <tbody>
                            <tr class="dark">
                                <td class="value"><tc-webtag:handle coderId="21075542" context="development" darkBG="true" /></td>
                                <td class="valueC">53.15</td>
                                <td class="valueC">53.15</td>
                                <td class="valueC">4</td>
                                <td class="valueC">10</td>
                                <td class="valueC">2</td>
                                <td class="valueC"><a href="http://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=63319"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                                <td class="headerC">2</td>
                            </tr>
                        </tbody>
                        <%-- PE --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="9998760" context="development" darkBG="true" /></td>
                                <td class="valueC">88.17</td>
                                <td class="valueC">89.15</td>
                                <td class="valueC">1</td>
                                <td class="valueC">60</td>
                                <td class="valueC">60</td>
                                <td class="valueC"><a href="http://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=63305"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                                <td class="headerC">60</td>
                            </tr>
                        </tbody>
                        <%-- serine --%>
                        <tbody>
                            <tr class="dark">
                                <td class="value"><tc-webtag:handle coderId="20937270" context="development" darkBG="true" /></td>
                                <td class="valueC">75.25</td>
                                <td class="valueC">75.57</td>
                                <td class="valueC">2</td>
                                <td class="valueC">30</td>
                                <td class="valueC">15</td>
                                <td class="valueC"><a href="http://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=63300"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                                <td class="headerC">15</td>
                            </tr>
                        </tbody>
                        <%-- Yeung --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="15604762" context="development" darkBG="true" /></td>
                                <td class="valueC">N/A</td>
                                <td class="valueC">N/A</td>
                                <td class="valueC">5</td>
                                <td class="valueC">10</td>
                                <td class="valueC">2</td>
                                <td class="valueC">N/A</td>
                                <td class="headerC">2</td>
                            </tr>
                            <tr><td colspan="8">&nbsp;</td></tr>
                        </tbody>
                        
                        <%-- Round 2 --%>
                        <thead>
                            <tr class="sidebarTitle" nowrap="nowrap">
                                <td class="headerC" colspan="1">&nbsp;</td>
                                <td class="headerC" colspan="5">Ant Dependency Versions / NAnt Dependency Versions<br />
                                    <A href="https://software.topcoder.com/catalog/c_component.jsp?comp=26945110&ver=1"><img src="/i/interface/java.gif" alt="Java" border="0" /></A>
                                    <A href="https://software.topcoder.com/catalog/c_component.jsp?comp=26945120&ver=1"><img src="/i/interface/dotnet.gif" alt=".NET" border="0" /></A></td>
                                <td class="headerC" colspan="2">&nbsp;</td>
                            </tr>
                            <tr class="sidebarTitle" nowrap="nowrap">
                                <td class="headerC" colspan="1">&nbsp;</td>
                                <td class="headerC" colspan="5">Round 2</td>
                                <td class="headerC" colspan="2">&nbsp;</td>
                            </tr>
                            <tr class="sidebarTitle" nowrap="nowrap">
                                <td class="header">Competitor</td>
                                <td class="headerC">initial score</td>
                                <td class="headerC">final score</td>
                                <td class="headerC">place</td>
                                <td class="headerC">wager</td>
                                <td class="headerC">points</td>
                                <td class="headerC">link</td>
                                <td class="headerC">rd2 total</td>
                            </tr>
                        </thead> 
                        <%-- catcher --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="10063132" context="development" darkBG="true" /></td>
                                <td class="valueC">N/A</td>
                                <td class="valueC">N/A</td>
                                <td class="valueC">6</td>
                                <td class="valueC">20</td>
                                <td class="valueC">3</td>
                                <td class="valueC">N/A</td>
                                <td class="headerC">7</td>
                            </tr>
                        </tbody>
                        <%-- enefem21 --%>
                        <tbody>
                            <tr class="dark">
                                <td class="value"><tc-webtag:handle coderId="20092786" context="development" darkBG="true" /></td>
                                <td class="valueC">75.48</td>
                                <td class="valueC">75.6</td>
                                <td class="valueC">5</td>
                                <td class="valueC">10</td>
                                <td class="valueC">2</td>
                                <td class="valueC"><a href="http://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=64168"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                                <td class="headerC">12</td>
                            </tr>
                        </tbody>
                        <%-- fanse --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="20095099" context="development" darkBG="true" /></td>
                                <td class="valueC">N/A</td>
                                <td class="valueC">N/A</td>
                                <td class="valueC">6</td>
                                <td class="valueC">30</td>
                                <td class="valueC">5</td>
                                <td class="valueC">N/A</td>
                                <td class="headerC">7</td>
                            </tr>
                        </tbody>
                        <%-- lyt --%>
                        <tbody>
                            <tr class="dark">
                                <td class="value"><tc-webtag:handle coderId="21075542" context="development" darkBG="true" /></td>
                                <td class="valueC">93.48</td>
                                <td class="valueC">95.47</td>
                                <td class="valueC">2</td>
                                <td class="valueC">30</td>
                                <td class="valueC">15</td>
                                <td class="valueC"><a href="http://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=64173"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                                <td class="headerC">17</td>
                            </tr>
                        </tbody>
                        <%-- PE --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="9998760" context="development" darkBG="true" /></td>
                                <td class="valueC">97.03</td>
                                <td class="valueC">97.5</td>
                                <td class="valueC">1</td>
                                <td class="valueC">20</td>
                                <td class="valueC">20</td>
                                <td class="valueC"><a href="http://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=64089"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                                <td class="headerC">80</td>
                            </tr>
                        </tbody>
                        <%-- serine --%>
                        <tbody>
                            <tr class="dark">
                                <td class="value"><tc-webtag:handle coderId="20937270" context="development" darkBG="true" /></td>
                                <td class="valueC">85.89</td>
                                <td class="valueC">87.13</td>
                                <td class="valueC">3</td>
                                <td class="valueC">60</td>
                                <td class="valueC">20</td>
                                <td class="valueC"><a href="http://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=64149"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                                <td class="headerC">35</td>
                            </tr>
                        </tbody>
                        <%-- Yeung --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="15604762" context="development" darkBG="true" /></td>
                                <td class="valueC">83.7</td>
                                <td class="valueC">84.01</td>
                                <td class="valueC">4</td>
                                <td class="valueC">60</td>
                                <td class="valueC">15</td>
                                <td class="valueC"><a href="http://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=64152"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                                <td class="headerC">17</td>
                            </tr>
                            <tr><td colspan="8">&nbsp;</td></tr>
                        </tbody>
                        
                        <%-- Round 3 --%>
                        <thead>
                            <tr class="sidebarTitle" nowrap="nowrap">
                                <td class="headerC" colspan="1">&nbsp;</td>
                                <td class="headerC" colspan="5">Subversion Path-Based Authorization Web Interface<br />
                                    <A href="https://software.topcoder.com/catalog/c_component.jsp?comp=26952774&ver=1"><img src="/i/interface/java.gif" alt="Java" border="0" /></A>
                                    <A href="https://software.topcoder.com/catalog/c_component.jsp?comp=26952784&ver=1"><img src="/i/interface/dotnet.gif" alt=".NET" border="0" /></A></td>
                                <td class="headerC" colspan="2">&nbsp;</td>
                            </tr>
                            <tr class="sidebarTitle" nowrap="nowrap">
                                <td class="headerC" colspan="1">&nbsp;</td>
                                <td class="headerC" colspan="5">Round 3</td>
                                <td class="headerC" colspan="2">&nbsp;</td>
                            </tr>
                            <tr class="sidebarTitle" nowrap="nowrap">
                                <td class="header">Competitor</td>
                                <td class="headerC">initial score</td>
                                <td class="headerC">final score</td>
                                <td class="headerC">place</td>
                                <td class="headerC">wager</td>
                                <td class="headerC">points</td>
                                <td class="headerC">link</td>
                                <td class="headerC">complete total</td>
                            </tr>
                        </thead> 
                        <%-- catcher --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="10063132" context="development" darkBG="true" /></td>
                                <td class="valueC">N/A</td>
                                <td class="valueC">N/A</td>
                                <td class="valueC">4</td>
                                <td class="valueC">60</td>
                                <td class="valueC">15</td>
                                <td class="valueC">N/A</td>
                                <td class="headerC">22</td>
                            </tr>
                        </tbody>
                        <%-- enefem21 --%>
                        <tbody>
                            <tr class="dark">
                                <td class="value"><tc-webtag:handle coderId="20092786" context="development" darkBG="true" /></td>
                                <td class="valueC">46.93</td>
                                <td class="valueC">47.55</td>
                                <td class="valueC">3</td>
                                <td class="valueC">60</td>
                                <td class="valueC">20</td>
                                <td class="valueC"><a href="http://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=65226"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                                <td class="headerC">32</td>
                            </tr>
                        </tbody>
                        <%-- fanse --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="20095099" context="development" darkBG="true" /></td>
                                <td class="valueC">N/A</td>
                                <td class="valueC">N/A</td>
                                <td class="valueC">4</td>
                                <td class="valueC">60</td>
                                <td class="valueC">15</td>
                                <td class="valueC">N/A</td>
                                <td class="headerC">22</td>
                            </tr>
                        </tbody>
                        <%-- lyt --%>
                        <tbody>
                            <tr class="dark">
                                <td class="value"><tc-webtag:handle coderId="21075542" context="development" darkBG="true" /></td>
                                <td class="valueC">73.85</td>
                                <td class="valueC">76.27</td>
                                <td class="valueC">2</td>
                                <td class="valueC">60</td>
                                <td class="valueC">30</td>
                                <td class="valueC"><a href="http://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=65222"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                                <td class="headerC">47</td>
                            </tr>
                        </tbody>
                        <%-- PE --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="9998760" context="development" darkBG="true" /></td>
                                <td class="valueC">91.55</td>
                                <td class="valueC">92.68</td>
                                <td class="valueC">1</td>
                                <td class="valueC">20</td>
                                <td class="valueC">20</td>
                                <td class="valueC"><a href="http://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=65201"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                                <td class="headerC">100</td>
                            </tr>
                        </tbody>
                        <%-- serine --%>
                        <tbody>
                            <tr class="dark">
                                <td class="value"><tc-webtag:handle coderId="20937270" context="development" darkBG="true" /></td>
                                <td class="valueC">N/A</td>
                                <td class="valueC">N/A</td>
                                <td class="valueC">4</td>
                                <td class="valueC">10</td>
                                <td class="valueC">2</td>
                                <td class="valueC">N/A</td>
                                <td class="headerC">37</td>
                            </tr>
                        </tbody>
                        <%-- Yeung --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="15604762" context="development" darkBG="true" /></td>
                                <td class="valueC">N/A</td>
                                <td class="valueC">N/A</td>
                                <td class="valueC">4</td>
                                <td class="valueC">30</td>
                                <td class="valueC">7</td>
                                <td class="valueC">N/A</td>
                                <td class="headerC">24</td>
                            </tr>
                            <tr><td colspan="8">&nbsp;</td></tr>
                        </tbody>
                    </table>
                    <p>&nbsp;</p>


            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>