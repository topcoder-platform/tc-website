package com.topcoder.web.codinginterface.techassess.model;

import com.topcoder.shared.netCommon.screening.ScreeningConstants;
import com.topcoder.shared.netCommon.screening.response.data.ScreeningProblemLabel;

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
    private long time = 0;
    private long startTime = 0;
    private String status = null;
    private ScreeningProblemLabel[] problems = null;


    public ProblemSetInfo() {
    }

    public ProblemSetInfo(String description, String name, long startTime, long time,
                          String status, int typeId, ScreeningProblemLabel[] problems) {
        this.description = description;
        this.name = name;
        this.time = time;
        this.startTime = startTime;
        this.status = status;
        this.typeId = typeId;
        this.problems = problems;
    }

    public int getCompletedCount() {
        int count = 0;
        for (int i = 0; i < problems.length; i++) {
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
        long ret = 0;
        if (startTime > 0) {
            ret = System.currentTimeMillis() + time - startTime;
        } else {
            ret = time;
        }
        return ret;
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


    public long getTime() {
        return time;
    }

    public void setTime(long time) {
        this.time = time;
    }

    public long getStartTime() {
        return startTime;
    }

    public void setStartTime(long startTime) {
        this.startTime = startTime;
    }
}


