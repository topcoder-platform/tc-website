package com.topcoder.mpsqas.appletmanager;

import com.topcoder.ejb.MPSQASServices.MPSQASServices;
import com.topcoder.ejb.MPSQASServices.MPSQASServicesHome;
import com.topcoder.mpsqas.common.*;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;

import javax.naming.Context;
import java.util.ArrayList;

/**
 * CommunicationProcessor is responsable for processing information
 * from the client and preparing information to send to the client.
 *
 * @author mitalub
 *
 */
public class CommunicationProcessor {
    private static Logger log = Logger.getLogger(CommunicationProcessor.class);

    /**
     * The constructor sets up the Communication Processor and a connection
     * to the beans.
     *
     * @param conn The ClientConnection for the client.
     * @param id The connection id for the client.
     * @param map A handle on the MainAppletProcessor.
     *
     */
    public CommunicationProcessor(ClientConnection conn, int id,
                                  MainAppletProcessor map) {
        log.info("Creating CommunicationProcessor for " + id);
        clientConnection = conn;
        mainAppletProcessor = map;
        connectionId = id;
        userId = -1;
        currentRoomType = MessageTypes.LOGIN_ROOM;
        roomTypeHistory = new ArrayList();
        roomIdHistory = new ArrayList();
        roomRelativeIndex = -1;
        try {
            Context ctx = TCContext.getInitial();
            mpsqasHome = (MPSQASServicesHome) ctx.lookup(
                    ApplicationServer.MPSQAS_SERVICES);
        } catch (Exception e) {
            log.error("CommunicationProcessor couldn't get the bean.");
            e.printStackTrace();
        }
    }

    /**
     * Removes the user from the MainAppletProcessor
     */
    public void kill() {
        if (userId >= 0) mainAppletProcessor.removeUser(connectionId);
    }

    /**
     * processInputObject receives an Object from the client and sends the Object
     * to the correct method for handling.
     *
     * param o The Object to process.
     *
     */
    public void processInputObject(Object o) {
        ArrayList data = (ArrayList) o;
        int type = ((Integer) data.remove(0)).intValue();
        try {
            switch (type) {
                case MessageTypes.LOGIN_RQ:
                    log.debug("Received LOGIN_RQ from " + data.get(0));
                    login((String) data.get(0), (String) data.get(1));
                    break;
                case MessageTypes.MOVE_RQ:
                    log.debug("Received MOVE_RQ from " + userName);
                    if (data.size() == 1) {
                        move(((Integer) data.get(0)).intValue(), -1, true);
                    } else {
                        move(((Integer) data.get(0)).intValue(),
                                ((Integer) data.get(1)).intValue(), true);
                    }
                    break;
                case MessageTypes.RELATIVE_MOVE_RQ:
                    log.debug("Got RELATIVE_MOVE_RQ from " + userName);
                    moveRelative(((Integer) data.get(0)).intValue());
                    break;
                case MessageTypes.PROPOSAL_RQ:
                    log.debug("Received PROPOSAL_RQ from " + userName);
                    saveProposal((ProblemInformation) data.get(0));
                    break;
                case MessageTypes.SUBMIT_PROBLEM_RQ:
                    log.debug("Got SUBMIT_PROBLEM_RQ from " + userName);
                    saveProblem((ProblemInformation) data.get(0));
                    break;
                case MessageTypes.SUBMIT_PROBLEM_STATEMENT_RQ:
                    log.debug("Got SUBMIT_PROBLEM_STATEMENT_RQ from " + userName);
                    saveProblemStatement((String) data.get(0));
                    break;
                case MessageTypes.ADMIN_SAVE_PROBLEM_RQ:
                    log.debug("Got ADMIN_SAVE_PROBLEM_RQ from " + userName);
                    saveAdminProblemInformation((ProblemInformation) data.get(0));
                    break;
                case MessageTypes.PENDING_REPLY_RQ:
                    log.debug("Recieved PROPOSAL_REPLY_RQ from " + userName);
                    processPendingReply(((Boolean) data.get(0)).booleanValue(), (String) data.get(1));
                    break;
                case MessageTypes.SEND_CORRESPONDENCE_RQ:
                    log.debug("Recieved SEND_CORRESPONDENCE_RQ from " + userName);
                    sendCorrespondence((Correspondence) data.get(0));
                    break;
                case MessageTypes.COMPILE_RQ:
                    log.debug("Got COMPILE_RQ from " + userName);
                    compile((ProblemInformation) data.get(0));
                    break;
                case MessageTypes.TEST_RQ:
                    log.debug("Got TEST_RQ from " + userName);
                    test((Object[]) data.get(0), ((Integer) data.get(1)).intValue());
                    break;
                case MessageTypes.COMPARE_SOLUTIONS_RQ:
                    log.debug("Got COMPARE_SOLUTIONS_RQ from " + userName);
                    compareSolutions();
                    break;
                case MessageTypes.SUBMIT_APPLICATION_RQ:
                    log.debug("Got SUBMIT_APPLICATION_RQ from " + userName);
                    submitApplication((String) data.get(0));
                    break;
                case MessageTypes.APPLICATION_REPLY_RQ:
                    log.debug("Got APPLICATION_REPLY_RQ from " + userName);
                    processApplicationReply(((Boolean) data.get(0)).booleanValue(),
                            (String) data.get(1));
                    break;
                case MessageTypes.SCHEDULE_PROBLEMS_RQ:
                    log.debug("Got SCHEDULE_PROBLEMS_RQ from " + userName);
                    saveContestProblems((ArrayList) data.get(0));
                    break;
                case MessageTypes.CONTEST_VERIFY_RQ:
                    log.debug("Got CONTEST_VERIFY_RQ from " + userName);
                    verifyContest();
                    break;
                case MessageTypes.SUBMIT_PAYMENT_RQ:
                    log.debug("Got SUBMIT_PAYMENT_RQ from " + userName);
                    recordPayment((ArrayList) data.get(0));
                    break;
                case MessageTypes.CHAT_RQ:
                    //log.debug("Received CHAT_RQ from "+userName);
                    chat((String) data.get(0));
                    break;
                case MessageTypes.CHAT_HISTORY_RQ:
                    log.debug("Got CONTEST_HISTORY_RQ from " + userName);
                    getChatHistory();
                    break;
                case MessageTypes.PING_RQ:
                    //log.debug("Got PING_RQ from "+userName);
                    //don't do anything, just for keeping connection alive
                    break;
                default:
                    log.debug("Received unrecognized: " + type);
            }
        } catch (Exception e) {
            log.error("Error processing input object for " + userName);
            e.printStackTrace();
            ArrayList errorResponse = new ArrayList(3);
            errorResponse.add(new Integer(MessageTypes.UPDATE_STATUS_RS));
            errorResponse.add(ApplicationConstants.SERVER_ERROR);
            errorResponse.add(new Boolean(true));
            sendToClient(errorResponse);
        }
    }


    /**
     * Receives an Object for handling from the
     * MainAppletProcessor, processes the Object, if necessary and sends it to
     * the applet.
     *
     * @param type    The type of response
     * @param data    The response dataa
     */
    public void processOutputObject(int type, Object data) {
        //for cloning, so each person receiving broadcast gets his own copy
        ArrayList tempData;

        switch (type) {
            case MessageTypes.CHAT_RS:
            case MessageTypes.NEW_USER_LIST_RS:
            case MessageTypes.NEW_CORRESPONDENCE_RS:
            case MessageTypes.PING_RS:
            case MessageTypes.NEW_PENDING_PROPOSAL_RS:
            case MessageTypes.NEW_PENDING_SUBMISSION_RS:
            case MessageTypes.NEW_PENDING_APPLICATION_RS:
                sendToClient((ArrayList) data);
                break;
            case MessageTypes.NEW_ROUND_SCHEDULE_RS:
                processNewRoundSchedule((ArrayList) data);
                break;
            case MessageTypes.PROBLEM_MODIFIED_RS:
                allowProblemSubmission = false;
                sendToClient((ArrayList) data);
                break;
            default:
                log.debug("Received unrecognized processOutputObject type: " + type);
        }
    }

    /**
     * login attempts to login a user by calling the MPSQASServicesBean
     * If the login is unsucessful, an error is returned to the client.
     * Otherwise, information regarding the client's state is returned and
     * information about the user is stored in this file
     *
     * @param handle   Handle of person trying to log in.
     * @param password Password of person trying to log in.
     */
    private void login(String handle, String password) {
        ArrayList data = null;
        try {
            data = createBean().authenticateUser(handle, password);
            //data[0]=Boolean success
            //data[1]=String Error Message OR Integer user id
            //data[2]=                        Boolean isAdmin
            //data[3]=                        Boolean isWriter
            //data[4]=                        Boolean isTester
        } catch (Exception e) {
            data = new ArrayList(2);
            data.add(new Boolean(false));
            data.add(ApplicationConstants.SERVER_ERROR);
            log.error("Exception authenticating user:");
            e.printStackTrace();
        }

        ArrayList loginResponse = new ArrayList(4);
        loginResponse.add(new Integer(MessageTypes.LOGIN_RS));
        loginResponse.add(data.get(0));
        if (((Boolean) data.get(0)).booleanValue()) {
            userName = handle;
            userId = ((Integer) data.get(1)).intValue();
            isAdmin = ((Boolean) data.get(2)).booleanValue();
            isWriter = ((Boolean) data.get(3)).booleanValue();
            isTester = ((Boolean) data.get(4)).booleanValue();
            loginResponse.add(new Boolean(isAdmin));
            sendToClient(loginResponse);
            mainAppletProcessor.addUser(connectionId, this, userName);
            move(MessageTypes.FOYER_ROOM, -1, true);
        } else {
            String error = (String) data.get(1);
            loginResponse.add(error);
            sendToClient(loginResponse);
        }
    }

    /**
     * Moves a user to a room by sending the applet information about the new
     *
     * @param roomType The type of room to which the user is moving.
     * @param id The id (round, coder, ... ) of the room to which user is moving,
     *           or -1 if no applicable id.  The type of id is determined by the
     *           room type.
     * @param record If true, the room is added to the history.
     */
    private void move(int roomType, int id, boolean record) {
        ArrayList moveData = new ArrayList(3);
        ArrayList moveResponse = new ArrayList(3);
        moveResponse.add(new Integer(MessageTypes.MOVE_RS));
        moveResponse.add(new Integer(roomType));
        try {
            switch (roomType) {
                //----------------------------------------------------------
                case MessageTypes.PROPOSAL_ROOM: //id = n.a.
                    if (!isWriter) {
                        moveResponse.set(1, new Integer(MessageTypes.FOYER_ROOM));
                        moveData.add("You must be a writer to propose a problem.  " +
                                "Please fill out an application.");
                    }
                    break;

                    //----------------------------------------------------------
                case MessageTypes.FOYER_ROOM: //id = n.a.
                    moveData.add("Choose an option from the menus above.");
                    moveData.add(createBean().getUnreadCorrespondence(userId));
                    break;

                    //----------------------------------------------------------
                case MessageTypes.PENDING_APPROVAL_ROOM: //id = n.a.
                    if (!isAdmin) return;

                    ArrayList proposalData = createBean().getProblems(
                            ApplicationConstants.PROBLEMS_WITH_STATUS,
                            MessageTypes.PROPOSAL_PENDING_APPROVAL);
                    if (proposalData == null) {
                        throw new Exception("Null data from bean.");
                    }
                    moveData.add(proposalData);

                    ArrayList submissionData = createBean().getProblems(
                            ApplicationConstants.PROBLEMS_WITH_STATUS,
                            MessageTypes.SUBMISSION_PENDING_APPROVAL);
                    if (submissionData == null) {
                        throw new NullPointerException("Null data from bean.");
                    }
                    moveData.add(submissionData);
                    break;

                    //----------------------------------------------------------
                case MessageTypes.MAIN_PROBLEM_ROOM: //id = ALL_PROBLEMS, all problems, else user problems
                    ArrayList writingProblems = null;
                    ArrayList testingProblems = null;
                    if (id == MessageTypes.ALL_PROBLEMS && isAdmin) {
                        moveData.add(new Boolean(false));
                        moveData.add(new Boolean(true));
                        testingProblems = createBean().getProblems(ApplicationConstants.ALL_PROBLEMS, -1);
                        if (testingProblems == null) {
                            throw new NullPointerException("Null data from bean.");
                        }
                    } else {
                        moveData.add(new Boolean(isWriter));
                        moveData.add(new Boolean(isTester));
                        if (isWriter) {
                            writingProblems = createBean().getProblems(
                                    ApplicationConstants.USER_WRITTEN_PROBLEMS
                                    , userId);
                            if (writingProblems == null) {
                                throw new NullPointerException("Null data from bean.");
                            }
                        }
                        if (isTester) {
                            testingProblems = createBean().getProblems(
                                    ApplicationConstants.USER_TESTING_PROBLEMS
                                    , userId);
                            if (testingProblems == null) {
                                throw new NullPointerException("Null data from bean.");
                            }
                        }
                    }

                    moveData.add(writingProblems);
                    moveData.add(testingProblems);
                    break;

                    //----------------------------------------------------------
                case MessageTypes.UPCOMING_CONTESTS_ROOM: //id = n.a.
                    ArrayList upcomingContests = createBean().getContests(userId);
                    moveData.add(upcomingContests);
                    break;

                    //----------------------------------------------------------
                case MessageTypes.MAIN_APPLICATION_ROOM:  //id = n.a.
                    if (isAdmin) {
                        ArrayList appData = createBean().getPendingApplications();
                        if (appData == null) {
                            throw new Exception("Null data from bean.");
                        }
                        moveData.add(appData);
                    }
                    break;

                    //----------------------------------------------------------
                case MessageTypes.MAIN_USER_ROOM:  //id = n.a.
                    if (isAdmin) {
                        ArrayList users = createBean().getUsers(
                                ApplicationConstants.ALL_USERS, -1);
                        if (users == null) {
                            throw new NullPointerException("Null data from bean.");
                        }
                        moveData.add(users);
                        currentRoomType = MessageTypes.MAIN_USER_ROOM;
                    }
                    break;

                    //----------------------------------------------------------
                case MessageTypes.VIEW_PROBLEM_ROOM:
                    //XXX:
                    //|id| = problem id
                    //id > 0, editable,
                    //id < 0, admin approval, not editable
                    log.debug("Viewing problem_id = " + id);
                    if (id > 0) {
                        currentViewProblemId = id;
                        ProblemInformation problemInformation =
                                createBean().getProblemInformation(id, userId);

                        ArrayList panels = new ArrayList(5);
                        panels.add(new Integer(MessageTypes.PROBLEM_STATEMENT_PANEL));
                        if (problemInformation.getStatus() >= MessageTypes.PROPOSAL_APPROVED) {
                            panels.add(new Integer(MessageTypes.SOLUTION_PANEL));
                            panels.add(new Integer(MessageTypes.ALL_SOLUTION_PANEL));
                            panels.add(new Integer(MessageTypes.TEST_CASES_PANEL));
                        }
                        panels.add(new Integer(MessageTypes.CHAT_PANEL));
                        panels.add(new Integer(MessageTypes.CORRESPONDENCE_PANEL));
                        if (isAdmin) {
                            panels.add(new Integer(MessageTypes.ADMIN_PROBLEM_PANEL));
                        }

                        moveData.add(problemInformation);
                        moveData.add(panels);
                        moveData.add(new Boolean(problemInformation.getUserType()
                                != ApplicationConstants.PROBLEM_TESTER));
                        //edit problem statement?
                        moveData.add(new Boolean(true)); //can user edit solution?
                        moveData.add("Edit your problem.");
                        if (isAdmin) //give them the list of testers
                        {
                            ArrayList testers = createBean().getUsers(
                                    ApplicationConstants.ALL_TESTERS, -1);
                            moveData.add(testers);
                        }
                        moveData.add(mainAppletProcessor.getUserList(
                                MessageTypes.VIEW_PROBLEM_ROOM, id, connectionId));

                        allowProblemSubmission = true;
                    } else {
                        currentViewProblemId = -id;

                        ProblemInformation problemInfo =
                                createBean().getProblemInformation(-id, userId);
                        ArrayList panels = new ArrayList(3);
                        panels.add(new Integer(MessageTypes.PROBLEM_STATEMENT_PANEL));
                        panels.add(new Integer(MessageTypes.CORRESPONDENCE_PANEL));
                        if (problemInfo.getStatus() >=
                                MessageTypes.SUBMISSION_PENDING_APPROVAL) {
                            panels.add(new Integer(MessageTypes.ALL_SOLUTION_PANEL));
                            panels.add(new Integer(MessageTypes.TEST_CASES_PANEL));
                        }
                        panels.add(new Integer(MessageTypes.APPROVAL_PANEL));
                        moveData.add(problemInfo);
                        moveData.add(panels);
                        moveData.add(new Boolean(false));  //edit problem statement?
                        moveData.add(new Boolean(false));  //edit solution?
                        moveData.add("View and reply to pending problem.");
                        moveData.add(mainAppletProcessor.getUserList(
                                MessageTypes.VIEW_PROBLEM_ROOM, -id, connectionId));
                    }

                    break;

                    //----------------------------------------------------------
                case MessageTypes.VIEW_CONTEST_ROOM: //id = roundid
                    ContestInformation contestInfo = createBean().getContestInformation(
                            id, isAdmin);
                    if (contestInfo == null) {
                        throw new NullPointerException("Null data from bean.");
                    }

                    currentViewRoundId = id;
                    moveData.add(contestInfo);
                    moveData.add(mainAppletProcessor.getUserList(
                            MessageTypes.VIEW_CONTEST_ROOM, currentViewRoundId, connectionId));

                    break;

                    //----------------------------------------------------------
                case MessageTypes.APPLICATION_ROOM:  //id = n.a.
                    switch (id) {
                        case MessageTypes.TESTER_APPLICATION:
                            if (isTester) {
                                moveResponse.set(1, new Integer(MessageTypes.FOYER_ROOM));
                                moveData.add("You are already a problem tester.  No need to apply.");
                            } else {
                                moveData.add("Problem Tester Application:");
                                currentApplicationType = id;
                            }
                            break;
                        case MessageTypes.WRITER_APPLICATION:
                            if (isWriter) {
                                moveResponse.set(1, new Integer(MessageTypes.FOYER_ROOM));
                                moveData.add("You are already a problem writer.  No need to apply.");
                            } else {
                                moveData.add("Problem Writer Application:");
                                currentApplicationType = id;
                            }
                            break;
                        default:
                            log.debug(userName + " requested an invalid application: "
                                    + id);
                            moveResponse.set(1, new Integer(MessageTypes.FOYER_ROOM));
                            moveData.add("Unknown application type.  What are you doing?");
                    }
                    break;

                    //----------------------------------------------------------
                case MessageTypes.VIEW_APPLICATION_ROOM:  //id = dev_app_id
                    ApplicationInformation info = createBean().getApplicationInformation(
                            id);
                    if (info == null) throw new NullPointerException("Null data from bean.");
                    currentViewApplicationId = id;
                    moveData.add(info);
                    break;

                    //----------------------------------------------------------
                case MessageTypes.VIEW_USER_ROOM:
                    UserInformation userInfo = createBean().getUserInformation(id);

                    if (userInfo == null) {
                        throw new Exception("Null data from bean.");
                    }

                    moveData.add(userInfo);
                    currentViewUserId = id;

                    //----------------------------------------------------------
                default:
                    log.debug("Unrecognized room type: " + roomType);
            }
        } catch (Exception e) {
            log.error("Error getting information for roomtype" + roomType
                    + "for " + userName + ":");
            e.printStackTrace();
            moveResponse = new ArrayList();
            moveResponse.add(new Integer(MessageTypes.MOVE_RS));
            moveResponse.add(1, new Integer(MessageTypes.FOYER_ROOM));
            moveData = new ArrayList(1);
            moveData.add(ApplicationConstants.SERVER_ERROR);
        }
        moveResponse.add(moveData);
        sendToClient(moveResponse);

        //store current room:
        currentRoomType = ((Integer) moveResponse.get(1)).intValue();

        if (record) {
            while (roomRelativeIndex + 1 < roomTypeHistory.size()) {
                roomTypeHistory.remove(roomRelativeIndex + 1);
                roomIdHistory.remove(roomRelativeIndex + 1);
            }
            roomTypeHistory.add(new Integer(currentRoomType));
            roomIdHistory.add(new Integer(id));
            roomRelativeIndex++;
        }

        registerMove();
    }

    /**
     * Moves a user to the room they were at value times ago (can be negative
     * or positive).
     *
     * @param value How far back or forward to go in history.
     */
    private void moveRelative(int value) {
        if (roomRelativeIndex + value < 0 ||
                roomRelativeIndex + value >= roomTypeHistory.size()) {
            ArrayList response = new ArrayList(3);
            ArrayList moveData = new ArrayList(1);
            response.add(new Integer(MessageTypes.UPDATE_STATUS_RS));
            if (value < 0) {
                response.add("Cannot go back anymore.");
            } else {
                response.add("Cannot go forward anymore.");
            }
            response.add(new Boolean(true));
            sendToClient(response);
            value = 0;
        }

        roomRelativeIndex += value;
        int type = ((Integer) roomTypeHistory.get(roomRelativeIndex)).intValue();
        int id = ((Integer) roomIdHistory.get(roomRelativeIndex)).intValue();

        move(type, id, false);
    }

    /**
     * Handles a user proposing a problem.  It calls the application server
     * to check the validity of the proposal and then returns the results to the
     * user.  If the problem proposal is ok, it inserts any additional notes
     * (if there are any) as correspondance through the application server
     *
     * @param info   The information on the problem proposal.
     */
    private void saveProposal(ProblemInformation info) throws Exception {
        ArrayList proposalResponse = new ArrayList(3);

        if (!isWriter) {
            proposalResponse.add(new Integer(MessageTypes.UPDATE_STATUS_RS));
            proposalResponse.add("You are not a problem writer.  Please apply first.");
            proposalResponse.add(new Boolean(true));
            sendToClient(proposalResponse);
            return;
        }

        ArrayList proposalResults = createBean().saveProposal(info, userId);
        //proposalResults[0] = Boolean - successful proposal?
        //proposalResults[1] = if false, reason why
        proposalResponse.add(new Integer(MessageTypes.UPDATE_STATUS_RS));

        if (((Boolean) proposalResults.get(0)).booleanValue()) {
            proposalResponse.add("Your proposal has been submitted succesfully.");
        } else {
            proposalResponse.add(proposalResults.get(1));
        }

        proposalResponse.add(
                new Boolean(!((Boolean) proposalResults.get(0)).booleanValue()));
        sendToClient(proposalResponse);
    }

    /**
     * saveProblem submit process a reqest from the applet to submit a problem.
     * It calls on the application server to do all the database updates.
     *
     * @param info The ProblemInformation for the problem.
     */
    private void saveProblem(ProblemInformation info) throws Exception {
        ArrayList saveProblemResponse = new ArrayList(3);
        saveProblemResponse.add(new Integer(MessageTypes.UPDATE_STATUS_RS));

        if (!allowProblemSubmission) {
            saveProblemResponse.add("This problem has been modified by another "
                    + "user.  Reload the problem before submitting.");
            saveProblemResponse.add(new Boolean(true));
        } else {
            ArrayList submitInfo = createBean().saveProblem(info,
                    currentViewProblemId,
                    userId,
                    connectionId);
            //submitInfo[0]  Boolean - success
            //submitInfo[1]  if false, error
            if (((Boolean) submitInfo.get(0)).booleanValue()) {
                saveProblemResponse.add("Your problem submission was sucessful.");
                saveProblemResponse.add(new Boolean(false));
            } else {
                saveProblemResponse.add(submitInfo.get(1));
                saveProblemResponse.add(new Boolean(true));
            }
        }
        sendToClient(saveProblemResponse);
    }

    /**
     * Calls the bean to save the problem statement for the current problem, and
     * returns the results to the user.
     *
     * @param statement The new problem statement version.
     */
    private void saveProblemStatement(String statement) throws Exception {
        ArrayList response = new ArrayList();
        response.add(new Integer(MessageTypes.UPDATE_STATUS_RS));

        if (allowProblemSubmission) {
            String result = createBean().saveProblemStatement(statement,
                    currentViewProblemId,
                    userId,
                    connectionId);
            response.add(result);
            response.add(new Boolean(false));
        } else {
            response.add("This problem has been modified by another "
                    + "user.  Reload the problem before submitting.");
            response.add(new Boolean(true));
        }

        sendToClient(response);
    }

    /**
     * Calls the bean to save some problem information related to the problem.  First
     * makes sure the user is an admin.
     */
    private void saveAdminProblemInformation(ProblemInformation problemInfo) throws Exception {
        if (isAdmin) {
            ArrayList response = new ArrayList(3);
            response.add(new Integer(MessageTypes.UPDATE_STATUS_RS));

            boolean wentOk = createBean().saveAdminProblemInformation(problemInfo,
                    currentViewProblemId);
            if (wentOk) {
                response.add("Information saved.");
                response.add(new Boolean(false));
            } else {
                response.add(ApplicationConstants.SERVER_ERROR);
                response.add(new Boolean(true));
            }

            sendToClient(response);
        }
    }


    /**
     * Handles an admin's response to a proposal.  The method first
     * makes sure the user is an admin, and then calls a bean method to take
     * care of the proposal.
     *
     * @param approved  A boolean if the admin approved (true) or disproved (false)
     *                  the proposal.
     * @param message   A message from the admin regarding the problem.
     */
    private void processPendingReply(boolean approved, String message) throws Exception {
        if (isAdmin) {
            ArrayList proposalReply = new ArrayList(3);
            ArrayList proposalInfo = createBean().processPendingReply(currentViewProblemId,
                    approved,
                    message,
                    userId);
            //0  - boolean, if ok or not
            //1  - if somethinf wrong, a reason
            proposalReply.add(new Integer(MessageTypes.UPDATE_STATUS_RS));
            if (((Boolean) proposalInfo.get(0)).booleanValue()) {
                proposalReply.add("You succesfully replied to the problem proposal.");
            } else {
                proposalReply.add(proposalInfo.get(1));
            }
            proposalReply.add(new Boolean(
                    !((Boolean) proposalInfo.get(0)).booleanValue()));

            sendToClient(proposalReply);
        }
    }

    /**
     * Processes a request from the applet to send a correspondence message.
     * It calls the bean with the message and the problem id;
     *
     * @param message The correspondence to send.
     */
    private void sendCorrespondence(Correspondence message) throws Exception {
        ArrayList correspondenceResponse = new ArrayList(3);
        correspondenceResponse.add(new Integer(MessageTypes.UPDATE_STATUS_RS));

        if (createBean().sendCorrespondence(message, currentViewProblemId, userId)) {
            correspondenceResponse.add("Your message has been sent.");
            correspondenceResponse.add(new Boolean(false));
        } else {
            correspondenceResponse.add(ApplicationConstants.SERVER_ERROR);
            correspondenceResponse.add(new Boolean(true));
        }

        sendToClient(correspondenceResponse);
    }

    /**
     * Handles a user's compile request.  It first makes sure the code is
     * not blank, and then if it is not, it sends the compile request to the
     * application server bean.
     *
     * @param info The ProblemInformation for the problem to be compiled.
     */
    private void compile(ProblemInformation info) throws Exception {
        ArrayList compileResponse = new ArrayList(4);
        if (info.getSolution().getText().trim().equals("")) {
            compileResponse.add(new Integer(MessageTypes.UPDATE_STATUS_RS));
            compileResponse.add("You cannot compile blank code.");
            compileResponse.add(new Boolean(true));
            sendToClient(compileResponse);
            return;
        }

        ArrayList compileResults = createBean().compile(info,
                currentViewProblemId,
                userId);
        //[0]  Boolean ok or not.
        //[1]  Message if errors.
        if (((Boolean) compileResults.get(0)).booleanValue()) {
            compileResponse.add(new Integer(MessageTypes.UPDATE_STATUS_RS));
            compileResponse.add("Compile Successful.");
            compileResponse.add(new Boolean(false));
        } else {
            compileResponse.add(new Integer(MessageTypes.UPDATE_STATUS_RS));
            compileResponse.add("Compile Errors: \n"
                    + "<FONT FACE=\"MonoSpaced\">"
                    + compileResults.get(1)
                    + "</FONT>");  //XXX: Monospace font for nicer display in applet.
            compileResponse.add(new Boolean(false));
        }
        sendToClient(compileResponse);
    }

    /**
     * Handles a user's test requerst by calling the
     * application server (the bean) to test the code and
     * returns the results of the test to the user
     *
     * @param args  Array of args with which to test.
     * @param howMany TEST_ONE=test user's code,
     *                TEST_ALL=test all problem's submission.
     */
    private void test(Object[] args, int howMany) throws Exception {
        ArrayList testResponse = new ArrayList(4);

        String testResult;
        testResult = createBean().test(args, currentViewProblemId, userId, howMany);
        testResponse.add(new Integer(MessageTypes.UPDATE_STATUS_RS));
        testResponse.add("Test Results: \n\n"
                + "<FONT FACE=\"MonoSpaced\">"
                + testResult
                + "</FONT>");  //XXX: Monospace font for nicer display in applet.
        testResponse.add(new Boolean(false));

        sendToClient(testResponse);
    }

    /**
     * Compares all the solutions to a problem by calling the bean and returns the
     * results to the applet.
     */
    private void compareSolutions() throws Exception {
        ArrayList compareSolutionsResponse = new ArrayList(4);

        String compareResult = (String) createBean().compareSolutions(
                currentViewProblemId).get(1);
        compareSolutionsResponse.add(
                new Integer(MessageTypes.UPDATE_STATUS_RS));
        compareSolutionsResponse.add("All solutions test results: \n"
                + "<FONT FACE=\"MonoSpaced\">"
                + compareResult
                + "</FONT>");  //XXX: Monospace font for nicer display in applet.
        compareSolutionsResponse.add(new Boolean(false));

        sendToClient(compareSolutionsResponse);
    }

    /**
     * Calls the bean to enter an application into the database.
     *
     * @param message A String containing the message the user left with his
     *                application.
     */
    private void submitApplication(String message) throws Exception {
        ArrayList response = new ArrayList(3);
        response.add(new Integer(MessageTypes.UPDATE_STATUS_RS));

        ArrayList appData = createBean().saveApplication(message,
                currentApplicationType,
                userId);
        //appData[0] true/false sucess
        //appData[1] if false, an error message

        if (!((Boolean) appData.get(0)).booleanValue()) {
            response.add(appData.get(1));
            response.add(new Boolean(true));
        } else {
            response.add("Your application was submitted.");
            response.add(new Boolean(false));
        }

        sendToClient(response);
    }

    /**
     * Calls the bean to reply to an application.
     *
     * @param accepted A boolean as to whether the application was approved.
     * @param message A String containing any message the admin left
     */
    private void processApplicationReply(boolean accepted, String message) throws Exception {
        ArrayList response = new ArrayList(3);
        response.add(new Integer(MessageTypes.UPDATE_STATUS_RS));
        if (isAdmin) {
            ArrayList appData = createBean().processApplicationReply(currentViewApplicationId,
                    accepted, message, userId);
            //appData[0] true/false sucess
            //appData[1] if false, an error message

            if (!((Boolean) appData.get(0)).booleanValue()) {
                response.add(appData.get(1));
                response.add(new Boolean(true));
            } else {
                response.add("Your reply was submitted.");
                response.add(new Boolean(false));
            }

            sendToClient(response);
        } else {
            log.debug(userName
                    + " is not an admin, but is trying to reply to dev_app "
                    + currentViewApplicationId + "!!!!");
            response.add(new Boolean(false));
            response.add("You cannot do this unless you are an admin.");
            sendToClient(response);
            return;
        }
    }

    /**
     * Calls a bean method to set the problems and problem testers for the
     * currently view round.
     *
     * @param problems An ArrayList matching the local availableProblems, but
     *                 with some of the scheduled tags changed
     * @param testers  An ArrayList matching the local availableTesters, but with
     *                 some of the scheduled tags changed.
     */
    private void saveContestProblems(ArrayList problems) throws Exception {
        if (isAdmin) {
            ArrayList schedResponse = new ArrayList(2);
            schedResponse.add(new Integer(MessageTypes.UPDATE_STATUS_RS));

            String schedResults = createBean().saveContestProblems(currentViewRoundId,
                    problems);
            schedResponse.add(schedResults);
            schedResponse.add(new Boolean(false));

            sendToClient(schedResponse);
        }
    }

    /**
     * Calls the bean to check everything with the current contest and returns
     * the results to the applet.
     */
    private void verifyContest() throws Exception {
        ArrayList response = new ArrayList(2);

        response.add(new Integer(MessageTypes.UPDATE_STATUS_RS));
        String result = createBean().verifyContest(currentViewRoundId);
        response.add("Contest Verify Results: \n" + result);
        response.add(new Boolean(false));

        sendToClient(response);
    }

    /**
     * Calls the bean to update the payments for all the users whose ids
     * are in the passed ArrayList;
     *
     * @param users ArrayList of user ids of users being paid.
     */
    private void recordPayment(ArrayList users) throws Exception {
        if (isAdmin) {
            ArrayList response = new ArrayList(3);
            response.add(new Integer(MessageTypes.UPDATE_STATUS_RS));

            boolean ok = createBean().recordPayment(users);
            if (ok) {
                response.add("Payment information submitted.");
                response.add(new Boolean(false));
            } else {
                response.add(ApplicationConstants.SERVER_ERROR);
                response.add(new Boolean(true));
            }
            sendToClient(response);
        }
    }

    /**
     * Puts together a chat message from the user and sends the chat message
     * to the MainAppletProcessor to go out to everyone.
     *
     * @param text  The chat message.
     */
    private void chat(String text) {
        ArrayList chatResponse = new ArrayList(2);
        chatResponse.add(new Integer(MessageTypes.CHAT_RS));
        chatResponse.add(userName + "> " + text + "\n");
        if (currentRoomType == MessageTypes.VIEW_CONTEST_ROOM) {
            mainAppletProcessor.sendResponseToRoom(MessageTypes.CHAT_RS, chatResponse,
                    currentRoomType, currentViewRoundId);
            mainAppletProcessor.logChatMessage(currentViewRoundId, -1, userId, text);
        } else if (currentRoomType == MessageTypes.VIEW_PROBLEM_ROOM) {
            mainAppletProcessor.sendResponseToRoom(MessageTypes.CHAT_RS, chatResponse,
                    currentRoomType, currentViewProblemId);
            mainAppletProcessor.logChatMessage(-1, currentViewProblemId, userId, text);
        }
    }


    /**
     * Gets the chat history from the bean for the current round and
     * returns the history to the applet as a chat message.
     */
    private void getChatHistory() throws Exception {
        ArrayList response = new ArrayList(2);

        String result;
        if (currentRoomType == MessageTypes.VIEW_CONTEST_ROOM) {
            result = createBean().getChatHistory(currentViewRoundId, true);
        } else {
            result = createBean().getChatHistory(currentViewProblemId, false);
        }
        response.add(new Integer(MessageTypes.UPDATE_STATUS_RS));
        response.add("History:\n" + result);
        response.add(new Boolean(false));

        sendToClient(response);
    }

    /**
     * Processes a NEW_ROUND_SCHEDULE_RS from the mainAppletProcessor - finishes
     * filling out the contest info if the user is an admin.
     *
     * @param data[0] MessageTypes.NEW_ROUND_SCHEDULE_RS
     * @param data[1] The ContestInformation
     */
    private void processNewRoundSchedule(ArrayList data) {
        try {
            if (isAdmin) {
                ContestInformation contestInfo = createBean().getContestInformation(
                        currentViewRoundId, true);
                data.set(1, contestInfo);
            }
            sendToClient(data);
        } catch (Exception e) {
            log.error("Error processing NEW_ROUND_SCHEDULE_RS for " + userName);
            e.printStackTrace();
        }
    }

    /**
     * Calls the MainAppletProcessor's move user method with information in the
     * current user cache Assumes the user cache has been correctly updated by
     * the methods.
     */
    private void registerMove() {
        if (currentRoomType == MessageTypes.VIEW_CONTEST_ROOM) {
            mainAppletProcessor.moveUser(connectionId, currentRoomType,
                    currentViewRoundId);
        } else if (currentRoomType == MessageTypes.VIEW_PROBLEM_ROOM) {
            mainAppletProcessor.moveUser(connectionId,
                    currentRoomType,
                    currentViewProblemId);
        } else {
            mainAppletProcessor.moveUser(connectionId, currentRoomType, -1);
        }
    }

    /**
     * sendToClient calls on the ClientConnection to send an Object out to a client
     *
     * ArrayList data   The data to send to the client
     */
    public void sendToClient(ArrayList data) {
        clientConnection.sendObject(data);
    }

    /**
     * createBean creates a MPSQASServicesBean by calling
     * mpsqasHome.create and returns a handle on the bean (MPSQASServices).
     * If it cannot create the bean, it keeps trying until it can.
     *
     * @param returns Handle on a MPSQASServices bean.
     */
    private MPSQASServices createBean() {
        while (1 == 1) {
            try {
                return (MPSQASServices) mpsqasHome.create();
            } catch (Exception e) {
                log.error("Could not get MPSQASServicesBean: Trying again...");
                e.printStackTrace();
                try {
                    Thread.sleep(2000);
                } catch (Exception ignore) {
                }
            }
        }
    }

    //User cache
    private String userName;
    private int userId;
    private boolean isWriter;
    private boolean isTester;
    private int currentRoomType;
    private int currentViewRoundId;
    private int currentViewProblemId;
    private int currentViewApplicationId;
    private int currentApplicationType;
    private int currentViewUserId;
    private boolean allowProblemSubmission;
    //(don't allow problem submissions if the problem has been modified)
    private ArrayList roomTypeHistory;
    private ArrayList roomIdHistory;
    private int roomRelativeIndex;
    private boolean isAdmin;

    //Applet Server Data
    private ClientConnection clientConnection;
    private MainAppletProcessor mainAppletProcessor;
    private int connectionId;

    //bean information
    private MPSQASServicesHome mpsqasHome;
}
