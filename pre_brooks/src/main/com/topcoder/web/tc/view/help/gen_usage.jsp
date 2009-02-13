<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - Help</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="help"/>
                <jsp:param name="level2" value="index"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="left" class="bodyText">
        <img src="/i/clear.gif" alt="" width="1" height="10" border="0" /><br/>
        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="help"/>  
           <jsp:param name="image1" value="white"/>  
           <jsp:param name="title" value="Competition Manual"/>  
        </jsp:include>

        <h2>General TopCoder Arena Usage</h2>
        
        <a name="gen_usage"></a>
        <p><span class="bodySubtitle">General Arena Usage</span><br/>
        Each room in the Arena has a chat interface to allow communication with others in the same room.  You can see 
        who is in the room with you by checking the "Who's here" list in your room.  Each coder has a color associated with 
        them, which is derived based on the rating/color key on the left side of the applet.  The circle next to each coder's 
        handle represents how close they are to reaching the next rating color level.  The more full the circle, the higher their 
        rating within their color group.  From anywhere in the Arena, you have the option to move to a different area of the Arena.  
        You can move to one of three types of rooms:  1) a lobby room, 2) a practice room, or 3) a competition room.  A lobby 
        room is a place to chat with others who are logged in.  There is a special lobby room called the "Admin Lobby Room" 
        that is used to communicate with the competition administrators.  Questions about the Arena usage and the problem 
        statements can be asked in the Admin Lobby Room.  There are numerous practice rooms that contain problem sets 
        that have been used in past competitions.  The practice rooms are a great place to become acclimated with the Arena 
        interface and the competition structure.  The competition rooms only become available shortly before the start of a 
        scheduled match or tournament.  The interface for the competition rooms is very similar to that of the practice rooms.
        </p>
        
        <a name="chatting"></a>
        <p><span class="bodySubtitle">Chatting / Asking Questions</span><br/>
        In all rooms, there is a place to chat.  You can communicate with the others in the room by typing in the chat line at the 
        bottom of the screen.  There are a number of features to make chatting easier.  Next to the chat line, you will find a box 
        populated with a ">>".  Clicking on this box will expand your chat options and present two dropdown lists.  The first list 
        represents the type of chat message, while the second contains a list of the handles of all coders currently in the room.
        </p>
        
        <ul>
        <li>        
        <a name="gen_chat"></a><span class="bodySubtitle">General Chat</span> - 
        The most basic form of chat is the "General" chat, which will simply allow you to type in a message.  A general chat 
        message will be sent to all of the coders currently in that room.  The general chat message type is equivalent to simply 
        typing a message in the chat line without the chat feature box expanded.
        </li>
        <li>
        <a name="replyto"></a><span class="bodySubtitle">ReplyTo</span> - 
        When the chat gets busy in a specific room, it can be helpful to address a specific person with a chat message.  Using the "ReplyTo" feature in the expanded chat box will allow you to choose a handle to which the chat message will be directed.  A "ReplyTo" chat message is analogous to typing "[handle]: this is the message" on the chat line.  The advantage of this is that the recipient of the message will see your chat as a highlighted message, indicating that the message is intended for them.  A "ReplyTo" message will be seen by all coders who are currently in the room.
        </li>
        <li>
        <a name="whisper"></a><span class="bodySubtitle">Whisper</span> - 
        A whisper is a message that will be displayed only to the recipient - not any other coders in the room.  Choosing a whisper message type is the same as typing "/whisper [handle] this is the message" in the chat line.  "/msg" can also be used in place of "/whisper".  Whisper messages can also be used to communicate with coders who are in a different room than where you are.  Keep in mind that any TopCoder administrators (the orange handles) will also see any messages that are whispered at any time.
        </li>
        <li>
        <a name="admin"></a><span class="bodySubtitle">Admin</span> - 
        If at any time you have a question regarding the use of the Arena or, in the case of an active match or tournament, a question about the problems, you can use the "admins" message type.  An "admins" message type will show up on the screen of anyone in the Admin Lobby Room, regardless of where you are when you send the message.  This is convenient because you will not need to leave your competition room to query the administrators.  Typing "admins: this is my message" in the chat area, you can also send an "admins" message type.
        </li>
        <li>        
        <a name="enhanced"></a><span class="bodySubtitle">Auto-Enhanced Chat</span> - 
        By default, you will have access to the auto-enhanced chat functionality.  With auto-enhanced chat turned on, you will notice that when any message type is directed at a specific coder, it will default to that same message type and coder for subsequent messages.  This makes it easy to hold a conversion with another coder without typing their handle each time you would like to reply.  Auto-enhanced chat can be disabled from the Options menu at any time.  
        </li>
        <li>
        <a name="emoting"></a><span class="bodySubtitle">Emoting</span> - 
        On occasion, you may find it useful to convey an emotion in the chat area in the third person.  Any time the string "/me" appears as the first part of a chat message, the "/me" will be replaced with your TopCoder handle and the message will appear to all users in italics.  (i.e. "/me is very happy")
        </li>
        </ul>
        
        <p><a name="other_members"></a><span class="bodySubtitle">Other Members in the Arena</span></p>

        <ul>
        <li>
        <a name="member_info"></a><span class="bodySubtitle">Getting Information about another Member</span> - 
        There are a number of places in the Arena where the handles of other TopCoder members appear.  In most cases, you can double-click on any of the handles to get extra information about that member.  The information provided includes the member's rating, how many events they've participated in, how long they've been a member, and their member quote from their profile.  You may also type "/whois [handle]" in any chat input to achieve the same results.
        
        </li>
        <li>
        <a name="member_find"></a><span class="bodySubtitle">Finding Another Member</span> - 
        Using the "Search" feature under the "Main Menu" will allow you to enter a member's handle in order to find out if they are currently logged into the Arena, and if so what room they are in.  If the member is in fact currently logged in, you will be given the option of moving directly to the room they are in - without it being necessary to use the menus to navigate.
        
        </li>
        <li>
        <a name="in_arena"></a><span class="bodySubtitle">Seeing Who's in the Arena</span> - 
        The "Active Users" menu option under the "Main Menu" will provide you with a list of all TopCoder members who are currently logged in to the Arena.  You may sort the resultant list by either TopCoder handle or by rating by clicking on the column headings.  In addition, by right clicking on any of the handles in this list you will have the option to either perform a search for that member or retrieve information for that member.
        
        </li>
        <li>
        <a name="moving"></a><span class="bodySubtitle">Moving Around</span> - 
        You may move around the Arena by using the menus at the top of the Arena.  The "Lobbies" menu will allow you to switch between the various lobbies, the "Practice Rooms" menu provides navigation between the many practice rooms that are available, and the "Active Contests" menu will allow you to move to the various rooms of a specific match or tournament that is being run.  When you first log in, you will automatically be placed into the "Chat Room 1" lobby.  From there you can move to any of the other rooms in the Arena.
        
        </li>
        <li>
        <a name="leader_board"></a><span class="bodySubtitle">The Leader Board</span> - 
        During times when there is at least one TopCoder event taking place in the Arena, you can get an overview of the action by clicking on the "Leader Board" button on the left side of the Arena.  The leader board window contains a list of all rooms for a given event along with the current leader in each room.  Additional information for each room includes 1) the room number, 2) the seed (expected room placement) of the current leader, and 3) the current point total for the leader.  If there are multiple events taking place, you can switch the leader board to a different event using the "Rounds" drop-down list at the bottom of the leader board window.  Clicking on any of the column headings in the leader board will sort the list by the information in the column that was clicked.<br/><br/>
        In addition, you have the option of "drilling in" to any of the rooms by double clicking on any of the individual rooms listed in the leader board.  Drilling into a room will open the "Room Summary" window, which will display each member who is competing in that room, along with their current point totals and status for each of the problems.<br/><br/>
        Click here for additional information on the functionality in the room summary window.
        
        </li>
        </ul>

        <p><a name="messages"></a><span class="bodySubtitle">Messages</span><br/>
        On occasion, during a TopCoder rated event, we will need to provide some of the participants with additional information about the problem statements.  These types of announcements usually come in the form of problem statement clarifications.  There are three types of administrative messages: General messages, round messages, and problem messages.  The general messages will be sent to all members who are logged in to the Arena at the time of the message, round messages will go to all members who are registered for a given match (or tournament round), and the problem messages (specific to a given problem) will be sent to those who are affected by that problem.  By default, a message will immediately show up on your screen as a pop-up window when it is sent.  However, if you have configured the Arena to disable broadcast pop-ups, the "Messages" button will blink upon receipt of a new message.  Clicking the "Messages" button will open the messages window that contains all of the recent messages that have been sent.  Double clicking on an individual message will allow you to read the full text of the message.  It is a good idea to check the messages each time you log in, especially if you are in the middle of a competition, to make sure that you did not miss any important messages while you were logged out.</p>


        
         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

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
