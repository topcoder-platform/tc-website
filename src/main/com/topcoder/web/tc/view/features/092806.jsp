<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
<style type="text/css">
.codeBox
{
   width: 600;
   padding: 10px;
   margin: 20px;
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
   border: 1px solid #999;
}
</style>
</head>

<body>

<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180" id="onLeft">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="features"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

<div style="float: right; text-align:right;">
<tc-webtag:forumLink forumID="506127" message="Discuss this article" /><br>
<div id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A></div>
<div id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A></div>
</div>
<span class="bigTitle">Writing code that writes code:<br>Using TopCoder components to develop TopCoder components</span>

      <p>
      <img src="/i/m/Seiz3r_mug.gif" alt="" border="0" align="left" class="myStatsPhoto"/>
      By&#160;<tc-webtag:handle coderId="10584406" /><br>
      <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
      </p>

<div style="float:left; padding-right:5px;"><A href="/i/education/xmi2cs.zip"><img src="/i/interface/emblem/disk.gif" alt="Download" /></A></div>
<strong><A href="/i/education/xmi2cs.zip">Download</A> the application (ZIP 1.5mb)</strong>
<br><br>
Writing code that writes code can be a powerful technique for developers.  In an effort to be more productive, developers want to be able to accomplish tasks with fewer keystrokes, bugs, and headaches.  While writing a code generator can take longer than simply writing the code, the time you can save in the future will more than make up for the initial effort.  
<br><br>
How does this apply to TopCoder?  TopCoder component competitions consist of three main phases: specification, architecture and design, and development and testing (more information is available <A href="http://software.topcoder.com/components/methodology.jsp">here</A>).  For development competitions, the primary goal is for developers to provide an accurate implementation of the design.  This design, generated using Poseidon to build UML class diagrams for the component, is stored in an XMI file.  Because XMI is a standardized format, developers can leverage this to get a faster, more stable start on development.  
<br><br>
For algorithm competitors looking to try their hand at component competition - and take a shot at some of the Digital Run prize money - using this XMI file will give you a head start and allow you to skip the tedious work of making a code skeleton that can be compiled.  For current development competitors using J2EE or .NET, this approach will help you reduce the amount of time spent coding without sacrificing any quality.
<br><br>
<span class="bodySubtitle">The Code from Poseidon</span><br>
You may ask: Poseidon generates a code skeleton.  Why bother generating a new one?
<br><br>
For developers working on .NET componenets, the code from Posiedon does have some limitations, including:
<ul>
<li>Missing "using" statements.</li>
<li>Namespaces are nested instead of appearing on a single line.</li>
<li>2 space indentation instead of 4 space.</li>
<li>.NET convention typically places the opening "{" on a new line.</li>
<li>Documentation does not wrap to 120 characters (which is a line length limit for TopCoder development).</li>
<li>Method bodies will contain "return string;" rather than the preferred "throw new NotImplementedException();"</li>
<li>Documentation contains exception tags without the cref attribute indicating which type of exception the documentation is referencing.</li>
<li>Delegates, enums, and access modifiers such as "const" and "readonly" are often misrepresented.</li>
</ul>

Although developers do not have to fix all these points before being able to compile, they have to fix all of these before submitting the component.  If using test-driven development (writing tests before implementing methods), developers must compile a skeleton of the component to compile test code.  Needless to say, the Poseidon generated code hurts almost as much as it helps.
<br><br>
<span class="bodySubtitle">Components to the Rescue</span><br>
Using the XMI Parser, Document Generator, and Unit Test Generator components, competitors can get started much more easily.  Although this article uses .NET samples, all three of these components are available for Java as well.  The XMI Parser can be used to analyze the XMI file and collect data from the component design.  The Document Generator can be used to easily take the data gathered from the XMI file and produce source code files, which can be customized to each developer's preferences and style.  After compiling the source code, the Unit Test Generator can be used as a basis for generating skeleton test code, so the developer can dive right in to development instead of spending time starting off with method declarations and documentation.
<br><br>
<span class="bodySubtitle">More about XMI</span><br>
The Poseidon component design resides inside a ZUML file in the docs directory of a development distribution.  A ZUML file is simply a ZIP archive of the Poseidon project files.  The component design is stored in the XMI file in the archive.  XMI, which is an acronym for XML Metadata Interchange, is a standard from the Object Management Group which facilitates capturing information from UML models.  Recent TopCoder components use version 1.2 of the specification, available from <A href="http://www.omg.org/cgi-bin/doc?formal/02-01-01">http://www.omg.org/cgi-bin/doc?formal/02-01-01</A>.
<br><br>
<span class="bodySubtitle">The XMI Parser API</span><br>
Due to a strong design and simple API, the XMI Parser is easy to use.  The class that performs the parsing is TopCoder.Uml.Xmi.XmiParser.  This parser class interacts with classes that implement the IXmiHandler interface.  For the parser to send nodes to the handler - which are responsible for capturing information from the parser -- the handler must be registered with the parser.  The AddHandler method provides this functionality, requiring the instance of the handler and an array of strings indicating the XML nodes the handler will use.  The parse method will then recursively walk through the document tree, passing a System.Xml.XmlNode to the ProcessNode method of registered handlers each time a specified node is encountered.  In addition, handlers must implement EndProcessing, which the parser uses to notify the handler that parsing is complete.
<br><br>
The API provides the capability for more than one handler to be registered to a node type.  The component is distributed with one implementation of IXmiHandler, TopCoder.Uml.Xmi.Parser.Handlers.BasicDiagramInfoHandler.  Capturing basic information on the diagrams in the design, the BasicDiagramInfoHandler is a great place to start for looking at how to use a handler.  However, it does not capture extensive information associated with the diagrams and will not help generate better skeleton code.
<br><br>
<span class="bodySubtitle">Elegantly Capturing the Design</span><br>
Some key nodes in the XMI:
<ul>
<li>UML:Class
    <ul><li>A .NET class, either in the System or TopCoder namespace.</li></ul></li>
<li>UML:Interface
    <ul><li>An interface.</li></ul></li>
<li>UML:Package
    <ul><li>Specified the namespace for all class nodes contained in its descendent nodes.</li></ul></li>
<li>UML:Operation
    <ul><li>Methods in a class.</li></ul></li>
<li>UML:Parameter
    <ul><li>A method parameter.</li></ul></li>
<li>UML:Dependency
    <ul><li>Shows relationships and dependencies between classes.</li></ul></li>
<li>UML:Attribute
    <ul><li>Class attributes.</li></ul></li>
</ul>

<span class="bodySubtitle">Taking a look at the UML:Package Nodes</span><br>
Here is an example of a quick way to look at the UML:Package nodes in the XMI file.  The node has a name attribute, which will provide the namespace.  This example is executed for the XMI file for the XSD2DDL component.
<br><br>
<pre class="codeBox">
public class PackageAnalyzer : IXmiHandler
{
    public const string NodeTypes = "UML:Package";
    public string ProcessNode(XmlNode node)
    {
        XmlAttribute nameAttribute = node.Attributes["name"];
        if (nameAttribute != null)
            Console.WriteLine("UML:Package - " + nameAttribute.Value);
        return node.ToString();
    }
    public void EndProcessing() {}
}

class Program
{
    static void Main(string[] args)
    {
        PackageAnalyzer packageAnalyzer = new PackageAnalyzer();
        XmiParser parser = new XmiParser();
        parser.AddHandler("MyPackageAnalyzer", packageAnalyzer, 
PackageAnalyzer.NodeTypes);
        parser.ParseFrom(@"c:\XSD2DDL9.xmi");
        Console.ReadLine();
    }
}
</pre>

<b>Output:</b>
<pre class="codeBox">
UML:Package - System
UML:Package - Collections
UML:Package - Data
UML:Package - TopCoder
UML:Package - TopCoder.DB.Generation.Xsd2Ddl
UML:Package - TopCoder.Util.ConfigurationManager
UML:Package - TopCoder.Util.CommandLine
UML:Package - TopCoder.Unix.MagicNumbers
UML:Package - TopCoder.Util.ObjectFactory
UML:Package - TopCoder.DB.Generation.Xsd2Ddl.Generators
UML:Package - TopCoder.DB.Generation.Xsd2Ddl.Sources
UML:Package - TopCoder.DB.Generation.Xsd2Ddl.Standards
UML:Package - TopCoder.DB.Generation.Xsd2Ddl.ExtendedProperties
UML:Package - TopCoder.Util.DataValidator
</pre>

Excluding UML:Package nodes for which no name is specified, this example shows how a simple handler can look at the namespaces inside an XMI file.  While the TopCoder namespaces come out fully qualified, the System namespaces are nested elements, hence the output of just "Collections" and "Data."
<br><br>
<span class="bodySubtitle">Generating the Source Files</span><br>
The task of rendering the captured data as source files is facilitated by TopCoder's DocumentGenerator component.  The document generator is a simple yet powerful component that generates files based on text templates - in addition to generating C# source files, DocumentGenerator can also be used to personalize e-mails and format reports.  Although an application could be designed to output directly into the format and layout required, using the document generator helps separate the data layer from the presentation view, which is a good practice.
<br><br>
While the document generator can use templates stored in compiled assembly files or databases, the quickest way to use the component is to place the template in a text file.  The template is applied based on an instance implementing ITemplate.  The component provides functionality for reading template data into an ITemplate instance through the ParseTemplate method of the DocumentGenerator class.  For example:
<pre class="codeBox">
static void Main(string[] args)
{
    string template_file = "template.txt";
    string template_data_file = "template-data.xml";
    string template_content = "";
    string output_file = "generator-output.cs";
    using (StreamReader reader = new StreamReader(template_file))
        template_content = reader.ReadToEnd();
    DocumentGenerator documentGenerator = DocumentGenerator.GetInstance();
    ITemplate template = documentGenerator.ParseTemplate(template_content);
    documentGenerator.ApplyTemplate(template, new 
StreamReader(template_data_file), new StreamWriter(output_file));
}
</pre>

Here's the template:

<pre class="codeBox">
# This is a simple .cs file template.
%loop:DEPENDENCY%using %NAMESPACE%;
%endloop%
%ACCESS_MODIFIER% %ABSTRACT%class %CLASS_NAME%
\{
    %loop:METHOD%%ACCESS_MODIFIER% %RETURN_TYPE% 
%METHOD_NAME%(%loop:ARGUMENT%%KIND%%TYPE% %NAME%%COMMA%%endloop%)
    \{
        throw new NotImplementedException();
    \}
    %endloop%
\}
</pre>

The readability of the template file could be better; however, this template provides the best formatting for the generated C# source file.  The text between percent signs corresponds to the nodes in the XML document.  If a node occurs more than once in the document, it can be output using the %loop:NODE_NAME% indicator.  This is useful for class dependencies and methods.  Inside the loop, the referenced nodes are child nodes of the loop node (this will be clearer after looking at the data for the template).  To keep the template as close as possible to standard C# source file formatting, some of the spacing is placed in the data file, such as a space after "abstract" in "public abstract class."  Otherwise, non-abstract classes would have two spaces, formatted as "public  class."
<br><br>
The data for the template:

<pre class="codeBox">
&lt;?xml version="1.0" ?>
&lt;DATA>
    &lt;DEPENDENCY&gt;&lt;NAMESPACE&gt;System&lt;/NAMESPACE&gt;&lt;/DEPENDENCY&gt;
    &lt;DEPENDENCY&gt;&lt;NAMESPACE&gt;System.Collections&lt;/NAMESPACE&gt;&lt;/DEPENDENCY&gt;
    &lt;DEPENDENCY&gt;&lt;NAMESPACE&gt;TopCoder.Uml.Xmi.Parser&lt;/NAMESPACE&gt;&lt;/DEPENDENCY&gt;
    &lt;ACCESS_MODIFIER&gt;public&lt;/ACCESS_MODIFIER&gt;
    &lt;ABSTRACT /&gt;
    &lt;CLASS_NAME&gt;SampleClass&lt;/CLASS_NAME&gt;
    &lt;METHOD&gt;
        &lt;ACCESS_MODIFIER&gt;public&lt;/ACCESS_MODIFIER&gt;
        &lt;RETURN_TYPE&gt;void&lt;/RETURN_TYPE&gt;
        &lt;METHOD_NAME&gt;sampleMethod&lt;/METHOD_NAME&gt;
        &lt;ARGUMENT&gt;
            &lt;HOW /&gt;
            &lt;TYPE&gt;string&lt;/TYPE&gt;
            &lt;NAME&gt;firstArgument&lt;/NAME&gt;
            &lt;COMMA&gt;, &lt;/COMMA&gt;
        &lt;/ARGUMENT&gt;
        &lt;ARGUMENT&gt;
            &lt;KIND /&gt;
            &lt;TYPE&gt;string[]&lt;/TYPE&gt;
            &lt;NAME&gt;stringArray&lt;/NAME&gt;
            &lt;COMMA /&gt;
        &lt;/ARGUMENT&gt;
    &lt;/METHOD&gt;
&lt;/DATA&gt;
</pre>

The output:

<pre class="codeBox">
using System;
using System.Collections;
using TopCoder.Uml.Xmi.Parser;

public class SampleClass
{
    public void sampleMethod(string firstArgument, string[] stringArray)
    {
        throw new NotImplementedException();
    }
    
}
</pre>

<span class="bodySubtitle">Using the Unit Test Generator</span><br>
After generating the source code, the next step is to make any slight modifications necessary to compile it.  After compiling the code, the developer can use the Unit Test Generator component on the assembly.  Usage of this component is extremely simple:
<br><br>
<pre class="codeBox">
string assemblyFile = @"c:\TopCoder.Uml.Xmi.Parser.dll";
string @namespace = "TopCoder.Uml.Xmi.Parser";
string outputDirectory = @"c:\temp";
UnitTestGenerator.GenerateCode(assemblyFile, @namespace, outputDirectory);
</pre>

<br><br>
This method call depends on the DefaultTemplate.txt being present in the conf directory.  The default template is great for getting started generating test code, and can be modified to suit each developer's style.
<br><br>
The beginning of a generated code file:

<pre class="codeBox">
// Copyright (c)2003, TopCoder, Inc. All rights reserved
// @author TCSDEVELOPER

using System;
using NUnit.Framework;

namespace TopCoder.Uml.Xmi.Parser
{
    /// <summary>
    /// Unit tests for the XmiParser class.
    /// </summary>
    [TestFixture]
    public class XmiParserTests
    {
        // ADD YOUR ATTRIBUTES HERE
        
        /// <summary>
        /// Set up.
        /// </summary>
        [SetUp]
        public void SetUp()
        {
            // ADD YOUR SETUP CODE HERE
        }

        /// <summary>
        /// Tear down.
        /// </summary>
        [TearDown]
        public void TearDown()
        {
            // ADD YOUR TEAR DOWN CODE HERE
        }

        /// <summary>
        /// Tests the constructor.
        /// XmiParser()
        /// </summary>
        [Test]
        public void TestConstructor1()
        {
            // ADD YOUR TEST CODE HERE
        }
</pre>

In conclusion, by using the XmiParser, DocumentGenerator, and UnitTestGenerator components, a development competitor can get a faster and better start on component development. 
        <br><br>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
