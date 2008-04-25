package com.topcoder.web.email.bean;


import java.io.Serializable;


/**

 * Contains log entry for a job

 *

 * @author 	James Lee (jameslee@cs.stanford.edu)

 * @version	1.0

 */


public class JobLogEntry

        implements Serializable {

    protected String detailStatus;

    protected String detailReason;

    protected int detailId;


    public JobLogEntry() {

    }


    public void setDetailStatus(String detailStatus) {

        this.detailStatus = detailStatus;

    }


    public String getDetailStatus() {

        return detailStatus;

    }


    public void setDetailReason(String detailReason) {

        this.detailReason = detailReason;

    }


    public String getDetailReason() {

        return detailReason;

    }


    public void setDetailId(String detailId) {

        try {

            this.detailId = Integer.parseInt(detailId);

        } catch (NumberFormatException e) {

        }

    }


    public String getDetailId() {

        return String.valueOf(detailId);

    }

}