package com.topcoder.web.project.servlet;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.project.common.*;
import com.topcoder.web.project.ejb.ProjectServices.ProjectServices;

import javax.naming.InitialContext;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

public final class ProjectBean {

    protected static ProjectServices projectServices = null;
    protected static Exception exception = null;

    public static final int ROLE_EXECUTIVE = 1;
    public static final int ROLE_MANAGER = 2;
    public static final int ROLE_DEVELOPER = 3;

    private static HashMap hmProjectStatus = null;
    private static HashMap hmProjectTaskStatus = null;
    private static HashMap hmUsers = null;
    private static HashMap hmUserIds = null;

    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    static {
        try {
            InitialContext ctx = new InitialContext();
            projectServices = (ProjectServices) BaseProcessor.createEJB(ctx, ProjectServices.class);
        } catch (Exception e) {
            exception = e;
        }

        try {
            hmProjectStatus = getProjectServices().getProjectStatuses();
            hmProjectTaskStatus = getProjectServices().getProjectTaskStatuses();
            hmUsers = getProjectServices().getUsers();
            hmUserIds = getProjectServices().getUserIds();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ProjectBean() {
    }

    public static ProjectServices getProjectServices() throws Exception {
        if (exception != null) {
            throw exception;
        } else {
            return projectServices;
        }
    }

    public int validateLogin(String handle, String password) {
        try {
            return getProjectServices().validateLogin(handle, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public String getGroups(int user_id) {
        try {
            return getProjectServices().getGroups(user_id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    public ArrayList getProjects(int role, int userId, int statusId) {
        try {
            return getProjectServices().getProjects(role, userId, statusId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList getProjects(int role, int userId, int statusId, String orderBy) {
        try {
            return getProjectServices().getProjects(role, userId, statusId, orderBy);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList getProjectTasks(int projectId, int statusId) {
        try {
            return getProjectServices().getProjectTasks(projectId, statusId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList getProjectTasks(int projectId, int statusId, String orderBy) {
        try {
            return getProjectServices().getProjectTasks(projectId, statusId, orderBy);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList getProjectIssues(int projectId) {
        try {
            return getProjectServices().getProjectIssues(projectId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList getProjectUserUpdates(int projectId) {
        try {
            return getProjectServices().getProjectUserUpdates(projectId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList getProjectUserUpdates(int projectId, int projectTaskId) {
        try {
            return getProjectServices().getProjectUserUpdates(projectId, projectTaskId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList getProjectUserTasks(int projectTaskId) {
        try {
            return getProjectServices().getProjectUserTasks(projectTaskId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Project getProjectById(int projectId) {
        try {
            return getProjectServices().getProjectById(projectId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ProjectTask getProjectTaskById(int projectTaskId) {
        try {
            return getProjectServices().getProjectTaskById(projectTaskId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ProjectIssue getProjectIssueById(int projectIssueId) {
        try {
            return getProjectServices().getProjectIssueById(projectIssueId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ProjectUserUpdate getProjectUserUpdateById(int projectUserUpdateId) {
        try {
            return getProjectServices().getProjectUserUpdateById(projectUserUpdateId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
/*
    public ProjectTaskUpdate getProjectTaskUpdateById(int projectTaskUpdateId) {
        try { return getProjectServices().getProjectTaskUpdateById(projectTaskUpdateId); } catch (Exception e) { e.printStackTrace(); return null; }
    }
*/
    public ProjectUser getProjectUserById(int projectUserId) {
        try {
            return getProjectServices().getProjectUserById(projectUserId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ProjectUserTask getProjectUserTaskById(int projectUserTaskId) {
        try {
            return getProjectServices().getProjectUserTaskById(projectUserTaskId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public UserMessage getUserMessageById(int messageId) {
        try {
            return getProjectServices().getUserMessageById(messageId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void setReceiverUserMessageFolder(int messageId, int folderId) {
        try {
            getProjectServices().setReceiverUserMessageFolder(messageId, folderId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void setSenderUserMessageFolder(int messageId, int folderId) {
        try {
            getProjectServices().setSenderUserMessageFolder(messageId, folderId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void setMessageReadDate(int messageId, Date dateIn) {
        try {
            getProjectServices().setMessageReadDate(messageId, dateIn);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean isEmpty(Object objIn) {
        return (("" + objIn).trim().length() == 0);
    }

    // PROJECT METHODS
    public boolean saveProject(Project project) {
        try {
            getProjectServices().setProject(project);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public int addProject(Project project) {
        try {
            return getProjectServices().addProject(project);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean removeProject(int projectId) {
        return false;
    }

    // PROJECT TASK METHODS
    public boolean saveProjectTask(ProjectTask projectTask) {
        try {
            getProjectServices().setProjectTask(projectTask);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean addProjectTask(ProjectTask projectTask) {
        try {
            getProjectServices().addProjectTask(projectTask);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // PROJECT ISSUE METHODS
    public boolean saveProjectIssue(ProjectIssue projectIssue) {
        try {
            getProjectServices().setProjectIssue(projectIssue);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean addProjectIssue(ProjectIssue projectIssue) {
        try {
            getProjectServices().addProjectIssue(projectIssue);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // PROJECT USER UPDATE METHODS
    public boolean saveProjectUserUpdate(ProjectUserUpdate projectUserUpdate) {
        try {
            getProjectServices().setProjectUserUpdate(projectUserUpdate);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean addProjectUserUpdate(ProjectUserUpdate projectUserUpdate) {
        try {
            getProjectServices().addProjectUserUpdate(projectUserUpdate);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // PROJECT USER METHODS
    public boolean saveProjectUser(ProjectUser projectUser) {
        try {
            getProjectServices().setProjectUser(projectUser);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean addProjectUser(ProjectUser projectUser) {
        try {
            getProjectServices().addProjectUser(projectUser);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // PROJECT USER TASK METHODS
    public boolean saveProjectUserTask(ProjectUserTask projectUserTask) {
        try {
            getProjectServices().setProjectUserTask(projectUserTask);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean addProjectUserTask(ProjectUserTask projectUserTask) {
        try {
            getProjectServices().addProjectUserTask(projectUserTask);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // USER MESSAGE METHODS
    public boolean saveUserMessage(UserMessage userMessage) {
        try {
            getProjectServices().setUserMessage(userMessage);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean addUserMessage(UserMessage userMessage) {
        try {
            getProjectServices().addUserMessage(userMessage);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public ArrayList getUserMessages(int senderId, int receiverId, int senderFolder, int receiverFolder) throws Exception {
        try {
            return getProjectServices().getUserMessages(senderId, receiverId, senderFolder, receiverFolder);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList getUserMessages(int senderId, int receiverId, int senderFolder, int receiverFolder, String orderBy) throws Exception {
        try {
            return getProjectServices().getUserMessages(senderId, receiverId, senderFolder, receiverFolder, orderBy);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /********************** special **********************************/
    public void convertIssueToTask(ProjectIssue projectIssue) {
        ProjectTask task = new ProjectTask();
        task.setName("New Issue");
        task.setProject_task_desc(projectIssue.getIssue_text());
        task.setProject_id(projectIssue.getProject_id());
        task.setStatus_id(1);
        addProjectTask(task);
        projectIssue.setClose_date(new Date());
        saveProjectIssue(projectIssue);
    }

    public void loginMember(int loginId, int user_id, String messageIn) {
        try {
            getProjectServices().loginMember(loginId, user_id, messageIn);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void logoutMember(int loginId, String messageIn) {
        try {
            getProjectServices().logoutMember(loginId, messageIn);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /********************** lookups **********************************/
    public void refreshLookups() {
        try {
            hmProjectStatus = getProjectServices().getProjectStatuses();
            hmProjectTaskStatus = getProjectServices().getProjectTaskStatuses();
            hmUsers = getProjectServices().getUsers();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public HashMap getProjectStatuses() {
        return hmProjectStatus;
    }

    public HashMap getProjectTaskStatuses() {
        return hmProjectTaskStatus;
    }

    public HashMap getUsers() {
        return hmUsers;
    }

    public int getUserId(int projectUserId) {
        int userId = 0;
        try {
            userId = getProjectServices().getUserId(projectUserId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userId;
    }

    public HashMap getUserIds() {
        return hmUserIds;
    }

    public int getProjectUserId(int userId, int projectId, int role) {
        int projectUserId = 0;
        try {
            projectUserId = getProjectServices().getProjectUserId(userId, projectId, role);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return projectUserId;
    }

    public Integer[] getProjectUserIds(int projectTaskId) {
        Integer[] userIds = new Integer[0];
        try {
            userIds = getProjectServices().getProjectUserIds(projectTaskId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userIds;
    }

    public Integer[] getProjectUserIds(int projectId, int role) {
        Integer[] userIds = new Integer[0];
        try {
            userIds = getProjectServices().getProjectUserIds(projectId, role);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userIds;
    }

    public HashMap getUsers(int group) {
        HashMap users = new HashMap();
        try {
            users = getProjectServices().getUsers(group);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    public String getProjectStatusString(int projectStatus) {
        HashMap projectStatuses = getProjectStatuses();
        if (projectStatuses.containsKey(new Integer(projectStatus))) {
            return (String) projectStatuses.get(new Integer(projectStatus));
        } else {
            return "<not found>";
        }
    }

    public String getProjectTaskStatusString(int projectTaskStatus) {
        HashMap projectTaskStatuses = getProjectTaskStatuses();
        if (projectTaskStatuses.containsKey(new Integer(projectTaskStatus))) {
            return (String) projectTaskStatuses.get(new Integer(projectTaskStatus));
        } else {
            return "<not found>";
        }
    }

    public int getUserId(String handleIn) {
        HashMap userIds = getUserIds();
        if (userIds.containsKey(handleIn)) {
            return ((Integer) userIds.get(handleIn)).intValue();
        } else {
            return -1;
        }
    }

    public String getUserString(Integer user_id) {
        HashMap users = getUsers();
        if (users.containsKey(user_id)) {
            return (String) users.get(user_id);
        } else {
            return "<not found>";
        }
    }
}
