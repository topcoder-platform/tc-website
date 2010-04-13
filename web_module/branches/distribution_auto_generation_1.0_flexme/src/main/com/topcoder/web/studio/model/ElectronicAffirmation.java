package com.topcoder.web.studio.model;

import com.topcoder.web.common.model.Base;
import java.sql.Timestamp;

/**
 * Entity class.
 * @author Vitta
 * @version 1.0
 */
public class ElectronicAffirmation extends Base {
    private Integer submissionId;
    private Timestamp createTime;

    public Integer getSubmissionId() {
        return submissionId;
    }

    public void setSubmissionId(Integer submissionId) {
        this.submissionId = submissionId;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }
}
