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
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Features</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY>
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
	<TR>
    <!-- Left Column Begins -->
		<TD WIDTH="180" VALIGN="top">
<!-- Left Column Include Begins -->	
    <!-- Global Seconday Nav Begins -->	
        <xsl:call-template name="global_left"/>
	<!-- Global Seconday Nav Ends -->	
<!-- Left Column Include Ends -->    		
	  	</TD>
	<!-- Left Column Ends -->
	<!-- Gutter Begins -->
		<TD WIDTH="4" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
	<!-- Center Column Begins -->	
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#FFFFFF" VALIGN="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">features</xsl:with-param>
  <xsl:with-param name="title">&#160;TopCoder Feature</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>          
					<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#FFFFFF">
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="21" BORDER="0"/></TD></TR>						
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">
<!-- <IMG SRC="/i/f/feat_050102_tn3.jpg" ALT="" WIDTH="100" HEIGHT="150" HSPACE="10" VSPACE="3" ALIGN="right" BORDER="0"/> -->

<P><FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>Who needs another UI framework?</B></FONT><BR/>
<I>Unorthodox UI Framework</I><BR/><BR/>
Wednesday, January 22, 2003<BR/>
By&#160;the_gigi,<I>TopCoder Member</I><BR/>
</P>

<B>Introduction</B>

<P>
The time is 1999. The internet hype is high and we were out to conquer the 
world. The killer app was a chat-on-page service that allows users who surf 
the web to see who else is on the same page and interact with them. The 
architecture was a classic client-server. The client had to be magnificent 
of course to capture the hearts and souls of the billions of users. A 
strategic decision we made was that  one of our competitive advantages will 
be a user interface that has never been seen before.
</P>

<P>
<B>Who needs another UI framework?</B>
</P>

<P>
Well, we did. The requirements were pretty exotic:
</P>

<P>
<UL>
	<LI>Non-rectangular windows and controls</LI>
	<LI>Double Buffering</LI>
	<LI>Object-oriented programming model</LI>
	<LI>Programming model that decouples UI from application logic</LI>
	<LI>Windows target platform</LI>
</UL>

</P>

<P>
I evaluated a few toolkits and frameworks including raw GDI, MFC and FLTK 
and found all of them unsatisfactory. I didn't evaluate Qt and it looks like 
a pretty good match in hindsight, but then you wouldn't have read this 
article.
</P>

<P>
Let's tackle the issues one by one:
</P>

<P>
No-rectangular windows and controls - this could be achieved with the Region 
APIs. No framework/toolkit supports them in a satisfactory way (MFC just 
provides a wrapper class)
</P>

<P>
Double-buffering - doesn't work for toolkits that allocate HWND for each control or use common controls
</P> 

<P>
Object-oriented programming model - several toolkits (MFC and FLTK) 
</P>

<P>
Programming model that decouples UI from application logic - only FLTK sort of supports it, 
but still it locks you into its own event loop
</P>

<P>
So we decided to roll our own UI framework.
</P>

<P>
<B>Win32 basic concepts</B>
</P>

<P>
Before we dive into the framework itself let's get everybody up to speed on 
some basic Win32 concepts.Windows is based on the concept of a window. Window is a visual rectangular (most of the time) area on the desktop. The user interacts with a window via the mouse and keyboard and the operating system interacts with the window via system 
calls.
</P>

<P>
<B>Windows, WNDCLASS, HWND and window procedure</B><BR/>
Each window has a window class which determines its class name and its 
behavior. When creating a window the creator must specify it's window class. A handle of type HWND identifies the window. When the window gets a message it is dispatched by the operating system to its window procedure, which is typically a huge switch statement where each case handles a specific message.
</P>

<P>
<B>Messages, message queues and message loop</B><BR/>
All the communication between programs, users and windows is done via 
messages. A Win32 application receives all the messages through the main message loop which dispatches the message to the appropriate window. Messages are kept in a queue and the application extracts all the currently waiting messages and handles them, then it relinquishes control to the operating system and enters an efficient wait state until more messages are available.
</P>

<P>
<B>The Control hierarchy</B>
</P>

<P>
I had some experience of component-based development but no major OO project 
experience. Now, UI frameworks are a classic application to the OO paradigm. 
Deep class hierarchies are bad for your health for multiple reasons and I 
discovered it the hard way. Initially, consider the following basic hierarchy:
</P>

<P>
Control, Container, Resizable, Scrollable, WinControl, TopLevelWindow. You 
could derive concrete controls such as a Button from any level at the 
hierarchy and it became a mess very quickly. Finally, I settled down on the 
following compressed hierarchy:
</P>

<P>
Control, WinControl, TopLevelWindow
</P>

<P>
<B>Control</B>
</P>

<P>
Control is a visual object on the screen. Controls have a bounding 
rectangle, know how to draw themselves, how to respond to mouse and keyboard 
events and can also be hidden and disabled. The operating system knows nothing about Controls and the framework is responsible to orchestrate the interaction with the operating system. Control also implements the Composite design pattern. This means that each Control may contain other controls in a recursive manner. Control makes sure that it's contained controls draw themselves after it draws itself, arranges their size and position when it's own size is changed (according to a specific layout scheme) and propagate mouse and keyboard events to them.
</P>

<P>
<B>WinControl</B>
</P>

<P>
WinControl is a control that wraps an HWND. The WinControl is responsible 
for controlling the behavior
of it's HWND and how it responds to various window messages. There are two 
kinds of WinControls :
</P>

<P>
* Native WinControl - The window class is pre-registered like RichEdit which 
provides the window proc
</P>

<P>
* Custom WinControl - The window class is custom-made and the control 
provides the window proc
</P>


<P>
<B>TopLevelWindow</B>
</P>

<P>
TopLevelWindow is a WinControl that has no parent HWND. TopLevelWindows may 
have some unique properties like user-resizable and dragging that separate 
them from regular WinControls.
</P>

<P>
<B>Atomic Controls</B>
</P>
<P>
The atomic controls are the building blocks with which every other custom 
control should be composed of. These controls access the GDI sub-system 
directly and therefore are the portability border of the framework (together with WinControl and TopLevelWindow). Every other control is implemented in terms of these controls or other composite controls and consume framework 
events only (as opposed to windows messages).
</P>

<P>
<B>ImageControl</B>
</P>

<P>
ImageControl encapsulates the concept of an image with a non-rectangular 
region. The image control may be stretched so its image occupies it's entire 
area. ImageControl supplies two stretching modes (Stretch and Tile). In both 
ways the image is cut into 9 rectangular areas. The 4 corners are copied to 
the stretched image and the other 5 parts are stretched according to the 
stretch mode. This prevents pixelation of the corners.
</P>


<P>
<B>TextControl</B>
</P>

<P>
TextControl encapsulates the functionality of displaying text in a specific 
font, size and color on the screen.  It's a very simple control that uses the 
::DrawText() API to draw its text on the screen.
</P>


<P>
<B>Composition Vs. Inheritance</B>
</P>

<P>
Most UI frameworks embrace inheritance as a way to customize controls. You 
derive your custom control from a pre-existing control, override a few 
virtual methods and that's it. There are many problems with this programming 
model. It promotes deep class hierarchies, the computation is broken between multiple layers, and each layer must be aware of other layers. Derived classes must conform to assumptions made by base classes such as calling base class 
methods at various times. Changes to base classes tend to break the behavior 
of derived classes, which implicitly depended on some base class behavior.
</P>

<P>
An alternative solution, which is very effective, is to use composition of 
pre-existing controls. The idea is that composing existing controls using the generic containment mechanism creates custom controls. The application-specific logic that manipulates the UI controls resides in a separate class that intercepts events from the controls. This sounds very abstract so let's examine a simple example. Suppose you want to create a list of items with a remove button. The desired behavior is this:
</P>

<P>
* The remove button is enabled if, and only if, some items are selected in the 
list.
</P>

<P>
* When the remove button is clicked, the selected items are removed from the list.
</P>

<P>
So, how do we go about it? The UI is made from a generic Control that 
contains a ListControl and a ButtonControl. The look and feel of this UI 
(size, background and foreground color, font, relative location of controls) 
can be configured in a generic way. The application-specific behavior is relegated to an interaction manager, which is an application class. This 
class is responsible for populating the list, enabling/disabling the remove 
button according to the number of items in the list and for removing 
selected items when the remove button is clicked. In order to perform all these tasks, this class intercepts events from the UI such as OnSelect from the 
ListControl and OnClick from the ButtonControl. Note that the interaction 
manager shouldn't create and configure the look and feel of the UI. All it 
needs is for someone (some higher level application factory) to pass it 
pointers to the list and the remove button. This someone should also 
register the interaction manager as the sink of events from the button and 
the list. The interaction manager implements the event interfaces of the 
list and the button. The result is a completely decoupled UI code and 
application code. This arrangement allows extreme flexibility such as adding 
a background image or small icons to the list without any change to the code 
or adding additional functionality (e.g. help button) merely by adding a 
new interaction manager for the help button - the original interaction 
manager is not even aware of the existence of this help button.
</P>

<P ALIGN="center"><B>Event Propagation</B></P>

<P>
<B>Handling OS Events</B>
</P>

<P>
UI frameworks by their nature use event-driven programming models. The most 
important events are the paint, mouse and keyboard events. The paint events notify the 
framework that a portion of the screen must be repainted (e.g. when the user drags a window 
around the screen), the mouse events notify the framework about mouse movements and button 
press/release, the keyboard events notify the framework about (you guessed it) key presses 
and releases. In Windows, the OS generates these events in response to user actions and puts 
them in the message queue of the appropriate application. There are several concepts such as 
keyboard focus and mouse capture that control who gets what messages. If you remember, our 
framework implements its controls independently of the OS. This means that if you created a 
button control and placed it on a top-level-window and then the user clicked this button, 
the event in the form of a WM_LBUTTONDOWN Windows message will arrive to the top-level window. 
However, this event should go to the button. This process involves two phases. In the first phase, 
Windows messages such as WM_LBUTTONDOWN are converted to an internal representation 
(e.g. HandleLeftMouseDown). This phase is performed by WinControl, which implements 
a standard window procedure, intercepts all the relevant messages and forwards them 
as internal framework events to its Control base class. This is where the second 
phase kicks in. The instance of Control that handles the event through HandleLeftMouseDown 
is the top-level-window Control instance. This instance contains all the controls on this 
window and specifically the button. It checks the mouse coordinates and if the coordinates 
fall inside some child control, it forwards the event to this control by calling its 
HandleLeftMouseDown. This process continues recursively. If there are no children under 
the mouse coordinates, the control executes its mouse down handling logic. The base class 
Control just ignores it; the ButtonControl class changes its state, its appearance and also 
notifies its sink about this event (more about this in the next section). The same principles 
apply to other events too.
</P>

<P>
Let's examine another important event - the WM_PAINT event. Windows specifies what part of 
the window should be repainted as a rectangle. There are some intricacies, such as previously 
invalidated portions of the screen that I will skip because they don't contribute to the discussion, 
but you had better not skip them if you are implementing a custom drawing application. The framework 
intercepts the message (via WinControl's window procedure) and passes it to the Control class through 
the HandleDraw() method. The implementation is pretty convoluted but the idea is this: allocate an 
offscreen memory buffer, tell each child control whose bounding region (NOT rectangle) that 
intersects the invalidated region to draw itself onto this buffer, and copy the buffer to the 
screen. The result is efficient, flicker-free draw. Each Control recursively calls its own 
Draw() method and then recursively calls the HandleDraw() method of its children.
</P>

<P>
<B>Framework Notification Events</B>
</P>

<P>
In the previous section, I discussed propagating OS events to specific framework controls, but there 
is another type of events. The framework controls generate their own events that should be directed to 
interested parties which are either other controls that collaborate through events or application 
objects that are interested in the state of the UI (interaction managers). This is much simpler 
than handling OS events since no external elements are involved. Each control defines an events 
interface and accepts a sink object that implements this interface upon creation. When some event 
occurs, the control notifies its sink. Let's take the TabControl as an example. This control maintains 
a list of pages that occupy the same area on the screen and only one of them is displayed 
(the active page) at any given moment. The user can "tab" through the pages by clicking the tab 
headers with the mouse or using the arrow keys. The TabControl is responsible for hiding and showing 
the various pages, but it also notifies the application that the active page has changed. This is useful 
if the application saves the last UI session in some persistent storage (registry, configuration file). 
The application object will implement the event interface of the TabControl by deriving from 
ITabControlEvents interface and will implement the OnPageChange() method. The application factory 
will pass a pointer to this object to the TabControl (as ITabControlEvents, the actual type is irrelevant). 
The TabControl will call its sink's OnPageChange() method when the user selects a different tab. 
The application object will note this fact and upon application exit will store it, so on the next 
invocation of the application the UI state can be restored (at least the active tab page).</P>

<P>
<B>Resizing and Layout Management</B>
</P>

<P>
A control's position is specified as pixels from the top-left corner of its container. Suppose 
that we have a control that should be positioned 10 pixels from the right side of its host WinControl. 
Well, it's not extremely difficult to subtract some numbers and get the position in terms of pixels from 
the top-left corner. However, if the container is ever resized, the position must be recalculated. This 
applies to horizontal and vertical position separately and similarly if you want to stretch the control 
to cover its container or some portion of it. One way to do it is to implement an OnSize() method in 
interaction manager for every control that contains other controls and perform all the calculations. 
This is a tedious and error-prone maintenance nightmare, especially with complex GUIs that contain tens 
of nested controls. The framework can help here with the LayoutInfo structure that defines exactly how 
they should behave when their container control is resized. The LayoutInfo struct allows pretty sophisticated 
definitions like positioning in a fixed distance from another control, positioning using ratios (e.g. 30%) or 
centering. Also stretching may be defined as fixed difference from the size of a reference control or as a 
percentage. All these settings may be applied separately in the horizontal and vertical dimensions.
</P>

<P>
The big advantage is that this dynamic behavior can be specified at initialization time, preferably by 
reading some external configuration file, and should not burden the application developer.
</P>

<B>Summary</B>

<P>
This article describes a UI framework based on design principles that promote modularity, information hiding, 
ease of use and layered approach in order to conquer complexity. It introduces several design patterns that could be used 
in broader scopes than UI programming such as interface-based event propagation and single point of creation. 
It is implemented on top of the Win32 GDI primitives but there are only a few well-encapsulated classes that 
actually access the Win32 API. Most of the framework is implemented in terms of itself. The framework 
explicitly deviates from some traditional UI programming models such as extension by overriding virtual 
methods and the venerable MVC design pattern.
</P>




<P><BR/></P>

<!-- <IMG SRC="/i/m/the_gigi_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/> -->
By&#160;the_gigi<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/stat?c=member_profile&amp;cr=292607" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
      
<P><A HREF="/?&amp;t=features&amp;c=feat_topics" CLASS="bodyGeneric">Would you like to write a feature?</A></P>
						</TD></TR>                                                                 
					</TABLE>
		<P><BR/></P>
					</TD>
					<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
				</TR>   	
				<TR>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>	
				<TR>
					<TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>
			</TABLE>
		</TD>
	<!-- Center Column Ends -->
<!-- Body Area Ends -->

	<!-- Gutter -->
		<TD WIDTH="4" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	<!-- Right Column Begins -->
		<TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>       
<!-- Right Column Include Ends -->       
        </TD>
	<!-- Right Column Ends -->
	<!-- Gutter -->
		<TD WIDTH="10" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	</TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>

