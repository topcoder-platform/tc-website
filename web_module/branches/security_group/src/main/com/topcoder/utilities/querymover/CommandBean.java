package com.topcoder.utilities.querymover;

public class CommandBean {
    private long commandId;
    private String commandDesc;
    private int commandGroupId;

    public CommandBean() {
        commandId = 0;
        commandDesc = "";
        commandGroupId = 0;
    }

    public CommandBean(long commandId, String commandDesc, int commandGroupId) {
        setCommandId(commandId);
        setCommandDesc(commandDesc);
        setCommandGroupId(commandGroupId);
    }

    public long getCommandId() {
        return commandId;
    }

    public void setCommandId(long commandId) {
        this.commandId = commandId;
    }

    public String getCommandDesc() {
        return commandDesc;
    }

    public void setCommandDesc(String commandDesc) {
        this.commandDesc = commandDesc;
    }

    public int getCommandGroupId() {
        return commandGroupId;
    }

    public void setCommandGroupId(int commandGroupId) {
        this.commandGroupId = commandGroupId;
    }

    public String toString() {
        return "id: " + commandId + " desc: " + commandDesc + " groupid: " + commandGroupId;
    }
}
