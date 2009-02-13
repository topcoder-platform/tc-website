package com.topcoder.web.csf.model;

import com.topcoder.web.common.model.Base;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 1, 2006
 */
public class DocumentType extends Base {

    public static final Integer SPECIFICTION = new Integer(1);
    public static final Integer TEMPLATE = new Integer(2);

    private Integer id;
    private String description;

    public Integer getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

}
