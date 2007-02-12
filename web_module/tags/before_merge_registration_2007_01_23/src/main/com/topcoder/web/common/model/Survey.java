package com.topcoder.web.common.model;

import java.sql.Timestamp;
import java.util.Collections;
import java.util.Set;
import java.util.TreeSet;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public class Survey extends Base {


    private Long id;
    private String name;
    private Timestamp start;
    private Timestamp end;
    private Integer statusId;
    private String text;
    private boolean resultsViewable;
    private Set questions;


    public Survey() {
        questions = new TreeSet();
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Timestamp getStart() {
        return start;
    }

    public void setStart(Timestamp start) {
        this.start = start;
    }

    public Timestamp getEnd() {
        return end;
    }

    public void setEnd(Timestamp end) {
        this.end = end;
    }

    public Integer getStatusId() {
        return statusId;
    }

    public void setStatusId(Integer statusId) {
        this.statusId = statusId;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public boolean isResultsViewable() {
        return resultsViewable;
    }

    public void setResultsViewable(boolean resultsViewable) {
        this.resultsViewable = resultsViewable;
    }

    public Set getQuestions() {
        return Collections.unmodifiableSet(questions);
    }

    public void setQuestions(Set questions) {
        this.questions = questions;
    }
}
