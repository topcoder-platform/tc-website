package com.topcoder.mpsqas.mapplet.messaging;

import com.topcoder.mpsqas.common.*;
import com.topcoder.mpsqas.mapplet.MainApplet;
import com.topcoder.mpsqas.mapplet.rooms.*;

import java.util.ArrayList;

/**
 *  InputProcessor
 *
 *  This class processes all input from the server and sends tasks to the
 *  applet interface accordingly.
 *
 *  @author mitalub
 */
public class InputProcessor {
    /**
     * The constructor sets up the InputProcessor by storing a handle to the MainApplet
     *
     * @param ma  A handle to the MainApplet
     */
    public InputProcessor(MainApplet ma) {
        mainApplet = ma;
    }

    /**
     * processObject looks at the type of Object which came from the server and
     * sends the data to the correct place in the applet for handling.
     *
     * @param obj   The Object from the server.
     */
    public void processObject(Object obj) {
        ArrayList data = (ArrayList) obj;
        int type = ((Integer) data.remove(0)).intValue();
        switch (type) {
            case MessageTypes.LOGIN_RS:
                login(data);
                break;
            case MessageTypes.MOVE_RS:
                move(data);
                break;
            case MessageTypes.CHAT_RS:
                chat(data);
                break;
            case MessageTypes.RETURN_RESULTS_RS:
                returnResults(data);
                break;
            case MessageTypes.NEW_USER_LIST_RS:
                newUserList(data);
                break;
            case MessageTypes.NEW_CORRESPONDENCE_RS:
                newCorrespondence(data);
                break;
            case MessageTypes.NEW_ROUND_SCHEDULE_RS:
                newRoundSchedule(data);
                break;
            case MessageTypes.NEW_PENDING_SUBMISSION_RS:
            case MessageTypes.NEW_PENDING_PROPOSAL_RS:
                newPending(data, type == MessageTypes.NEW_PENDING_PROPOSAL_RS);
                break;
            case MessageTypes.PROBLEM_MODIFIED_RS:
                problemModified(data);
                break;
            case MessageTypes.NEW_PENDING_APPLICATION_RS:
                newApplicationTable(data);
                break;
            case MessageTypes.UPDATE_STATUS_RS:
                updateStatus(data);
                break;
            case MessageTypes.PING_RS:
                ping();
                break;
            default:
                System.out.println("Got bad response type: " + type);
        }
    }

    /**
     * login handles login data from the server.  It gets a handle on the login room
     * from the MainApplet and calls methods in the login room to report the error,
     * or prepare to move to the MainRoom.
     *
     * @param data[0]   Boolean indicating if login was sucessful
     * @param data[1]   String that is error, if login unsuccesful
     */
    private void login(ArrayList data) {
        if (mainApplet.getCurrentRoomType() != MessageTypes.LOGIN_ROOM)
            return;
        LoginRoom lr = (LoginRoom) mainApplet.getCurrentRoom();
        if (((Boolean) data.remove(0)).booleanValue()) {
            mainApplet.loadMovingRoom();
            mainApplet.setAdmin(((Boolean) data.remove(0)).booleanValue());
        } else {
            lr.makeLoginError((String) data.remove(0));
        }
    }

    /**
     * move handles move data from the server.  It calls the MainApplet to
     * move with the data passed.
     *
     * @param data[0]    The room type to move to
     * @param data[1..]  Information about the move from the server
     */
    private void move(ArrayList data) {
        mainApplet.move(((Integer) data.remove(0)).intValue(), (ArrayList) data.remove(0));
    }

    /**
     * chat handles chat data from the server.  It gets the chat window from the RoomHolder
     * and adds the messsage to the end.
     *
     * @param data[0]   The message to add.
     */
    private void chat(ArrayList data) {
        if (mainApplet.getCurrentRoomType() == MessageTypes.VIEW_CONTEST_ROOM) {
            ViewContestRoom vcr = (ViewContestRoom) mainApplet.getCurrentRoom();
            vcr.addChat((String) data.get(0));
        } else if (mainApplet.getCurrentRoomType() == MessageTypes.VIEW_PROBLEM_ROOM) {
            ViewProblemRoom vcr = (ViewProblemRoom) mainApplet.getCurrentRoom();
            vcr.addChat((String) data.get(0));
        } else {
            return;
        }
    }

    /**
     * Handles a RETURN_RESULTS_RS response from the server by calling the MainApplet
     * to do a pop up and by updating that status
     *
     * @param data[0]  The message to pop up.
     * @param data[1]  The message to put for the status.
     * @param data[2]  Urgent status
     */
    private void returnResults(ArrayList data) {
        mainApplet.popUp((String) data.remove(0));
        updateStatus(data);
    }

    /**
     * Handles a NEW_USER_LIST_RS by updating the user list in the ViewContestRoom.
     *
     * @param data[0] The new user list.
     */
    private void newUserList(ArrayList data) {
        if (mainApplet.getCurrentRoomType() == MessageTypes.VIEW_CONTEST_ROOM) {
            ViewContestRoom vcp = (ViewContestRoom) mainApplet.getCurrentRoom();
            vcp.setUserList((ArrayList) data.get(0));
        } else if (mainApplet.getCurrentRoomType() == MessageTypes.VIEW_PROBLEM_ROOM) {
            ViewProblemRoom vcp = (ViewProblemRoom) mainApplet.getCurrentRoom();
            vcp.setUserList((ArrayList) data.get(0));
        } else {
            return;
        }
        mainApplet.getStatusBox().appendMessage("Updated User List!", true);
    }

    /**
     * Processes a NEW_CORRESPONDENCE_RS from the server by calling the ViewProblemRoom
     * and adding the correspondence
     * message to the list.
     */
    private void newCorrespondence(ArrayList data) {
        if (mainApplet.getCurrentRoomType() == MessageTypes.VIEW_PROBLEM_ROOM) {
            ViewProblemRoom vpr = (ViewProblemRoom) mainApplet.getCurrentRoom();
            vpr.addCorrespondence((Correspondence) data.get(0));
        }
    }

    /**
     * Calls a ViewContestRoom to update the round it is displaying.
     *
     * @param data ArrayList containing the new round information.
     */
    private void newRoundSchedule(ArrayList data) {
        if (mainApplet.getCurrentRoomType() == MessageTypes.VIEW_CONTEST_ROOM) {
            ViewContestRoom vcp = (ViewContestRoom) mainApplet.getCurrentRoom();
            vcp.updateSchedule((ContestInformation) data.get(0));
        }
    }

    /**
     * Calls a PENDING_APPROVAL_ROOM to add a problem to either the pending proposal or
     * pending submission table.
     *
     * @param data[0] ArrayList containing the new problem info.
     * @param isProposal True if new proposal, false if new submission
     */
    private void newPending(ArrayList data, boolean isProposal) {
        if (mainApplet.getCurrentRoomType() == MessageTypes.PENDING_APPROVAL_ROOM) {
            PendingApprovalRoom par = (PendingApprovalRoom) mainApplet.getCurrentRoom();

            if (isProposal) {
                par.addProposal((ArrayList) data.get(0));
            } else {
                par.addSubmission((ArrayList) data.get(0));
            }
        }
    }

    /**
     * Tells the ViewProblemRoom to not allow any broadcasts until the room is reloaded.
     *
     * @param data[0] The message.
     */
    private void problemModified(ArrayList data) {
        if (mainApplet.getCurrentRoomType() == MessageTypes.VIEW_PROBLEM_ROOM) {
            ViewProblemRoom vpr = (ViewProblemRoom) mainApplet.getCurrentRoom();
            vpr.problemWasModified((String) data.get(0));
        }
    }

    /**
     * Updates the list of pending applications in the application table.
     *
     * @param data[0] A new ArrayList of application info
     */
    private void newApplicationTable(ArrayList data) {
        if (mainApplet.getCurrentRoomType() == MessageTypes.MAIN_APPLICATION_ROOM) {
            MainApplicationRoom var = (MainApplicationRoom) mainApplet.getCurrentRoom();
            var.updateApplications((ArrayList) data.get(0));
        }
    }

    /**
     * Updates the status message in the current room.
     *
     * @param data[0] The message to disply
     * @param data[1] If true, the message is urgent, if false or not present,
     *                the message is not urgent
     */
    private void updateStatus(ArrayList data) {
        if (data.size() == 2) {
            mainApplet.getStatusBox().appendMessage((String) data.get(0),
                    ((Boolean) data.get(1)).booleanValue());
        } else {
            mainApplet.getStatusBox().appendMessage((String) data.get(0), false);
        }
    }

    /**
     * Processes a PING_RS by sending a PING_RQ to the server.
     */
    private void ping() {
        ArrayList ping = new ArrayList();
        ping.add(new Integer(MessageTypes.PING_RQ));
        mainApplet.sendToServer(ping);
    }

    /**
     * shutDown is called when the connection to the server is lost.  It calls the
     * mainApplet to shut everything down.
     */
    public void shutDown() {
        mainApplet.kill();
    }

    private MainApplet mainApplet;  //a handle on the MainApplet
}
