<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>TopCoder Application Methodology</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>

</head>

<body>

<jsp:include page="/top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
<jsp:include page="/includes/global_left.jsp">
<jsp:param name="node" value="m_support"/>
</jsp:include>
        </td>
<!-- Left Column Ends -->
<td width="100%" align="center" class="bodyColumn">
                            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                                <tr valign="top">
                                    <td width="100%">
                                        <div align="center">
                                            <table border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td><a href="#qa"><img src="/i/development/development_methodology_03.gif" border="0" alt="quality_assurance"/></a></td>
                                                    <td><img src="/i/development/development_methodology_04.gif" alt=""/></td>
                                                    <td><a href="#spec"><img src="/i/development/development_methodology_05.gif" alt="specification" border="0"/></a></td>
                                                </tr>
                                                <tr>
                                                    <td><img src="/i/development/development_methodology_07.gif" alt=""/></td>
                                                    <td><img src="/i/development/development_methodology_08.gif" alt=""/></td>
                                                    <td><img src="/i/development/development_methodology_09.gif" alt=""/></td>
                                                </tr>
                                                <tr>
                                                    <td><a href="#development"><img src="/i/development/development_methodology_10.gif" alt="development" border="0"/></a></td>
                                                    <td><img src="/i/development/development_methodology_11.gif" alt=""/></td>
                                                    <td><a href="#design"><img src="/i/development/development_methodology_12.gif" alt="design" border="0"/></a></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>

                                <tr valign="top">
                                    <td class="bodyText">
                                        <p>The TopCoder Software Application Development Methodology utilizes the TopCoder Software Component Catalog and
                                            distributed member base to create robust, high quality applications.  It combines our Component Development
                                            Methodology with our peer review, components customization, and application integration processes.</p>
                                    </td>
                                </tr>

                                <!-- Specification begins -->
                                <tr valign="top">
                                    <td width="100%">
                                        <a name="spec"></a>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="10" bgcolor="#EEEEEE">
                                            <tr valign="top">
                                                <td class="methNav" width="98%">
                                                    <span class="bodyText">
                                                        <strong>Specification</strong>
                                                    </span>&#160;&#160;|&#160;&#160;
                                                    <a class="methNav" href="#design">Architecture and Design</a>&#160;&#160;|&#160;&#160;
                                                    <a class="methNav" href="#development">Development and Testing</a>&#160;&#160;|&#160;&#160;
                                                    <a class="methNav" href="#integration">Integration</a>&#160;&#160;|&#160;&#160;
                                                    <a class="methNav" href="#qa">Quality Assurance</a>&#160;&#160;&#160;&#160;
                                                </td>
                                                <td class="methNav" width="2%" nowrap="nowrap">
                                                    <div class="topPage">
                                                        <a href="#top">[Top of Page]</a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>

                                <tr valign="top">
                                    <td class="bodyText">
                                        <p>
                                            <b>Specification Phase:</b> The Specification phase defines the scope of the project and the functional requirements.
                                        </p>
                                        <p>
                                            <ol>
                                                <li>TopCoder Software Project Manager creates an Application Requirements Specification to define scope.</li>
                                                <li>Application Manager creates Activity Diagrams to define the functional flow of the applications.</li>
                                                <li>Application Manager creates high-level Use Cases that describe all actors and processes involved in the
                                                    functionality of the application.</li>
                                                <li>Application Manager and Information Architect create a working prototype of the application.  This is a graphical
                                                    rendering of the application user interface.</li>
                                                <li>Application Manager creates a Architecture Diagram that defines the logical and physical layout of the system.</li>
                                                <li>Application Manager creates a Deployment Diagram that defines the logical layout of the system modules and components.</li>
                                                <li>Application Manager creates the Application Design Project Plan for the project.</li>
                                            </ol>
                                        </p>
                                    </td>
                                </tr>
                                <!-- Specification ends -->



                                <!-- Design begins -->
                                <tr valign="top">
                                    <td width="100%">
                                        <a name="design"></a>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="10" bgcolor="#EEEEEE">
                                            <tr valign="top">
                                                <td class="methNav" width="98%">
                                                    <a class="methNav" href="#spec">Specification</a>&#160;&#160;|&#160;&#160;
                                                    <span class="bodyText">
                                                        <strong>Architecture and Design</strong>
                                                    </span>&#160;&#160;|&#160;&#160;
                                                    <a class="methNav" href="#development">Development and Testing</a>&#160;&#160;|&#160;&#160;
                                                    <a class="methNav" href="#integration">Integration</a>&#160;&#160;|&#160;&#160;
                                                    <a class="methNav" href="#qa">Quality Assurance</a>&#160;&#160;&#160;&#160;
                                                </td>
                                                <td class="methNav" width="2%" nowrap="nowrap">
                                                    <div class="topPage">
                                                        <a href="#top">[Top of Page]</a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>

                                <tr valign="top">
                                    <td class="bodyText">
                                        <p>
                                            <b>Architecture and Design Phase:</b>  TopCoder Software Designers create and submit application
                                            designs for review by a TopCoder Software Architecture Review Board.
                                        </p>

                                        <ol>
                                            <li>Eligible TopCoder members inquire to be selected for the design phase of the application.</li>
                                            <li>TopCoder Software selects 2 members to work independently during the design phase of the application.</li>
                                            <li>Designers must submit the following documents by the Due Date as stated in the Application Project Posting page:
                                                <ul>
                                                    <li>Application Design Specification Document</li>
                                                    <li>Detailed Use Case Diagrams</li>
                                                    <li>Sequence Diagrams - Scope of Sequence Diagrams extends from system entry point to component entry point</li>
                                                    <li>Component Diagram - Interactions between components</li>
                                                    <li>Component Class Diagrams - Outline of all interfaces between components and application interaction</li>
                                                    <li>Development Scope Document - Describes the recommended development strategy and effort</li>
                                                </ul>
                                            </li>
                                            <li>TopCoder members selected for the design phase are required to submit incremental deliverables defined by the TopCoder Product Manager.</li>
                                            <li>An Architecture Review Board reviews each incremental deliverable and provides feedback to the designers after each phase of the design.</li>
                                            <li>The Application Design Specification Document is expected to specify both generic components that can be mapped
                                                to the
                                                <a href="http://software.topcoder.com/catalog/c_showroom.jsp" target="_blank">TopCoder Software Component Catalog</a>,
                                                new components and component extensions necessary to implement functionality specific to the application.
                                            </li>
                                            <li>The Architecture Review Board reviews and scores each final design submission.</li>
                                            <li>Submissions passing the minimum requirements or a review score greater than 50, will be compensated for their submissions.</li>
                                            <li>If the new components are required for the application, they will be developed separately using the
                                                <a href="/tc?module=Static&d1=dev&d2=support&d3=compMethodology">Component Development Methodology</a>.
                                            </li>
                                            <li>The winning designer incorporates Review Board suggestions into their final design.</li>
                                            <li>The Architecture Review Board performs a final review and accepts the application design.</li>
                                            <li>The winning design is posted as an Application Development Project.</li>
                                        </ol>
                                    </td>
                                </tr>
                                <!-- Design ends -->

                                <!-- Development begins -->
                                <tr valign="top">
                                    <td width="100%">
                                        <a name="development"></a>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="10" bgcolor="#EEEEEE">
                                            <tr valign="top">
                                                <td class="methNav" width="98%">
                                                    <a class="methNav" href="#spec">Specification</a>&#160;&#160;|&#160;&#160;
                                                    <a class="methNav" href="#design">Architecture and Design</a>&#160;&#160;|&#160;&#160;
                                                    <span class="bodyText">
                                                        <strong>Development and Testing</strong>
                                                    </span>&#160;&#160;|&#160;&#160;
                                                    <a class="methNav" href="#integration">Integration</a>&#160;&#160;|&#160;&#160;
                                                    <a class="methNav" href="#qa">Quality Assurance</a>&#160;&#160;&#160;&#160;
                                                </td>
                                                <td class="methNav" width="2%" nowrap="nowrap">
                                                    <div class="topPage">
                                                        <a href="#top">[Top of Page]</a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>

                                <tr valign="top">
                                    <td class="bodyText">
                                        <p>
                                            <b>Development and Testing Phase:</b> TopCoder members inquire for the development position as posted
                                            by the TopCoder Software Project Manager.  The Project Manager then selects 2 members to compete
                                            for each required area of development.  Members must develop and implement the requirements of
                                            the specification as designed by the application winning design.
                                        </p>

                                        <ol>
                                            <li>Eligible TopCoder members inquire to be selected for the development phase of the application.</li>
                                            <li>TopCoder Software selects 2 members to work independently during the development phase of the application.</li>
                                            <li>Developers are responsible for submitting completed development solutions that can be integrated
                                                with other developer submissions. </li>
                                            <li>Developers must submit the following documents by the Due Date as stated in the Application Project Posting page:
                                                <ul>
                                                    <li>A working solution as defined by the Application Requirements and Design Specifications</li>
                                                    <li>Unit Test Cases:</li>
                                                    <ul>
                                                        <li>Checking methods for handling of valid and invalid arguments.</li>
                                                        <li>Testing constructors for accessibility.</li>
                                                        <li>Testing expected output.</li>
                                                        <li>Stress Testing.</li>
                                                    </ul>
                                                </ul>
                                            </li>
                                            <li>The Designer and TopCoder Software Application Manager are available to answer questions and give guidance.</li>
                                            <li>A Development Review Board is selected from the Development Review Board Pool.</li>
                                            <li>The Development Review Board and Designer are responsible for testing and scoring each submission.</li>
                                            <li>Once all submissions are scored a winning solution is chosen.</li>

                                            <li>The winning developer incorporates Review Board suggestions into their final development submission.</li>
                                            <li>The Development Review Board performs a final review and accepts the development submission.</li>
                                            <li>The winning development submission is posted as an Application Integration Project.</li>

                                            <li>The Development Review Board will test the application at the end of the Integration Phase.  All bug fixes are
                                                addressed immediately by the integration team.</li>
                                            <li>The Development Review Board performs the Final Application Review once all the of fixes have been applied.</li>
                                        </ol>
                                    </td>
                                </tr>
                                <!-- Development ends -->
                               <!-- Integration begins -->
                                <tr valign="top">
                                    <td width="100%">
                                        <a name="integration"></a>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="10" bgcolor="#EEEEEE">
                                            <tr valign="top">
                                                <td class="methNav" width="98%">
                                                    <a class="methNav" href="#spec">Specification</a>&#160;&#160;|&#160;&#160;
                                                    <a class="methNav" href="#design">Architecture and Design</a>&#160;&#160;|&#160;&#160;
                                                    <a class="methNav" href="#development">Development and Testing</a>&#160;&#160;|&#160;&#160;
                                                    <span class="bodyText">
                                                        <strong>Integration</strong>
                                                    </span>&#160;&#160;|&#160;&#160;
                                                    <a class="methNav" href="#qa">Quality Assurance</a>&#160;&#160;|&#160;&#160;
                                                </td>
                                                <td class="methNav" width="2%" nowrap="nowrap">
                                                    <div class="topPage">
                                                        <a href="#top">[Top of Page]</a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr valign="top">
                                    <td class="bodyText">
                                        <p>
                                            <b>Integration Phase:</b> TopCoder members inquire for the integraion position as posted
                                            by the TopCoder Software Project Manager.  The Project Manager then selects 2 members to compete
                                            for each required area of integration.  Members must integrate the requirements of
                                            the specification as designed by the application winning design.
                                        </p>

                                        <ol>
                                            <li>Eligible TopCoder members inquire to be selected for the integration phase of the application.</li>
                                            <li>TopCoder Software selects 2 members to work independently during the integration phase of the application.</li>
                                            <li>Members are responsible for submitting completed integrated solutions that are ready for deployment </li>
                                            <li>Developers must submit the following documents by the Due Date as stated in the Application Project Posting page:
                                                <ul>
                                                    <li>A working solution as defined by the Application Requirements and Design Specifications</li>
                                                    <li>Unit Test Cases:</li>
                                                    <ul>
                                                        <li>Testing the implementation from a user perspective</li>
                                                    </ul>
                                                </ul>
                                            </li>
                                            <li>The Designer, Developers and TopCoder Software Application Manager are available to answer questions and give guidance.</li>
                                            <li>A Development Review Board is selected from the Development Review Board Pool.</li>
                                            <li>The Development Review Board and Designer are responsible for testing and scoring each submission.</li>
                                            <li>Once all submissions are scored a winning solution is chosen.</li>
                                            <li>The winning integrator incorporates Review Board suggestions into their final submission.</li>
                                            <li>The Development Review Board performs the Final Application Review once all the of fixes have been applied.</li>

                                        </ol>
                                    </td>
                                </tr>
                                <!-- Integration ends -->
                               <!-- QA begins -->
                                <tr valign="top">
                                    <td width="100%">
                                        <a name="qa"></a>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="10" bgcolor="#EEEEEE">
                                            <tr valign="top">
                                                <td class="methNav" width="98%">
                                                    <a class="methNav" href="#spec">Specification</a>&#160;&#160;|&#160;&#160;
                                                    <a class="methNav" href="#design">Architecture and Design</a>&#160;&#160;|&#160;&#160;
                                                    <a class="methNav" href="#development">Development and Testing</a>&#160;&#160;|&#160;&#160;
                                                    <a class="methNav" href="#integration">Integration</a>&#160;&#160;|&#160;&#160;
                                                    <span class="bodyText">
                                                        <strong>Quality Assurance</strong>
                                                    </span>&#160;&#160;&#160;&#160;
                                                </td>
                                                <td class="methNav" width="2%" nowrap="nowrap">
                                                    <div class="topPage">
                                                        <a href="#top">[Top of Page]</a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr valign="top">
                                    <td class="bodyText">
                                        <ol>
                                            <li>The Development Review Board and Designer perform several iterations of
                                                QA testing and provide feedback to the developers at specified milestones
                                                of the development phase.</li>
                                            <li>The Primary Development Review Board members and Designer team up with the
                                                TopCoder Software Project Manager to perform several iterations of QA testing
                                                with the winning integrators at the completion of integration.</li>
                                            <li>Once the TopCoder Software Project Manager is satisfied that the application
                                                meets the rigorous standards of TopCoder Software, the application solution
                                                is accepted and the Application Integration Team is compensated.</li>
                                        </ol>
                                    </td>
                                </tr>
                                <!-- QA ends -->
                            </table>
            <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="180">
            <jsp:include page="../right.jsp"/>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
