package com.topcoder.web.hs.model;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

public class SearchBean {

    private final static int MAX_RESULTS_PER_PAGE = 15;

    private Integer start = null;
    private Integer end = null;
    private String handle = null;
    private String state_code = null;
    private Long school_id = null;
    private String min_rating = null;
    private String max_rating = null;
    private ResultSetContainer state_list = null;
    private ResultSetContainer school_list = null;
    private ResultSetContainer member_list = null;
    private boolean has_prev = false;
    private boolean has_next = false;

    public static int getMaxResultsPerPage() {
        return (MAX_RESULTS_PER_PAGE);
    }

    public Integer getStart() {
        return (start);
    }

    public void setStart(Integer _start) {
        start = _start;
    }

    public Integer getEnd() {
        return (end);
    }

    public void setEnd(Integer _end) {
        end = _end;
    }

    public String getHandle() {
        return (handle);
    }

    public void setHandle(String _handle) {
        handle = _handle;
    }

    public String getStateCode() {
        return (state_code);
    }

    public void setStateCode(String _state_code) {
        state_code = _state_code;
    }

    public Long getSchoolId() {
        return (school_id);
    }

    public void setSchoolId(Long _school_id) {
        school_id = _school_id;
    }

    public String getMinRating() {
        return (min_rating);
    }

    public void setMinRating(String _min_rating) {
        min_rating = _min_rating;
    }

    public String getMaxRating() {
        return (max_rating);
    }

    public void setMaxRating(String _max_rating) {
        max_rating = _max_rating;
    }

    public ResultSetContainer getStateList() {
        return (state_list);
    }

    public void setStateList(ResultSetContainer _state_list) {
        state_list = _state_list;
    }

    public ResultSetContainer getSchoolList() {
        return (school_list);
    }

    public void setSchoolList(ResultSetContainer _school_list) {
        school_list = _school_list;
    }

    public ResultSetContainer getMemberList() {
        return (member_list);
    }

    public void setMemberList(ResultSetContainer _member_list) {
        member_list = _member_list;
    }

    public boolean getHasPrev() {
        return (has_prev);
    }

    public void setHasPrev(boolean _has_prev) {
        has_prev = _has_prev;
    }

    public boolean getHasNext() {
        return (has_next);
    }

    public void setHasNext(boolean _has_next) {
        has_next = _has_next;
    }

    public boolean hasMemberList() {
        return (member_list != null);
    }
}
