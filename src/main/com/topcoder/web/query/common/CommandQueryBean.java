package com.topcoder.web.query.common;

public class CommandQueryBean {

    private long commandId;
    private long queryId;
    private String queryName;
    private int sortOrder;

    public CommandQueryBean() {
        setCommandId(0);
        setQueryId(0);
        setQueryName("");
        setSortOrder(0);
    }

    public long getCommandId() {
        return commandId;
    }

    public void setCommandId(long commandId) {
        this.commandId = commandId;
    }

    public long getQueryId() {
        return queryId;
    }

    public void setQueryId(long queryId) {
        this.queryId = queryId;
    }

    public String getQueryName() {
        return queryName;
    }

    public void setQueryName(String queryName) {
        this.queryName = queryName;
    }

    public int getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(int sortOrder) {
        this.sortOrder = sortOrder;
    }

    public boolean equals(Object o) {
        if (o instanceof CommandQueryBean) {
            return ((CommandQueryBean)o).getCommandId()==this.getCommandId() &&
                   ((CommandQueryBean)o).getQueryName().equals(this.getQueryName()) &&
                   ((CommandQueryBean)o).getQueryId()==this.getQueryId() &&
                   ((CommandQueryBean)o).getSortOrder()==this.getSortOrder();
        } else {
            return false;
        }
    }

}
