<%@  page language="java"%>
<% String selected = request.getParameter("selected")==null?"":request.getParameter("selected"); %>

                        <table border="0" cellpadding="5" cellspacing="0" width="100%">
                            <tr><td><h3 class="bodySubtitle" nowrap>Contents</h3></td></tr>
                            <tr><td><h3 class="bodySubtitle" nowrap>Contents</h3></td></tr>
                        
 <!-- Getting Started begins -->
                            <tr>
                            <% if (selected.equals("steps")) { %>
                                <td class="helpTitleOn" nowrap><strong>Perform the Following Steps</strong></td>
                            <% } else { %>
                                <td class="helpTitle" nowrap><a href="steps.jsp">Perform the Following Steps</a></td>
                            <% } %>
                            </tr>
                        
                            <tr>
                                <td class="helpSubtitle" nowrap>
                                    Step 1 - Loading the Application<br>
                                    Step 2 - Launching the Application<br>
                                    Step 3 - Login<br>
                                    Step 4 - Welcome Screen<br>
                                    Step 5 - Example Problem Set<br>
                                    Step 6 - Test Set A (if presented)<br>
                                    Step 7 - Test Set B (if presented)<br>
                                    Step 8 - Finishing up
                                </td>
                            </tr>
<!-- Getting Started ends -->
                            
<!-- Load Testing Application begins -->
                            <tr>
                            <% if (selected.equals("testingApp")) { %>
                                <td class="helpTitleOn" nowrap><strong>Loading the Testing Applicaton</strong></td>
                            <% } else { %>
                                <td class="helpTitle" nowrap><a href="testingApp.jsp">Loading the Testing Applicaton</a></td>
                            <% } %>
                            </tr>
<!-- Load Testing Application ends -->
                        
<!-- The Coding Window begins -->
                            <tr>
                            <% if (selected.equals("codingWindow")) { %>
                                <td class="helpTitleOn" nowrap><strong>The Coding Window</strong></td>
                            <% } else { %>
                                <td class="helpTitle" nowrap><a href="codingWindow.jsp">The Coding Window</a></td>
                            <% } %>
                            </tr>
                        
                            <tr>
                                <td class="helpSubtitle" nowrap>
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
                                    Submitting
                                </td>
                            </tr>
<!-- The Coding Window ends -->
                            
<!-- Saving begins -->
                            <tr>
                            <% if (selected.equals("saving")) { %>
                                <td class="helpTitleOn" nowrap><strong>Saving</strong></td>
                            <% } else { %>
                                <td class="helpTitle" nowrap><a href="saving.jsp">Saving</a></td>
                            <% } %>
                            </tr>
<!-- Saving ends -->
                        
<!-- Clearing the Code begins -->
                            <tr>
                            <% if (selected.equals("clearingCode")) { %>
                                 <td class="helpTitleOn" nowrap><strong>Clearing the Code</strong></td>
                           <% } else { %>
                                <td class="helpTitle" nowrap><a href="clearingCode.jsp">Clearing the Code</a></td>
                            <% } %>
                            </tr>
<!-- Clearing the Code ends -->
                        
<!-- The Timer begins -->
                            <tr>
                            <% if (selected.equals("timer")) { %>
                                <td class="helpTitleOn" nowrap><strong>The Timer</strong></td>
                            <% } else { %>
                                <td class="helpTitle" nowrap><a href="timer.jsp">The Timer</a></td>
                            <% } %>
                            </tr>
 <!-- The Timer ends -->

                            <tr><td class="helpTitle" nowrap>&#160;</td></tr>
                        </table>
