package com.topcoder.web.csf.model;

import com.topcoder.web.common.model.Base;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 28, 2006
 */
public class ContestProperty extends Base {

    public static final Integer CONTEST_OVERVIEW_TEXT = new Integer(1);
    public static final Integer PRIZE_DESCRIPTION = new Integer(2);
    public static final Integer VIEWABLE_SUBMISSIONS = new Integer(3);
    public static final Integer MIN_WIDTH = new Integer(4);
    public static final Integer MAX_WIDTH = new Integer(5);
    public static final Integer MIN_HEIGHT = new Integer(6);
    public static final Integer MAX_HEIGHT = new Integer(7);
    public static final Integer MAX_SUBMISSIONS = new Integer(8);
    public static final Integer PROJECT_ID = new Integer(9);


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
