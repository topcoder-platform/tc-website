package com.topcoder.web.codinginterface.techassess.model;

import com.topcoder.shared.netCommon.screening.response.data.ScreeningProblemLabel;
import com.topcoder.shared.netCommon.screening.ScreeningConstants;

import java.util.Date;
import java.io.Serializable;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jan 5, 2005
 */
public class ProblemSetInfo implements Serializable {

    private String description = null;
    private String name = null;
    private Date timeRemaining = null;
    private String status = null;
    private ScreeningProblemLabel[] problems = null;

    public ProblemSetInfo() {
    }

    public ProblemSetInfo(String description, String name, Date timeRemaining, String status, ScreeningProblemLabel[] problems) {
        this.description = description;
        this.name = name;
        this.timeRemaining = timeRemaining;
        this.status = status;
        this.problems = problems;
    }

    public int getCompletedCount() {
        int count =0;
        for (int i=0; i<problems.length; i++) {
            int status = problems[i].getStatus().intValue();
            if (status == ScreeningConstants.SUBMITTED ||
                    status == ScreeningConstants.OUT_OF_TIME ||
                    status == ScreeningConstants.SYSTEM_TEST_SUCCEEDED ||
                    status == ScreeningConstants.SYSTEM_TEST_FAILED) {
                count++;
            }
        }
        return count;
    }

    public int getProblemCount() {
        return problems.length;
    }


    public ScreeningProblemLabel[] getProblems() {
        return problems;
    }

    public void setProblems(ScreeningProblemLabel[] problems) {
        this.problems = problems;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getTimeRemaining() {
        return timeRemaining;
    }

    public void setTimeRemaining(Date timeRemaining) {
        this.timeRemaining = timeRemaining;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}


