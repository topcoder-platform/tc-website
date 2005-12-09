/*
 * Copyright (c) 2005 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening;

import java.util.Date;

/**
 * A screening record bean. 
 *
 * @author WishingBone
 * @version 1.0
 */
public class ScreeningRecord {

    private long submission = -1;
    private long submitter = -1;
    private Date date = null;
    private boolean current = false;
    private String status = null;
    private String handle = null;

    public long getSubmission() {
        return this.submission;
    }
    public void setSubmission(long submission) {
        this.submission = submission;
    }

    public long getSubmitter() {
        return this.submitter;
    }
    public void setSubmitter(long submitter) {
        this.submitter = submitter;
    }

    public String getHandle() {
        return this.handle;
    }
    public void setHandle(String handle) {
        this.handle = handle;
    }

    public Date getDate() {
        return this.date;
    }
    public void setDate(Date date) {
        this.date = date;
    }

    public boolean getCurrent() {
        return this.current;
    }
    public void setCurrent(boolean current) {
        this.current = current;
    }

    public String getStatus() {
        return this.status;
    }
    public void setStatus(String status) {
        this.status = status;
    }

}
