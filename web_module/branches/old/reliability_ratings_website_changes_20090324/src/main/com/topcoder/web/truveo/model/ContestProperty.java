package com.topcoder.web.truveo.model;

import com.topcoder.web.common.model.Base;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 28, 2006
 */
public class ContestProperty extends Base {

    public static final Integer CONTEST_OVERVIEW_TEXT = 1;
    public static final Integer PRIZE_DESCRIPTION = 2;
    public static final Integer VIEWABLE_SUBMISSIONS = 3;
    public static final Integer MIN_WIDTH = 4;
    public static final Integer MAX_WIDTH = 5;
    public static final Integer MIN_HEIGHT = 6;
    public static final Integer MAX_HEIGHT = 7;
    public static final Integer MAX_SUBMISSIONS = 8;
    public static final Integer VIEWABLE_SUBMITTERS = 9;


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