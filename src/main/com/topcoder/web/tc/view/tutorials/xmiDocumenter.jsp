<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Component Tutorials</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<style type="text/css">
.code
{
   width: 570;
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

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="comp_tutorials"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="tutorBodyFull">

<jsp:include page="../page_title.jsp" >
   <jsp:param name="image" value="comp_tut"/>
   <jsp:param name="title" value="&#160;"/>
</jsp:include>

<div style="float: right;"><tc-webtag:forumLink forumID="505953" message="Discuss this article" /></div>
<span class="bodyTitle">Using XMI Documenter</span>

<p>
<img src="/i/m/traugust_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="15664457" context="development"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>


<p>
This <a href="/i/downloads/xmi_documenter_ui.zip">package</a> contains the source code for the demo described below, as well as a build file to compile and run it. 
<br><br>
Click <A href="/i/development/downloads/xmi_documenter_ui.jnlp">here</A> to run the XMI Documenter demo as a Java Web Start application (you will need a Java 1.5 Runtime Environment, or a Java 1.4 Runtime Environemnt with JAXP 1.3 installed as explained in section 4.3 of this document).
<br><br>
<span class="bodySubtitle">1. Introduction</span><br>
This article will show how the <a href="http://software.topcoder.com/catalog/c_component.jsp?comp=20668655">XMI Documenter component</a> can be used to build an XMI documentation editor which can be used as a replacement for the somewhat sub-optimal documentation editing features of Poseidon.
<br><br>
As the functionality and concepts of XMI Documenter component itself are already explained in the <a href="http://software.topcoder.com/catalog/document?id=21224843">XMI Documenter CS</a>, this document will not explain these details again, but will focus on three main topics:
<ul>
<li>How to use the XMI Documenter API to build an editor;</li>
<li>XMI documenter Implementation details;</li>
<li>How to setup and run the XMI Documenter UI;</li>
</ul>
Just to clarify from the start of this article: the article includes a fully functional XMI documentation editor example application that can be used to edit the documentation elements of an XMI model. In case you are not really interested in reviewing all of the details you can jump directly to <a href="#chap4">Chapter 4</a> and configure and run the already existent UI.
<br><br>
<span class="bodySubtitle">2. How to use the XMI Documenter API</span><br>
This chapter will describe the main parts of the XMI Documenter API and show how they work together and are used in the demo provided with this article.
<br><br>
The starting point for all XMI documentation editing is the class <tt>XMIDocumentFactory</tt>. This class provides two factory methods (both named <tt>createDocument</tt>, one takes a <tt>java.io.InputStream</tt>, the other one an <tt>org.w3c.dom.Document</tt>) for parsing an XMI input into an <tt>XMIDocument</tt> instance (see <tt>XMIDocumenterUIDemo#load()</tt>):

<pre class="code">
FileInputStream xmiStream = <b>new</b> FileInputStream(selectedFile); 
 <b>try</b> {
    // load the XMI document 
    currentDocument = factory.createDocument(xmiStream); 
    // update the tree
    treeModel.setRoot(<b>new</b> XMIDocumentNode(currentDocument)); 
    treeModel.reload(); 
    saveButton.setEnabled(<b>true</b>); 
} <b>finally</b> { 
    xmiStream.close(); 
} 
</pre>

An <tt>XMIDocument</tt> represents the structure of the parsed XMI file. The instance itself, and all of its members, does not contain all the information that was in the XMI file &mdash; it doesn't even contain enough information to reconstruct a valid XMI file from an <tt>XMIDocument</tt> instance. Instead the <tt>XMIDocument</tt> and all of its <tt>ModelElement</tt>s are backed by a DOM tree of the parsed XMI file. The read and write of documentation for elements actually occurs by accessing the backing DOM nodes of the corresponding <tt>ModelElement</tt>s.
<br><br>
An <tt>XMIDocument</tt> instance is mainly a holder for all classes and interfaces defined in the XMI document. These classes and interfaces can be retrieved using the <tt>getClasses</tt> method. Subsets of all defined classes of the document can be retrieved using the <tt>getClasesForPackage</tt> or <tt>getClassesWithOperations</tt> methods. For details on the handling of interfaces see <a href="#chap3">Chapter 3</a> of this article.  An example of the retrieval of classes from an <tt>XMIDocument</tt> instance can be seen in <tt>XMIDocumenterUIDemo.XMIDocumentNode#XMIDocumentNode()</tt> &mdash; this method creates child nodes for all packages and classes defined in the <tt>XMIDocument</tt> instance:

<pre class="code">
// get classes defined in document
<b>final</b> ClassElement[] ownedElements = document.getClasses(); 
<b>for</b> (<b>int</b> i = 0; i &lt; ownedElements.length; i++) { 
    <b>final</b> ClassElement classElement = ownedElements[i]; 
    <b>final</b> String packageName = classElement.getPackageName(); 
  // find or create the package node containing the class node
    <b>final</b> PackageNode packageNode = findPackageNode(packageName); 
    // create the class node and add it to the parent package node
    packageNode.addChildNode(<b>new</b> ModelElementTreeNode(classElement, 
	packageNode)); 
} 
</pre>

A <tt>ClassElement</tt> contains <tt>AttributeElement</tt>s for all fields defined in the class and <tt>OperationElement</tt>s for all methods defined in the class. <tt>OperationElement</tt>s consist of <tt>ParameterElement</tt>s, an optional <tt>ReturnValueElement</tt> and <tt>ExceptionElement</tt>s. The whole documentation tree of an XMI document is described by these Elements. The UI editor itself can even abstract the differences between all of these instances and treat all of the instances as <tt>ModelElement</tt> instances. This way all of the instances can be by handled in a generic way &mdash; see <tt>XMIDocumenterUIDemo.ModelElementTreeNode</tt> which abstracts the editing and handling of <tt>ModelElement</tt>s, e.g. in the constructor:

<pre class="code">
ModelElementTreeNode(<b>final</b> ModelElement element, <b>final</b> TreeNode parent) { 
     <b>super</b>(parent); 
     <b>this</b>.element = element; 
     <b>final</b> ModelElement[] ownedElements = element.getOwnedElements(); 
     <b>for</b> (<b>int</b> i = 0; i &lt; ownedElements.length; i++) { 
         <b>final</b> ModelElement ownedElement = ownedElements[i]; 
         getChildren().add(<b>new</b> ModelElementTreeNode(ownedElement,  <b>this</b>)); 
     } 
}
</pre>

All of the modification logic inside <tt>XMIDocumenterUIDemo</tt> also relies on the API declared by <tt>ModelElement</tt>. Basically the methods <tt>getName getDocumentationText</tt> and <tt>setDocumentationText</tt> are used to display and edit all of the elements and their documentation.
<br><br>
Upon selection of a tree node that represents a <tt>ModelElement</tt>, any previously started editing of a <tt>ModelElement</tt> instance is ended by writing the current editor value back to the <tt>ModelElement</tt> instance &mdash; see <tt>XMIDocumenterUIDemo#endElementEditing()</tt>:

<pre class="code">
<b>if</b> (currentlyEditedModelElement != <b>null</b>) { 
    <b>final</b> String text = editingArea.getText(); 
    <b>if</b> (!text.equals(currentlyEditedModelElement.getDocumentationText())) { 
        currentlyEditedModelElement.setDocumentationText(text); 
    } 
    currentlyEditedModelElement = <b>null</b>; 
    editingArea.setText(""); 
    editingArea.setEnabled(<b>false</b>); 
} 
</pre>

Afterwards the <tt>ModelElement</tt> represented by the selected node becomes the currently edited element and its current documentation text is written to the documentation editor pane &mdash; see <tt>XMIDocumenterUIDemo#editModelEelement()</tt>:

<pre class="code">
<b>private void</b> editModelElement(<b>final</b> ModelElement modelElement, 
                              <b>final</b> ModelElementTreeNode modelElementTreeNode) { 
    endElementEditing(); 
    currentlyEditedTreeNode = modelElementTreeNode; 
    currentlyEditedModelElement = modelElement; 
    editingArea.setText(currentlyEditedModelElement.getDocumentationText()); 
    editingArea.setEnabled(<b>true</b>); 
}
</pre>

The only point at which this generic handling of <tt>ModelElement</tt>s is broken up is the <tt>XMIDocumenterUIDemo.XMIDocumenterTreeRenderer</tt>, that checks the type of all of the <tt>ModelElement</tt> instances using <tt>instanceof</tt> to be able to display the type of the <tt>ModelElement</tt> represented by a TreeNode.
<br><br>
When editing of the XMI document has been finished, the document instance can be written into an <tt>java.io.OutputStream</tt> using <tt>XMIDocument#writeTo()</tt> &mdash; see <tt>XMIDocumenterUIDemo#save()</tt> for an example on this:

<pre class="code">
<b>final</b> FileOutputStream out = <b>new</b> FileOutputStream(selectedFile); 
<b>try</b> { 
    currentDocument.writeTo(out); 
    treeModel.setRoot(<b>new</b> XMIDocumentNode(currentDocument)); 
    treeModel.reload(); 
} <b>finally</b> { 
    out.close(); 
} 
</pre>

After describing all of the core elements of the XMI Documenter API, this article has hopefully helped illustrate how to load, modify and save XMI files using XMI Documenter component.
<br><br>

<a name="chap3"></a>
<span class="bodySubtitle">3. Implementation details of XMI documenter that are worth noting</span><br>
This chapter describes some of the XMI Documenter implementation details that are not suitable to be mentioned in the API documentation or CS of a component. 
<br><br>
The most interesting aspect of the XMI Documenter for designers who want to use this editor might be what is necessary to exist in the XMI document before staring editing of documentation. As the XMI Documenter does not provide any functionality for the creation of model elements, all elements that need to be documented must exist before loading the document. This basically means that all classes have to be declared, all methods and fields to be documented must be created inside Poseidon and all parameters need to be modeled.  Special care must be taken of any exception documentation. In the XMI document created by Poseidon, there is no real structural model element that represents a throws declaration of a method. Instead, a method can have multiple throws-documentation elements (which in general are XML elements, that contain the all text after a throws tag). When documenting exceptions in methods, you must first create throws documentation for each of the exceptions that will be documented for the method, and the throws documentation must contain at least one word (which will be interpreted as the exception class name) or it will be ignored during XMI examination of the XMIDocumentFactory. So basically, before documenting, create all classes, fields and methods (including arguments, return value and throws documentation) as the XMI Documenter is unable to create model elements, it can only modify existing ones.
<br><br>
The first thing that may seem odd is that interface and class elements found in the analyzed XMI file are both mapped to ClassElement instances and thus cannot be distinguished at runtime. The reason for this is that the parsing and handling of interfaces in the XMI file was not contained in the original design (neither designer nor design review board noticed that). When this was identified by a developer during dev phase, the PM decided that it was too late (i.e. the deadline was too near) to make any changes to the public API of the XMI documenter component &mdash; so the least intrusive fix was introduced &mdash; mapping interfaces to ClassElements also. Perhaps a 1.1 component will fix this issue.
<br><br>
One more thing worth mentioning is that the XMI Documenter component does not have the scope of validating given XMI files. It may continue and work on an XMI file that is syntactically invalid but is valid enough in structure and content to be parsed ant modified by the component &mdash; so this basically means Garbage in-Garbage Out, i.e. the component will not always detect invalid XMI documents.
<br><br>
The third detail that is worth noticing is that when the XMIDocument instance is constructed using the method XMIDocumentFactory#createDocument(org.w3c.dom.Document), the backing DOM used by the created XMIDocument instance is the one given as argument to that create method &mdash; so modifications to the XMI document result in modifications of the DOM document and vice versa. In the worst case that means that external modifications of the DOM document may break the integrity of the XMIDocument instance and the result of the file written out by XMIDocument#writeTo may be unpredictable.  So keep that in mind when using that particular factory method.
<br><br>

<a name="chap4"></a>
<span class="bodySubtitle">4. How to setup and run the XMI Documenter UI demo</span><br>
The demo provided along with this article contains the class mentioned in the article and a build script to compile and run the editor. This demo can either be used as-is or as a starting point for your own modifications and improvements to the XMI editor. Most of this chapter describes the setup of dependencies of XMI Documenter.	
<br><br>
<b>4.1 TopCoder Software Components used</b>
<ul>
<li>GUID Generator 1.0</li>
<li>Base Exception 1.0</li>
<li>XMI Documenter 1.0</li>
</ul>
<i>NOTE: The default location for TopCoder Software component jars is../lib/tcs/COMPONENT_NAME/COMPONENT_VERSION relative to the component installation.  Setting the tcs_libdir property in topcoder_global.properties will overwrite this default location.</i>
<br><br>

<b>4.2 Third Party Components used by XMI Documenter</b>
<ul>
<li>JAXP (Required only with Java 1.4) : version 1.3.1 : <a href="https://jaxp.dev.java.net/servlets/ProjectDocumentList?folderID=4584&expandFolder=4584&folderID=0">https://jaxp.dev.java.net/servlets/ProjectDocumentList?folderID=4584&expandFolder=4584&folderID=0</a></li>
</ul>
<i>NOTE: The default location for 3rd party packages is ../lib relative to this component installation.  Setting the ext_libdir property in topcoder_global.properties will overwrite this default location.</i>
<br><br>

<b>4.3 Dependencies Configuration</b><br>
Follow the instructions at <a href="https://jaxp.dev.java.net/Updating.html">https://jaxp.dev.java.net/Updating.html</a>, section "Using JAXP with version 1.4 of the Java 2 platform" to configure JAXP 1.3 for use with Java 1.4.  JAXP 1.3 is already included in Java 1.5, so nothing needs to be done for a Java 1.5 environment.
In General the following steps are required:
<ul>
<li>Download Xalan-J 2.7.0 (<a href="http://xml.apache.org/xalan-j/">http://xml.apache.org/xalan-j/</a>) from <a href="http://www.apache.org/dyn/closer.cgi/xml/xalan-j">http://www.apache.org/dyn/closer.cgi/xml/xalan-j</a></li>
<li>All five Jars from the binary 2-Jar distribution are needed.</li>
</ul>
Now two options exist depending on whether JAXP-1.3 shall be integrated in the JDK or only be used when needed:
<ul>
<li>Integration in JDK 1.4:
    <ul>
    <li>Put the Jars in <tt>%JDK_HOME%/jre/lib/endorsed</tt> &mdash; Create that directory if it doesn't exist</li>
    <li>Jars in that directory are loaded by the JDK classloader before rt.jar is loaded, i.e. the files are prepended in the JVM boot class path</li>
    </ul>
</li>
<li>Use the Jars only when needed
    <ul>
    <li>For compilation use the <tt>javac</tt>-argument <tt>-Xbootclasspath/p:xml-apis.jar</tt> (where <tt>xml-apis.jar</tt> is the path to the <tt>xml-apis.jar</tt> from the Xalan binary distribution)</li>
    <li>At runtime use the JVM argument <tt>-Xbootclasspath/p:</tt> and mention all 5 jars from the xalan distribution</li>
    </ul>
</li>
<li>Actually the build file is aware of whether the JAXP 1.3 must be prepended to the boot class path and does so during compile and run, so under normal conditions only <tt>ant startdemo</tt> must be executed and the Jars are automatically added to the boot class path of compiler and JVM if JVM version is not 1.5 </li>
</ul>

<b>4.4 Running the demo</span></b><br>
To run the demo GUI simply call <tt>ant startdemo</tt>.  The window shows three buttons, load can be used to load an XMI file (*.zuml files must be unzipped before editing), then while navigating through the tree you can view and edit the documentation of the selected node in the edit area on the right hand side. At any time the current state of the XMI document can be saved using the save button. The third button highlights tree nodes in red if they either contain no documentation or if they contain children with no documentation.<br/>
<a href="/i/downloads/xmi_documenter_ui.zip">Download Demo</a>
        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
