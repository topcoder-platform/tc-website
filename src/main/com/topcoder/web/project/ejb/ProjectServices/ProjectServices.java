package com.topcoder.web.project.ejb.ProjectServices;

import com.topcoder.web.project.common.*;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.HashMap;

public interface ProjectServices extends EJBObject {

    //**********************************/
    //******* PROJECT METHODS **********/
    //**********************************/
    // Get methods
    public Project getProjectById(int projectId) throws RemoteException, Exception;

    public ArrayList getProjects(int role, int userId, int statusId) throws RemoteException, Exception;

    public ArrayList getProjects(int role, int userId, int statusId, String orderBy) throws RemoteException, Exception;

    // Standard set/add/remove methods
    public void setProject(Project project) throws RemoteException, Exception;

    public int addProject(Project project) throws RemoteException, Exception;

    public void removeProject(int projectId) throws RemoteException, Exception;

    //***************************************/
    //******* PROJECT TASK METHODS **********/
    //***************************************/
    // Get methods
    public ProjectTask getProjectTaskById(int projectTaskId) throws RemoteException, Exception;

    public ArrayList getProjectTasks(int projectId, int statusId) throws RemoteException, Exception;

    public ArrayList getProjectTasks(int projectId, int statusId, String orderBy) throws RemoteException, Exception;

    // Standard set/add/remove methods
    public void setProjectTask(ProjectTask projectTask) throws RemoteException, Exception;

    public void addProjectTask(ProjectTask projectTask) throws RemoteException, Exception;

    //***************************************/
    //******* PROJECT ISSUE METHODS **********/
    //***************************************/
    // Get methods
    public ProjectIssue getProjectIssueById(int projectIssueId) throws RemoteException, Exception;

    public ArrayList getProjectIssues(int projectId) throws RemoteException, Exception;

    // Standard set/add/remove methods
    public void setProjectIssue(ProjectIssue projectIssue) throws RemoteException, Exception;

    public void addProjectIssue(ProjectIssue projectIssue) throws RemoteException, Exception;

    //*****************************************/
    //******* PROJECT USER UPDATE METHODS **********/
    //*****************************************/
    // Get methods
    public ProjectUserUpdate getProjectUserUpdateById(int projectUserUpdateId) throws RemoteException, Exception;

    public void setProjectUserUpdate(ProjectUserUpdate projectUserUpdate) throws RemoteException, Exception;

    public void addProjectUserUpdate(ProjectUserUpdate projectUserUpdate) throws RemoteException, Exception;

    public ArrayList getProjectUserUpdates(int projectId) throws RemoteException, Exception;

    public ArrayList getProjectUserUpdates(int projectId, int projectTaskId) throws RemoteException, Exception;

    //********************************************/
    //******* PROJECT USER METHODS **********/
    //********************************************/
    public ProjectUser getProjectUserById(int projectUserId) throws RemoteException, Exception;

    public void setProjectUser(ProjectUser projectUser) throws RemoteException, Exception;

    public void addProjectUser(ProjectUser projectUser) throws RemoteException, Exception;

    //********************************************/
    //******* PROJECT USER TASK METHODS **********/
    //********************************************/
    public ProjectUserTask getProjectUserTaskById(int projectUserTaskId) throws RemoteException, Exception;

    public void setProjectUserTask(ProjectUserTask projectUserTask) throws RemoteException, Exception;

    public void addProjectUserTask(ProjectUserTask projectUserTask) throws RemoteException, Exception;

    public ArrayList getProjectUserTasks(int projectTaskId) throws RemoteException, Exception;

    //********************************************/
    //******* USER MESSAGE METHODS **********/
    //********************************************/
    public UserMessage getUserMessageById(int user_messageId) throws RemoteException, Exception;

    public void setUserMessage(UserMessage user_message) throws RemoteException, Exception;

    public void addUserMessage(UserMessage user_message) throws RemoteException, Exception;

    public ArrayList getUserMessages(int senderId, int receiverId, int senderFolder, int receiverFolder) throws RemoteException, Exception;

    public ArrayList getUserMessages(int senderId, int receiverId, int senderFolder, int receiverFolder, String orderBy) throws RemoteException, Exception;

    public void setReceiverUserMessageFolder(int messageId, int folderId) throws RemoteException, Exception;

    public void setSenderUserMessageFolder(int messageId, int folderId) throws RemoteException, Exception;

    public void setMessageReadDate(int messageId, java.util.Date dateIn) throws RemoteException, Exception;

    //********************************************/
    //******* LOGIN METHODS **********/
    //********************************************/
    public void loginMember(int loginId, int user_id, String messageIn) throws RemoteException, Exception;

    public void logoutMember(int loginId, String messageIn) throws RemoteException, Exception;

    //*********************************/
    //******* LOOKUP METHODS **********/
    //*********************************/
    public int getProjectUserId(int userId, int projectId, int role) throws RemoteException, Exception;

    public int getUserId(int projectUserId) throws RemoteException, Exception;

    public Integer[] getProjectUserIds(int projectId, int role) throws RemoteException, Exception;

    public Integer[] getProjectUserIds(int projectTaskId) throws RemoteException, Exception;

    public HashMap getProjectStatuses() throws RemoteException, Exception;

    public HashMap getProjectTaskStatuses() throws RemoteException, Exception;

    public HashMap getUsers() throws RemoteException, Exception;

    public HashMap getUserIds() throws RemoteException, Exception;

    public HashMap getUsers(int group) throws RemoteException, Exception;

    //****************************************/
    //******* MISCELLANEOUS METHODS **********/
    //****************************************/
    public String getGroups(int user_id) throws RemoteException, Exception;

    public int validateLogin(String handle, String password) throws RemoteException, Exception;
}
