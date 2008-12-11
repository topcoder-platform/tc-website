package com.topcoder.web.oracle.model;

import com.topcoder.web.common.model.Base;

/**
 * @author dok
 * @version $Revision: 59093 $ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 14, 2007
 */
public class CandidateProperty extends Base {

    public static final Integer IMAGE_SOURCE = 1;
    public static final Integer DOWNLOAD_URL = 2;

    private Integer id;
    private String description;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}