package com.topcoder.web.truveo.model;

import com.topcoder.web.common.model.Base;

/**
 * @author dok
 * @version $Revision: 70119 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 1, 2006
 */
public class DocumentType extends Base {

    public static final Integer SPECIFICTION = 1;
    public static final Integer TEMPLATE = 2;

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
