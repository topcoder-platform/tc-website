<%@ page import="com.topcoder.web.codinginterface.techassess.Constants"%>
<%@  page language="java"%>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<% String selected = request.getParameter("selected")==null?"":request.getParameter("selected"); %>

                        <table border=0 cellpadding=5 cellspacing=0 width="100%">
                            <tr><td class=bodyBigTitle>Help Manual: Contents</td></tr>

 <!-- Getting Started begins -->
                            <tr>
                            <% if (selected.equals("steps")) { %>
                                <td class=helpTitleOn>Perform the Following Steps</td>
                            <% } else { %>
                                <td><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=Static&d1=help&d2=steps">Perform the Following Steps</a></td>
                            <% } %>
                            </tr>

                            <tr>
                                <td class=helpSubtitle>
                                    Step 1 - Loading the Application<br>
                                    Step 2 - Login<br>
                                    Step 3 - Welcome Screen<br>
                                    Step 4 - Example Problem Set<br>
                                    Step 5 - Test Set A (if presented)<br>
                                    Step 6 - Test Set B (if presented)<br>
                                    Step 7 - Finishing up
                                    <br><br>
                                </td>
                            </tr>
<!-- Getting Started ends -->

<!-- Load Testing Application begins -->
                            <tr>
                            <% if (selected.equals("testingApp")) { %>
                                <td class=helpTitleOn>Loading the Technical<br />Assessment Applicaton</td>
                            <% } else { %>
                                <td><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=Static&d1=help&d2=testingApp">Loading the Technical<br />Assessment  Applicaton</a></td>
                            <% } %>
                            </tr>
<!-- Load Testing Application ends -->

<!-- The Coding Window begins -->
                            <tr>
                            <% if (selected.equals("codingWindow")) { %>
                                <td class=helpTitleOn>The Coding Window</td>
                            <% } else { %>
                                <td><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=Static&d1=help&d2=codingWindow">The Coding Window</a></td>
                            <% } %>
                            </tr>

                            <tr>
                                <td class=helpSubtitle>
                                    The Problem Statement<br>
                                    Choosing a Language<br>
                                    Creating a Solution<br>
                                    Java Code Template<br>
                                    C++ Code Template<br>
                                    C# Code Template<br>
                                    Compiling<br>
                                    User Testing<br>
                                    The Problem Arguments Window<br>
                                    Simple Data Types<br>
                                    Complex Data Types<br>
                                    Submitting<br><br>
                                </td>
                            </tr>
<!-- The Coding Window ends -->

<!-- Saving begins -->
                            <tr>
                            <% if (selected.equals("saving")) { %>
                                <td class=helpTitleOn>Saving</td>
                            <% } else { %>
                                <td><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=Static&d1=help&d2=saving">Saving</a></td>
                            <% } %>
                            </tr>
<!-- Saving ends -->

<!-- Clearing the Code begins -->
                            <tr>
                            <% if (selected.equals("clearingCode")) { %>
                                 <td class=helpTitleOn>Clearing the Code</td>
                           <% } else { %>
                                <td><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=Static&d1=help&d2=clearingCode">Clearing the Code</a></td>
                            <% } %>
                            </tr>
<!-- Clearing the Code ends -->

<!-- The Timer begins -->
                            <tr>
                            <% if (selected.equals("timer")) { %>
                                <td class=helpTitleOn>The Timer</td>
                            <% } else { %>
                                <td><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=Static&d1=help&d2=timer">The Timer</a></td>
                            <% } %>
                            </tr>
 <!-- The Timer ends -->

                            <tr><td>&#160;</td></tr>
                        </table>
