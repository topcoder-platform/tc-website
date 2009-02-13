package com.topcoder.web.common.model;

/**
 * @author dok
 * @version $Revision: 62106 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public class QuestionType extends Base {
    private Integer id;
    private String description;
    private boolean active;

    public static final Integer SRM_SURVEY = 1;
   public static final Integer ELIGIBLE = 2;
    public static final Integer PERSONAL = 3;
    public static final Integer TOURNAMENT_TRAVEL_INFO = 4;
    public static final Integer TOURNAMENT_SURVEY_QUESTION = 5;
    public static final Integer GENERAL_SURVEY_NO_RESULTS = 6;
    public static final Integer SCHULZE_ELECTION = 7;

    public QuestionType() {

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
