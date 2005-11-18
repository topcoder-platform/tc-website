package com.topcoder.web.email.bean;


import java.io.Serializable;
import java.util.Date;


/**

 * Contains summary information for a job.

 *

 * @author 	James Lee (jameslee@cs.stanford.edu)

 * @version	1.0

 */


public class JobSummary

        implements Serializable {

    protected String fromPersonal;

    protected String fromAddress;

    protected String subject;

    protected Date startDate;

    protected Date endDate;

    protected String status;

    protected String statusOk;

    protected String statusFailed;

    protected String statusTodo;

    protected String statusOther;

    protected int statusId;

    protected int jobTypeId;


    public JobSummary() {

    }


    public void setFromPersonal(String fromPersonal) {

        this.fromPersonal = fromPersonal;

    }


    public String getFromPersonal() {

        return fromPersonal;

    }


    public void setFromAddress(String fromAddress) {

        this.fromAddress = fromAddress;

    }


    public String getFromAddress() {

        return fromAddress;

    }


    public void setSubject(String subject) {

        this.subject = subject;

    }


    public String getSubject() {

        return subject;

    }


    public void setStartDate(Date startDate) {

        this.startDate = startDate;

    }


    public Date getStartDate() {

        return startDate;

    }


    public void setEndDate(Date endDate) {

        this.endDate = endDate;

    }


    public Date getEndDate() {

        return endDate;

    }


    public void setStatus(String status) {

        this.status = status;

    }


    public String getStatus() {

        return status;

    }


    public void setStatusOk(String status) {

        this.statusOk = status;

    }


    public String getStatusOk() {

        return statusOk;

    }


    public void setStatusFailed(String status) {

        this.statusFailed = status;

    }


    public String getStatusFailed() {

        return statusFailed;

    }


    public void setStatusTodo(String status) {

        this.statusTodo = status;

    }


    public String getStatusTodo() {

        return statusTodo;

    }


    public void setStatusOther(String status) {

        this.statusOther = status;

    }


    public String getStatusOther() {

        return statusOther;

    }


    public void setStatusId(String statusId) {

        try {

            this.statusId = Integer.parseInt(statusId);

        } catch (NumberFormatException e) {

            this.statusId = 0;

        }

    }


    public String getStatusId() {

        return String.valueOf(statusId);

    }


    public void setJobTypeId(String jobTypeId) {

        try {

            this.jobTypeId = Integer.parseInt(jobTypeId);

        } catch (NumberFormatException e) {

            this.jobTypeId = 0;

        }

    }


    public String getJobTypeId() {

        return String.valueOf(jobTypeId);

    }


}