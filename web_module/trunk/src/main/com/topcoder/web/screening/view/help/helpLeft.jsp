<%@  page language="java"%>
<% String selected = request.getParameter("selected")==null?"":request.getParameter("selected"); %>

                        <table border="0" cellpadding="3" cellspacing="0" width="100%">
                            <tr><td><h3 class="bodySubtitle">Contents</h3></td></tr>
                        
                        <table border="0" cellpadding="3" cellspacing="0" width="100%">
 <!-- Getting Started begins -->
                            <tr>
                            <% if (selected.equals("steps")) { %>
                                <td class="helpTitleOn"><strong>Perform the Following Steps</strong></td>
                            <% } else { %>
                                <td class="helpTitle"><a href="steps.jsp">Perform the Following Steps</a></td>
                            <% } %>
                            </tr>
                        
                            <tr>
                                <td class="helpSubtitle">
                                    Step 1 - Loading the Application<br>
                                    Step 2 - Launching the Application<br>
                                    Step 3 - Login<br>
                                    Step 4 - Welcome Screen<br>
                                    Step 5 - Example Problem Set<br>
                                    Step 6 - Test Set A<br>
                                    Step 7 - Test Set B<br>
                                    Step 8 - Finishing up
                                </td>
                            </tr>
<!-- Getting Started ends -->
                            
<!-- Load Testing Application begins -->
                            <tr>
                            <% if (selected.equals("testingApp")) { %>
                                <td class="helpTitleOn"><strong>Loading the Testing Applicaton</strong></td>
                            <% } else { %>
                                <td class="helpTitle"><a href="testingApp.jsp">Loading the Testing Applicaton</a></td>
                            <% } %>
                            </tr>
<!-- Load Testing Application ends -->
                        
<!-- The Coding Window begins -->
                            <tr>
                            <% if (selected.equals("codingWindow")) { %>
                                <td class="helpTitleOn"><strong>The Coding Window</strong></td>
                            <% } else { %>
                                <td class="helpTitle"><a href="codingWindow.jsp">The Coding Window</a></td>
                            <% } %>
                            </tr>
                        
                            <tr>
                                <td class="helpSubtitle">
                                    The Problem Statement<br>
                                    Choosing a Language<br>
                                    Creating a Solution<br>
                                    Java Code Template<br>
                                    C++ Code Template<br>
                                    C# Code Template<br>
                                    Compiling<br>
                                    User Testing<br>
                                    Submitting
                                </td>
                            </tr>
<!-- The Coding Window ends -->
                            
<!-- Saving begins -->
                            <tr>
                            <% if (selected.equals("saving")) { %>
                                <td class="helpTitleOn"><strong>Saving</strong></td>
                            <% } else { %>
                                <td class="helpTitle"><a href="saving.jsp">Saving</a></td>
                            <% } %>
                            </tr>
<!-- Saving ends -->
                        
<!-- Clearing the Code begins -->
                            <tr>
                            <% if (selected.equals("clearingCode")) { %>
                                 <td class="helpTitleOn"><strong>Clearing the Code</strong></td>
                           <% } else { %>
                                <td class="helpTitle"><a href="clearingCode.jsp">Clearing the Code</a></td>
                            <% } %>
                            </tr>
<!-- Clearing the Code ends -->
                        
<!-- The Timer begins -->
                            <tr>
                            <% if (selected.equals("timer")) { %>
                                <td class="helpTitleOn"><strong>The Timer</strong></td>
                            <% } else { %>
                                <td class="helpTitle"><a href="timer.jsp">The Timer</a></td>
                            <% } %>
                            </tr>
 <!-- The Timer ends -->
                        </table>
