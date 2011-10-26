package com.topcoder.web.truveo.model;

import com.topcoder.web.common.model.Base;

/**
 * @author dok
 * @version $Revision: 70119 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 15, 2007
 */
public class SubmissionStatus extends Base {
    public static final Integer ACTIVE = 1;
    public static final Integer DELETED = 2;

    private Integer id;
    private String description;

    public Integer getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }


    public void setId(Integer id) {
        this.id = id;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
