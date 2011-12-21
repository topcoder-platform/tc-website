package com.topcoder.web.common.model;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */

public class EventType extends Base {

    public static final Integer CONTEST_ID = 1;
    public static final Integer INVITATIONAL_ID = 2;
    public static final Integer ROUND_ID = 3;
    public static final Integer TOURNAMENT_ID = 4;
    public static final Integer COMPONENT_TOURNAMENT_ID = 5;
    public static final Integer ALGORITHM_TOURNAMENT_ID = 6;
    public static final Integer STUDIO_TOURNAMENT_ID = 7;
    public static final Integer HIGH_SCHOOL_TOURNAMENT_ID = 8;
    public static final Integer MARATHON_TOURNAMENT_ID = 9;

    public static final Integer INTRO_EVENT_ID = 11;
    public static final Integer INTRO_EVENT_ALGO_ID = 12;
    public static final Integer INTRO_EVENT_COMP_ID = 13;
    public static final Integer SPONSOR_TRACK_ID = 15;
    public static final Integer PROFESSOR_NOMINATION_ID = 16;

    public static final Integer OPENAIM_TOURNAMENT_ID = 17;

    public EventType() {

    }

    private Integer id;
    private String description;

    public Integer getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

}

