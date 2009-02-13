package com.topcoder.utilities.querymover;

public class CommandGroupBean {
    private int commandGroupId;
    private String commandGroupDesc;

    public CommandGroupBean() {
        commandGroupId = 0;
        commandGroupDesc = "";
    }

    public CommandGroupBean(int commandGroupId, String commandGroupDesc) {
        setCommandGroupId(commandGroupId);
        setCommandGroupDesc(commandGroupDesc);
    }

    public int getCommandGroupId() {
        return commandGroupId;
    }

    public void setCommandGroupId(int commandGroupId) {
        this.commandGroupId = commandGroupId;
    }

    public String getCommandGroupDesc() {
        return commandGroupDesc;
    }

    public void setCommandGroupDesc(String commandGroupDesc) {
        this.commandGroupDesc = commandGroupDesc;
    }

    public String toString() {
        return "id: " + commandGroupId + " desc: " + commandGroupDesc;
    }
}
