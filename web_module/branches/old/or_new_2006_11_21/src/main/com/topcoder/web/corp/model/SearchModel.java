/*
 * SearchModel.java
 *
 * Created on July 13, 2004, 11:31 AM
 */

package com.topcoder.web.corp.model;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

/**
 * @author rfairfax
 */
public class SearchModel extends BaseModel {

    private String firstName;
    private String lastName;
    private String emailAddress;

    private ResultSetContainer rsc;
    private long total;
    private long userId;

    private long start;
    private long end;


    /**
     * Creates a new instance of SearchModel
     */
    public SearchModel() {
        firstName = "";
        lastName = "";
        emailAddress = "";
        total = 0;
        userId = 0;
    }

    public ResultSetContainer getRsc() {
        return rsc;
    }

    public void setRsc(ResultSetContainer rsc) {
        this.rsc = rsc;
    }

    public void setStart(long i) {
        start = i;
    }

    public void setEnd(long i) {
        end = i;
    }

    public long getStart() {
        return start;
    }

    public long getEnd() {
        return end;
    }

    public void setUserId(long i) {
        userId = i;
    }

    public long getUserId() {
        return userId;
    }

    public void setFirstName(String s) {
        firstName = s;
    }

    public void setLastName(String s) {
        lastName = s;
    }

    public void setEmailAddress(String s) {
        emailAddress = s;
    }

    public void setTotal(long i) {
        total = i;
    }

    public void setResults(ResultSetContainer rs) {
        rsc = rs;
    }

    public long getTotal() {
        return total;
    }

    public ResultSetContainer getResults() {
        return rsc;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

}
