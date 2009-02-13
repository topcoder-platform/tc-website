<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map,
                 com.topcoder.shared.dataAccess.DataAccessConstants, 
                 com.topcoder.shared.util.ApplicationServer"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>Development Tutorial</title>

<jsp:include page="../../script.jsp" />

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="level1" value="development"/>
                <jsp:param name="level2" value="support"/>
                <jsp:param name="level3" value="devTutorial"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br />
			
			<h2>Development Tutorial</h2>

			<a name="sectionI"></a>
			<h2>I. Introduction</h2>
			<span class=bodySubtitle>Developing at TopCoder</span>
			<p>TopCoder develops components in C# and Java.  Though the languages may 
				be substantially different, the process is rather similar.  This tutorial 
				will cover the development process, from start to finish.  Where the 
				process is substantially different, information will be given for each 
				language.</p>
			<span class=bodySubtitle>Development Process</span>
			<span class=bodySubtitle></span>
			<p>The development process, at a high level, is simple.  You are tasked to 
				convert a component design, prepared by the designer and reviewed by 
				the Design Review Board, into a functional component.  When you have 
				completed your task, your submission will be reviewed by the Development Review 
				Board.  If you are the winning developer, you are then tasked to make 
				changes required and recommended by the Review Board.  Once complete, your 
				component undergoes a Final Review, and you're done!</p>
			<p>TopCoder provides considerable documentation about its design and development 
				processes; if you have not already done so, you should peruse the TopCoder 
				Software development document archive (available <a href="/tc?module=Static&d1=dev&d2=support&d3=compDocumentation">here</a>).  
				The TopCoder Member Guide, Development Design and Review Scorecard, and Jalopy 
				Configuration File documents should all be of interest to you. The documents 
				will show you what is expected of your submissions, and the Jalopy 
				configuration will even help you get there.</p>
			<span class=bodySubtitle>Required Software</span>
			<p>You may write your source code in any environment you wish.  However, we rely on 
				certain technologies to build and package our components.  Also, we rely 
				on reference libraries common to each language.  Exact packages are listed 
				below.</p>
			<p>One tool common to all languages here at TopCoder is a UML design tool.  
				You will need a UML design tool compatible with Poseidon's latest 
				release.  You can learn more about Poseidon at <a href="http://www.gentleware.com/" target="_blank">Gentleware's homepage</a>.</p>
			<h3>C#</h3>
			<p>
				<table border="0" cellpadding="0" width="100%" class="formFrame">
					<thead>
						<tr>
							<td class=projectHeaders><strong>Tool</strong></td>
							<td class=projectHeaders><strong>URL</strong></td>
							<td class=projectHeaders><strong>Description</strong></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class=projectCells valign=top nowrap=nowrap>Microsoft .NET Framework v1.1</td>
							<td class=projectCells valign=top nowrap=nowrap><a href="http://msdn.microsoft.com/netframework/downloads/updates/default.aspx" target="_blank">MSDN 
									SDKs</a></td>
							<td class=projectCells valign=top>
								<p>If you're interested to develop in C#, you probably already have this 
									installed.  It is available through Windows Update, or through the link at 
									left.</p>
								<p>You may develop your code on any platform and with any framework, but your 
									submission will require and be judged against the current release of the 
									Microsoft .NET Framework.</p>
							</td>
						</tr>
						<tr>
							<td class=projectCells valign=top nowrap=nowrap>NAnt</td>
							<td class=projectCells valign=top nowrap=nowrap><a href="http://nant.sourceforge.net/" target="_blank">Homepage</a></td>
							<td class=projectCells valign=top>
								<p>NAnt is a utility that executes custom, extensible build scripts.  
									You will need this tool to compile your project and submit your code 
									to TopCoder.  Build scripts are covered in more detail in <a href="#sectionIII">Section III</a>.</p>
							</td>
						</tr>
						<tr>
							<td class=projectCells valign=top nowrap=nowrap>NUnit</td>
							<td class=projectCells valign=top nowrap=nowrap><a href="http://www.nunit.org/" target="_blank">Homepage</a></td>
							<td class=projectCells valign=top>NUnit is a framework that will allow you to quickly and concisely test your 
								code. Unit testing is covered in more detail in <a href="#sectionVI">Section VI</a>.</td>
						</tr>
					</tbody>
				</table>
			</p>
			<h3>Java</h3>
				<table border="0" cellpadding="0" width="100%" class="formFrame">
				<thead>
					<tr>
						<td class=projectHeaders><strong>Tool</strong></td>
						<td class=projectHeaders><strong>URL</strong></td>
						<td class=projectHeaders><strong>Description</strong></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class=projectCells valign=top nowrap=nowrap>Sun J2SE SDK 1.4.2</td>
						<td class=projectCells valign=top nowrap=nowrap><a href="http://java.sun.com/j2se/1.4.2/download.html" target="_blank">SDK 
								Download Page</a></td>
						<td class=projectCells valign=top>
							<p>Java development is normally performed against the latest JDK.  You should 
								keep up to date with the latest edition from Sun.</p>
						</td>
					</tr>
					<tr>
						<td class=projectCells valign=top nowrap=nowrap>Ant</td>
						<td class=projectCells valign=top nowrap=nowrap><a href="http://ant.apache.org/" target="_blank">Homepage</a></td>
						<td class=projectCells valign=top>
							<p>Ant is a utility that executes custom, extensible build scripts.  
								You will need this tool to compile your project and submit your code 
								to TopCoder.  Build scripts are covered in more detail in <a href="#sectionIII">Section III</a>.</p>
						</td>
					</tr>
					<tr>
						<td class=projectCells valign=top nowrap=nowrap>JUnit</td>
						<td class=projectCells valign=top nowrap=nowrap><a href="http://www.junit.org/" target="_blank">Homepage</a></td>
						<td class=projectCells valign=top>JUnit is a framework that will allow you to quickly and concisely test your 
							code. Unit testing is covered in more detail in <a href="#sectionVI">Section VI</a>.</td>
					</tr>
					<tr>
						<td class=projectCells valign=top nowrap=nowrap>Sun J2SE JRE 1.3</td>
						<td class=projectCells valign=top nowrap=nowrap><a href="http://java.sun.com/j2se/1.3/download.html" target="_blank">JRE 
								Download Page</a></td>
						<td class=projectCells valign=top>
							<p>Though our components are developed for the latest J2SE environment, we try to 
								support older JREs as possible.  Often, development projects will require 
								the component to build against the 1.3 runtime environment.  Many Windows 
								systems will already have this in a location such as C:\Program 
								Files\JavaSoft\JRE.  Search for rt.jar.</p>
						</td>
					</tr>
					<tr>
						<td class=projectCells valign=top nowrap=nowrap>Sun J2EE SDK 1.4</td>
						<td class=projectCells valign=top nowrap=nowrap><a href="http://java.sun.com/j2ee/1.4/download.html" target="_blank">SDK 
								Download Page</a></td>
						<td class=projectCells valign=top>
							<p>Only a few components will require this package. Check the Requirements 
								specification for the project you are interested in before installing this 
								software.</p>
						</td>
					</tr>
					<tr>
						<td class=projectCells valign=top nowrap=nowrap>Jalopy</td>
						<td class=projectCells valign=top nowrap=nowrap><a href="http://jalopy.sourceforge.net/" target="_blank">Homepage</a></td>
						<td class=projectCells valign=top>Jalopy will format your source appropriately, when used with TopCoder's 
							configuration file (available <a href="/i/development/downloads/topcoder_code_convention.xml" target="_blank">
								here</a>). This can save you quite a bit of time.</td>
					</tr>
					<tr>
						<td class=projectCells valign=top nowrap=nowrap>Checkstyle</td>
						<td class=projectCells valign=top nowrap=nowrap><a href="http://checkstyle.sourceforge.net/" target="_blank">Homepage</a></td>
						<td class=projectCells valign=top>Checkstyle is a format checker. You should check your source code format with 
							Checkstyle before submission, if possible.</td>
					</tr>
				</tbody>
			</table>
			<p>Be sure to configure your system environment as required by [N]Ant.  Also, 
				note the locations of your xUnit installation; the location may be required 
				later to configure your build script.</p>
			<span class=bodySubtitle>Registration</span>
			<p>To participate in any development contest, you must first register with TopCoder 
				Software. Registration not only allows you to submit design and 
				development solutions, but also allows you to compete in TopCoder algorithm competitions. To register, follow this <a href="/reg/index.jsp" target="_blank">link</a>.</p>
			<h2><A name="#sectionII"></A>II. Picking A Project</h2>
			<p>Picking a project is the first step to a winning development submission.  
				You can quickly find open development projects at <a href="/?t=development&amp;c=comp_projects" target="_blank">
					this page</a>.  From that page, you can see which projects are open, 
				when registration ends and when submissions are due.  These dates are 
				very important.  You must indicate your interest to develop a solution by 
				the "Registration Ends" date.  Your entire solution, complete with 
				tests and documentation, is due by the "Submit by" date.  Also important 
				is the complexity level.  The higher the complexity level, the more 
				difficult the project may be.  However, personal evaluation is usually a 
				lot more useful than the complexity level.</p>
			<span class=bodySubtitle>Project Details</span>
			<p>Clicking on the name of any project will bring you to the details for that 
				project.  Here you will find detailed information about the project, links 
				to documentation for the project, payment information, and a more comprehensive 
				timeline.</p>
			<span class=bodySubtitle>Deciding On A Project</span>
			<p>After finding a project that interests you, familiarize yourself with the design 
				documentation for the project.  The most concise document is the 
				requirements specification.  This document will contain information about 
				the various technologies involved in the project (e.g. SSL, LDAP, ODBC).  
				If you are still interested, you can read the component specification, which 
				will be a much more detailed guide to implementing the component.  There 
				are other documents available, but these are the most important to determine if 
				a project is right for you.</p>
			<p>Before choosing a project, it is very important to ensure you will have enough 
				time to complete the project.  Consider your other responsibilities and 
				assignments for the scheduled development period.  Also, keep in 
				mind that the component may use some technology you are not familiar 
				with.  Do you know how to use database connections in C#?  Do you 
				know how java.lang.ref's classes are used?  Do you know enough about a 
				certain network protocol to implement a component which requires it?  Be 
				sure to review sections 1.2, 1.3 and 2 of the component specification to ensure 
				you are familiar with the technologies employed. 
			</p>
			<span class=bodySubtitle>Project Registration</span>
			<p>Now that you've found a project you're comfortable with, and you have the time 
				to complete it, you're ready to register!  Click on the Register link on 
				the project details page to register for the project.</p>
			<h2><A name="sectionIII"></A>III. Getting Started - Environment</h2>
			<p>After registration, you'll have access to the project submission application, as 
				well as a forum for your component. </p>
			<span class=bodySubtitle>Project Submit and Review</span>
			<p>Project Submit and Review is the central hub for all development and design 
				contests you participate in.  You will upload your submission via 
				this application, and you receive your review scores here as well.  To 
				begin, go <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/review/" target="_blank">here</a>, 
				and log in.  Once logged in, you will see a list of all your open 
				projects, as well as your status.</p>
			<p>Click on the name of the project to view the timeline for the project, or to see 
				other more detailed information.  At the bottom of this screen, you will 
				have buttons appropriate to the current phase of development. Additionally, there is a 
				button marked "Contact Product Manager".  You can use this button at any 
				time to send questions, comments, complaints, or any other information to the 
				Product Manager.
			</p>
			<span class=bodySubtitle>Developer Forum</span>
			<p>A link to the development forum for your project is also available from the 
				project detail page.  Most communication regarding your project will take 
				place on the forums.  Your TopCoder username and password should allow you 
				to view the Developer Forum for your component.  If it does not, contact 
				your Product Manager immediately.  
			</p>
			<span class=bodySubtitle>Development Distribution</span>
			<p>On the development forum, there are four main sections: Design Phase Documents, 
				Design Phase Questions, Development Phase Documents, and Development Phase 
				Questions.  You will find the Development Distribution for your component 
				under Development Phase Documents.  The Development Distribution should 
				contain all the files and documents necessary to start development on your 
				component.</p>
			<p>Java distributions are commonly in jar format, and .NET distributions are 
				commonly in zip format.  Both can be extracted with an unzip utility.</p>
			<h3>Contents</h3>
			<p><font face="Courier New">/conf - </font>This directory, 
					if present, will contain configuration files for your component.  
					Sometimes this will include configuration for components your submission will 
					rely on, or sample configuration files written by the designer.  If no 
					such files were created during design phase, you may not have this directory in 
					your distribution.  If your component uses configuration files, you will 
					need to create this directory on your own.</p>
			<p><font face="Courier New">/docs - </font>This directory contains all current 
				documentation for your component.  This includes a .zargo or .zuml UML 
				design specification, as well as the requirements and component specification. 
				The design documents are covered in more detail in <a href="#sectionIV">Section IV</a>.</p>
				<p><font face="Courier New">/lib - </font>Here you 
						will find all required components level libraries that your component will 
						require.  Not included here are system level libraries (e.g. ODBC drivers, 
						and other libraries that may required more complicated installation).  All 
						TCS components that your project relies on should be included here.  If any 
						are missing, you need to contact your Product Manager.</p>
			</font>
			<p><font face="Courier New">/src - </font>This directory will contain all your 
				source, when you complete your project.  In the distribution, normally 
				only a directory skeleton will be created here.  Developers are 
				responsible for source file generation, covered in more detail in <a href="#sectionIV">Section IV</a>.</p>
			<p><font face="Courier New">/test_files - </font> This directory contains 
				all files used by your component during testing.  This can include special 
				or extreme configuration files, input and output samples, database schema, and 
				anything else non-compilable your testing needs.  The distribution will 
				often contain some sample testing data that the designer has created.</p>
			<h4>Java</h4>
			<p><font face="Courier New">/META-INF - </font>This directory is created by the jar packager, and can be ignored.</p>
			<p><font face="Courier New">/build.xml - </font>This is a default, possibly unconfigured build script.  Build scripts are covered in more detail in <a href="#sectionIII">Section III</a>.</p>
			<h4>C#</h4>
			<p><font face="Courier New">/default.build - </font>This is a default, possibly unconfigured build script.  Build scripts are covered in more detail in <a href="#sectionIII">Section III</a>.</p>
			<span class=bodySubtitle><a name="#setupenv"></a>Setting Up Your Environment</span>
			<p>First off, you'll need to decide on a working directory.  Appropriate 
				examples include <font face="Courier New"><font size="2">C:\working\</font><font face="Times New Roman">,</font>
					<font face="Courier New"><font size="2">C:\proj\</font><font face="Times New Roman">,</font>
						<font face="Courier New"><font size="2">~/projects/</font> <font face="Times New Roman">
								,</font> </font></font></font>or 
					wherever you are comfortable putting your code.  It is recommended to 
					establish a new directory for TopCoder projects, to minimize confusion and 
					reduce the chance of submitting the wrong files when you're ready to 
					submit.  For this tutorial, we'll assume your working directory is </font>
				<font face="Courier New" size="2">/proj/tc/</font><font face="Times New Roman">.</font></p>
			<p>Once you've found a place to store your project, unzip the distribution.  
				This directory (<font face="Courier New"><font size="2">/proj/tc/<em>project-name</em></font></font>) 
				will be referred to as your project directory.  For this tutorial, we'll 
				assume your project name is <font face="Courier New" size="2">tutorial_gen</font>.</p>
			<p>The next step is to configure your build script.  Keep in mind that TCS 
				will not be using your build script: don't devote TOO much time here.  
				Make the tweaks below to fix paths and library references.  If you're 
				having significant problems, check in with your project manager.</p>
			<h3>Java Build Script - build.xml</h3>
			<p>The default build script for your project will be almost ready to use.  One 
				change you will always need to make is the path to your 1.3 JRE, mentioned 
				above in Required Tools.  Find the entry for <font face="Courier New" size="2">
					java_1_3_bootclasspath</font> in the build script.  The script is XML, 
				and you'll need to be careful not to change anything unintentionally.</p>
			<p>If your path to the 1.3 JRE is "<font face="Courier New" size="2">C:\Program 
					Files\JavaSoft\JRE\1.3.1_10\lib</font>", the java_1_3_bootclasspath will 
				change to the following:</p>
			<p><font face="Courier New"><font size="2"><span class="b"> </span> <span class="m">&lt;</span><span class="t">property</span>
						<span class="t">name</span><span class="m">="</span>java_1_3_bootclasspath<span class="m">"</span><span class="t">
							value</span><span class="m">="<strong>C:\Program&#160;Files\JavaSoft\JRE\1.3.1_10\lib</strong></span><strong>\rt.jar</strong><span class="m">"</span><span class="m">
							/&gt;</span></font></font>
			</p>
			<p>In many cases, this will be all the configuration you will need to do.  If 
				you cannot add the JUnit jar to your classpath, you will need to include it in 
				the build script.  Uncomment the section below, and change <font face="Courier New" size="2">${ext_libdir}/junit.jar</font>
				to the correct path.</p>
			<p><font face="Courier New" size="2">&lt;!-- 3rd Party Dependencies --&gt;<br>
					&lt;!-- &lt;property name="junit.jar" value="${ext_libdir}/junit.jar"/&gt;<br>
					--&gt;</font></p>
			<p>If your project requires additional libraries, you will need to configure your 
				build script to account for these during build and run time.  There should 
				already be a few commented examples of libraries in the script.</p>
			<p><font face="Courier New" size="2">&lt;property name="spell_check.version" 
					value="1.0"/&gt;<br>
					&lt;property name="spell_check.jar.name" value="spell_check.jar"/&gt;<br>
					&lt;property name="spell_check.path" 
					value="spell_check/${spell_check.version}"/&gt;<br>
					&lt;property name="spell_check.jar" 
					value="${tcs_libdir}/${spell_check.path}/${spell_check.jar.name}"/&gt;</font>
			</p>
			<p>This allows for easy configuration of different versions of the library with 
				minimal build editing. You may have noted the reference to <font face="Courier New" size="2">
					${tcs_libdir}</font> .  This should already be defined at the top of 
				your build script as follows:</p>
			<p><font face="Courier New" size="2">&lt;property name="tcs_libdir" value="lib/tcs" 
					/&gt;</font></p>
			<p>This configuration would look for the spell check library jar at <font face="Courier New">
					<font size="2">/proj/tc/tutorial_gen/lib/tcs/spell_check/1.0/spell_check.jar.  </font>
					<font face="Times New Roman" size="3">Odds are your distribution will already have 
						the proper library path, but if not, you can alter your build script as 
						appropriate, by changing the path or file name property above.</font></font></p>
			<p>Once you have your jar references set up, you will need to add them to the 
				buildlibs property in your script.</p>
			<p><font face="Courier New" size="2">&lt;path id="buildlibs"&gt;<br>
					   &lt;pathelement location="${spell_check.jar}" /&gt;<br>
					   <br>
					   &lt;!-- .... other library references .... --&gt;<br>
					<br>
					   </font><font face="Courier New" size="2">&lt;pathelement 
					location="${j2ee.jar}" /&gt;<br>
					&lt;/path&gt;</font>
			</p>
			<p>You must include any library your component requires to build or run.  
				While it can be useful to rely on your classpath, it is good practice to 
				include all the necessary libraries here.</p>
			<h3>Java - topcoder_global.properties</h3>
			<p>As you may (or may not) have noticed, the build.xml that came with your 
				distribution contains a reference to a file named "<font face="Courier New" size="2">../../topcoder_global.properties</font>".  
				Using this file, you can set properties that won't change between projects, 
				such as the path to your 1.3 JRE.</p>
			<p>The format is simple (and common to all Java properties files).</p>
			<p><font face="Courier New" size="2">propertyname=value</font></p>
			<p>First, create <font face="Courier New" size="2">topcoder_global.properties</font>
				in the directory below your project (if your current project is<font face="Courier New" size="2">/proj/tc/tutorial-gen</font>, 
				your properties file will reside in <font face="Courier New" size="2">/proj/tc</font>). Now, 
				you can set properties for all your build scripts.  For the JRE, you 
				would add:</p>
			<p><font face="Courier New" size="2">java_1_3_bootclasspath=C:\Program 
					Files\JavaSoft\JRE\1.3.1_10\lib\rt.jar</font></p>
			<p>You can add comments to the file, as well.
			</p>
			<p><font face="Courier New" size="2"># I need a comment to remember what this means.<br>
					java_1_3_bootclasspath=C:\Program Files\JavaSoft\JRE\1.3.1_10\lib\rt.jar</font></p>
			<p>You can also use property expansion.
			</p>
			<p><font face="Courier New" size="2">java_home=C:\Program Files\JavaSoft\JRE\1.3.1_10<br>
					java_1_3_bootclasspath=${java_home}\lib\rt.jar</font></p>
			<p>
				Keep in mind that your topcoder_global.properties reference is at the beginning 
				of your build.xml. This means that properties from the build.xml won't expand 
				in your properties file (they aren't yet defined).  Also note that 
				properties set in the <font face="Courier New" size="2">topcoder_global.properties</font>
				will always override properties set in the build.xml. For more information, see <a href="http://ant.apache.org/manual/CoreTasks/property.html" target="_blank">
					the Ant documentation</a>.
			</p>
			<h3>C# Build Script - default.build</h3>
			<p>NAnt build scripts are very similar to Ant build scripts. </p>
			<p>The major change you will need to make is the path to your NUnit installation. 
				Find the line below in your build script, and replace the path with the proper 
				path to your <font face="Courier New" size="2">nunit.framework.dll</font>.</p>
			<p><font face="Courier New" size="2">&lt;property name="Nunit" value="D:\Program 
					Files\NUnit V2.0\bin\nunit.framework.dll"/&gt;</font></p>
			<p><font color="#000000">If your project requires additional libraries, you will need 
					to configure your build script to account for these during build and run 
					time.  .NET is somewhat more flexible with binary locations, but it is 
					always good practice to place your libraries in the <font face="Courier New" size="2">
						/lib</font> directory. </font></p>
			<p><font face="Courier New" size="2">&lt;property 
					value="${tcs_bin}\generic_parser\1.0\TopCoder.Util.GenericParser.dll" 
					name="generic_parser.dll"/&gt; </font></p>
			<a name="sectionIV"></A>
			<h2>IV. Getting Started - Development</h2>
			<p>You've got your environment ready, your distribution extracted, your build 
				script configured.  Now what?  Well, the first step is reading the 
				design documentation.</p>
			<span class=bodySubtitle>Design Documents - Your New Best Friend</span>
			<p>The <font face="Courier New"><font size="2">/doc </font><font face="Times New Roman" size="3">
						directory is chock full of information you will need to complete your 
						submission.</font></font></p>
			<p><font face="Courier New"><font face="Times New Roman" size="3"><font face="Courier New" size="2">.zuml 
							/ .zargo</font> - There should be one UML document in the doc 
						directory.  This will contain definitions for all classes and interfaces 
						present in the component.  It will define all the behavior you will need 
						to implement, including failure conditions.</font></font></p>
			<p><font face="Courier New" size="2">.pdf / .rtf</font> - There should be one 
				Component Specification and one Requirements Specification present in the 
				doc directory.  The Component Spec is a more reader friendly version of 
				the UML document.  It summarizes the general design of the component, as 
				well required standards and algorithms for the component.  It concisely 
				defines Exception classes and other information you will need.  The 
				Requirements Spec is present, but you should not need it.  It defines the 
				design requirements; all these should already be met.</p>
			<p><font face="Courier New"><font face="Times New Roman" size="3"><font face="Courier New" size="2">.gif 
							/ .png</font> - These documents are generated from the UML documentation 
						and can be disregarded.  All information here will be more easily 
						accessible in the UML document.</font></font></p>
			<span class=bodySubtitle>Development Process</span>
			<p>As explained in <a href="#sectionI">Section I</a>, your part in the development process is to implement the 
				a design which has already been created and reviewed.  To this end, <strong>you 
					should consider the public API in the design document as canon</strong>.  
				You are not allowed to deviate from the public API without approval from the 
				Product Manager and/or the designer.  This includes: adding or removing 
				public classes, methods, and interfaces.</p>
			<p>This is not to say that every design is flawless; quite the opposite.  
				There is almost always room to improve any design. However, disagreements with 
				design decisions are fixed by design revision, not by development. The 
				implementation phase of the development process is not the appropriate time to 
				remedy design issues, unless they are fatal to the project. TopCoder employs a 
				fully reviewed process for all design changes.
			</p>
			<p>If you have any improvements or insights for the next revision of the design, 
				please post them on the forum.  If you do happen to run into any problem 
				during development, bring them up, immediately, on the development 
				forum.  The earlier any conflicts or issues with the design are 
				noted, the sooner they can be fixed.  If appropriate, read up on the 
				design forum posts.  It is possible that issues have already been 
				identified and addressed there. Again, if you see anything that hasn&#8217;t been 
				addressed, please bring it up in the development forum... it can&#8217;t hurt!</p>
			<p>All this being said, you are encouraged to make any possible improvements on the 
				underlying implementation.  If you can refactor the behavior of the public 
				classes into a private helper class: go for it!  If you can come up with 
				a more efficient data gathering or manipulation algorithm than the one 
				specified by the designer: wonderful!  The only part of the design set in 
				stone is the public API and the general behavior of the component from the 
				user's perspective. Basically, you can't change the "what" of your project, but you do 
				have some freedom to improve the "how."</p>
			<h3>Development Innovation</h3>
			<p>Different designs allow for different degrees of development-phase innovation. 
				This is partly a matter of the complexity of the design itself, and partly a 
				matter of the designer&#8217;s approach. It is possible for a design to describe the 
				component so completely that component coding is reduced to a translation of 
				pseudo code from the Component Specification into the appropriate language for 
				the component. It is also possible for the design to be restricted to 
				definition of the public API, leaving the developer to provide all other 
				implementation details. Most designs, however, fall somewhere in the middle.</p>
			<p>Implementation of method bodies is always an area in which developers have an 
				opportunity to put their own twist on the development. With some designs it may 
				also be reasonable or even necessary to add private or package-private methods, 
				constructors, or even whole classes that are not specified explicitly in the 
				design documents. If and when you make such additions you should take care to 
				ensure that they are both necessary and appropriate because these parts of the 
				submission are likely to attract extra scrutiny from the Development Review 
				Board. Developer additions (like any other element of the component), should 
				generally have the narrowest possible scope and the most restrictive access 
				that are consistent with their intended usage. Be sure everywhere to use the 
				most appropriate types of objects and primitives for the tasks at hand.
			</p>
			<span class=bodySubtitle><a name="#stubs">Generating Stubs</a></span>
			<p>The first step in concrete development will be stub generation.  Stubs are 
				compilable code skeletons.  Where you would normally find a function 
				body, however, there is simply a "stub."  The stubs feature the full API 
				of the final component, but none of the logic.  The Community Edition of 
				Poseidon can generate stubs for you, in Java format.  The more expensive 
				versions of Poseidon can also generate C# code.  Without one of these 
				versions, however, you will have to convert the files by hand. You 
				should, however, be able to request the stub code from your Product Manager.</p>
			<p>Keep in mind that the stub code you receive will likely not be compilable.  
				You'll need to ensure that approximations and external references are 
				resolved.  For instance, in a .NET component, the designer may have had to 
				create stand in objects for system types.  You'll need to delete these.</p>
			<p>Another common problem with generated stubs is the association section.  
				Many relationships (such as aggregation and composition) in the UML document 
				will be inappropriately translated to code.  You are responsible for 
				ensuring the proper translation of the API documentation (the UML document and 
				the Component Specification) to compilable code.</p>
			<span class=bodySubtitle>Project Structure</span>
			<p>The source for your project will reside under /src in your project 
				directory.  At this point, your project should be arranged similarly to 
				the following (under the <font face="Courier New" size="2">/proj/tc/tutorial_gen/</font>
				directory in the example case):</p>
			<p></p>
			
			<table border="0" cellpadding="0" width="100%" class="formFrame">
				<thead>
					<tr>
						<td class=projectHeaders>Path</td>
						<td class=projectHeaders>Description</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class=projectCells valign=top nowrap=nowrap><font face="Courier New">conf/</font></td>
						<td class=projectCells valign=top>Any configuration files necessary to your component.</td>
					</tr>
					<tr>
						<td class=projectCells valign=top nowrap=nowrap><font face="Courier New">docs/</font></td>
						<td class=projectCells valign=top>All the documentation for your project.</td>
					</tr>
					<tr>
						<td class=projectCells valign=top nowrap=nowrap><font face="Courier New">lib/</font></td>
						<td class=projectCells valign=top>All your local libraries.</td>
					</tr>
					<tr>
						<td class=projectCells valign=top nowrap=nowrap><font face="Courier New">src/</font></td>
						<td class=projectCells valign=top>All your source code will be placed here (including test code).</td>
					</tr>
					<tr>
						<td class=projectCells valign=top nowrap=nowrap><font face="Courier New">test_files/</font></td>
						<td class=projectCells valign=top>All non-compiled files used in testing will be placed here.</td>
					</tr>
				</tbody>
			</table>
			<h3>Java</h3>
			<p>The code for your component will be stored in the <font face="Courier New" size="2">/src/java/main/</font>
				directory.  From there, you need to arrange your source according to the 
				package for your project.  For instance, if your component was <font face="Courier New" size="2">
					com.topcoder.util.tutorial</font>, your full path to source would be <font face="Courier New" size="2">
					/src/java/main/com/topcoder/util/tutorial/.</font>
						Below are Java specific paths.</p>
			<table border="0" cellpadding="0" width="100%" class="formFrame">
				<thead>
					<tr>
						<td class=projectHeaders>Path</td>
						<td class=projectHeaders>Description</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class=projectCells valign=top nowrap=nowrap><font face="Courier New">lib/tcs/spell_check/1.0/spell_check.jar</font></td>
						<td class=projectCells valign=top>In this example, a component that the Tutorial Generator relies on. Your 
							component may not depend on any components, or it may depend on many.</td>
					</tr>
					<tr>
						<td class=projectCells valign=top nowrap=nowrap><font face="Courier New">src/java/main/</font></td>
						<td class=projectCells valign=top>Your component code will reside in this directory.</td>
					</tr>
					<tr>
						<td class=projectCells valign=top nowrap=nowrap><font face="Courier New">src/java/main/com/topcoder/util/tutorial/</font></td>
						<td class=projectCells valign=top>In this example, this is the appropriate place for stubs. In your project, the 
							path will be different.</td>
					</tr>
				</tbody>
			</table>
			<h3>C#</h3>
			<p>The code for your component will be stored in the <font face="Courier New" size="2">/src/csharp/main/</font>
				directory.  From there, you need to arrange your source according to the 
				package for your project.  For instance, if your component was <font face="Courier New" size="2">
					TopCoder.Util.Tutorial.dll</font>, your full path to source would be <font face="Courier New" size="2">
					/src/csharp/main/TopCoder/Util/Tutorial/. </font>Below 
						are C# specific paths.  Although C# namespaces do not require 
						directory arrangement conformity as Java packages do, it is TopCoder practice 
						to arrange the source files according to namespace.</p>
			<table border="0" cellpadding="0" width="100%" class="formFrame">
				<thead>
					<tr>
						<td class=projectHeaders>Path</td>
						<td class=projectHeaders>Description</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class=projectCells valign=top nowrap=nowrap><font face="Courier New">lib/TopCoder.Util.SpellCheck.dll</font></td>
						<td class=projectCells valign=top>In this example, a component that the Tutorial Generator relies on. Your 
							component may not depend on any components, or it may depend on many.</td>
					</tr>
					<tr>
						<td class=projectCells valign=top nowrap=nowrap><font face="Courier New">src/csharp/main/</font></td>
						<td class=projectCells valign=top>Your component code will reside in this directory.</td>
					</tr>
					<tr>
						<td class=projectCells valign=top nowrap=nowrap><font face="Courier New">src/csharp/main/TopCoder/Util/Tutorial/</font></td>
						<td class=projectCells valign=top>In this example, this is the appropriate place for stubs. In your project, the 
							path will be different.</td>
					</tr>
				</tbody>
			</table>
			<span class=bodySubtitle>Building Your Project</span>
			<p>Once you have generated and cleaned your stubs, you should be able to build your 
				component with the build script. To do so, you simply execute your build tool 
				from the command line, with a target.</p>
			<p>Here are the common build targets for [N]Ant:</p>
			<table border="0" cellpadding="0" width="100%" class="formFrame">
				<thead>
					<tr>
						<td class=projectHeaders nowrap=nowrap><strong>Target<br>
								Name</strong></td>
						<td class=projectHeaders><strong>Description</strong></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class=projectCells valign=top nowrap=nowrap>compile</td>
						<td class=projectCells valign=top>This target will compile your project into a fully functional binary unit 
							(assuming that your code is correct).</td>
					</tr>
					<tr>
						<td class=projectCells valign=top nowrap=nowrap>compile_tests</td>
						<td class=projectCells valign=top>This target will compile your tests.  It depends on a successful 
							compile.</td>
					</tr>
					<tr>
						<td class=projectCells valign=top nowrap=nowrap>compile_targets</td>
						<td class=projectCells valign=top><em>(Java Only) </em>This target will compile your component against the 1.3 
							JRE you configured.  Normally, you must build against this target, to pass 
							screening.  Section 2 of the Component Specification should detail whether 
							or not you need to compile_targets.</td>
					</tr>
					<tr>
						<td class=projectCells valign=top nowrap=nowrap>test</td>
						<td class=projectCells valign=top>This target will execute your tests.  It depends on a 
							successful compile_tests.  After test execution, the results can be found 
							in the <font face="Courier New" size="2">/log</font> directory.</td>
					</tr>
					<tr>
						<td class=projectCells valign=top nowrap=nowrap>clean</td>
						<td class=projectCells valign=top>This target will clean the /build directory, removing all compiled code and 
							intermediate files from the project.</td>
					</tr>
					<tr>
						<td class=projectCells valign=top nowrap=nowrap>dev_submission</td>
						<td class=projectCells valign=top>This target will create a packaged submission for you to upload via Project 
							Submit and Review, when your project is complete.</td>
					</tr>
				</tbody>
			</table>
			<p>To execute a build target, you simply move into the directory where your build 
				script is (it should be the project root directory), and execute <font face="Courier New" size="2">
					ant &lt;target&gt;</font> or n<font face="Courier New" size="2">ant 
						&lt;target&gt;.  </font>Make sure that you've 
							properly configured [N]Ant to allow execution at the command line, or this step 
							simply won't work!
			</p>
			<p><a href="/i/development/nantbuild.html" target="_blank">Example NAnt Build</a></p>
			<p><a href="/i/development/antbuild.html" target="_blank">Example Ant Build</a></p>
			<p>Your component should almost always build cleanly against the stubs.  If 
				they do not compile, you probably have an API problem, or a library 
				configuration issue. It is far easier to fix these issues now, before you have 
				written any tests or code, and you should do so if possible.</p>
			<span class=bodySubtitle>And You're Off!</span>
			<p>At this point in the tutorial, you should be ready to develop your 
				project.  Any more specific information on development technique or 
				strategy is beyond the scope of this document.  However, for the next few 
				sections, we'll walk you through documentation, unit testing, and common 
				problems during development, common to all projects.</p>
			<a name="sectionV"></A>
			<h2>V. Working Towards Your Submission - Documentation</h2>
			<p>Documentation is critical to a useful, maintainable component.  If you 
				document your code as you write it, you probably won't even notice the burden 
				of writing a project's worth of documentation.  Your submission will be 
				assessed on the quality of documentation.  Furthermore, the better your 
				documentation is, the easier it will be for the Review Board to understand 
				and evaluate your code, and the better your overall score will be.</p>
			<span class=bodySubtitle>API Documentation</span>
			<p>Autogenerated API documentation from the UML document is intended for your 
				consumption, not for the final product.  In Java, the API is documented 
				through javadoc comments, and in C# via XML comments.  All classes, 
				interfaces, methods, and variables must be documented. Below are examples of 
				each type:</p>
			<h3><a name="#javadoc">Java</a></h3>
			<p>Many Java IDEs (such as Eclipse or IDEA) will automatically generate API 
				documentation as you type.</p>
			<pre>/**
	 * Saves the file to permanent storage, on the path specified by configuration. The path
	 * must not begin with a backslash, and must not contain any special characters (see component
	 * specification). If the  filename cannot be used, an exception will be thrown.
	 *
	 * @param filename The filename to save to. May not  be null or empty.
	 * @throws IllegalArgumentException If filename is null.
	 * @throws IllegalArgumentException If filename is not valid (zero length, invalid characters, etc).
	 * @throws IOException If an error is encountered while saving the file.
	 */
	 public void SaveAs(string filename)</pre>
			<p>For more information on javadoc commenting, please see <a href="http://java.sun.com/j2se/javadoc/writingdoccomments/index.html" target="_blank">
					http://java.sun.com/j2se/javadoc/writingdoccomments/index.html</a>.</p>
			<h3><a name="#csdoc">C#</a></h3>
			<p></p>
			Visual Studio.NET will create much of your XML documentation for you, as you 
			write your code. Simply type /// before a declaration.
			<p></p>
			<pre>/// &lt;summary&gt;
	/// Saves the file to permanent storage, on the path specified by configuration. The path
	/// must not  begin with a backslash, and must not contain any special characters (see component
	/// specification). If the filename cannot be  used, an exception will be thrown.
	/// &lt;/summary&gt;
	/// &lt;param name="filename"&gt;The filename to save to. May not be null  or empty.&lt;/param&gt;
	/// &lt;exception cref= "ArgumentNullException"&gt;If filename is null.&lt;/exception&gt;
	/// &lt;exception cref="ArgumentException"&gt;If filename is not valid
	/// (zero length, invalid characters, etc).&lt;/exception&gt;
	/// &lt;exception cref="IOException"&gt;If an error is encountered while saving the file.&lt;/exception&gt;
	public override void SaveAs(string filename)</pre>
			<p>Though C# does not have checked throws, it is good practice to note expected 
				exceptions that the function can generate in your API documentation.  For 
				more information about XML documentation, see <a href="http://msdn.microsoft.com/msdnmag/issues/02/06/XMLC/default.aspx" target="_blank">
					http://msdn.microsoft.com/msdnmag/issues/02/06/XMLC/default.aspx</a>.</p>
			<h3>Documentation Content</h3>
			<p>Explain how the component will behave, invalid input, failure behavior. If the 
				object mutates based on certain operations, make sure this is clear (though 
				List.add(object) is obviously a mutator, List.screenedAccept(object, bool) may 
				not be so obvious [even if it is obvious to you!]). Make sure to document the 
				return value, all thrown exceptions, and all parameters. Additionally, every 
				class and interface in your project should have summary documentation, 
				explaining its general function and place in your component.</p>
			<p>You should not include any personally identifiable information in your 
				submission.  Anywhere you would use your TCS handle (for instance, in an 
				@author tag), put TCSDEVELOPER.  This helps keep review as 
				impartial and objective as possible.  After you win, you'll change your 
				code to include your handle (during Final Fixes).</p>
			<h3>Documentation Audience</h3>
			<p>The audience for your API documentation will be the consumers of the component; 
				TopCoder Software's customers.  Always keep a professional tone in your 
				API documentation.  Write in an active voice.  Be as descriptive as 
				possible, and consider that the consumer of the component may not be as 
				familiar with the language, or the component, as you are.</p>
			<p>As mentioned above, documentation from the UML source will not be appropriate to 
				the final product.  For instance, you might have received the following 
				documentation for the SaveAs function above:</p>
			<pre>Pull the path info from the config file, then append the filename passed in.  Attempts
	to save the file to that location, throws exception otherwise.

	Invalid Input: null, blank, funny characters, non-fs safe
	Valid Input: everything else

	Throws: IOException on failure, InvalidArgumentException if it is</pre>
			<p>This documentation is certainly descriptive of what the SaveAs function does, 
				but it is more a guideline for you, the developer, than descriptive 
				documentation for the user.  You'll want to remove the implementation 
				details, and explain, clearly and concisely, how the function behaves.  
				Also, "funny characters" may be appropriate documentation for internal 
				development, but is not appropriate to go to a customer.  You should 
				rewrite the API documentation as you complete each function, with these 
				guidelines in mind.</p>
			<span class=bodySubtitle>Inline Documentation</span>
			<p>Inline documentation are simple comments which explain code function within code 
				blocks. Documentation here is intended both for possible component consumers, 
				as well as internal TopCoder improvement. As with any programming, the more 
				documentation you add, the easier the code is to maintain. x++; is obviously 
				incrementing x. No documentation necessary. Or is there? loopIndex++ might be 
				more appropriate, or recordCount++, and so on. If the intention of your code is 
				not plainly obvious, perhaps you need some commenting!</p>
			<span class=bodySubtitle>Required Documentation</span>
			<p>There is no hard and fast rule for correct API or inline documentation, and 
				review here will be highly subjective.</p>
			<p>However, there are some basic requirements.
				</p><ul>
					<li>
					Every file must contain a TopCoder copyright notice.
					</li><li>
						All public API elements MUST be commented fully (parameters, return types, 
						exceptions). <b>NOTE: This includes Unit Tests.</b>
					</li><li>
					Any overly complex or large block of code should contain some inline commenting 
					to explain purpose and function.
					</li><li>
						Documentation must be professional in tone and quality.</li></ul>
			<p>Keep in mind the guidelines in this section, and you should score well on your 
				documentation!</p>
			
			<A name="sectionVI"></A>
			<h2>VI. Working Towards Your Submission - Unit Tests</h2>
			<p>Every component, big or small, requires a set of tests.  These tests are 
				meant to probe the component for correct behavior when given proper input, as 
				well as correct failure when given improper input. Our style of unit 
				testing originates from Extreme Programming. You don&#8217;t necessarily need to 
				program in this style, but for more information on the thought and methodology 
				of unit testing, see <a href="http://www.xprogramming.com/" target="_blank">http://www.xprogramming.com</a> or
				<a href="http://junit.sourceforge.net/#Documentation" target="_blank">http://junit.sourceforge.net/#Documentation</a>.</p>
			<p>In Extreme Programming, you write tests before you write code. Again, this 
				is not required, but it can be very useful.  Your API is largely 
				immutable, so you should be able to write tests against the API, regardless of 
				their success.  Use this fact to your advantage, and test 
				often.  As you fill in the stubs, more tests will pass.</p>
			<span class=bodySubtitle>What Are Unit Tests?</span>
			<p>Unit tests are programmatic tests for the correct functionality of a piece of 
				software, at the finest granularity possible (i.e. tests for each unit of 
				functionality.) This normally means tests of each individual non-private method 
				and constructor of each class. Tests should verify correct operation across the 
				spectrum of legal state and inputs, including extreme values, and also should 
				verify correct failure behavior for every testable failure scenario.</p>
			<span class=bodySubtitle>Test Scope</span>
			<p></p>
			<p>Unit tests can be as extensive as you like.  In some cases, your tests may 
				include more code than the unit you are testing!
			</p>
			<p>For every public function in your component, you must have a corresponding test. 
				You should test accuracy and failure (valid and invalid input). The wider range 
				of input and output you test, the more likely you are to expose bugs. It is 
				very difficult to test the full range of input (sometimes impossible in large 
				input spaces). However, the closer you can approximate the full range of input, 
				the more robust your code will be.</p>
			<p>In addition to these small, atomic tests, you should always create tests that 
				probe the expected function of your component, from start to finish.</p>
			<span class=bodySubtitle><a name="#testlink">Creating Your Tests</a></span>
			<p>The first thing you'll need to do is create a directory for your tests.  
				It'll be under your <font face="Courier New" size="2">src/</font> tree. 
				Each language is a bit different for testing purposes.</p>
			<ul>
				<li>
					<a href="/tc?module=Static&d1=dev&d2=support&d3=devUnitTestsCSharp">Writing C# Unit Tests</a>
				</li><li>
					<a href="/tc?module=Static&d1=dev&d2=support&d3=devUnitTestsJava">Writing Java Unit Tests</a></li></ul>
			<span class=bodySubtitle>Unit Testing Tips</span>
			<p>It can be very tempting to simply aggregate all of your unit tests into one 
				function.  However, this greatly reduces the utility of your tests.  
				In our example above, we could easily combine all three test functions into a 
				single function, testSaveAs().  Instead of having three tests, we now only 
				have one.  If any of the three behaviors are broken, all tests will 
				fail.  In larger scale testing, this composite testing methodology can 
				lead to very confusing failure conditions, and it can become difficult to debug 
				your testing code.  The smaller and more atomic your tests 
				become, the more obvious <span style="font-size: 12pt; font-family: 'Times New Roman';">
					the failure point and probable cause generally are.</span></p>
			<ul>
				<li>
				ALWAYS implement a tested version of the demonstration from the component 
				specification.
				</li><li>
				ALWAYS provide a meaningful message in assert and fail calls.
				</li><li>
				ALWAYS document your test code as well as you document your component code.
				</li><li>
				Break up your tests into discrete TestCase classes. If one TestCase becomes 
				unmanageable, don't hesitate to break it into two or more classes.
				</li><li>
				Break up your tests within those classes into the smallest functions possible; 
				this way, it is clear which areas of the component are failing.  You can 
				then use the number of tests passing and failing as a completion metric, as 
				well.
				</li><li>
				Reduce code duplication and increase robustness with setUp() and tearDown().
				</li><li>
				Test every public function for as much valid and invalid input as time allows.
				</li><li>
				Test expected component processes: loading, processing data, and saving data, 
				for instance.
				</li><li>
				Don't forget to clean up your environment! Unit tests should leave the system 
				in the same state they found it in; there should be no persistent changes. This 
				is checked during development review.
				</li><li>
				Test classes are normal classes in every respect, except that they have special 
				significance to the testing framework. These classes can inherit from a class 
				intermediate between themselves and the final test. They may contain methods 
				other than test methods. They may have state.
				</li><li>
				Because they are in the same package or namespace as the component classes they 
				test, the unit tests can access package-private and protected classes and their 
				members.
				</li><li>
					Interfaces cannot be tested directly, but methods that accept interface 
					arguments can be presented with alternative implementations. This technique has 
					great potential for verifying that the component does the expected things with 
					and to its interface-typed fields and method arguments, and that it reacts 
					correctly to exceptions thrown by methods invoked on such arguments.</li>
			</ul>
			<A name="sectionVII"></A>
			<h2>VII. Working Towards Your Submission - Problems</h2>
			<p>During the course of development, you may run into any number of problems.  
				You may need a component from the catalog.  There may be some flaw in the 
				design that blocks development.  You may have questions about the 
				designer's intent, or some technology employed by your component.  Have no 
				fear, you're not alone!</p>
			<p>If you find any confusion or ambiguity in the design, bring it up on the forums 
				for your component (available from Project Submit &amp; Review).  It's 
				possible that you've found some case or situation that the designer may not 
				have thought of.  It may be that you're misreading the component, or 
				overlooking something.  In any case, problems specific to the component 
				itself should be addressed on the component forum.</p>
			<p>On the other hand, if you have problems writing your code, or if you don&#8217;t 
				understand a required technology, or bugs in that regard, you should probably 
				go to TopCoder's Round Tables, and not the development forums.  The 
				TopCoder Round Tables are available at this URL: <a href="/rtables/index.jsp" target="_blank">
					http://www.topcoder.com/rtables/index.jsp</a>.  The General, 
				or Component Competition Forums are appropriate places to start looking 
				for help.  The Round Tables are frequented by many of the highly 
				experienced TopCoder members, as well as TopCoder Software staff, who will 
				always try to help as best they can.</p>
			<p>If you ever have a problem that blocks you from working on your project, email 
				the Project Manager immediately.  This includes things such as missing or 
				corrupt files, access or application problems, and major design issues.  
				You can email your Project Manager from the Project Submit &amp; Review Details 
				page for your component.  If you can't access Project Submit &amp; Review, 
				email <a href="mailto:service@topcoder.com">service@topcoder.com</a>, and 
				indicate which project you're registered to, and the nature of your problem.</p>
			<p>The proper method of communication is NOT a readme file. If you need to make any 
				significant deviation from the design, you need to get in touch with the 
				designer and PM.</p>
				
			<A name="sectionVIII"></A>
			<h2>VIII. Submission!</h2>
			<p>The hard work is over, and you've got 150 successful unit tests.  You're 
				ready to submit your solution!</p>
			<p>First, you should review your code.  Make sure that your submission meets 
				the review guidelines (<a href="#sectionIX">Section IX</a>) as fully as possible.
					Finding small issues now will save you points later in the review 
					process.  Make sure that your directory structure is appropriate as above.</p>
			<p>Secondly, make sure your code compiles.  If you're writing a Java solution, 
				make sure that the compile_targets build target compiles, if applicable.</p>
			<p>Finally, run the dev_submission build target.  This will build a compressed 
				archive of your files.  Make sure to verify that all the files you've 
				written are in the archive, and add any missing files as needed.  Your 
				submission should include a successful log from your unit tests, all the files 
				in the <font face="Courier New" size="2">conf/</font> tree, and all the files 
				and directories you need in <font face="Courier New" size="2">test_files/</font>.  
				If you have time, you can extract your dev submission to another directory and 
				ensure that it builds cleanly.</p>
			<p>Once you're satisfied with your submission archive, you can upload it through 
				Project Submit &amp; Review!</p>
			<span class=bodySubtitle>Making your Submission Shine</span>
			<p>In order to win development competitions it is necessary to make your submission 
				outshine your competition.</p>
			<p>This can be quite a trick for very simple, highly specified components, and 
				should be of considerable concern even for more complex or more loosely 
				specified components. There are many ways to put that shine on your submission, 
				but here are some suggestions:</p>
			<ul>
				<li>
				Write clean, clear, efficient code. Even though there is no review line item 
				specifically for this, reviewers are nevertheless likely to react better to 
				code that is easy for them to read and understand. With efficient code you get 
				a potential performance advantage in stress and benchmark testing, as well as 
				likely kudos (and a few extra points) from the reviewers.
				</li><li>
				Write a comprehensive unit testing suite. Inadequate tests can cost you dearly 
				because there are several review line items pertaining to the unit test suite. 
				Tests should cover all non-private methods thoroughly, and they should be well 
				documented. Doing a good job on the tests can be a big win because the unit 
				test suite is one of the areas that are more frequently neglected.
				</li><li>
				Provide excellent documentation. The class and method documentation is the 
				developer&#8217;s responsibility, and few developers seem to give it the attention it 
				deserves. Good documentation will be clear and comprehensive. Read and become 
				familiar with Javadoc&#8217;s docs. Note, for instance, that more or less arbitrary 
				HTML can be inserted into documentation comments; appropriate use of that 
				feature can be very effective. Try to put yourself in another developer&#8217;s 
				position and ask yourself what you might possibly want to know about the 
				component &#8211; then put it in. Read and follow Sun or Microsoft's guide on writing 
				comments for the respective language, and also their related documentation on 
				how to write API specifications.
				</li><li>
				Fully satisfy all requirements and provide all required functionality. Perhaps 
				this should go without saying, but it will hurt your chances if anything is 
				left out. Watch out for special cases and unusual inputs.
				</li><li>
					Pay attention to any issues that the designer may have disregarded or 
					overlooked &#8211; thread safety, for instance, or portability (even Java and .NET 
					software can have portability issues). Where you have discretion within the 
					design, give your submission desirable properties such as these.
				</li>
			</ul>
			<A name="sectionIX"></A>
			<h2>IX. Review</h2>
			<p>The submission is out of your hands, and the Review Board will judge it on the 
				following criteria.  You can find a very detailed summary of the scorecard 
				<a href="/tc?module=Static&amp;d1=dev&amp;d2=support&amp;d3=devReviewSample">here</a>.</p>
			<p><strong>The implementation addresses the functionality as detailed in the component 
					design documents.  - </strong>Does your component function as the 
				design specified?  Does it do everything required, in the manner required?</p>
			<p><strong>The implementation correctly uses the technologies that are specific to the 
					component. - </strong>Does your component use all relevant technology 
				properly?  Do you connect to the database properly?  Do you use 
				proper XML configuration?  This also applies to design elements such as 
				singleton design, and synchronization.</p>
			<p><strong>The implementation properly implements required algorithms as defined in 
					section 1.3 of the Component Specification.</strong> - If there are 
				any complicated algorithms in your component, they are likely specified by the 
				design.  If you have improved the algorithms, you can earn extra points 
				here.  If there are any problems with your implementation of the 
				algorithms, you will lose points.  If you find any problems with the 
				specification in 1.3, you need to bring it up on the forum, and find a 
				solution with the designer.  As the developer, you are responsible for the 
				proper behavior of your component, even if there was a flaw in the algorithm 
				design.
			</p>
			<p><strong>All classes, methods and variables declarations are <em>exactly</em> as they 
					are defined in the design documents (visibility, types, modifiers, names, 
					exception list).  </strong>- As above, you must conform exactly to the 
				API in the design.  Removing, adding, or altering public API elements is 
				unacceptable without prior approval from the designer or PM.</p>
			<p><strong>No additional public or protected entities are present in the design.</strong>  
				- You may only add private entities to the component.Package private and 
				protected variables are not allowed. Package private methods are allowed, as 
				long as they fit naturally into the design. Package private classes are allowed 
				also, if they are used to provide helper methods. Private variables, methods 
				and inner classes are allowed. All added entities must follow the language 
				naming conventions and must use proper English. Note that when there are 
				multiple packages, helper classes may need to be public. In this case the 
				restriction about adding public classes and methods is relaxed.  
			</p>
			<p><strong>The implementation properly maps class relationships. - </strong>This 
				point is generally implicit if you have implemented the design as 
				specified.  You should not add dependencies or associations between 
				classes unless necessary.</p>
			<p><strong>The object types defined in the implementation are the best choice for the 
					intended usage. - </strong>As a developer, you will have to make choices 
				for object types.  For instance, you may decide to use a TreeMap to store 
				some value mappings.  Unless you need to preserve key ordering, you should 
				probably use a HashMap instead.  The "best" choice here is generally 
				related to efficiency.</p>
			<p><strong>There is no useless code. - </strong>Don't write sloppy code, and don't 
				reinvent the wheel.  Both C# and Java library code can copy arrays, and 
				convert collections to arrays automatically.  Don't rewrite library 
				code.  Don't make assignments to variables you never reference.  
				Don't leave testing or temporary functions and code in the component.</p>
			<p><strong>There is no code redundancy. - </strong>Factor code out into helper 
				functions or classes wherever possible.  Use intelligent overloading to 
				reduce code duplication.  Still, don't go too far to this extreme.  
				Balance your code to minimize duplication as much as possible without ending up 
				with 50 one line functions.</p>
			<p><strong>The code is clear and efficient. - </strong>This is somewhat subjective, 
				but there are objective references.  You probably shouldn't go more than 
				one level with the ternary if operator (e.g. good ? "great!" : ok ? "I suppose" 
				: bad ? or_is_it ? "darn" : "phew" : "who knows?").  This is not 
				clear.  Similarly, large blocks of code... if you're getting more than 50 
				lines in a single function, you can probably break it up into multiple 
				functions.  For example, if you're drawing a graph, you can have a 
				drawAxes() function, a drawData() function, and a drawLegend() fuction, rather 
				than a very large block of code.  As for efficiency, small things can make 
				a big difference.  Break out of a search when you've arrived at the 
				desired value.  Set intelligent sentinel conditions, use short circuit 
				evaluation.  Don't overcomplicate your code, and try to simplify whereever 
				possible.</p>
			<p><strong>The thrown exceptions provide suitable error messages and cause (where 
					appropriate). </strong>- Like documentation, exceptions should be concise, 
				detailed, and professional.  "IT SCREWED UP AGAIN" is not an appropriate 
				exception message, no matter how appropriate it may feel at the time.</p>
			<p><strong>All code, including test cases, follows the TopCoder coding 
					conventions. - </strong>Our coding conventions are the published 
				standards for Java and C#. You can view them at the following links:<br>
				<br>
				<A href="http://java.sun.com/docs/codeconv/html/CodeConvTOC.doc.html">Java Coding Conventions</A><br/>
				<A href="http://msdn.microsoft.com/library/default.asp?url=/library/en-us/vsent7/html/vxconcodingtechniques.asp">.NET Coding Conventions</A><br/><br/>
			</p>
			<p><strong>The implementation code contains detailed documentation for classes, 
					methods, and variables, written in Javadoc / XML style as required by the Java 
					/ C# coding standards.</strong> - See the documentation section for 
				more information.  The documentation should be detailed, comprehensive, 
				and professional.  You will also be judged on grammar and spelling. 
			</p>
			<p><strong>There are no errors and no warnings while generating the Javadoc / XML 
					documentation. - </strong>The documentation must be syntactically correct: 
				no documentation for elements that no longer exist, no inappropriately anchored 
				or malformed documentation elements.</p>
			<p><strong>Unit Test Cases thoroughly and correctly test all methods and 
					constructors. - </strong>Unit tests are very important, and you must 
				thoroughly test your component.  See the Unit Test section above.</p>
			<p><strong>Unit Test cases contain an implementation or a demonstration of how the 
					component will be used. </strong>- You should test the component as it 
				will be used.  The component specification will usually contain an example 
				case of use, and you should implement a test for proper behavior.</p>
			<p><strong>Where applicable, Unit Test Cases properly configure the test environment. </strong>
				- Make sure to take advantage of configuration files and setUp() and tearDown() 
				to receive a good score here.</p>
			<p><strong>Where applicable, files used in Unit Test Cases exist in the /test_files 
					directory.</strong> - If your component requires files to perform tests, 
				they should reside here.  If they don't, you'll lose points.</p>
			<p><strong>Where applicable, Unit Test cases do not leave temporary files on the file 
					system, open network or database connections, open files or streams after 
					testing is complete.</strong> - Tests may be run very frequently by TCS or 
				our clients.  It is imperative that the tests leave the system in the same 
				state they find it, and leave no debris.</p>
			<p><strong>The unit test code contains detailed documentation for classes, methods and 
					variables.</strong> - Your unit test code must be documented exactly 
				as your component code.</p>
			<p>Additionally, each of the three development reviewers will write unit tests that 
				will probe your component for accuracy, proper failure, and performance under 
				stress. Your component will be awarded a score based on each of the above 
				points, and those tests.</p>

			<A name="sectionX"></A>
			<h2>X. Appeals</h2>
			<p>After review is complete, you will have a few days to view and appeal the score 
				your component was given.  You'll see the comments from the Board on each 
				point above, and you can dispute any score.  Please keep in mind that you 
				must have a very good reason to appeal, or it will be denied.  If the 
				reviewer makes a statement that is in conflict with the design, or if the 
				review has made an oversight, feel free to appeal.  On the other hand, 
				matters of opinion may not be appealed.  If you are the winning developer, 
				you will have the opportunity to discuss reviewers' judgments in Final 
				Fixes...</p>

			<A name="sectionXI"></A>
			<h2>XI. Final Fixes</h2>
			<p>Congratulations!  You're the winning developer!</p>
			<p>However, there is probably still work to be done.  Your review scorecard 
				will be available via Project Submit &amp; Review, and there you will find any 
				and all problems the Review Board found with your submission.  It will 
				contain required and recommended fixes to the submission as received.</p>
			<p><strong>Every single required fix must be addressed.  Your component WILL NOT be 
					completed until they are.  </strong>Every recommended fix should be 
				attempted. Obviously, they follow the required fixes in priority, but if there 
				is time, they should be completed.</p>
			
			<span class=bodySubtitle>Communication</span>
			<p>More than any stage of the component, communication during final fixes is key.</p>
			<p>If, for any reason, you have a question or comment on the review, post it as 
				soon as possible. If there is any blocking issue, email the PM immediately, and 
				post to the forum. The PM will look into the issue, and ensure that the primary 
				reviewer is on top of things. If, for whatever reason, you feel a required fix 
				is impossible, you need to address it on the forums. Do NOT just resubmit 
				without the fix done, or a comment in a readme. This is never acceptable. 
				Communicate with the reviewers to avoid these conflicts!  The more detail 
				you can give, and the sooner you give it, the more smoothly this stage will 
				go.  The Review Board is always open to communication from the developer; 
				they may have overlooked something in the design or in your submission.  
				Don't be afraid to question the Review Board.  Questions and comments show 
				that you're paying attention and actively involved; without communication, the 
				Review Board doesn't know that you're working on the fixes, and can't clarify 
				their requirements.</p>
			
			<A name="sectionXII"></A>
			<h2>XII. Final Submission and Review</h2>
			<p>This is just another dev_submission build.  Follow the same guidelines 
				above for ensuring all your files are uploaded properly.  Try to be as 
				complete as possible before resubmitting. This saves everyone time, including 
				you.</p>
			<p>If you've met all the requirements, and all the review tests still pass, the 
				component is complete, and goes into preparation to be added to the 
				catalog.  Your work is complete!</p>
			<p>If anything is not done, you've earned a return trip to Final Fixes.</p>
			
			<A name="sectionXIII"></A>
			<h2>XIII. Conclusion</h2>
			<p>That concludes this development tutorial.  You've registered, developed, 
				tested, submitted, been reviewed, appealed, won, fixed, and finally submitted 
				once again.  You've earned your payment, and will receive royalties from 
				your work going forward.  Again, congratulations.  What better way to 
				celebrate than finding another project to register for and doing it all over 
				again?
			</p>
			
            <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

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
