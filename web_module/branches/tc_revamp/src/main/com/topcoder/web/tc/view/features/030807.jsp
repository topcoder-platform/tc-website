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

<div class="linkBox">
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <tc-webtag:forumLink forumID="514662" message="Discuss this article" />
</div>

<span class="bigTitle">Test Drive: OpenLaszlo</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/mindboggler_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="16067996" context="algorithm" /><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<p>In Tim Berners Lee's proposal for a hypertext project, he conceived of the Web as a medium for sharing documents. All the concepts revolved around retrieving documents from and posting documents to the server. Berners Lee saw the need for this venture due to the large number of documents at CERN and the lack of an established way to navigate through them: &ldquo;HyperText provides a single user-interface to many large classes of stored information such as reports, notes, data-bases, computer documentation and on-line systems help,&rdquo; he wrote.</p>

<p>With hypertext the World Wide Web was born, but the technology that the hypertext revolution brought into existence was far too powerful to be limited to just storing and retrieving documents. Technologists and geeks around the world began to break the limitations and came up with far more interesting things to do with the Web. What began as &ldquo;Remote Scripting&rdquo; (coined by Microsoft in 1998) and Rich Internet Application (coined by Macromedia in 2002) became all the rage with AJAX.</p>

<p>The World Wide Web had evolved from a medium for sharing documents into a medium for distributing networked applications, or Web 2.0 (coined by, well, everybody). Through all this, it became clear that there was a need for better tools to develop more interactive applications. Before too long, there were a flurry of new AJAX toolkits around, including GWT, Dojo, ATLAS, echo and so forth. <a href="http://www.openlaszlo.org/" target="_blank">OpenLaszlo</a> is a recent, open-source addition to this group. </p>

<p>I stumbled upon OpenLaszlo through my work on a project called Cached Web Application. The vision of this project is to gradually step towards the &quot;Global Internet Brain&quot; described in the paper &ldquo;<a href="<tc-webtag:linkTracking link="http://www.santafe.edu/~gmk/Pubs/InfoSoc/"/>" target="_blank" refer="feature 030807"/>The Global Brain As An Emergent Structure From The Worldwide Computing Network, And Its Implications For Modeling</a>,&quot; by G. Mayer-Kress and C. Barczys. This paper proposes an Internet in which all the information stored on the various servers is acted upon by user agents in ways beyond the creator&rsquo;s imagination. </p>

<p>Our study so far has suggested that a mixed model, incorporating the hyper-linked nature of the web and the data-driven nature of traditional networked applications, works well. To achieve this we've studied a number of Rich Internet Application formats, OpenLaszlo among them. In this article, I'll present my findings and compare OpenLaszlo to some of its peers.</p>

<p><span class="bodySubtitle">OpenLaszlo Architecture</span><br />
OpenLaszlo is an end-to-end system for creating Rich Internet Application. The Laszlo Presentation Server (LPS) operates as a servlet running in the server, which compiles source code into swf files upon client request and outputs a representation. Apart from compilation, LPS also manages persistent state and data transfer to and from the client. LPS comes into play only if you deploy your application as proxied. </p>

<p>You can also choose to deploy the application in the SOLO option, in which the source code files are pre-compiled to swf files. The swf files can then be deployed normally like any other swf files. Although the documentation recommends the SOLO mode of deployment, due to performance reasons and ease of deployment, a proxied application gives you more power to work with. Since only the first request would require compilation and subsequent requests can be met from a cache, I believe the performance cost due to compilation shouldn&rsquo;t be too much of an issue. </p>

<p>Regardless of how you deploy the application, the client will always be an swf file. Note, though, that the application does not use any of the Flash services or objects. Instead all the functionality &ndash; and there is a wide range, including timers, data-binding, animation etc. -- is provided by Laszlo Foundation Classes (LFC). These classes are actually present and included in every swf file. Accordingly, one of the drawbacks is that the application can become bulky. A simple &ldquo;Hello World&rdquo; application is 72K, for example. Hopefully OpenLaszlo will not expand on these classes or, if they do, hopefully they will limit the number of required classes to as few as possible.</p>

<p>Basic installation of OpenLaszlo was neat and one-click. There was no post-installation configuration needed to get it up and running.</p>

<p><span class="bodySubtitle">LZX Programming Language</span><br />
OpenLaszlo uses the LZX Programming Language, which is a mixture of XML and Javascript. All code should look like this:</p>

<pre> &lt;canvas&gt; 
    &lt;dataset/&gt; 
    &lt;script/&gt; 
    &lt;resource/&gt; 
    &lt;class/&gt; 
    &lt;components&gt; 
       &lt;handler name=&quot;eventname&quot; method=&quot;methodname&quot;&gt; 
          !&lt;[CDATA[ 
             Your Javascript here. 
          ]]&gt; 
       &lt;/handler&gt; 
    &lt;/component&gt; 
    &lt;view&gt; 
       &lt;layout/&gt; 
    &lt;/view&gt; 
 &lt;/canvas&gt; </pre>

<p>Script, class, resource, component and view are all optional (though there wouldn&rsquo;t be an application without them). The <strong>script</strong> tag is meant for adding arbitrary codes and functions. <strong>Class</strong>, as the name suggests, creates classes (and yes, OpenLaszlo is object oriented). <strong>View</strong> represents the visual element of LZX. All the visual elements are present in the View and View is the super class of all the classes. </p>

<p><strong>Components</strong> are comparable to user controls in Visual Basic, and include buttons, windows, texts, edit boxes, and a lot more. Components add all the functionality to your applications, and are themselves classes. Although all the components could be put straight onto the canvas, there is little incentive to do so since maintaining the layout would become difficult.</p>

<p><strong>Layout</strong> is not a tag as such, but I included it to represent all the classes of layout like simplelayout, hbox and vbox, stableborderlayout and constantborderlayout. Although combinations of view and layout offer complete control over the layout, you may find this approach frustrating due to complicated multiple nestings. This is where the IDE's help: A WYSIWYG IDE can arrange all the elements on the canvas. </p>

<p>All views receive <strong>events</strong>, and are handled using the <strong>handler</strong> tag. The handler tag encloses the javascript for handling the event. There can be more than one handler for a single event, but in those cases all the handlers will be evoked. Make sure your handler javasript is marked by CDATA. This will ensure the parser won't try to parse this and mistake a usage of &quot;&lt;&quot; within the script as the beginning of a tag. </p>

<p>The <strong>name</strong> attribute identifies which event the handler is handling. Alternatively the method attribute can contain the name of the method that will be fired to handle the event. This mode of handler can be used when multiple events are being handled the same way. </p>

<p><strong>Dataset</strong> is a feature that adds data support to the application. It is equivalent to XmlHttpRequest but is conceptually different and neater in several ways. </p>

<p>One nice addition to the language is <strong>Constraints</strong>. Often, codes are included just to say things like &quot;resize the width because the container's width changed.&quot; Constraints are expressions that are continuously evaluated and whose value is stored in an attribute. For example:</p>

<pre>&lt;view width=&quot;$(parent.width - 10}&quot;&gt; </pre>

<p>will make the width of the view always 10 less than the parent's width. </p>

<p><span class="bodySubtitle">Object-Orientation</span><br />
As noted above, OpenLaszlo has object-orientation. Classes are created using the &lt;class&gt; tag. Classes can have attributes and methods declared. While all classes inherit from View, the inherited methods can be overridden. Also, as is characteristic to Javascript, the methods of the objects created can be individually overridden, and objects can also have additional methods. In other words, this model operates as classes that guarantee the presence of methods and attributes without limiting the objects to those methods and attributes. A class will look like the following:</p>

<pre> &lt;class name=&quot;ClassName&quot; extends=&quot;SuperClass&quot;&gt; 
    &lt;attribute name=&quot;Name&quot; type=&quot;Data Type&quot;/&gt; 
    &lt;method name=&quot;methodname&quot; arg=&quot;argument list&quot;&gt; 
       !&lt;[CDATA[ 
          Your Javascript here. 
       ]]&gt; 
    &lt;/method&gt; 
    &lt;handler/&gt; 
    &lt;event/&gt; 
    &lt;state/&gt; 
 &lt;/class&gt; </pre>

<p>The <strong>attribute</strong> name is used to create instances of the class. If no superclass is specified then View class is the default super class. The attribute and the method tags are self-explanatory. Handlers are as described before, though it's worth noting that new custom events can be created. </p>

<p>This is how instances are created:</p>

<pre>&lt;ClassName name=&quot;instancename&quot;/&gt; </pre>

<p>You can also create the instances using script. Each instance can have a <strong>name</strong> or an <strong>id</strong>. The difference between the two is that name has to be qualified with its parent name while id must be unique. These two forms of names give you the best of both worlds &ndash; using a unique id eliminates the risk of a name conflict, while using consistent names makes it easier to use frequently referred-to components.</p>

<p>There is one more feature that is a great addition to the language overall, called <strong>state</strong>. Every application can be imagined to be in some state. If you want some piece of code to be executed only when those states are applied, you use this feature. The documentation on OpenLaszlo includes a neat example on drag and drop that uses state.</p>

<p><span class="bodySubtitle">Data Set and XPath</span><br />
Data Set is OpenLaszlo's most innovative and powerful feature. A DataSet is an entity in your application that represents an xml file. What it refers to and how it is included is hidden in the abstraction. Essentially, it implement an asynchronous http request, but itsfunctionality exceeds that. DataSet can bind to information in three ways: embedded, included and HTTP data. In embedded mode the XML data is hardcoded into the source and referred to later on. In included mode, the XML data is a static file, which is requested when the application is loaded. The HTTP data mode, however, is the most flexible and useful of the three &ndash; here's how you declare it:</p>

<pre>&lt;dataset name=&quot;mydataset&quot; type=&quot;http&quot; src=&quot;URL&quot; request=&quot;true/false&quot;/&gt; </pre>

<p>The URL can be anything: a server side script, CGI, a static XML file etc. If the request attribute is true, the data is fetchedas soon as the application loads. To send a request manually, the mydataset.doRequest() method is invoked. Further, mydataset.setQueryString() can be used to set the query string. There are also a number of other interesting methods for powerful feature access. </p>

<p>There are three events raised by DataSet: ondata, ontimeout and onerror. <strong>ondata</strong> is raised when the request is complete. It is equivalent to HTTP Status 4. <strong>ontimeout</strong> occurs when the request takes more than 30 seconds to complete. You cannot change the ontimeout expiry time to anything else but there is a documented hack on how to make it expire is less than 30 seconds. The <strong>onerror</strong> event is raised when the server returns any error.</p>

<p>Once you have the dataset, XPath can be used for data access. This will make more sense with an example -- suppose you had an XML file like this:</p>

<pre> &lt;topcoders&gt; 
 &lt;coder&gt; 
    &lt;handle&gt; Petr &lt;/handle&gt; 
    &lt;rating&gt; 3500 &lt;/rating&gt; 
 &lt;/coder&gt; 
 &lt;coder&gt; 
    &lt;handle&gt; tomek &lt;/handle&gt; 
    &lt;rating&gt; 3400 &lt;/rating&gt; 
 &lt;/coder&gt; 
 &lt;/topcoders&gt; </pre>

<p>Now topcoders:/coder[1] refers to the coder 1 XML, which is Petr and his rating, and topcoders:/coder[1]/handle refers to his handle alone. </p>

<p>This is called a <strong>datapath,</strong> and it is used to fill up the values of various components. For example: </p>

<pre> &lt;dataset name=&quot;favcoders&quot; src=&quot;topcoders.xml&quot;/&gt; 
 &lt;view datapath = &quot;favcoders:/coders[1]&quot;&gt; 
    &lt;text datapath = &quot;handle/text()&quot;&gt; 
    &lt;text datapath = &quot;rating/text()&quot;&gt; 
 &lt;/view&gt; </pre>

<p>The output of this is </p>

<pre>Petr 3500</pre>

<p>Neat, isn't it? You could make a method call favcoders.doRequest(), and the values of the text would be automatically updated. This could allow you to do a number of complex things, and the documentation of OpenLaszlo includes a lot of detailed information on databinding. If you've worked with Visual Basic, you can probably relate dataset to datasource and datapath to the datafield attribute of the controls. The difference here is that dataset acts on XML, whereas the controls in VB act on a database.</p>

<p>You should be very careful using datasets, especially since OpenLaszlo's debugging mode doesn't always catch errors related to datapaths. Generally I would advise people to create an embedded dataset first, test your application to the maximum with it and then change the dataset mode to HTTP.</p>

<p>Although the documentation says dataset can be procured from a remote source, the example it cites doesn't actually work. At the same time Flash disallows cross-site request for security reasons (unless the domain you are requesting to has crossdomain.xml, which allows it). My conclusion is that this is an error in the documentation. That said, you can work around this problem with server-side caching of remote data. </p>

<p><span class="bodySubtitle">Testing and Debugging</span><br />
OpenLaszlo has some built-in debugging support. To enable debugger in your application, set the <strong>debug</strong> attribute of the canvas tag to true. </p>

<pre> &lt;canvas debug='true'/&gt; </pre>

<p>This will bring up a debugger window that displays a log of runtime errors, like referring to non-existent methods and attributes. </p>

<p>One interesting thing to note is that there is no division by zero error. Instead the expression evaluates to infinity. The number of runtime errors is few and needs some improvement, especially with datapath. Despite all this, the inherent features like method trace, backtrace, and stack dump provide enough tools for relatively efficient debugging. In addition, there is an additional debugging feature which traces all unused objects to detect memory leaks. </p>

<p>OpenLaszlo has a testing feature with the spirit and feel of JUnit. The Testing objects are included with the following line: </p>

<pre> &lt;include href=&quot;lzunit&quot;/&gt; </pre>

<p>A TestSuite is a collection of TestCases, which are collections of textXXX functions. </p>

<pre> &lt;TestSuite&gt; 
    &lt;TestCase&gt; 
       &lt;method name=&quot;testXXX&quot;&gt; 
       &lt;/method&gt; 
       &lt;method name=&quot;testXXX&quot;&gt; 
       &lt;/method&gt; 
    &lt;/TestCase&gt; 
 &lt;/TestSuite&gt; </pre>

<p>Tests are run in the order they are written, but a longer test can sometimes finish later than a smaller test. Hence the test starts are synchronous but tests may end asynchronously. A global flag can be set to make the entire process asynchronous. As you might expect, there are also setUp and TearDown methods that get executed before and after every tests. </p>

<p><span class="bodySubtitle">Comparison</span><br />
So, how does OpenLaszlo stand up to the competition? The following table compares it some similar Rich Internet Applications: GWT, Dojo, Atlas and Yahoo UI library.</p>

<table cellspacing="0" cellpadding="0" class="stat" style="width: 100%">
	<thead>
		<tr nowrap="nowrap">
    <td class="headerC"></td>
    <td class="headerC">OpenLaszlo</td>
    <td class="headerC">GWT</td>
    <td class="headerC">Dojo</td>
    <td class="headerC">Atlas</td>
    <td class="headerC">Yahoo UI Library</td>
  </tr>
   </thead>
   <tbody>
  <tr class="light">
    <td class="value"><strong>Overview</strong></td>
    <td class="value">OpenSource, community developed and maintained by OpenLaszlo Foundation. AJAX and Rich Internet Application development toolkit.</td>
    <td class="value">Created by Google. Now open source and hosted at code.google.com</td>
    <td class="value">Started by Alex Russell, currently maintained by Dojo Foundation. Licensed under both BSD and Academic Free License</td>
    <td class="value">Created and maintained by Microsoft. Highly integrated with .NET. Designed to run on IE but supports Firefox and Safari to an extent.</td>
    <td class="value">Created and maintained by Yahoo.</td>
  </tr>
  <tr class="dark">
    <td class="value"><strong>Programming Language</strong></td>
    <td class="value">LZX Programming Language</td>
    <td class="value">Java</td>
    <td class="value">Javascript</td>
    <td class="value">XML-script and JavaScript</td>
    <td class="value">Javascript</td>
  </tr>
  <tr class="light">
    <td class="value"><strong>Runtime</strong></td>
    <td class="value">Two deployment modes -- : SOLO and Proxied &ndash; that are distinguished by the presence of the LPS server. Flash is the rendering engine regardless of mode.</td>
    <td class="value">GWT compiler compiles to HTML and Javascript</td>
    <td class="value">HTML</td>
    <td class="value">XML-script which is parsed by underlying Atlas engine</td>
    <td class="value">HTML</td>
  </tr>
  <tr class="dark">
    <td class="value"><strong>Layout</strong></td>
    <td class="value">XML</td>
    <td class="value">Java</td>
    <td class="value">HTML</td>
    <td class="value">HTML</td>
    <td class="value">HTML</td>
  </tr>
  <tr class="light">
    <td class="value"><strong>DataAccess</strong></td>
    <td class="value">Through DataSet abstraction</td>
    <td class="value">Asynchronous request made through a wrapper class</td>
    <td class="value">Asynchronous request made through a wrapper class</td>
    <td class="value">Asynchronous request made through a wrapper class</td>
    <td class="value">Asynchronous request made through a wrapper class</td>
  </tr>
  <tr class="dark">
    <td class="value"><strong>Environment</strong></td>
    <td class="value">Client-side coding through LZX. Server-side is bound through Laszlo Presentation Server, which is responsible for interface compilation, handling data management requests and persistence management. Optionally the server side can be skipped altogether.</td>
    <td class="value">Enables end to end coding in Java.</td>
    <td class="value">Essentially only client-side. There is no binding to any form of server-side technology</td>
    <td class="value">A lot of ASP.NET integration.</td>
    <td class="value">Essentially only client-side. There is no binding of any sort to any server-side technology</td>
  </tr>
  <tr class="light">
    <td class="value"><strong>Testing/Debugging</strong></td>
    <td class="value">Built-in testing and debugging unit.</td>
    <td class="value">Integration with JUnit. During coding, all the compiled code runs in the JVM, hence all the Java Language features are available.</td>
    <td class="value">Has library called Dojo Infrastructure that provides profiling, logging and reflection capabilities.</td>
    <td class="value">Integrated with Visual Studio, so the debugging features of the IDE can be used.</td>
    <td class="value">Has built-in logger.</td>
  </tr>
  <tr class="dark">
    <td class="value"><strong>License</strong></td>
    <td class="value">Open source</td>
    <td class="value">Open source</td>
    <td class="value">BSD and Academic Free License</td>
    <td class="value">MsPl</td>
    <td class="value">BSD License</td>
  </tr>
  <tr class="light">
    <td class="value"><strong>CSS Support</strong></td>
    <td class="value">No</td>
    <td class="value">Yes</td>
    <td class="value">Yes</td>
    <td class="value">Yes</td>
    <td class="value">Yes</td>
  </tr>
  <tr class="dark">
    <td class="value"><strong>DOM Support</strong></td>
    <td class="value">No</td>
    <td class="value">Yes</td>
    <td class="value">Yes</td>
    <td class="value">Yes</td>
    <td class="value">Yes</td>
  </tr>
  <tr class="light">
    <td class="value"><strong>Back Button Support</strong></td>
    <td class="value">No</td>
    <td class="value">Yes</td>
    <td class="value">Yes</td>
    <td class="value">Yes</td>
    <td class="value">Yes</td>
  </tr>
  <tr class="dark">
    <td class="value"><strong>Animation Support</strong></td>
    <td class="value">Yes</td>
    <td class="value">No</td>
    <td class="value">No</td>
    <td class="value">No</td>
    <td class="value">Yes</td>
  </tr>
  </tbody>
</table>

<p>Future enhancements for OpenLaszlo include supporting multiple deployment runtimes (currently in beta, with OpenLaszlo 4) and, through a collaboration with Sun code-named Project &quot;Orbit,&quot; enabling OpenLaszlo applications to run on devices like cell phones and PDAs that are powered by Java ME. </p>

<p><span class="bodySubtitle">Conclusion</span><br />
Using OpenLaszlo entails some trade-offs. For example, as a staunch supporter of the WWW architecture standards, I found it difficult to digest yet another setback to bookmarking. A DHTML version of OpenLaszlo may add bookmarking, but then DHTML itself is not a W3C standard. In addition, some argue that it is inadvisable to build an application entirely on a third-party plugin, though it's worth noting that the Flash Player is almost as widespread as Internet Explorer itself.

<p>However, I believe that OpenLaszlo can be a useful tool for accelerating Rich Internet Application development and that, when used discreetly, the features that it offers justify these trade-offs. With the support of the open source community behind it, OpenLaszlo should continue to evolve and improve. If you're looking for a Rich Internet Application toolkit, and have some flexibility in what you can use, then I'd encourage you to give OpenLaszlo a look.</p>

<p><br></p>
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
