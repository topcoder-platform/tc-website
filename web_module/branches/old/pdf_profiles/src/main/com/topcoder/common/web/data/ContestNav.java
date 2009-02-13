package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;


public final class ContestNav
        implements Serializable, Comparable, TagRenderer {

    private int ContestId;
    private int ContestNavId;
    private String Task;
    private String Command;

    public ContestNav() {
        ContestId = 0;
        ContestNavId = 0;
        Task = "";
        Command = "";
    }

    public int compareTo(Object other) {
        int result = 0;
        ContestNav otherNav = (ContestNav) other;
        if (this.ContestNavId < otherNav.ContestNavId) {
            result = -1;
        } else if (this.ContestNavId > otherNav.ContestNavId) {
            result = 1;
        }
        return result;
    }


    // set methods
    public void setContestId(int ContestId) {
        this.ContestId = ContestId;
    }

    public void setContestNavId(int ContestNavId) {
        this.ContestNavId = ContestNavId;
    }

    public void setTask(String Task) {
        this.Task = Task;
    }

    public void setCommand(String Command) {
        this.Command = Command;
    }

    // get methods
    public int getContestId() {
        return ContestId;
    }

    public int getContestNavId() {
        return ContestNavId;
    }

    public String getTask() {
        return Task;
    }

    public String getCommand() {
        return Command;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("ContestNav");
            result.addTag(new ValueTag("ContestId", ContestId));
            result.addTag(new ValueTag("ContestNavId", ContestNavId));
            result.addTag(new ValueTag("Task", Task));
            result.addTag(new ValueTag("Command", Command));
        } catch (Exception e) {
            throw new Exception("common.web.data.ContestNav:getXML ERROR: " + e);
        }
        return result;
    }

}

