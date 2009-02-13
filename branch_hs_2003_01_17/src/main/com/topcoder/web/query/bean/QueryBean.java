package com.topcoder.web.query.bean;

import java.io.Serializable;

public class QueryBean implements Serializable {
    private long queryId;
    private String name;
    private String text;
    private boolean ranking;
    private int columnIndex;

    public QueryBean() {
        setQueryId(0);
        setName("");
        setText("");
        setRanking(false);
        setColumnIndex(0);
    }

    public long getQueryId() {
        return queryId;
    }

    public void setQueryId(long queryId) {
        this.queryId = queryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public boolean isRanking() {
        return ranking;
    }

    public void setRanking(boolean ranking) {
        this.ranking = ranking;
    }

    public int getColumnIndex() {
        return columnIndex;
    }

    public void setColumnIndex(int columnIndex) {
        this.columnIndex = columnIndex;
    }

    public boolean equals(Object o) {
        if (o instanceof QueryBean) {
            return ((QueryBean)o).getQueryId()==this.getQueryId() &&
                   ((QueryBean)o).getName().equals(this.getName()) &&
                   ((QueryBean)o).getText().equals(this.getText()) &&
                   ((QueryBean)o).isRanking()==this.isRanking() &&
                   ((QueryBean)o).getColumnIndex()==this.getColumnIndex();
        } else {
            return false;
        }
    }

}
