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
        <jsp:param name="tabLev2" value="design"/>
        <jsp:param name="tabLev3" value="summary"/>
        </jsp:include>

            <div id="pageBody">
                <h1><span>nicka81 is the new Component Design Champion!</span></h1>
                    <div style="float:right;">
                        <A HREF="http://forums.topcoder.com/?module=ThreadList&amp;forumID=518024">Discuss this</A><br />
                    </div>

                    <p>Friday, November 2, 2007<br />
                    by <span><strong>the Design Review Board</strong></span><br />
                    <span><em>TopCoder Members</em></span></p>
                    
                    <p style="float:right; width:200px; 350px; margin-left:10px;"><img src="/i/tournament/tccc07/compDes.jpg"></p>
                    <br /><br />
                    <p>After three days of on-site finals, <tc-webtag:handle coderId="293874" context="design" darkBG="true" /> emerged as the winner of the 2007 TopCoder Collegiate Challenge Component Design competition, taking home the top prize of $25,000. <tc-webtag:handle coderId="8518361" darkBG="true" /> took second place, and <tc-webtag:handle coderId="21471587" darkBG="true" /> took home the third.</p>
                    
                    <p style="font-size:14px; font-weight:bold;">Component Design Final Scores</p>
                    <table cellspacing="0" cellpadding="0" class="stat" style="width: 50%">
                        <thead>
                            <tr class="sidebarTitle" nowrap="nowrap">
                                <td class="header" colspan="1">Handle</td>
                                <td class="headerC" colspan="1">Final Score</td>
                            </tr>
                        </thead> 
                        <%-- nicka81 --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="293874" darkBG="true" context="design" /></td>
                                <td class="valueC">92</td>
                            </tr>
                        </tbody>
                        <%-- Vovka --%>
                        <tbody>
                            <tr class="dark">
                                <td class="value"><tc-webtag:handle coderId="8518361" darkBG="true" context="design" /></td>
                                <td class="valueC">60</td>
                            </tr>
                        </tbody>
                        <%-- urtks --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="21471587" darkBG="true" context="design" /></td>
                                <td class="valueC">42</td>
                            </tr>
                        </tbody>
                        <%-- kakarotto --%>
                        <tbody>
                            <tr class="dark">
                                <td class="value"><tc-webtag:handle coderId="20256177" darkBG="true" context="design" /></td>
                                <td class="valueC">38</td>
                            </tr>
                        </tbody>
                        <%-- Luca --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="10348862" darkBG="true" context="design" /></td>
                                <td class="valueC">34</td>
                            </tr>
                        </tbody>
                        <%-- sql_lall --%>
                        <tbody>
                            <tr class="dark">
                                <td class="value"><tc-webtag:handle coderId="275640" darkBG="true" context="design" /></td>
                                <td class="valueC">26</td>
                            </tr>
                        </tbody>
                        <%-- bramandia --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="7568791" darkBG="true" context="design" /></td>
                                <td class="valueC">18</td>
                            </tr>
                        </tbody>
                    </table>
                    <br /><br />

                    <%-- Round 1 --%>
                    <p>Wednesday, October 31, 2007<br />
                    <span style="font-size:14px;"><strong>Round 1: Graph Framework</strong></span><br />
                    by <tc-webtag:handle coderId="277356" context="design" darkBG="true" /></p>
                    
                    <p>Probably all of us are familiar with Graph theory and have implemented various graph algorithms to solve problems. Depending on the problem space, it may be necessary to represent graphs in memory in a variety of different ways.  The Graph Framework component provides a standard interface for representing graphs regardless of internal memory representation.</p>
                    <p>The component will provide two representations for graphs, one suitable for dense graphs and one suitable for sparse graphs. The Graph Framework should also provide numerous common graph functionalities, such as modeling both directed and undirected graphs, with or without cycles, CRUD operations with edges and vertices, event listener framework, etc.</p>
                    <p>It seems to be an exciting component for designers - the designer should not know some specific IT technology (such as ASP.NET, servlets, JSP, etc.) and maximum freedom for creativity is given to implement the requirements. Many requirements make the design really untrivial - the designers should have good knowledge of various design patterns to implement the required functionality and make usage of this component really easy.  Competitors had to find the golden mean between simplicity of API and the component flexibility.</p>
                    <p>Probably the most challenging parts of the component were the ability to find out what kind of graph a Graph object is (directed, undirected, acyclic, multigraph, etc.) in an efficient way and making such property settable.  The designer has to implement flexible validation support for invalid operations and powerful transformation mechanisms from one kind of graph to another one.</p> 
                    <p>Another non-trivial task was to make the graph really independent from its representation but make easy extending of both graph operations and graph representation possible. Some designers implement Bridge Design pattern to solve this task effectively.</p>
                    <br />
                    
                    <%-- Round 2 --%>
                    <p>Thursday, November 1, 2007<br />
                    <span style="font-size:14px;"><strong>Round 2: AJAX Scrollable JSF Data Bound Table / AJAX Scrollable Data Bound Control</strong></span><br />
                    by <tc-webtag:handle coderId="152342" context="design" darkBG="true" /></p>
                    
                    <p>The Scrollable Data Bound Table component is a custom table component with a scrollbar. It uses AJAX to pass the data when it becomes necessary as the user slides the scroll bar up and down, and caches it on the client side to keep the network traffic down to the minimum required.</p>
                    <p>Building a design for this component was relatively straightforward, as the web technologies that must be used place strict boundaries for the design. Understanding these technologies was crucial to submitting a working design, though. This proved too challenging for the majority of the competitors: the component got only three submissions that passed the review.</p>
                    <p>When the requirements call for a compact design like this, the designers get fewer chances to forget a requirement, miss a relationship on a diagram, or make a mistake in an algorithm description. They also get more time to document their classes and methods well. As the result, the submitters are forced to compete on fine points of understanding the TopCoder Design Methodology and showcasing their submissions to the users (and of course to the Review Board). The winning submissions in both Java and .NET were high-quality designs with great documentation for developers, earning their authors impressive scores in the upper nineties.</p>
                    <br />
                    
                    <%-- Round 3 --%>
                    <p>Friday, November 2, 2007<br />
                    <span style="font-size:14px;"><strong>Round 3: Faceted Classification</strong></span><br />
                    by <tc-webtag:handle coderId="151743" context="design" darkBG="true" /></p>
                    
                    <p>The "Faceted Classification" component is a component designed to categorize items based on their properties.</p>
                    <p>From the requirements specification for the component:</p>
                    <p><em>"A faceted classification attempts to exhaustively define a domain through mutually exclusive categories.  Facets are orthogonal categories that isolate one perspective of a domain, like 'Price' or 'Location.'   Facets allow items in a domain to be ordered in multiple ways, unlike traditional taxonomy which defines a single order.  Faceted navigation can be a very effective tool for multidimensional domains since it allows the user to choose the order classifications are selected from, like 'Location' and then 'Price.'"</em></p>
                    <p>Basically, the component provides a way to classify items based on values for defined facets.  The example used in the forum and in most of the designs was that of wine.  The facets for wine could include color (red or white), vintage (2003, 2002), price ($1-5, $5-25), alcohol content, and location, among other things.  A single ID for a specific type of wine could apply to a number of these facet values, like "color:red, vintage:2003, and price:$1-5."  The overall goal of the component is to provide a few basic features:</p>
                        <ul>
                            <li>A domain object model to allow a user to programmatically define the facets, their values, and the item IDs associated with each value;</li>
                            <li>A persistence mechanism that saves the model to comma-separated value (CSV) files.  Multiple files were allowed to house the data, and the file structure and layout was left up to the designer;</li>
                            <li>A bulk operation mechanism that allows for the user to bulk import, update, and delete entities from the model;</li>
                            <li>Set operations that allow the user to get sets of item assignments and perform union and intersections on those sets.</li>
                        </ul>
                    <p>The competitors had a lot of freedom with how this design was to look.  Designs like this are very open-ended, as they aren't reliant on very specific technologies (like JSP or WCF), so reviewing them is interesting as different approaches are taken to tackle the same problems.  One big thing the designers had to do was ensure they were up to date with the conversations in the forum, as it contained a number of clarifications to the original requirements, including things related to specific features and what the file input and output was to look like.</p>
                    <p>I was looking for a number of specific things in the design, besides the general requirements with basic design features, like design pattern and modifiers:</p>
                        <ul>
                            <li>The model API should be obvious to the user familiar with the requirements.  The user should be able to easily create facets (like wine color), values for those facets (like red or white), and assign item ID's to those values (like 123 or 345).</li>
                            <li>The API to modify the model, like create new values, rename values, and delete item assignments, should be obvious to the user and easy to call.</li>
                            <li>The persistence mechanism should be extensible, with the ability to easily plug in a new implementation, like database persistence, into the design.</li>
                            <li>The bulk operations should be obvious and user friendly.</li>
                            <li>The operations required with set manipulation should be efficiently described and designed.</li>
                            <li>The file structure should be well described, with good examples, and the general IO should be efficient, as it is expected there will be large sets of facets, values, and assignments.</li>
                        </ul>
                    <p>Overall this is a great component for a design final, as it allows the designers a lot of freedom over what the final design looks like and allows their creativity and attention to detail to flourish.</p>
                    <br /><br />
                    
                    <p style="font-size:14px; font-weight:bold;">Component Design: Scores &amp; Wagers</p>
                    <table cellspacing="0" cellpadding="0" class="stat" style="width: 100%">
                        <%-- Round 1 --%>
                        <thead>
                            <tr class="sidebarTitle" nowrap="nowrap">
                                <td class="headerC" colspan="1">&nbsp;</td>
                                <td class="headerC" colspan="5">Graph Framework<br />
                                    <A href="https://software.topcoder.com/catalog/c_component.jsp?comp=26953092&ver=1"><img src="/i/interface/java.gif" alt="Java" border="0" /></A>
                                    <A href="https://software.topcoder.com/catalog/c_component.jsp?comp=26953097&ver=1"><img src="/i/interface/dotnet.gif" alt=".NET" border="0" /></A></td>
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
                        <%-- bramandia --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="7568791" context="design" darkBG="true" /></td>
                                <td class="valueC">82.09</td>
                                <td class="valueC">84.57</td>
                                <td class="valueC">5</td>
                                <td class="valueC">60</td>
                                <td class="valueC">12</td>
                                <td class="valueC"><a href="http://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=63296"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                                <td class="headerC">12</td>
                            </tr>
                        </tbody>
                        <%-- kakarotto --%>
                        <tbody>
                            <tr class="dark">
                                <td class="value"><tc-webtag:handle coderId="20256177" context="design" darkBG="true" /></td>
                                <td class="valueC">80.86</td>
                                <td class="valueC">84.44</td>
                                <td class="valueC">6</td>
                                <td class="valueC">20</td>
                                <td class="valueC">3</td>
                                <td class="valueC"><a href="http://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=63317"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                                <td class="headerC">3</td>
                            </tr>
                        </tbody>
                        <%-- Luca --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="10348862" context="design" darkBG="true" /></td>
                                <td class="valueC">81.23</td>
                                <td class="valueC">87.36</td>
                                <td class="valueC">2</td>
                                <td class="valueC">48</td>
                                <td class="valueC">24</td>
                                <td class="valueC"><a href="http://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=63372"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                                <td class="headerC">24</td>
                            </tr>
                        </tbody>
                        <%-- nicka81 --%>
                        <tbody>
                            <tr class="dark">
                                <td class="value"><tc-webtag:handle coderId="293874" context="design" darkBG="true" /></td>
                                <td class="valueC">94.66</td>
                                <td class="valueC">96.18</td>
                                <td class="valueC">1</td>
                                <td class="valueC">60</td>
                                <td class="valueC">60</td>
                                <td class="valueC"><a href="http://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=63266"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                                <td class="headerC">60</td>
                            </tr>
                        </tbody>
                        <%-- sql_lall --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="275640" context="design" darkBG="true" /></td>
                                <td class="valueC">N/A</td>
                                <td class="valueC">N/A</td>
                                <td class="valueC">7</td>
                                <td class="valueC">10</td>
                                <td class="valueC">1</td>
                                <td class="valueC">N/A</td>
                                <td class="headerC">1</td>
                            </tr>
                        </tbody>
                        <%-- urtks --%>
                        <tbody>
                            <tr class="dark">
                                <td class="value"><tc-webtag:handle coderId="21471587" context="design" darkBG="true" /></td>
                                <td class="valueC">80.81</td>
                                <td class="valueC">86.39</td>
                                <td class="valueC">3</td>
                                <td class="valueC">20</td>
                                <td class="valueC">6</td>
                                <td class="valueC"><a href="http://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=63269"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                                <td class="headerC">6</td>
                            </tr>
                        </tbody>
                        <%-- Vovka --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="8518361" context="design" darkBG="true" /></td>
                                <td class="valueC">82.17</td>
                                <td class="valueC">85.76</td>
                                <td class="valueC">4</td>
                                <td class="valueC">42</td>
                                <td class="valueC">10</td>
                                <td class="valueC"><a href="http://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=63301"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                                <td class="headerC">10</td>
                            </tr>
                            <tr><td colspan="8">&nbsp;</td></tr>
                        </tbody>
                        
                        <%-- Round 2 --%>
                        <thead>
                            <tr class="sidebarTitle" nowrap="nowrap">
                                <td class="headerC" colspan="1">&nbsp;</td>
                                <td class="headerC" colspan="5">AJAX Scrollable JSF Data Bound Table / AJAX Scrollable Data Bound Control<br />
                                    <A href="https://software.topcoder.com/catalog/c_component.jsp?comp=26965587&ver=1"><img src="/i/interface/java.gif" alt="Java" border="0" /></A>
                                    <A href="https://software.topcoder.com/catalog/c_component.jsp?comp=26965489&ver=1"><img src="/i/interface/dotnet.gif" alt=".NET" border="0" /></A></td>
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
                        <%-- bramandia --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="7568791" context="design" darkBG="true" /></td>
                                <td class="valueC">N/A</td>
                                <td class="valueC">N/A</td>
                                <td class="valueC">5</td>
                                <td class="valueC">10</td>
                                <td class="valueC">2</td>
                                <td class="valueC">N/A</td>
                                <td class="headerC">14</td>
                            </tr>
                        </tbody>
                        <%-- kakarotto --%>
                        <tbody>
                            <tr class="dark">
                                <td class="value"><tc-webtag:handle coderId="20256177" context="design" darkBG="true" /></td>
                                <td class="valueC">63.17</td>
                                <td class="valueC">64.75</td>
                                <td class="valueC">2</td>
                                <td class="valueC">20</td>
                                <td class="valueC">5</td>
                                <td class="valueC"><a href="http://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=64174"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                                <td class="headerC">8</td>
                            </tr>
                        </tbody>
                        <%-- Luca --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="10348862" context="design" darkBG="true" /></td>
                                <td class="valueC">N/A</td>
                                <td class="valueC">N/A</td>
                                <td class="valueC">5</td>
                                <td class="valueC">10</td>
                                <td class="valueC">2</td>
                                <td class="valueC">N/A</td>
                                <td class="headerC">26</td>
                            </tr>
                        </tbody>
                        <%-- nicka81 --%>
                        <tbody>
                            <tr class="dark">
                                <td class="value"><tc-webtag:handle coderId="293874" context="design" darkBG="true" /></td>
                                <td class="valueC">93.95</td>
                                <td class="valueC">98.42</td>
                                <td class="valueC">1</td>
                                <td class="valueC">30</td>
                                <td class="valueC">30</td>
                                <td class="valueC"><a href="http://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=64119"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                                <td class="headerC">90</td>
                            </tr>
                        </tbody>
                        <%-- sql_lall --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="275640" context="design" darkBG="true" /></td>
                                <td class="valueC">80.28</td>
                                <td class="valueC">82.15</td>
                                <td class="valueC">3</td>
                                <td class="valueC">60</td>
                                <td class="valueC">20</td>
                                <td class="valueC"><a href="http://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=64218"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                                <td class="headerC">21</td>
                            </tr>
                        </tbody>
                        <%-- urtks --%>
                        <tbody>
                            <tr class="dark">
                                <td class="value"><tc-webtag:handle coderId="21471587" context="design" darkBG="true" /></td>
                                <td class="valueC">94.94</td>
                                <td class="valueC">98.26</td>
                                <td class="valueC">2</td>
                                <td class="valueC">60</td>
                                <td class="valueC">30</td>
                                <td class="valueC"><a href="http://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=64377"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                                <td class="headerC">36</td>
                            </tr>
                        </tbody>
                        <%-- Vovka --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="8518361" context="design" darkBG="true" /></td>
                                <td class="valueC">N/A</td>
                                <td class="valueC">N/A</td>
                                <td class="valueC">5</td>
                                <td class="valueC">10</td>
                                <td class="valueC">2</td>
                                <td class="valueC">N/A</td>
                                <td class="headerC">12</td>
                            </tr>
                            <tr><td colspan="8">&nbsp;</td></tr>
                        </tbody>
                        
                        <%-- Round 3 --%>
                        <thead>
                            <tr class="sidebarTitle" nowrap="nowrap">
                                <td class="headerC" colspan="1">&nbsp;</td>
                                <td class="headerC" colspan="5">Faceted Classification<br />
                                    <A href="https://software.topcoder.com/catalog/c_component.jsp?comp=26975529&ver=1"><img src="/i/interface/java.gif" alt="Java" border="0" /></A>
                                    <A href="https://software.topcoder.com/catalog/c_component.jsp?comp=26975404&ver=1"><img src="/i/interface/dotnet.gif" alt=".NET" border="0" /></A></td>
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
                        <%-- bramandia --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="7568791" context="design" darkBG="true" /></td>
                                <td class="valueC">78.65</td>
                                <td class="valueC">84.78</td>
                                <td class="valueC">7</td>
                                <td class="valueC">30</td>
                                <td class="valueC">4</td>
                                <td class="valueC"><a href="http://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=65230"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                                <td class="headerC">18</td>
                            </tr>
                        </tbody>
                        <%-- kakarotto --%>
                        <tbody>
                            <tr class="dark">
                                <td class="value"><tc-webtag:handle coderId="20256177" context="design" darkBG="true" /></td>
                                <td class="valueC">86.24</td>
                                <td class="valueC">92.65</td>
                                <td class="valueC">2</td>
                                <td class="valueC">60</td>
                                <td class="valueC">30</td>
                                <td class="valueC"><a href="http://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=65234"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                                <td class="headerC">38</td>
                            </tr>
                        </tbody>
                        <%-- Luca --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="10348862" context="design" darkBG="true" /></td>
                                <td class="valueC">83.67</td>
                                <td class="valueC">89.88</td>
                                <td class="valueC">5</td>
                                <td class="valueC">42</td>
                                <td class="valueC">8</td>
                                <td class="valueC"><a href="http://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=65228"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                                <td class="headerC">34</td>
                            </tr>
                        </tbody>
                        <%-- nicka81 --%>
                        <tbody>
                            <tr class="dark">
                                <td class="value"><tc-webtag:handle coderId="293874" context="design" darkBG="true" /></td>
                                <td class="valueC">86</td>
                                <td class="valueC">90.78</td>
                                <td class="valueC">4</td>
                                <td class="valueC">10</td>
                                <td class="valueC">2</td>
                                <td class="valueC"><a href="http://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=65196"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                                <td class="headerC">92</td>
                            </tr>
                        </tbody>
                        <%-- sql_lall --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="275640" context="design" darkBG="true" /></td>
                                <td class="valueC">83.58</td>
                                <td class="valueC">87.84</td>
                                <td class="valueC">6</td>
                                <td class="valueC">30</td>
                                <td class="valueC">5</td>
                                <td class="valueC"><a href="http://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=65223"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                                <td class="headerC">26</td>
                            </tr>
                        </tbody>
                        <%-- urtks --%>
                        <tbody>
                            <tr class="dark">
                                <td class="value"><tc-webtag:handle coderId="21471587" context="design" darkBG="true" /></td>
                                <td class="valueC">86.46</td>
                                <td class="valueC">92.39</td>
                                <td class="valueC">3</td>
                                <td class="valueC">20</td>
                                <td class="valueC">6</td>
                                <td class="valueC"><a href="http://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=65218"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                                <td class="headerC">42</td>
                            </tr>
                        </tbody>
                        <%-- Vovka --%>
                        <tbody>
                            <tr class="light">
                                <td class="value"><tc-webtag:handle coderId="8518361" context="design" darkBG="true" /></td>
                                <td class="valueC">90.05</td>
                                <td class="valueC">93.08</td>
                                <td class="valueC">1</td>
                                <td class="valueC">48</td>
                                <td class="valueC">48</td>
                                <td class="valueC"><a href="http://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=65227"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
                                <td class="headerC">60</td>
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