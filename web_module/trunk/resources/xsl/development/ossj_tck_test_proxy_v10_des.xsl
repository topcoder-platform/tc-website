<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl"/>
    <xsl:import href="../script.xsl"/>
    <xsl:import href="../includes/body_top.xsl"/>
    <xsl:import href="../foot.xsl"/>
    <xsl:import href="../includes/modules/stats_intro.xsl"/>
    <xsl:import href="../includes/global_left.xsl"/>
    <xsl:import href="../includes/dev/public_dev_right.xsl"/>
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
    <xsl:template match="/">

        <html>

            <head>

                <xsl:call-template name="Preload"/>

                <title>Sun OSS/J TCK Test Proxy Design Project at TopCoder</title>

                <xsl:call-template name="CSS"/>

                <meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
                <meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

            </head>

            <body>

                <!-- Header Begins -->
                <xsl:call-template name="Top"/>
                <!-- Header Ends -->

                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr valign="top">

                        <!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left">
                <xsl:with-param name="level1">development</xsl:with-param>
                <xsl:with-param name="level2">applications</xsl:with-param>
                <xsl:with-param name="level3">app_projects</xsl:with-param>
            </xsl:call-template>
          </td>
                        <!-- Left Column Ends -->

                        <!-- Gutter Begins -->
                        <td width="15" valign="top">
                            <img src="/i/clear.gif" width="15" height="5" alt="" border="0"/>
                        </td>
                        <!-- Gutter Ends -->

                        <!-- Center Column Begins -->
                        <td class="bodyText" width="99%" valign="top">
                            <img src="/i/clear.gif" width="240" height="10" alt="" border="0"/>
                            <br/>

                            <xsl:call-template name="BodyTop">
                                <xsl:with-param name="image1">white</xsl:with-param>
                                <xsl:with-param name="image">development</xsl:with-param>
                                <xsl:with-param name="title">&#160;Application Development</xsl:with-param>
                            </xsl:call-template>

                            <xsl:variable name='month' select='/TC/DEVELOPMENT/month'/>
                            <xsl:variable name='day' select='/TC/DEVELOPMENT/day'/>
                            <xsl:variable name='year' select='/TC/DEVELOPMENT/year'/>

                            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                                <tr valign="top">
                                    <td class="bodyText" width="100%">
                                        <img src="/i/clear.gif" alt="" width="240" height="1" border="0"/>
                                        <br/>

                                        <!-- Title -->
                                        <h1 class="devSubhead">Sun OSS/J TCK Test Proxy Application: Design</h1>

                                        <p class="smallText">&#160;&#160;&#160;&#160;
                                            <a href="#overview">Overview</a> |
                                            <a href="#projecttype">Project Type</a> |
                                            <a href="#payment">Payment</a> |
                                            <a href="#eligibility">Eligibility</a> |
                                            <a href="#timeline">Timeline</a> |
                                            <a target="_new" href="/i/development/downloads/OSSJTCKTestProxyApplicationSpec_v10.pdf">Requirement Specification</a>
                                            <!-- | <a href="/index?&amp;t=development&amp;c=tcs_app_inquire&amp;Project=OSS/J%20TCK%20Test%20Proxy">Inquire</a>-->
                                        </p>

                                        <!-- Overview -->
                                        <p>
                                            <strong>
                                                <a name="overview">Overview</a>
                                            </strong>
                                            <br/>
                                            TopCoder is working with Sun Microsystems to develop software components to be used in the OSS/J (Operational Support Systems through Java) Initiative.  OSS/J is a working group of industry leaders, including Motorola, NEC and Nortel, who have joined resources to define and implement an open, standard set of Java technology-based APIs that help jumpstart the implementation of services for next-generation networks by easing the integration of OSS/BSS (Operational and Business Support System) applications.  The OSS space covers the aspects of managing, configuring and running telecommunication networks.  For more information on OSS/J please visit http://java.sun.com/products/oss/.</p>

                                            <p>As each of the OSS/J specifications is implemented, the testing of the implementation will be crucial to ensuring that it properly implements the corresponding specification.  It will be of great value to the entire OSS/J community to have a TCK (Technology Compatibility Kit) and accompanying tools available to automatically generate and execute a robust set of test cases for each implementation of an OSS/J specification.</p>

                                            <p>At this time, the OSS/J community has already developed a number of static junit test cases to test the different API bundles that have been developed.  This process has been mostly a manual process and each test case has been developed twice in certain cases because of the two main integration profiles whereby calls to the OSS/J API can be made, through JVT (Java Value Type) or through XML over JMS.  The OSS/J API defines different types of implementations called integration profiles.  The interfaces of each API can be implemented using java interfaces (named JVT), and/or XML request/response over JMS (named XML/JMS profile and/or Web services in the near future).</p>

                                            <p>In order to make the process of developing test cases more efficient, the OSS/J community has asked TopCoder to initially develop an OSS/J Test Proxy that will provide a mechanism for utilizing the same junit test cases as they exist today, but execute the tests through any desired integration profile (i.e. JMS/XML, SOAP).</p>

                                            <p>IMPORTANT NOTE: This design project requires the designer to take the requirements that are laid out below and come up with a design that identifies additional components that will satisfy these requirements when packaged and used together. The designer must properly document the component requirements and interfaces within the Application Design Specification and Class Diagram. A corresponding component specification will then be posted along with the winning design from this project so that the components can be designed and developed separately.</p>

                                        <p>
                                            <strong>View the
                                                <a target="_new" class="bodyText" href="/i/development/downloads/OSSJTCKTestProxyApplicationSpec_v10.pdf">Business Requirements Specification</a> for this application project.
                                            </strong>
                                        </p>


                                        <!-- Project Type -->
                                        <p>
                                            <strong>
                                                <a name="projecttype">Project Type</a>
                                            </strong>
                                            <br/>
                                            Application Design Project: Provide a completed design for the OSS/J TCK Test Proxy project.  Please review the TopCoder Software
                                            <a href="/?&amp;t=development&amp;c=app_meth">Application Development Methodology</a> before you submit a solution.
                                        </p>

                                        <!-- Technologies -->
                                        <p>
                                            <strong>Technologies</strong>
                                        </p>
                                        <ul>
                                            <li>Development language: J2SE 1.4, J2EE 1.3 (EJB 2.0)</li>
                                            <li>Compile target: J2SE 1.4</li>
                                            <li>The OSS/J Trouble Ticket API has been defined using the Java Community Process (JCP) as a Java Specification Request (JSR). You can find downloads and information on this API by visiting the OSS/J main downloads page at http://java.sun.com/products/oss/downloads/jsr91_downloads.html</li>
                                            <li>The OSS/J XML Tooling API (version 1.1) is available for download on the TCS Developer Forum for this component.</li>
                                        </ul>

                                        <!-- Payment -->
                                        <p>
                                            <strong>
                                                <a name="payment">Payment</a>
                                            </strong>
                                            <br/>
                                             For each design project, TopCoder will compensate the member with the winning solution as well as the second place designer. In order to be paid, the submission must pass screening and receive a review score above the minimum score of 50.
                                             <br/><br/>
                                             Compensation for the winning solution is distributed in two installments.
                                             <br/><br/>
                                            <strong>First Payment:</strong>
                                            <br/>
                                             When the winning solution is submitted and review board suggestions are integrated.
                                             <br/><br/>
                                            <strong>Second Payment:</strong>
                                            <br/>
                                             At the completion of the development project*.
                                             <br/><br/>
                                             Compensation for the second place designer will be paid in one installment following the completion of the design project.
                                        </p>

                                        <p>
                                            <strong>Sun OSS/J TCK Test Proxy<br/>
                                            Winning Designer</strong>
                                            <br/>
                                            Total Payment - $1,260.00
                                            <br/>
                                            First Payment - $990.00
                                            <br/>
                                            Second Payment - $270.00
                                        </p>

                                        <p>
                                            <strong>Second Place Designer</strong>
                                            <br/>
                                            Total Payment - $360.00
                                        </p>

                                        <p>
                                            <strong>Reviewers</strong>
                                            <br/>
                                            Primary Design Reviewer - $295.00
                                            <br/>
                                            Design Reviewer - $280.00
                                            <br/>
                                            Design Reviewer - $280.00
                                            <br/><br/>
                                            Total - $2,205.00
                                        </p>

                                        <!-- Definition of Completion -->

                                        <p>
                                            <sup>*</sup>Completion of the project is defined as follows:
                                        </p>

                                        <ul>
                                            <li>The Submission has been selected by the board as the winning submission.</li>
                                            <li>Final fixes accepted by the design review board.</li>
                                            <li>All components and/or application modules that are developed further using the winning designer's recommendations are completed and accepted by the review board.</li>
                                            <li>Application launch into production environment.</li>
                                        </ul>

                                        <!-- Eligibility Requirements -->
                                        <p>
                                            <strong>
                                                <a name="eligibility">Eligibility</a>
                                            </strong>
                                            <br/>
                                            You must be a rated TopCoder member, at least 18 years of age, meeting all of the membership
                                            requirements and fit into one of the following categories:
                                        </p>

                                        <ol>
                                            <li>A US Citizen. </li>
                                            <li>A Lawful Permanent Resident of the US.</li>
                                            <li>A temporary resident, asylee, refugee, or have a lawfully issued work authorization card permitting unrestricted employment.</li>
                                            <li>A Non-US Citizen working in your country of residence.</li>
                                        </ol>

                                        <!-- Timeline -->
                                        <p>
                                            <strong>
                                                <a name="timeline">Timeline</a>
                                            </strong>
                                            <br/>
                                            The Design Submission must be submitted on time. All questions submitted
                                            prior to 6PM EDT on the Submission Due Dates will be answered. Following review
                                            from the board the winning member is given until the Updated Submission Due Date
                                            to modify their submission.
                                        </p>

                                        <table border="0" cellspacing="2" cellpadding="3" class="sidebarBox">
                                            <tr>
                                                <td class="sidebarText">
                                                    <b/>Application Project Posting:
                                                </td>
                                                <td class="sidebarText" align="right">
                                                    <b/>01.09.2004
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="sidebarText">Inquire By:</td>
                                                <td class="sidebarText" align="right">01.22.2004</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Member Acceptance:</td>
                                                <td class="sidebarText" align="right">01.23.2004</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Design Start:</td>
                                                <td class="sidebarText" align="right">01.26.2004</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Design Submissions Due:</td>
                                                <td class="sidebarText" valign="top" align="right">02.02.2004</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Winner Announced:</td>
                                                <td class="sidebarText" align="right">02.13.2004</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Updated Submission Due Date:</td>
                                                <td class="sidebarText" align="right">02.18.2004</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Design Complete:</td>
                                                <td class="sidebarText" align="right">02.24.2004</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Estimated Development End Date:</td>
                                                <td class="sidebarText" align="right">04.01.2004</td>
                                            </tr>
                                        </table>

                                        <!-- Register at TCS -->
                                        <p>
                                            <a name="requirementspecification"></a>
                                            <strong>View the
                                                <a target="_new" class="bodyText" href="/i/development/downloads/OSSJTCKTestProxyApplicationSpec_v10.pdf">Requirement Specification</a> for this application project &gt;&gt;
                                            </strong>
                                        </p>

                                        <p>
                                            <strong>
                                                <a name="inquire" href="/index?&amp;t=development&amp;c=tcs_app_inquire&amp;Project=OSS/J%20TCK%20Test%20Proxy">Inquire for the OSS/J TCK Test Proxy Project</a> to get selected as a designer and to obtain the information necessary to submit a solution.
                                            </strong>
                                        </p>

                                        <!--
                                        <p>
                                            <strong>
                                                <a href="/index?&amp;t=development&amp;c=tcs_app_inquire&amp;Project=Admin%20Tool%20Enhancements%20Group2">Inquire for the Group 2 Development Tasks of the Application Project</a> to get selected as a developer and to obtain the information necessary to submit a solution.
                                            </strong>
                                        </p>
                                        <p>
                                            <strong>
                                                <a href="/index?&amp;t=development&amp;c=tcs_app_inquire&amp;Project=Admin%20Tool%20Enhancements%20Group3">Inquire for the Group 3 Development Tasks of the Application Project</a> to get selected as a developer and to obtain the information necessary to submit a solution.
                                            </strong>
                                        </p>
                                        -->
                                        <!--<p>To submit a solution, email your submissions to
                                        <a href="mailto:submissions@topcodersoftware.com" class="bodyText">submissions@topcodersoftware.com</a>.</p> -->

                                        <p>
                                            <br/>
                                        </p>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <!-- Center Column Ends -->

                        <!-- Gutter begins -->
                        <td width="15">
                            <img src="/i/clear.gif" width="15" height="5" alt="" border="0"/>
                        </td>
                        <!-- Gutter Ends -->

                        <!-- Right Column Begins -->
                        <td width="244" valign="top">
                            <xsl:call-template name="public_dev_right"/>
                        </td>
                        <!-- Right Column Ends -->
                    </tr>
                </table>

                <!-- Footer begins -->
                <xsl:call-template name="Foot"/>
                <!-- Footer ends -->

            </body>

        </html>

    </xsl:template>
</xsl:stylesheet>
