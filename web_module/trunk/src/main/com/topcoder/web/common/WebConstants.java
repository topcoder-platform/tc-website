package com.topcoder.web.common;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: May 2, 2005
 */
public interface WebConstants {
    public static final String HANDLE = "ha";
    public static final String ROUND_ID = "rd";
    public static final String FORUM_ID = "forumID";
    public static final String STATIC_PREFIX = "d";
    public static final String TIMEZONE = "tz";
    public static final String USER_ID = "uid";
    public static final String COMPANY_ID = "cm";
    public static final String COMPONENT_ID = "cd";
    public static final String CONTEST_ID = "ct";
    public static final String MODULE_KEY = "module";
    public static final String PROJECT_ID_KEY = "project_id";
    public static final String USER_NAME = "username";
    public static final String PASSWORD = "password";

    public static final String PASSWORD_CONFIRM = "pac";
    public static final String EMAIL = "em";
    public static final String EMAIL_CONFIRM = "emc";
    public static final String GIVEN_NAME = "fn";
    public static final String MIDDLE_NAME = "mn";
    public static final String SURNAME = "ln";
    public static final String ADDRESS1 = "a1";
    public static final String ADDRESS2 = "a2";
    public static final String ADDRESS3 = "a3";
    public static final String COUNTRY_CODE = "cc";
    public static final String STATE_CODE = "sc";
    public static final String PROVINCE = "prov";
    public static final String CITY = "city";
    public static final String POSTAL_CODE = "zip";
    public static final String PHONE_NUMBER = "ph";

    public static final String TERMS = "terms";
    public static final String TERMS_AGREE = "terms_agree";
    public static final String TERMS_OF_USE_ID = "tuid";

    public static final String CODER_ID = "cr";
    public static final String ALGO_RATING_TYPE_ID = "ratid";


    //secondary reg parameters
    public static final String CODER_TYPE = "cty";
    public static final String DEMOG_PREFIX = "demog_";

    public static String ACTIVATION_CODE = "code";

    public static String SCHOOL_ID = "scid";

    //resume parameters
    public static final String RESUME = "resume";

    public static final int PREFERENCE_TEXT_ANSWER = 3;
    public static final int PREFERENCE_MULTIPLE_ANSWER = 2;
    public static final int PREFERENCE_SINGLE_ANSWER = 1;

    public static final int SKILL_TYPE_TECHNOLOGIES = 4;
    public static final int SKILL_TYPE_DATABASES = 3;
    public static final int SKILL_TYPE_LANGUAGES = 2;
    public static final int SKILL_TYPE_OS = 1;
    public static final int SKILL_TYPE_INDUSTRIES = 5;

    public static final int TECH_NOTE_TYPE_ID = 11;
    public static final int DB_NOTE_TYPE_ID = 13;
    public static final int LANGUAGE_NOTE_TYPE_ID = 10;
    public static final int OS_NOTE_TYPE_ID = 12;
    public static final int INDUSTRY_NOTE_TYPE_ID = 14;

    public static final int PREFERENCE_CONTRACTING = 2;
    public static final int PREFERENCE_CONTRACTING_TRUE = 32;
    public static final int PREFERENCE_CONTRACTING_FALSE = 33;
    public static final int PREFERENCE_PERMANENT = 7;
    public static final int PREFERENCE_PERMANENT_TRUE = 34;
    public static final int PREFERENCE_PERMANENT_FALSE = 35;

    public static final String LEFT_NAV_KEY = "node";

    public static final int HS_ALGO_RATING_TYPE_ID = 2;
    public static final int TC_ALGO_RATING_TYPE_ID = 1;


    public static final char[] INACTIVE_STATI = {'0', '9', '6', '5', '4', 'I'};
    public static final char[] UNACTIVE_STATI = {'2', 'U'};
    public static final char[] ACTIVE_STATI = {'1', 'A'};

}