package com.topcoder.web.common.voting;

import com.topcoder.web.common.model.Base;

/**
 * @author dok
 * @version $Revision: 59638 $ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 2, 2007
 */
public class ElectionStatus extends Base {
    public static final Integer ACTIVE = new Integer(2);
    public static final Integer UNACTIVE = new Integer(1);
    public static final Integer INACTIVE = new Integer(3);

    private Integer id;
    private String description;

    public ElectionStatus() {
        super();
    }

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
