<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - Help</title>

<jsp:include page="../script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="hs_how_to_compete"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="left" class="bodyText">
         <jsp:include page="../../page_title.jsp" >
         <jsp:param name="image" value="hs_support_faqs"/>
         <jsp:param name="title" value="How to Compete"/>
         </jsp:include>

        <h2>General TopCoder Arena Usage / Getting Started</h2>

        <a name="becomemember"></a>
      <p><span class="bodySubtitle">1 Become a TopCoder Member</span><br/>
      In order to log into the TopCoder Arena, you will need to be a TopCoder member.  If you have not already done so, you must first <A href="/reg/">register</A> on TopCoder's web site.  Once you register, you will be sent an activation email to the email address that you provided during the registration process.  As soon as you activate your account, you will be free to log into the TopCoder Arena using the handle and password that you've specified.
<%--
      <ul>
      <li>
        <a name="team"></a>
         <p><span class="bodySubtitle">1.1 Registering a Team</span><br/>
         Students will be able to compete either as an individual or as part of a team representing their school, or, in case they are not affiliated with a school, representing their town or themselves.  All students who register from a school will be part of that school's team.  Each school will have only one team.
      </li>
      <li>
        <a name="individual"></a>
         <p><span class="bodySubtitle">1.2 Registering as an Individual</span><br/>
         Students will be able to compete either as an individual or as part of a team representing their school, or, in case they are not affiliated with a school, representing their town or themselves.  Eligible students who do not attend a school can register to compete as an individual.  If only one student signs up from a school, that student will compete as an individual.
      </li>
      </ul>
--%>
      </p>
        <a name="whatisarena"></a>
      <p><span class="bodySubtitle">2 What is the TopCoder Arena?</span><br/>
      The TopCoder Arena is a pure Java application that can be run as either an Applet from within a browser, or as an application from within JWS (Java Web Start).  The Arena is where all of the competition action takes place.  It is where each coder can practice, compete, or spectate.
      </p>
        <a name="howtorun"></a>
      <p><span class="bodySubtitle">3 How to Run the TopCoder Arena</span><br/>
      
      <ul>
      <li>
        <a name="whatsoftware"></a>
         <p><span class="bodySubtitle">3.1 What software will you need to install?</span><br/>
         In order to run the TopCoder Arena, you will need to install a Java runtime environment that is at least version 1.4. Most browser software will recognize the existence of a Java runtime on your machine, and utilize the latest version in order to run the Arena as an applet. The latest version of the JRE (Java Runtime Environment) can be downloaded from <A href="http://java.sun.com/products/plugin/">Sun's website</A>. If you have the Sun 1.4 or 5.0 JRE or JDK installed on your machine, you already have the plug-in software installed. We recommend installing the JRE 1.4 environment, which is the most current version available. Once the plug-in (or the 1.4/5.0 environment) has been downloaded and installed, you will not need to perform these steps in the future. The download for the JRE version 1.4, which includes the plug-in software, is over 10MB. This means the download may take some time to complete. Remember, this download only needs to be completed once. Completing the previous steps will also satisfy all prerequisites in order to run the TopCoder Arena from within your browser. Installing the 1.4/5.0 Java Runtime will also allow you to run the TopCoder competition Arena from within Java Web Start. The TopCoder competition software exists as a signed .jar file, which will request full access to your local machine. This is so that certain elements of the Arena (i.e. cut and paste, writing to the local file system, etc.) will function properly.
      </li>
      <li>
        <a name="runningarena"></a>
         <p><span class="bodySubtitle">3.2 Running the TopCoder Arena as an Applet or by using Java Web Start</span><br/>
         Many TopCoder members prefer to run the TopCoder Arena as an application, rather than an Applet. In some cases, this can provide greater stability. Java Web Start (JWS) will facilitate this process, checking for new versions of the software each time the Arena is run. As long as JWS is properly configured on your machine, the arena will automatically launch via JWS.
      </li>
      <li>
        <a name="localfirewall"></a>
         <p><span class="bodySubtitle">3.3 Local Firewall and Network Considerations</span><br/>
         The following port access will be necessary in order to run the TopCoder Arena:
         <br/><br/>
         Outbound access to <A href="/">www.topcoder.com</A> on port 5001
         <br/><br/>
         While using HTTP Tunneling (see below), you will need access to arena.topcoder.com on port 80.
      </li>
      <li>
        <a name="httptunneling"></a>
         <p><span class="bodySubtitle">3.4 HTTP Tunneling</span><br/>
         While running on your machine, the TopCoder Arena will need to create a direct socket connection to the TopCoder competition server.  In order for this to function properly, your local networking environment must allow outbound TCP connections to <A href="/">www.topcoder.com</A> on port 5001.  Since port 5001 is a non-standard port, many firewalls will not allow this access.  If you do not have control over allowing this access, your only option will be to run the Arena utilizing HTTP tunneling.  By checking the HTTP Tunneling option on the Arena login screen, all network traffic to and from the TopCoder competition server will be wrapped as if it were standard HTTP traffic on a standard port (port 80).  This should resolve most firewall issues.  However, you should only utilize the tunneling option if it is necessary since the performance of the Arena will be significantly slower while the tunneling option is being utilized.
      </li>
      </ul>
        <a name="loggingin"></a>
      <p><span class="bodySubtitle">4 Logging in to the TopCoder Arena</span><br/>
      Once the TopCoder Arena launches, you will be presented with a login screen.  From here, you need simply type in your TopCoder handle and the password that you chose during the web site registration process.  Once you log in, you will initially be placed in the main chat lobby.  If you are already logged in and you log in from another location, your initial log in session will be disconnected.

        <a name="generalusage"></a>
      <p><span class="bodySubtitle">5 General Usage and the Various Lobbies</span><br/>
      Each room in the Arena has a chat interface to allow communication with others in the same room.  You can see who is in the room with you by checking the "Who's here" list in your room.  Each coder has a color associated with them, which is derived based on the rating/color key on the left side of the applet.  The circle next to each coder's handle represents how close they are to reaching the next rating color level.  The more full the circle, the higher their rating within their color group.  From anywhere in the Arena, you have the option to move to a different area of the Arena.  You can move to one of three types of rooms:  1) a lobby room, 2) a practice room, or 3) a competition room.  A lobby room is a place to chat with others who are logged in.  There is a special lobby room called the "Admin Lobby Room" that is used to communicate with the competition administrators.  Questions about the Arena usage and the problem statements can be asked in the Admin Lobby Room.  There are numerous practice rooms that contain problem sets that have been used in past competitions.  The practice rooms are a great place to become acclimated with the Arena interface and the competition structure.  The competition rooms only become available shortly before the start of a scheduled match or tournament.  The interface for the competition rooms is very similar to that of the practice rooms.

        <a name="chatting"></a>
      <p><span class="bodySubtitle">6 Chatting / Asking Questions</span><br/>
      In all rooms, there is a place to chat.  You can communicate with the others in the room by typing in the chat line at the bottom of the screen.  There are a number of features to make chatting easier.  Next to the chat line, you will find a box populated with a ">>".  Clicking on this box will expand your chat options and present two dropdown lists.  The first list represents the type of chat message, while the second contains a list of the handles of all coders currently in the room.

      <ul>
      <li>
        <a name="generalchat"></a>
         <p><span class="bodySubtitle">6.1 General Chat</span><br/>
         The most basic form of chat is the "General" chat, which will simply allow you to type in a message.  A general chat message will be sent to all of the coders currently in that room.  The general chat message type is equivalent to simply typing a message in the chat line without the chat feature box expanded.
      </li>
      <li>
        <a name="replyto"></a>
         <p><span class="bodySubtitle">6.2 ReplyTo</span><br/>
         When the chat gets busy in a specific room, it can be helpful to address a specific person with a chat message.  Using the "ReplyTo" feature in the expanded chat box will allow you to choose a handle to which the chat message will be directed.  A "ReplyTo" chat message is analogous to typing "[handle]: this is the message" on the chat line.  The advantage of this is that the recipient of the message will see your chat as a highlighted message, indicating that the message is intended for them.  A "ReplyTo" message will be seen by all coders who are currently in the room.
      </li>
      <li>
        <a name="whisper"></a>
         <p><span class="bodySubtitle">6.3 Whisper</span><br/>
         A whisper is a message that will be displayed only to the recipient - not any other coders in the room.  Choosing a whisper message type is the same as typing "/whisper [handle] this is the message" in the chat line.  "/msg" can also be used in place of "/whisper".  Whisper messages can also be used to communicate with coders who are in a different room than where you are.  Keep in mind that any TopCoder administrators (the orange handles) will also see any messages that are whispered at any time.
      </li>
      <li>
        <a name="admin"></a>
         <p><span class="bodySubtitle">6.4 Admin</span><br/>
         If at any time you have a question regarding the use of the Arena or, in the case of an active match or tournament, a question about the problems, you can use the "admins" message type.  An "admins" message type will show up on the screen of anyone in the Admin Lobby Room, regardless of where you are when you send the message.  This is convenient because you will not need to leave your competition room to query the administrators.  Typing "admins: this is my message" in the chat area, you can also send an "admins" message type.
      </li>
      <li>
        <a name="autochat"></a>
         <p><span class="bodySubtitle">6.5 Auto-Enhanced Chat</span><br/>
         By default, you will have access to the auto-enhanced chat functionality.  With auto-enhanced chat turned on, you will notice that when any message type is directed at a specific coder, it will default to that same message type and coder for subsequent messages.  This makes it easy to hold a conversion with another coder without typing their handle each time you would like to reply.  Auto-enhanced chat can be disabled from the Options menu at any time.  
      </li>
      <li>
        <a name="emoting"></a>
         <p><span class="bodySubtitle">6.6 Emoting</span><br/>
         On occasion, you may find it useful to convey an emotion in the chat area in the third person.  Any time the string "/me" appears as the first part of a chat message, the "/me" will be replaced with your TopCoder handle and the message will appear to all users in italics.  (i.e. "/me is very happy")
      </li>
      </ul>

        <a name="othermembers"></a>
      <p><span class="bodySubtitle">7 Other Members in the Arena</span><br/>

      <ul>
      <li>
        <a name="getinfo"></a>
         <p><span class="bodySubtitle">7.1 Getting Information about another Member</span><br/>
         There are a number of places in the Arena where the handles of other TopCoder members appear.  In most cases, you can double-click on any of the handles to get extra information about that member.  The information provided includes the member's rating, how many events they've participated in, how long they've been a member, and their member quote from their profile.  You may also type "/whois [handle]" in any chat input to achieve the same results.
      </li>
      <li>
        <a name="findmember"></a>
         <p><span class="bodySubtitle">7.2 Finding Another Member</span><br/>
         Using the "Search" feature under the "Main Menu" will allow you to enter a member's handle in order to find out if they are currently logged into the Arena, and if so what room they are in.  If the member is in fact currently logged in, you will be given the option of moving directly to the room they are in - without it being necessary to use the menus to navigate. You may also use "/find handle" to locate another member in the Arena.   

         If you wish to locate the assigned room for a given competitor - regardless of whether they are actually in that room, you have the option to use "/room handle" for information on that competitors assigned competition room.
      </li>
      <li>
        <a name="seemembers"></a>
         <p><span class="bodySubtitle">7.3 Seeing Who's in the Arena</span><br/>
         The "Active Users" menu option under the "Main Menu" will provide you with a list of all TopCoder members who are currently logged in to the Arena.  You may sort the resultant list by either TopCoder handle or by rating by clicking on the column headings.  In addition, by right clicking on any of the handles in this list you will have the option to either perform a search for that member or retrieve information for that member.
      </li>
      </ul>

        <a name="movingaround"></a>
      <p><span class="bodySubtitle">8 Moving Around</span><br/>
      You may move around the Arena by using the menus at the top of the Arena.  The "Lobbies" menu will allow you to switch between the various lobbies, the "Practice Rooms" menu provides navigation between the many practice rooms that are available, and the "Active Contests" menu will allow you to move to the various rooms of a specific match or tournament that is being run.  When you first log in, you will automatically be placed into the "Chat Room 1" lobby.  From there you can move to any of the other rooms in the Arena.

        <a name="leaderboard"></a>
      <p><span class="bodySubtitle">9 The Leader Board</span><br/>
      During times when there is at least one TopCoder event taking place in the Arena, you can get an overview of the action by clicking on the "Leader Board" button on the left side of the Arena.  The leader board window contains a list of all rooms for a given event along with the current leader in each room.  Additional information for each room includes 1) the room number, 2) the seed (expected room placement) of the current leader, and 3) the current point total for the leader.  If there are multiple events taking place, you can switch the leader board to a different event using the "Rounds" drop-down list at the bottom of the leader board window.  Clicking on any of the column headings in the leader board will sort the list by the information in the column that was clicked.  
      <br/><br/>
      In addition, you have the option of "drilling in" to any of the rooms by double clicking on any of the individual rooms listed in the leader board.  Drilling into a room will open the <A href="/tc?module=Static&d1=hs&d2=support&d3=roomSummary">Room Summary Window</A>, which will display each member who is competing in that room, along with their current point totals and status for each of the problems.  
      <br/><br/>
      Click here for additional information on the functionality in the <A href="/tc?module=Static&d1=hs&d2=support&d3=roomSummary">Room Summary Window</A>.
      </p>

         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="tchs"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
