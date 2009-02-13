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

<div style="float: right;"><tc-webtag:forumLink forumID="506068" message="Discuss this article" /></div>
<span class="bigTitle">Breaking software for fun and profit</span>

      <p>
      By&#160;<tc-webtag:handle coderId="10353806" /><br>
      <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
      </p>

<span class="bodySubtitle">Overview</span><br>
Were you the type of child who took apart your parents' appliance to see how they worked? If you like seeing how things work &mdash; and finding ways to make them stop &mdash; then testing might be for you.
<br><br>
Through TopCoder's Testing Competitions, participants will create test code that will be used to put Assembly Competition submissions through their paces.  This article will provide an overview of how the competition works, and what it takes to write a simple functional test.
<br><br>

<span class="bodySubtitle">The testing distribution.</span><br>
The testing distribution posted by the TopCoder stuff will contain all the information you need to write the tests. The most important documents are:
<ul>
  <li><strong>The specification</strong><br>
  A high-level overview of the functionality of the application you are going to test.</li>
  <li><strong>The use cases</strong><br>
  The use cases for the application. You should be familiar with them.</li>
  <li><strong>The test scenario</strong><br>
  This document contains the test scenarios which need to be implemented. It is the minimum you must submit. Feel free to add new scenarios, though, since the score depends on the quality of scenarios you submit.</li>
  <li><strong>The prototype</strong><br>
  This is the most important part. It defines the page layout, the navigation, form, inputs, the names of links, etc. - all the critical details that must be used while writing the tests. It is highly recommended to deploy the prototype on the local http server (Tomcat, Apache, IIS, or whatever you feel comfortable with) and try to run the test cases against it.</li>
</ul>
If you have any questions about the prototype, or the scenarios, or anything, don't be afraid to post your thoughts on the forum specific to your contest (the forums will be created for each competition). 
<br><br>

<span class="bodySubtitle">Preparing the database.</span><br>
The great majority of Web applications use the databases to store the data. If you want to test certain functionality of such an application, you have to prepare the database with all the data we know and can build proper checks on them. There are at least three ways to do this, each with its own pros and cons:
<ol>
<li><strong>The SQL script</strong><br>
You may provide an SQL script that will be run before any of the test case is run. This solution is acceptable but not recommended. Note that such tests will need a special treatment, and it is very likely that they will affect other test case.</li>
<li><strong>Creating the test data before each test case</strong><br>
This approach requires a bit more work than the first one, but gives more control over the testing up process.  You will be notified immediately if something goes wrong because of the exception or other failure.</li>
<li><strong>Using the DBUnit framework</strong><br>
From the <A href="http://dbunit.sourceforge.net/">DbUnit</A> home page: "DbUnit is a JUnit extension (also usable with Ant) targeted for database-driven projects that, among other things, puts your database into a known state between test runs. This is an excellent way to avoid the myriad problems that can occur when one test case corrupts the database and causes subsequent tests to fail or exacerbate the damage." What is more, it gives the possibility to assert the database content based on the prewritten data set, so there is no need to bother with checking everything by hand.</li>
</ol>
No matter which method you choose, remember to document it clearly. 
<br><br>

<span class="bodySubtitle">Writing tests using the HtmlUnit testing framework.</span><br>
Consider the test scenario:
<ol>
<li>go to the <A href="/tc?module=Static&d1=features&d2=071006_sample" target="_blank">sample page</A>.</li>
<li>check the page content</li>
<li>fill out the form with sample data.</li>
<li>submit the form</li>
<li>check the response</li>
</ol>

Sample data:<br>
<table class="formFrame" width="300" cellpadding="6" cellspacing="2" align="center">
   <tr class="sidebarTitle" nowrap="nowrap">
      <td>Field Name</td>
      <td>Sample Value</td>
   </tr>
   <tr class="GAtableText">
      <td>Login:</td>
      <td>TCSTESTER</td>
   </tr>
   <tr class="GAtableText">
      <td>Password:</td>
      <td>test</td>
   </tr>
   <tr class="GAtableText">
      <td>Action:</td>
      <td>Login</td>
   </tr>
   <tr class="GAtableText">
      <td>Check me!</td>
      <td>True</td>
   </tr>
</table>
<br><br>
In the next few paragraphs I will try to show how the test case could be done.
<br><br>

<span class="bodySubtitle">Connecting to the server.</span><br>

The first thing to do is to create the <tt>WebClient</tt>. This class represents a web browser which will be used in testing. We may use a specific browser (using one of the predefined versions) or the default, full-featured version, which has all the options available in the <tt>HtmlUnit</tt> enabled.
<pre class="codeBox">
WebClient client = new WebClient();
</pre>
Because in our sample test scenario we are going to test the alert message, an appropriate handler must be registered.
<pre class="codeBox">
MessageHandler handler = new MessageHandler();
client.setAlertHandler(handler);
</pre>

<tt>WebClient</tt> provides a couple of convenient methods to do that. You may use the URL or String (since 1.9), as well as create your own custom request using the <tt>WebRequestSetting</tt> object. This method returns the Page object implementation depending on the content type of the header. It may be <tt>HtmlPage</tt> instance (for <tt>text/html</tt>), <tt>TextPage</tt> (for <tt>text/plain</tt>) and so on. In your tests you expect to receive HtmlPage. If any error occurs with the connection or on the server side (like 404) an exception will be thrown.
<pre class="codeBox">
Page respPage = client.getPage("http://localhost:8080/tc/sample.html");
assertEquals("Expected HtmlPage", HtmlPage.class, respPage.getClass());
        HtmlPage page = (HtmlPage) respPage;
</pre>

<strong>Checking the response.</strong><br>
We should check if the returned page is the one we had expected. The <tt>HtmlUnit</tt> does not offer us any new assertions, so we need to use the one from the <tt>JUnit</tt>. For the sample test page, we expect the title to be 'Test sample', the page has one table with the caption 'This is a sample form.' and one form. To check this, you use some method offered by the <tt>HtmlPage</tt> class.
<br><br>
First we check the page title:
<pre class="codeBox">
assertEquals("Page title.", "Test sample.", page.getTitleText());
</pre>

Then, we check the tables count. Because there is no API call to get the table, we can get the table element by tag name.
<pre class="codeBox">
List tables = page.getDocumentElement().getHtmlElementsByTagName("table");
assertEquals("Tables count", 1, tables.size());
</pre>


<strong>Navigation on the page.</strong><br>
The Web page usually contains a hyperlink to other resources. Such links are modeled in the <tt>HtmlUnit</tt> by <tt>HtmlAnchor class</tt>. The framework offers two straightforward methods to get the link. If you know the <tt>href</tt> attribute of the anchor tag, you may use:
<pre class="codeBox">
assertNotNull(page.getAnchorByHref("result.html"));
</pre>
If the anchor has 'name' attribute, you may use:
<pre class="codeBox">
assertNotNull(page.getAnchorByName("test"));
</pre>
Things get harder if the anchor does not have name or id attributes and the href value is generated dynamically (for example, if it contains the session id). In such cases you need to use the value of the anchor tag. Because there is no method to do that, we need to do it by hand. 
<br><br>
First we get the list of all anchors on the page:
<pre class="codeBox">
List anchors = page.getAnchors();
</pre>
Now, iterating thru the list; you check each tag converted to the page representation. Look for the 'Result page' name and create a helper method <tt>getLink(HtmlPage page, String linkName);</tt>
<pre class="codeBox">
private static HtmlAnchor getLink(HtmlPage page, String linkName) {
        List anchors = page.getAnchors();
        for (Iterator it = anchors.iterator(); it.hasNext();) {
            HtmlAnchor anchor = (HtmlAnchor) it.next();
            if (linkName.equals(anchor.asText().trim())) {
                return anchor;
            }
        }
        
        return null; // or throw an exception
    }


HtmlAnchor resultPageAnchor = getLink(page, "Result page");
</pre>


The disadvantage of this method is that the value must be unique thru the page or else only the first link will be returned (of course you may code this method to return the 2nd, 3rd, ..n, nth occurrence of the name, but the order of the anchors is not guaranteed).
<br><br>
<strong>Using the anchor.</strong><br>
Clicking on the link usually leads to some action and your current object may become outdated. Use the one returned from the click action; the returned object does not necessarily need to be <tt>HtmlPage</tt>, but you can assume it will be.
<pre class="codeBox">
HtmlPage resultPage = (HtmlPage) resultPageAnchor.click();
</pre>

<strong>Filling the form out.</strong><br>
Now we know how to connect to the server, get the page, check its content, and navigate using hyperlinks. It's time to fill out the form since the straight majority of the test scenarios contain them. The form is represented by the <tt>HtmlForm class</tt>, which provides some really helpful methods.
<br><br>
First of all, you need to get the proper form. It's very simple if we know the '<tt>name</tt>' attribute of the form:
<pre class="codeBox">
HtmlForm form = page.getFormByName("testForm");
</pre>

If the form doesn't have a <tt>name</tt> attribute, but has an <tt>id</tt>, you may use a bit more general method:
<pre class="codeBox">
form = (HtmlForm)
page.getDocumentElement().getHtmlElementById("testFormId");
</pre>

Having the form, you may like to check if it has the correct submit method...
<pre class="codeBox">
assertEquals("Submit method", "post", form.getMethodAttribute());
</pre>
&#8230;or action&#8230;
<pre class="codeBox">
assertEquals("testForm action", "result.html", form.getActionAttribute());
</pre>

The form's inputs have their equivalent in the framework - <tt>HtmlInput</tt> and the specialized <tt>HtmlTextInput, HtmlPasswordInput, HtmlCheckBoxInput,</tt> and so on. We may retrieve each of them by the 'name' attribute or by the value (these are not the only possibilities to get the input or any other element on the page, though).
<br><br>
To get the login and password input:
<pre class="codeBox">
HtmlInput login = form.getInputByName("login");
HtmlInput pass = form.getInputByName("password");
</pre>
You may also check if the password input has <tt>type="password"</tt> attribute. You may do this in any of the following ways:
<pre class="codeBox">
assertEquals("Input: password type:", "password",
pass.getAttributeValue("type"));

assertEquals("Input: password should have type=password", 
HtmlPasswordInput.class, pass.getClass());
</pre>
Setting the value of the input means&#8230;just setting its value attribute :)
<pre class="codeBox">
pass.setAttributeValue("value", "test");
</pre>
or, more quickly:
<pre class="codeBox">
login.setValueAttribute("TCSTESTER");
</pre>
The <tt>setAttributeValue(&#8230;)</tt> method can be used to modify other attributes as well.
<br><br>
<strong>Select box.</strong><br>
The select boxes contain a list of options, one or more of which can be selected. By using the <tt>HtmlSelect</tt> you may check the option values, the default ones, the options id/value pairs. We may also 'inject' a fake value that was not present on the list. 
<br><br>
To do that you need to get the <tt>HtmlSelect</tt> instance from the form:   
<pre class="codeBox">
HtmlSelect actionSelect = form.getSelectByName("action");
</pre>
Checking the default value is easy:
<pre class="codeBox">
assertEquals("Default value", "Select", actionSelect.getDefaultValue());
</pre>
We may get the option at any position or the name, as well as the list of all options:
<pre class="codeBox">
HtmlOption loginOption = actionSelect.getOption(1);
loginOption = actionSelect.getOptionByValue("Login");
</pre>
There are two methods to select an option (or options for multiple selects). 
<br><br>
Because there may be some other action behind this, the <tt>setSelectedAttribute</tt> method returns the page object. It may be the same page, if no action was taken, or a new one - for instance, if the selecting action causes some changes on the page via javascript or a round trip to the Web server.
<br><br>
On our sample page, the result of selecting any option is the alert message. You will check if the alert box has been shown to the user.
<pre class="codeBox">
String alertMessage = handler.popAlertMessage();
assertNull("Unexpected alert: " + alertMessage, alertMessage);
actionSelect.setSelectedAttribute("Login", true);
assertEquals("Alert message", "Alert message", handler.popAlertMessage());
</pre>

<strong>Check boxes.</strong><br>
The next most often used input element is the checkbox. It is represented in the framework by the <tt>HtmlCheckBoxInput</tt> class and allows you to check its default value and/or change it.
<pre class="codeBox">
HtmlCheckBoxInput chkBox = (HtmlCheckBoxInput)
form.getInputByName("checkBox");

assertFalse("Expected unchecked.", chkBox.isChecked());
chkBox.setChecked(true);
</pre>

<span class="bodySubtitle">Submitting the form.</span><br>
When you have the form filled in with the test data, it's time to submit it to the server. The <tt>HtmlForm</tt> provides the submit methods, which slightly differ in the action. The non-argument <tt>submit()</tt> method sends the form to the appropriate server as if it had been submitted by javascript - i.e. no submit buttons were pressed. This method won't execute the form's '<tt>onsubmit</tt>' event, however, so if there is any validation or other code executed before the form is sent to the server we shouldn't use it. This method is helpful when we want to check the application behavior on a false input (for instance, too long field value, required field not set, checkbox not selected, etc.).
<br><br>
The other two methods allow you to choose the button which will be used to submit. It is useful when the page has more than one button, with each connected to a different action. 
<br><br>
The submit method return new <tt>Page</tt> instance with the result of the action.
<pre class="codeBox">
page = (HtmlPage) form.submit("submitButton");
</pre>
If the button which we need to use does not have the '<tt>name</tt>' or <tt>id</tt> attributes set, you may need to find it in the same ways you do with the anchors, by getting the list of the buttons on the form and iterating over it checking the button <tt>asText()</tt> values.
<br><br>

<span class="bodySubtitle">Asserting the response.</span><br>
We can check the response page in the same way we do with our first page. Here I will try to show how to deal with tables and their contents.
<br><br>
First, we need to get the table. As I said before, there is no API method to get the table. The next method that can be used is <tt>getOneHtmlElementByAttribute(&#8230;)</tt>.This method takes 3 arguments: the tag name, the attribute name and the attribute value. It may be used to get each element from the page that matches. If the element does not exist, an exception will be thrown.
<pre class="codeBox">
HtmlTable table = (HtmlTable)
page.getDocumentElement().getOneHtmlElementByAttribute("table", "name",
"resultTable");
</pre>
If the table you test contains the <tt>&lt;caption&gt;</tt> element (and the sample test page does), you may check its value using API call.
<pre class="codeBox">
assertEquals("Table caption", "Result table.", table.getCaptionText());
</pre>
<tt>HtmlTable</tt> provides the access to its rows, as well as to each cell. The indexes of the cells are zero-based. The <tt>HtmlTableCell</tt> has two concrete implementations: <tt>HtmlTableDataCell</tt> and <tt>HtmlTableHeaderCell</tt> which are just the markers for the <tt>&lt;td&gt;</tt> and <tt>&lt;th&gt;</tt> tags since they do not provide any new methods.  
<pre class="codeBox">
HtmlTableCell cell = table.getCellAt(0, 0);
</pre>
To check the text value of the cell, we need to use the <tt>asText()</tt> method.
<pre class="codeBox">
assertEquals("Column header.", "Field", cell.asText().trim());
</pre>
If the value of the cell is expected to be something more than just a plain text, you may select this element, using the cell as a base, by id or any other attribute.
<pre class="codeBox">
cell = table.getCellAt(4, 1);
HtmlAnchor anchor = (HtmlAnchor) cell.getHtmlElementById("linkId");
anchor = (HtmlAnchor) cell.getHtmlElementsByAttribute("a", "name",
"linkName").get(0);
assertNotNull("Missing link.", anchor);
</pre>
Note that the <tt>getHtmlElementsByAttribute(&#8230;)</tt> will return the list of elements which match the given triple (though, keep in mind, you should check the list size before accessing any element). If none are found, an empty list will be returned.
<br><br>

<span class="bodySubtitle">Dealing with dialog boxes.</span><br>
The application you testing may have some sort of interaction through the dialog  boxes (for example confirmation for delete operation). Such information are not available to us by the <tt>Page</tt> object (or any of derived class). Instead, the framework defines some interfaces (<tt>AlertHandler, ConfirmHandler, &#8230;</tt>) which should be used while creating custom message handler. Such handlers must be registered in the <tt>WebClient</tt> by the <tt>setAlertHandler</tt> or <tt>setConfirmHandler</tt> methods. 
<br><br>
The code below is an example of the custom alert handler:
<pre class="codeBox">
class MessageHandler implements AlertHandler {

    private List alerts = new ArrayList();

    /**
     * Handle an alert for the given page.
     * 
     * @param page The page on which the alert occurred.
     * @param message The message in the alert.
     */
    public void handleAlert(Page page, String message) {
        alerts.add(message);
    }

    /**
     * Returns the last alert message or null, if wasn't any.
     * 
     * @return the last alert message or null, if wasn't any.
     */
    public String popAlertMessage() {
        if (alerts.size() > 0) {
            return (String) alerts.remove(0);
        }
        
        return null;
    }
}
</pre>


That's it - the test case is ready, and you should be ready to participate in the Testing Competition. Good luck!



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
