<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <html>
      <head>

        <xsl:call-template name="Preload"/>      

        <title>TopCoder | Features</title>

        <xsl:call-template name="CSS"/>      

        <meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

      </head>

      <body bgcolor="#FFFFFF" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">

        <xsl:call-template name="Top"/>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">

            <xsl:call-template name="global_left"/>

        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->    
        <td class="bodyText" width="100%">
        
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">features</xsl:with-param>
                <xsl:with-param name="title">&#160;TopCoder Feature</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr><td colspan="3"><img src="/i/clear.gif" alt="" width="1" height="21" border="0"/></td></tr>                        
                <tr valign="top">
                    <td width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
                    <td class="bodyText" width="100%">         
                        <p><font size="4"><strong>An Enterprise Java Overview</strong></font><br />
                        Wednesday, January 14, 2004</p>

                        <p>By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=251184"><strong>dplass</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span></p>
                        
<p><b>Introduction</b><br/>
In this feature, I will give an overview of designing systems using Java 2 Enterprise Edition  (J2EE) and 
touch upon some of the technologies used to implement these systems.  J2EE actually encompasses over a 
dozen separate technologies; I will only describe a handful of them here.  Likewise, this article mostly covers 
web applications ("web apps") since that has been my area of expertise over the last 4 years, even though 
Enterprise Java can be used for client-server, or other types of applications.</p>

<p><b>Design Overview</b><br/>
J2EE web app design nearly always uses the "Model-View-Controller", or MVC design pattern.  It allows 
software architects to design in layers, which naturally leads to an implementation with those corresponding 
layers:</p>

<div align="center"><img src="/i/f/feat_011404.gif" width="350" height="252" border="0"/></div>

<p>The <b>Model</b> layer represents the actual "business objects" that are manipulated, such as a User, an Address, 
or an Order.  This layer is often combined with a persistence layer, such as Entity Enterprise Java Beans (EJBs) 
or Java Database Connectivity (JDBC.)</p>

<p>The <b>View</b> presents the model to the user.  Typically this is provided by Java Server Pages (JSPs), which 
render HTML to the user.  The <b>Controller</b> accepts input from the user, modifies the Model, and can change 
which View the user is seeing.  They are usually implemented using Java Servlets and/or EJBs.</p>


<p><b>The Model Layer</b><br/>
The Model is usually implemented using "PODS" - Plain Old Data Structures.  These are "simple" Java classes 
that have "getters" and "setters" for their properties.  The properties themselves are private but the getters 
and setters are public.  For example:</p>

<pre>
public class Address
{
      private String city;

      public String getCity() { return city; }
      public void setCity(String c) { this.city = c;}
}
</pre>

<p>The model holds data that is input from the user or stored in the database.  The relationships between these business 
entities are modeled using references between a parent and its children.  For example:</p>

<pre>
public class Person
{
      private Address address;
      public Address getAddress() { return address; }
      public void setAddress(Address a) { this.address = c; }
}
</pre>

<p>A one-to-many relationship is usually built as a Vector or List of multiple instances of the object.</p>

<p><b>Persistence Models</b><br/>
The persistence layer provides storage of data to the database, and retrieval from databases, usually relational SQL databases.</p>

<p>The commonly used persistence models include:</p>
<ol>
<li>JDBC - Java Database Connectivity.  This is a standard J2EE technology used for accessing SQL databases.  Most 
major database vendors provide JDBC drivers, which are specific to each database itself.  Happily, since JDBC 
standardizes the access to SQL, developers do not need to know the specifics of each database in order to use JDBC.</li>
<li>The drawback of JDBC is that there is no standard way to map between objects and relational databases 
(the so-called "O-R mapping").  Many third-party Java products exist, such as Hibernate and JDO, to aid in this 
mapping and can make persistence nearly invisible to the rest of the code.</li>
<li>Entity EJB.  This technology can automatically map a Java class to a table in a SQL database.  A major benefit of 
using EJBs is that the server, not the developer, manages transactions. Entity EJBs can be cumbersome to code.  
Historically, the mapping between the model and the database has been vendor-specific and it has been difficult to 
model complex table relationships (although both are mitigated by the latest EJB 2.0 specification.) </li>
</ol>

<p><b>Enterprise Java Beans (EJB)</b><br/>
EJBs are components that provide distributed execution, transaction control, declarative security, multi-threading, 
and scalability.  The mechanism to access an EJB is similar to a remote procedure call, except that the EJB compiler 
rather than the developer implements the actual call.</p>

<p>There are various flavors of EJBs, which include:</p>
<ol>
<li><b>Entity EJBs</b>. Each instance of the bean represents a row in a table of a database.  Entity EJBs are cached 
in the application server so that multiple clients do not have to re-read the same records from the database. The 
two variations on Entity EJBs are:</li>
<ol>
<li>Container Managed Persistence (CMP)- The mapping between the columns of a table is defined by the developer 
in a configuration file (called a deployment descriptor).  Until recently, this was a vendor-specific mapping where 
the specific application server's EJB compiler implements all the insert, update, delete and retrieve code.</li>
<li>Bean Managed Persistence (BMP) - All database interactions are written by the developer.  The developer can 
model complex relationships between tables, and thus objects.  The drawback to BMP is that it is error-prone and 
potentially slower to develop than CMP beans.</li>
</ol>
<li><b>Session EJBs</b>.  These EJBs are used as controllers.</li>
<ol>
<li>Stateful Session EJBs (SFSB).  These beans keep their state between calls; they can be used as "shopping carts" 
for a particular user.</li>
<li>Stateless Session EJBs (SLSB).  The application server maintains a "pool" of objects that do not retain their 
state between calls.  SLSB's are useful to control a transaction from start to finish, spanning multiple Entity EJB 
calls, multiple databases, and JDBC calls.</li>
</ol>
</ol>

<p><b>The View Layer</b><br/>
Java Server Pages (JSPs) are the technology of choice when implementing the View of a web application.  
JSPs are text files with sections that can include Java code or XML (called "tags").  For example, this is a 
simple JSP that generates HTML to show the current date:</p>

<pre>
&lt;%@ page import="java.util.Date"%&gt;
&lt;html&gt; &lt;head&gt;&lt;title&gt;JSP Date&lt;/title&gt;&lt;/head&gt;
&lt;body&gt;
The current date is &lt;%=new Date()%&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>The output of this JSP is:</p>
<div align="center"><img src="/i/f/feat_011404_2.gif" width="350" height="252" border="0"/></div>

<p>Even though the above example renders HTML and JSPs are nearly always used to generate HTML, JSPs can 
be used to generate any kind of text.  The usefulness of JSPs is that they can generate dynamic content but still 
use a familiar format.</p>

<p>There are actually two different ways to produce dynamic content in JSPs. Java scriptlets are bits and pieces 
of Java code interspersed in the text of the page.  In the example above, the scriptlet is underlined.  The 
disadvantage of this is that the code is not re-usable.  If you wanted the same code snippet on multiple pages, 
(even though there is an "include" mechanism in JSP) the code itself is not inherently reusable.  Another 
disadvantage of using scriptlets is that JSP development is frequently relegated to non-Java developers who 
specialize in HTML and JSPs.  Forcing them to use a language that they do not know is counter-productive and 
can lead to sub-optimal JSPs.</p>

<p>Instead, JSP custom tag libraries are used.  The developer can either write her own tag libraries (in Java), 
or use pre-made libraries, such as the JSTL library.  With a JSP tag library, tags replace the scriptlets.   Instead of:</p>

<pre>The current date is &lt;%=new Date()%&gt;</pre>

<p>A developer could write</p>

<pre>
The current date is 
&lt;dt:format pattern="MM/dd/yyyy hh:mm"&gt;
&lt;dt:currentTime/&gt;
&lt;/dt:format&gt;
</pre>

<p>As one can see, the tag syntax is XML and therefore it would be easy to transition HTML developers into 
"JSP-with-tags" developers.</p>
 
<p>When designing a website that uses JSP technology, I strongly advise that you consider designing and 
developing with templates.  Web sites need a consistent look and feel and therefore will contain common 
visual elements, such as a header, navigation area, and footer.  By designing your pages to use a common 
template, you will save yourself headaches later when you need to change the header on EVERY page.   
There are many frameworks for JSP that can help with this; Tiles is one of these frameworks and works 
with the Struts framework; both part of The Apache Software Foundation's Jakarta project.</p>

<p><b>The Controller Layer</b><br/>
The Controller is responsible for receiving input from the user (usually in the form of an HTTP request), 
taking some action, and updating the model.  The controller then sends the user to a view (usually a different 
view) to display the results of the action.</p>

<p>Servlets are the J2EE objects that take input from users.  They can be multi-threaded (to increase 
performance) with little effort on the part of the coder, and can take part in container-managed security.</p>

<p>Servlets and JSPs co-operate in two ways:</p>
<ol>
<li>a. Servlets store their output - the updated Model - in common places for JSPs to then read and display.</li>
<li>JSPs send their data to servlets based on the target of an HTML form; servlets redirect the web browser 
back to a particular JSP to change the "view".</li>
</ol>

<p>Often, servlets are used in conjunction with Stateless Session EJBs.  The benefit of this mechanism 
is that we can avoid writing our own transaction control by using the EJB's Container-Managed Transaction 
management.</p>

<p><b>Struts</b><br/>
Finally, I'd like to mention Struts.  Struts is a widely-used, widely-supported framework that 
makes designing and building the View, Controller, and Model layers easier.  The benefits of using Struts 
includes the following:</p>

<ol>
<li>Data mapping from a servlet to a Model</li>
<li>A JSP tag library</li>
<li>A way to "internationalize" messages in JSPs</li>
<li>A mechanism to redirect among different JSPs after the controller processes user requests</li>
<li>Other useful View and Controller functionality</li>
</ol>

<p>A thorough discussion of Struts is way beyond the scope of this article.  There are a plethora of written 
and on-line references for more information.</p>

<p><b>Conclusion and references</b><br/>
As with every other framework, designing systems using Enterprise Java provides much flexibility, requiring 
the software designer to make many choices along the way.  This article shows the typical layers of J2EE applications 
and identifies some of the decision points that arise when building web applications. Each topic is worthy of an article 
unto itself; this article was just the tip of the iceberg!</p>


<p><A href="http://java.sun.com/blueprints/enterprise/index.html">http://java.sun.com/blueprints/enterprise/index.html</A>  - Sun Microsystems publishes their "Blueprints" to design and develop Enterprise applications and provides much on-line documentation.  This covers EJBs, JSP, Java Servlets, as well as the design patterns that Sun recommends when designing web applications.</p>

<p><A href="http://jakarta.apache.org">http://jakarta.apache.org</A> - The Jakarta project has too many Java libraries and frameworks to mention; Struts, Tiles, Taglibs, and others are used in many web applications.  Instead of re-inventing the wheel, you can use these open-source projects to reduce development time.</p>

<p><A href="http://java.sun.com/products/jdo/">http://java.sun.com/products/jdo/</A> - "The Java Data Objects (JDO) API is a standard interface-based Java model abstraction of persistence."</p>

<p><A href="http://www.hibernate.org">http://www.hibernate.org</A> - "Hibernate is a powerful, ultra-high performance object/relational persistence and query service for Java"</p>

                        <p><br/></p>

                        <p>Would you like to <a href="/?&amp;t=features&amp;c=feat_topics" class="bodyGeneric">write a feature?</a></p>
                    </td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>                                                                 
            </table>
            <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>

            <xsl:call-template name="public_right_col"/>       

        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
<xsl:call-template name="Foot"/>
<!-- Footer ends -->

</body>
</html>

  </xsl:template>
</xsl:stylesheet>

