package com.topcoder.web.common.model;

/**
 * @author dok
 * @version $Revision: 62106 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public class QuestionStyle extends Base {
    private Integer id;
    private String description;
    private boolean active;

    public static final Integer SINGLE_CHOICE = 1;
    public static final Integer MULTIPLE_CHOICE = 2;
    public static final Integer LONG_ANSWER = 3;
    public static final Integer SHORT_ANSWER = 4;

    public QuestionStyle() {

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

    public boolean isActive() {
        return active;
    }
}
