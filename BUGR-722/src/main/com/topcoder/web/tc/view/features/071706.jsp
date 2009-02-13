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
.GAtableText, .GAtableText2, .GAtableText3, .GAtableText4, .GAtableText5
{
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
}
.GAtableText{   background-color: #EEEEEE; }
.GAtableText2{   background-color: #FF6600; }
.GAtableText3{   background-color: #FFCC00; }
.GAtableText4{   background-color: #FFFF00; }
.GAtableText5{   background-color: #FFFF99; }

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

<div style="float: right;"><tc-webtag:forumLink forumID="506072" message="Discuss this article" /></div>
<span class="bigTitle">An Introduction to AJAX</span>

      <p>
      <img src="/i/m/39inam_mug.gif" alt="" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
      By&#160;<tc-webtag:handle coderId="14995087" /><br>
      <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
      </p>

AJAX (Asynchronous JavaScript and XML) is the latest boom in the Web development world. AJAX helps developers narrow the gap between desktop and web applications &mdash; <strong>Google Earth, Flicker</strong> and <strong>MS Outlook Express Web Version</strong> are some of the applications powered by AJAX. This article will explore the basics of AJAX programming and then build on it using practical examples. For this article, I am assuming that readers have a basic understanding of JavaScript, DOM (Document Object Model) and XML.
<br><br>
<span class="bodySubtitle">Introduction</span><br>

<div style="float: right; padding: 0px 0px 0px 15px;">
<table class="formFrame" width="170" cellpadding="6" cellspacing="2">
   <tr class="GAtableText" nowrap="nowrap">
      <td>Want to read more on AJAX? Check out this <A href="i/education/ajax_presentation.ppt">presentation</A> TopCoder's Andy LaMora gave at the TCO, in which he traces the development of user interface paradigms over the years and looks at the future of AJAX. Also, you can read DPlass' <A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=dplass_12">blog entry</A> on the presentation.</td>
   </tr>
</table>
</div>


AJAX is not a new technology; it is basically a web development technique which uses existing technologies like JavaScript and XML. So you can actually start working in AJAX if you have a basic understanding of above mentioned technologies.
<br><br>
Asynchronous means that you can make a request to a server and perform other actions while the server is processing your request -- and on the arrival of the response required actions can be performed -- as opposed to conventional web applications, in which the user has to sit back and stare at the blank screen while the server is processing the request. Therefore using AJAX will improve the interactivity of your web application.
<br><br>
In conventional web applications when a user makes a request to the server the whole page is reloaded, while AJAX applications only update the relevant portion.
<br><br>
Let's look at an example
<br><br>
<div align="center"><img src="i/education/ajax_1.gif" alt="Figure 1"/></div>
<br><br>
A book shop website is shown in the figure above. To view the books in a specific category, a user selects the category and the related books are shown in the area below. In the conventional web applications the whole page would be reloaded, but in the case of AJAX only the relevant portion is updated (as shown in the figure below).
<br><br>
<div align="center"><img src="i/education/ajax_2.gif" alt="Figure 2"/></div>
<br><br>
<span class="bodySubtitle">AJAX Architecture</span><br>
<br><br>
<div align="center"><img src="i/education/ajax_3.gif" alt="Figure 2"/></div>
<br><br>
AJAX architecture is very simple; a user makes an initial request and, in response, the page with the AJAX engine is loaded. Thereafter, the user sends all requests to the AJAX engine through JavaScript function calls, while the AJAX engine forwards requests to the server, parses the responses, and displays the HTML in the browser.
<br><br>
Let's take another look at the book shop example:
<br><br>
<strong>Normal scenario</strong> - When the user selects a particular category the request is sent to the server. In return, a new page with book details is loaded to the browser.
<br><br>
<strong>AJAX</strong> - When a user selects a particular category the AJAX engine is called, which sends the request to the server using XmlHttpRequest object, parses the response, and updates the relevant portion of the page -- therefore the whole page is not reloaded.
<br><br>
<span class="bodySubtitle">AJAX engine</span><br>
AJAX engine is nothing but some simple JavaScript functions which use XmlHttpRequest object to make requests to the server. XmlHttpRequest is the main player in an AJAX application it handles all the communication with the server.
<br><br>
<strong>Common methods and properties of XmlHttpRequest Object</strong>
<br><br>
<table class="formFrame" width="450" cellpadding="6" cellspacing="2" align="center">
   <tr class="sidebarTitle" nowrap="nowrap">
      <td>Property</td>
      <td>Description</td>
   </tr>
   <tr class="GAtableText" nowrap="nowrap">
      <td>onreadystatechange</td>
      <td>Event handler that fires when the state of the request object changes.</td>
   </tr>
   <tr class="GAtableText" nowrap="nowrap">
      <td>readyState</td>
      <td>Returns values that indicate the current state of the object.</td>
   </tr>
   <tr class="GAtableText" nowrap="nowrap">
      <td>responseText</td>
      <td>String version of the response from the server.</td>
   </tr>
   <tr class="GAtableText" nowrap="nowrap">
      <td>responseXML</td>
      <td>DOM-compatible document object of the response from the server.</td>
   </tr>
   <tr class="GAtableText" nowrap="nowrap">
      <td>status</td>
      <td>Status code of the response from the server.</td>
   </tr>
   <tr class="GAtableText" nowrap="nowrap">
      <td>statusText</td>
      <td>Status message returned as a string.</td>
   </tr>
</table>
<br><br>
<table class="formFrame" width="450" cellpadding="6" cellspacing="2" align="center">
   <tr class="sidebarTitle" nowrap="nowrap">
      <td>Method</td>
      <td>Description</td>
   </tr>
   <tr class="GAtableText">
      <td>Abort()</td>
      <td>Cancels the current HTTP request.</td>
   </tr>
   <tr class="GAtableText">
      <td>getAllResponseHeaders()</td>
      <td>Retrieves the values of all the HTTP headers.</td>
   </tr>
   <tr class="GAtableText">
      <td>getResponseHeader("<i>headerLabel</i>")</td>
      <td>Retrieves the value of an HTTP header from the response body.</td>
   </tr>
   <tr class="GAtableText">
      <td>open("<i>method</i>", "<i>URL</i>"[, <i>asyncFlag</i>[, "<i>userName</i>"[, "<i>password</i>"]]])</td>
      <td>Initializes an MSXML2.XMLHTTP request, specifying the method, URL, and authentication information for the request.</td>
   </tr>
   <tr class="GAtableText">
      <td>send(<i>content</i>)</td>
      <td>Sends an HTTP request to the server and receives a response.</td>
   </tr>
   <tr class="GAtableText">
      <td>setRequestHeader("<i>label</i>", "<i>value</i>")</td>
      <td>Status message returned as a string.</td>
   </tr>
</table>
<br><br>

<span class="bodySubtitle">AJAX Explanation</span>
<br><br>
Steps Involved
<ol>
<li>Get the form data.</li>
<li>Make a request to the server.</li>
<li>Get and parse Response.</li>
<li>Update the relevant portion.</li>
</ol>

Let's consider the book shop example. First, we will attach an event with the drop down list
<pre class="codeBox">
&lt;select onChange="showbooks()" accesskey="cat" size="1" id="category" name="category"&gt;
       &lt;option value="History"&gt;History&lt;/option&gt;
       &lt;option value="Computer Science"&gt;Computer Science&lt;/option&gt;
       &lt;option value="Politics"&gt;Politics&lt;/option&gt;
       &lt;option value="Commerce"&gt;Commerce&lt;/option&gt;
       &lt;option value="Law"&gt;Law&lt;/option&gt;
       &lt;/select&gt;
</pre>

In the above example I attached a JavaScript function "showbooks" (I will explain it later) with <tt>onChange</tt> event of dropdown list named category. Whenever a user selects a different option the <tt>showbooks()</tt> function would be called. This function, basically, is our AJAX engine
<br><br>

<strong>Showbooks function</strong>
<br><br>
This function has to perform following tasks
<ol>
<li>Create a XmlHttpRequest Object</li>
<li>Grab the selected category</li>
<li>Build the request URL</li>
<li>Make the request</li>
</ol>

Creating the XmlHttpRequest object:

<pre class="codeBox">
var xmlHttp = false;
if (@_jscript_version &gt;= 5) 
try {
  xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
} catch (e) {
  try {
    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
  } catch (e2) {
    xmlHttp = false;
  }
}

if (!xmlHttp && typeof XMLHttpRequest != 'undefined') {
  xmlHttp = new XMLHttpRequest();
}
</pre>

Create a reference to XmlHttpRequest Object and assign it to XmlHttp. For MS Internet Explorer 5.0 or above version reference can be obtained by:
<pre class="codeBox">
 xmlHttp =ActiveXObject("Msxml2.XMLHTTP ");
</pre>
For other IE versions it can be obtained by:
<pre class="codeBox">
xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
</pre>
For all other browsers it can be obtained by:
<pre class="codeBox">
xmlHttp = new XMLHttpRequest();
</pre>
Grabbing the selected category:
<pre class="codeBox">
var cat= document.getElementById("category").value;
</pre>
Building the request URL:
<pre class="codeBox">
var url = "getbooks.php?cat=" + escape(cat);
</pre>
<tt>escape(cat)</tt> is a javascript function, which encodes the string provided as argument. It encodes all that characters which can't be transferred in the request.
<br><br>
For example, if a space occurs it is encoded as "%20" because it can't be transferred in the request URL. 
<br><br>

<strong>Making the request:</strong>

<pre class="codeBox">
    xmlHttp.open("GET", url, true);
</pre>
A connection is opened and the method of connection is specified, i.e. "Get" next argument is the url and last argument specifies the Boolean value, whether you want the request to be asynchronous or not.
<br><br>
An event handler is specified, which will fire every time the state of the request object is changed. This event handler is a very good place for error handling, as well as for providing the user with feedback. I will explain the <tt>onreadystatechange</tt> event later.
<pre class="codeBox">
   xmlHttp.send(null);
</pre>
Next the request is made through <tt>send()</tt> method. The only argument of the send() method is a query string. Since we are using "Get" method we don't need to specify the query string.
<br><br>

<strong>Parsing the Response</strong>
<pre class="codeBox">
function updatepage()
{
	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
	{
var response= xmlHttp.responseText;
}

document.getElementById("detail").innerHtml=response;
}
</pre>
<tt>readystate=4</tt> means that the server has completed the processing of request and the object is completely intilialized. <tt>responseText</tt> is the property which represents the server's response.
<br><br>
The Last line of the above code updates the relevant portion of the page. We have created the span tag with id details to show the details of the books.
<br><br>
<span class="bodySubtitle">More on readystate</span>
<br><br>
<tt>readystate</tt> property can have the following values:
<br><br>
<table class="formFrame" width="450" cellpadding="6" cellspacing="2" align="center">
   <tr class="sidebarTitle" nowrap="nowrap">
      <td>Value</td>
      <td>Description</td>
   </tr>
   <tr class="GAtableText">
      <td>0</td>
      <td>Uninitialized. The object is not initialized with data.</td>
   </tr>
   <tr class="GAtableText">
      <td>1</td>
      <td>Loading. The object is loading its data.</td>
   </tr>
   <tr class="GAtableText">
      <td>2</td>
      <td>Loaded. The object has finished loading its data.</td>
   </tr>
   <tr class="GAtableText">
      <td>3</td>
      <td>Interactive. The user can interact with the object even though it's not fully loaded.</td>
   </tr>
   <tr class="GAtableText">
      <td>4</td>
      <td>Complete. The object is completely initialized.</td>
   </tr>
</table>
<br><br>

Using these values we can provide user with feed back. Consider the code below
<pre class="codeBox">
function pageUpdate()
{
 	if(xmlHttp.readyState == 0)
	{
document.getElementById('details').innerHTML = "Sending Request...";
	}
	if(xmlHttp.readyState == 1)
	{
 document.getElementById(' details ').innerHTML = "Loading Response...";
	}
	if(xmlHttp.readyState == 2)
	{
     document.getElementById(' details ').innerHTML = "Response   Loaded...";
	}
	if(xmlHttp.readyState == 3)
	{
	 document.getElementById(' details ').innerHTML = "Response Ready...";
	}
	if(xmlHttp.readyState == 4)
	{
	document.getElementById(' details ').innerHTML = reponse;
               }
}
</pre>
<span class="bodySubtitle">Putting it all together</span><br>

<pre class="codeBox">
&lt;script language="javascript"&gt;
function showbooks()
{

		var cat= document.getElementById("category").value;

     var url = "getbooks.php?cat=" + escape(cat);

	         xmlHttp.open("GET", url, true);
		
	
                  xmlHttp.onreadystatechange = updatePage;

	

   		xmlHttp.send(null);
	
                  

}
function pageUpdate()
{
 	if(xmlHttp.readyState == 0)
	{
document.getElementById('details').innerHTML = "Sending Request...";
	}
	if(xmlHttp.readyState == 1)
	{
 document.getElementById(' details ').innerHTML = "Loading Response...";
	}
	if(xmlHttp.readyState == 2)
	{
     document.getElementById(' details ').innerHTML = "Response   Loaded...";
	}
	if(xmlHttp.readyState == 3)
	{
	 document.getElementById(' details ').innerHTML = "Response Ready...";
	}
	if(xmlHttp.readyState == 4)
	{
	document.getElementById(' details ').innerHTML = reponse;
               }
}

&lt;script&gt;
</pre>

<span class="bodySubtitle">Server Side Code</span><br>
PHP Developer

<pre class="codeBox">
Print("&lt;table bordercolor='#89A0D6' border='1' cellpadding='0' 
cellspacing='0 &gt;");
   Print(" &lt;tr&gt;");
      Print("&lt;td bgcolor='#89A0D6'  width='20%'&gt;&nbsp;&lt;/td&gt;");
      Print("&lt;td  bgcolor='#89A0D6' width='20%'&gt;&lt;b>Title&lt;/b&gt;&lt;/td&gt;");
   Print("	  &lt;td bgcolor='#89A0D6'
width='20%'&gt;&lt;b>Author&lt;/b&gt;&lt;/td&gt;");
      Print(" &lt;td bgcolor='#89A0D6' 
width='20%'&gt;&lt;b>Price&lt;/b&gt;&lt;/td&gt;");
      Print("&lt;td bgcolor='#89A0D6' width='20%'&gt;&lt;b>Add to 
Cart&lt;/b&gt;&lt;/td&gt;");
   Print(" &lt;/tr&gt;");
     
        	
        		
           $link=mysql_connect("localhost");
           mysql_select_db("ajaxexample");
           $query="select * from books where category=cat;
           $result=mysql_query($query);
           while($row=mysql_fetch_array($result))
           {
                      $title=$row ["title"];
                      $author=$rowcart["author"];
                      $price=$row ["price"];
                      $image=$row ["image"];
										
                      print("&lt;tr&gt;"");
                      print("&lt;td bordercolor='#FFFFFF'
width='20%'&gt;&lt;img src='images/$image' height='50' width='50' /&gt;&lt;/td&gt;");
                      print("&lt;td bordercolor='#FFFFFF' 
width='20%'&gt;$title&lt;/td&gt;");
                      print("&lt;td bordercolor='#FFFFFF'
width='20%'&gt;$author&lt;/td&gt;");
                      print("&lt;td bordercolor='#FFFFFF' 
width='20%'&gt;$price&lt;/td&gt;");
          				
                      print("&lt;td bordercolor='#FFFFFF' 
width='20%'&gt;&lt;a href=addtocart.php?bid=$bid&gt;&lt;img src='images/cart.jpg'
height='30' width='30' /&gt;&lt;/a&gt;&lt;/td&gt;");
                      print("&lt;/tr&gt;");
           }
        	
        	
           }
        	
   print("  &lt;/table&gt;");
</pre>

<span class="bodySubtitle">Positives of using AJAX</span><br>
<ul>
<li>High Interactivity<br>
AJAX application are more interactive then conventional web applications</li>
<li>High Usability<br>
Updating only relevant portion on each user request will improve the usability of your application.</li>
<li>High Speed<br>
AJAX applications are much faster then conventional web application.</li>
</ul>
Besides these AJAX has many other benefits.
<br><br>
<span class="bodySubtitle">Drawbacks of using AJAX</span>
<ul>
<li>If JavaScript is not activated on the client's PC AJAX won't work</li>
<li>Writing and managing complex JavaScript and XML.</li>
<li>Initial page load is slow.</li>
<li>The data loaded is dynamic so it can't be used for searching by search engines.</li>
<li>An interesting problem occurs when the user of the AJAX enabled application clicks the back button Ð nothing happens!</li>
</ul>
Lastly, XmlHttpRequest can be difficult to integrate into a browser. If a user follows Microsoft's security instructions, they will not be able to use AJAX applications in Internet Explorer (at least, not without accepting a prompt each time). For that reason &mdash; and to enable the back-button &mdash; developers sometimes have to go with an IFrames-based solution.  The early AJAX solutions did this, as does Google Maps. While IE7 is expected to handle XHR correctly, as a javascript function and not an ActiveX object, you should expect to spend a fair amount of time testing and tweaking browser compatibility.
<br><br>
<span class="bodySubtitle">Conclusion</span><br>
AJAX is a great tool for web applications that require a lot of interactivity and user input. Looking at both the strengths and weaknesses of AJAX, however, it becomes clear that there is a trade off Ð the higher the usability for an application's end users, the greater the complexity for an application's developers. For every project, developers should weigh AJAX' pros and cons and consider that trade-off for themselves. 

<br><br>

        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
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

<jsp:include page="../foot.jsp" />

</body>

</html>
