package com.topcoder.web.codinginterface.techassess.model;

import com.topcoder.shared.netCommon.screening.response.data.ScreeningProblemLabel;
import com.topcoder.shared.netCommon.screening.ScreeningConstants;

import java.io.Serializable;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jan 5, 2005
 */
public class ProblemSetInfo implements Serializable {

    private String description = null;
    private int typeId = 0;
    private String name = null;
    private long timeRemaining = 0;
    private String status = null;
    private ScreeningProblemLabel[] problems = null;

    public ProblemSetInfo() {
    }

    public ProblemSetInfo(String description, String name, long timeRemaining,
                          String status, int typeId, ScreeningProblemLabel[] problems) {
        this.description = description;
        this.name = name;
        this.timeRemaining = timeRemaining;
        this.status = status;
        this.typeId = typeId;
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

    public long getTimeRemaining() {
        return timeRemaining;
    }

    public void setTimeRemaining(long timeRemaining) {
        this.timeRemaining = timeRemaining;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

}


