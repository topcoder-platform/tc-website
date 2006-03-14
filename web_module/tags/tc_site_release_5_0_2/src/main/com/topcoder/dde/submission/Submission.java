package com.topcoder.dde.submission;

import java.io.Serializable;
import java.sql.Date;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: May 6, 2003
 * Time: 10:59:15 PM
 * To change this template use Options | File Templates.
 */
public class Submission implements Serializable {

    private long submissionId;
    private long submitterId;
    private String comment;
    private byte[] submission;
    private long date;

    public Submission(long submissionId, long submitterId, String comment, byte[] submission, long date) {
        this.submissionId = submissionId;
        this.submitterId = submitterId;
        this.comment = comment;
        this.submission = submission;
        this.date = date;
    }

    public long getSubmissionId() {
        return submissionId;
    }

    public long getSubmitterId() {
        return submitterId;
    }

    public String getComment() {
        return comment;
    }

    public byte[] getSubmission() {
        return submission;
    }

    public Date getDate() {
        return new Date(date);
    }
}
