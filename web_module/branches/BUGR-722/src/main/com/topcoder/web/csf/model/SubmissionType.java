package com.topcoder.web.csf.model;

import com.topcoder.web.common.model.Base;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jun 27, 2006
 */
public class SubmissionType extends Base {

    public static final Integer INITIAL_CONTEST_SUBMISSION_TYPE = new Integer(1);

    private Integer id;
    private String description;

    public Integer getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

}
