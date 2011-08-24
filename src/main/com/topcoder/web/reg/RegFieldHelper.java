package com.topcoder.web.reg;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.RegistrationTypeDAO;
import com.topcoder.web.common.model.CoderType;
import com.topcoder.web.common.model.RegistrationType;
import com.topcoder.web.common.model.User;

import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 28, 2006
 */
public class RegFieldHelper {

    protected static Logger log = Logger.getLogger(RegFieldHelper.class);
    private static Set<String> mainHSFields = new HashSet<String>();
    private static Set<String> mainCompFields = new HashSet<String>();
    private static Set<String> mainCorpFields = new HashSet<String>();
    private static Set<String> mainMinFields = new HashSet<String>();
    private static Set<String> mainSoftwareFields = new HashSet<String>();
    private static Set<String> mainStudioFields = new HashSet<String>();
    private static Set<String> mainTeacherFields = new HashSet<String>();
    private static Set<String> mainOpenAIMFields = new HashSet<String>();
    private static Set<String> mainTruveoFields = new HashSet<String>();

    private static Set<String> secondaryHSFields = new HashSet<String>();
    private static Set<String> secondaryCompStudentFields = new HashSet<String>();
    private static Set<String> secondaryCompProFields = new HashSet<String>();
    private static Set<String> secondaryCorpFields = new HashSet<String>();
    private static Set<String> secondaryMinFields = new HashSet<String>();
    private static Set<String> secondarySoftwareFields = new HashSet<String>();
    private static Set<String> secondaryStudioStudentFields = new HashSet<String>();
    private static Set<String> secondaryStudioProFields = new HashSet<String>();
    private static Set<String> secondaryTeacherFields = new HashSet<String>();
    private static Set<String> secondaryOpenAIMStudentFields = new HashSet<String>();
    private static Set<String> secondaryOpenAIMProFields = new HashSet<String>();
    private static Set<String> secondaryTruveoStudentFields = new HashSet<String>();
    private static Set<String> secondaryTruveoProFields = new HashSet<String>();

    private static Set<String> requiredMainHSFields = new HashSet<String>();
    private static Set<String> requiredMainCompFields = new HashSet<String>();
    private static Set<String> requiredMainCorpFields = new HashSet<String>();
    private static Set<String> requiredMainMinFields = new HashSet<String>();
    private static Set<String> requiredMainSoftwareFields = new HashSet<String>();
    private static Set<String> requiredMainStudioFields = new HashSet<String>();
    private static Set<String> requiredMainTeacherFields = new HashSet<String>();
    private static Set<String> requiredMainOpenAIMFields = new HashSet<String>();
    private static Set<String> requiredMainTruveoFields = new HashSet<String>();

    private static Set<String> requiredSecondaryHSFields = new HashSet<String>();
    private static Set<String> requiredSecondaryCompStudentFields = new HashSet<String>();
    private static Set<String> requiredSecondaryCompProFields = new HashSet<String>();
    private static Set<String> requiredSecondaryCorpFields = new HashSet<String>();
    private static Set<String> requiredSecondaryMinFields = new HashSet<String>();
    private static Set<String> requiredSecondarySoftwareFields = new HashSet<String>();
    private static Set<String> requiredSecondaryStudioStudentFields = new HashSet<String>();
    private static Set<String> requiredSecondaryStudioProFields = new HashSet<String>();
    private static Set<String> requiredSecondaryTeacherFields = new HashSet<String>();
    private static Set<String> requiredSecondaryOpenAIMStudentFields = new HashSet<String>();
    private static Set<String> requiredSecondaryOpenAIMProFields = new HashSet<String>();
    private static Set<String> requiredSecondaryTruveoStudentFields = new HashSet<String>();
    private static Set<String> requiredSecondaryTruveoProFields = new HashSet<String>();


    static {
        mainCompFields.add(Constants.GIVEN_NAME);
        mainCompFields.add(Constants.SURNAME);
        mainCompFields.add(Constants.NAME_IN_ANOTHER_LANGUAGE);
        mainCompFields.add(Constants.ADDRESS1);
        mainCompFields.add(Constants.ADDRESS2);
        mainCompFields.add(Constants.ADDRESS3);
        mainCompFields.add(Constants.CITY);
        mainCompFields.add(Constants.STATE_CODE);
        mainCompFields.add(Constants.POSTAL_CODE);
        mainCompFields.add(Constants.PROVINCE);
        mainCompFields.add(Constants.COUNTRY_CODE);
        mainCompFields.add(Constants.PHONE_NUMBER);
        mainCompFields.add(Constants.HANDLE);
        mainCompFields.add(Constants.PASSWORD);
        mainCompFields.add(Constants.PASSWORD_CONFIRM);
        mainCompFields.add(Constants.SECRET_QUESTION);
        mainCompFields.add(Constants.SECRET_QUESTION_RESPONSE);
        mainCompFields.add(Constants.SECURITY_KEY);
        mainCompFields.add(Constants.EMAIL);
        mainCompFields.add(Constants.EMAIL_CONFIRM);
        mainCompFields.add(Constants.QUOTE);
        mainCompFields.add(Constants.NOTIFICATION);
        mainCompFields.add(Constants.MEMBER_CONTACT);
        mainCompFields.add(Constants.SHOW_EARNINGS);
        mainCompFields.add(Constants.COMP_COUNTRY_CODE);
        mainCompFields.add(Constants.CODER_TYPE);
        mainCompFields.add(Constants.TIMEZONE);

        requiredMainCompFields.add(Constants.GIVEN_NAME);
        requiredMainCompFields.add(Constants.SURNAME);
        requiredMainCompFields.add(Constants.ADDRESS1);
        requiredMainCompFields.add(Constants.CITY);
        requiredMainCompFields.add(Constants.COUNTRY_CODE);
        requiredMainCompFields.add(Constants.HANDLE);
        requiredMainCompFields.add(Constants.PASSWORD);
        requiredMainCompFields.add(Constants.PASSWORD_CONFIRM);
        requiredMainCompFields.add(Constants.SECRET_QUESTION);
        requiredMainCompFields.add(Constants.SECRET_QUESTION_RESPONSE);
        requiredMainCompFields.add(Constants.SECURITY_KEY);
        requiredMainCompFields.add(Constants.EMAIL);
        requiredMainCompFields.add(Constants.EMAIL_CONFIRM);
        requiredMainCompFields.add(Constants.MEMBER_CONTACT);
        requiredMainCompFields.add(Constants.SHOW_EARNINGS);
        requiredMainCompFields.add(Constants.COMP_COUNTRY_CODE);
        requiredMainCompFields.add(Constants.CODER_TYPE);
        requiredMainCompFields.add(Constants.TIMEZONE);

        secondaryCompStudentFields.add(Constants.DEMOG_PREFIX);
        secondaryCompStudentFields.add(Constants.RESUME);
        secondaryCompStudentFields.add(Constants.GPA);
        secondaryCompStudentFields.add(Constants.GPA_SCALE);
        secondaryCompStudentFields.add(Constants.VISIBLE_SCHOOL);
        secondaryCompStudentFields.add(Constants.SCHOOL_NAME);
        secondaryCompStudentFields.add(Constants.SCHOOL_CITY);
        secondaryCompStudentFields.add(Constants.SCHOOL_ID);
        secondaryCompStudentFields.add(Constants.SCHOOL_PROVINCE);
        secondaryCompStudentFields.add(Constants.SCHOOL_STATE);
        secondaryCompStudentFields.add(Constants.SCHOOL_COUNTRY);
        secondaryCompStudentFields.add(Constants.SCHOOL_TYPE);
        secondaryCompStudentFields.add(Constants.REFERRAL);
        secondaryCompStudentFields.add(Constants.REFERRAL_CODER);
        secondaryCompStudentFields.add(Constants.REFERRAL_OTHER);

        requiredSecondaryCompStudentFields.add(Constants.VISIBLE_SCHOOL);
        requiredSecondaryCompStudentFields.add(Constants.SCHOOL_NAME);
        requiredSecondaryCompStudentFields.add(Constants.SCHOOL_CITY);
        requiredSecondaryCompStudentFields.add(Constants.SCHOOL_ID);
        requiredSecondaryCompStudentFields.add(Constants.SCHOOL_COUNTRY);
        requiredSecondaryCompStudentFields.add(Constants.SCHOOL_TYPE);
        requiredSecondaryCompStudentFields.add(Constants.REFERRAL);

        secondaryCompProFields.add(Constants.DEMOG_PREFIX);
        secondaryCompProFields.add(Constants.RESUME);
        secondaryCompProFields.add(Constants.REFERRAL);
        secondaryCompProFields.add(Constants.REFERRAL_CODER);
        secondaryCompProFields.add(Constants.REFERRAL_OTHER);
        secondaryCompProFields.add(Constants.TITLE);
        secondaryCompProFields.add(Constants.COMPANY_NAME);

        requiredSecondaryCompProFields.add(Constants.REFERRAL);
        requiredSecondaryCompProFields.add(Constants.TITLE);
        requiredSecondaryCompProFields.add(Constants.COMPANY_NAME);
    }


    static {
        mainHSFields.add(Constants.GIVEN_NAME);
        mainHSFields.add(Constants.SURNAME);
        mainHSFields.add(Constants.NAME_IN_ANOTHER_LANGUAGE);
        mainHSFields.add(Constants.CITY);
        mainHSFields.add(Constants.STATE_CODE);
        mainHSFields.add(Constants.COUNTRY_CODE);
        mainHSFields.add(Constants.HANDLE);
        mainHSFields.add(Constants.PASSWORD);
        mainHSFields.add(Constants.PASSWORD_CONFIRM);
        mainHSFields.add(Constants.SECRET_QUESTION);
        mainHSFields.add(Constants.SECRET_QUESTION_RESPONSE);
        mainHSFields.add(Constants.SECURITY_KEY);
        mainHSFields.add(Constants.EMAIL);
        mainHSFields.add(Constants.EMAIL_CONFIRM);
        mainHSFields.add(Constants.QUOTE);
        mainHSFields.add(Constants.NOTIFICATION);
        mainHSFields.add(Constants.TIMEZONE);

        requiredMainHSFields.add(Constants.GIVEN_NAME);
        requiredMainHSFields.add(Constants.SURNAME);
        requiredMainHSFields.add(Constants.CITY);
        requiredMainHSFields.add(Constants.COUNTRY_CODE);
        requiredMainHSFields.add(Constants.HANDLE);
        requiredMainHSFields.add(Constants.PASSWORD);
        requiredMainHSFields.add(Constants.PASSWORD_CONFIRM);
        requiredMainHSFields.add(Constants.SECRET_QUESTION);
        requiredMainHSFields.add(Constants.SECRET_QUESTION_RESPONSE);
        requiredMainHSFields.add(Constants.SECURITY_KEY);
        requiredMainHSFields.add(Constants.EMAIL);
        requiredMainHSFields.add(Constants.EMAIL_CONFIRM);
        requiredMainHSFields.add(Constants.TIMEZONE);

    }

    static {
        secondaryHSFields.add(Constants.DEMOG_PREFIX);
        secondaryHSFields.add(Constants.SCHOOL_NAME);
        secondaryHSFields.add(Constants.SCHOOL_CITY);
        secondaryHSFields.add(Constants.SCHOOL_ID);
        secondaryHSFields.add(Constants.SCHOOL_PROVINCE);
        secondaryHSFields.add(Constants.SCHOOL_STATE);
        secondaryHSFields.add(Constants.SCHOOL_COUNTRY);
        secondaryHSFields.add(Constants.SCHOOL_TYPE);

        requiredSecondaryHSFields.add(Constants.SCHOOL_NAME);
        requiredSecondaryHSFields.add(Constants.SCHOOL_CITY);
        requiredSecondaryHSFields.add(Constants.SCHOOL_ID);
        requiredSecondaryHSFields.add(Constants.SCHOOL_COUNTRY);
        requiredSecondaryHSFields.add(Constants.SCHOOL_TYPE);
    }

    static {
        mainCorpFields.add(Constants.GIVEN_NAME);
        mainCorpFields.add(Constants.SURNAME);
        mainCorpFields.add(Constants.NAME_IN_ANOTHER_LANGUAGE);
        mainCorpFields.add(Constants.ADDRESS1);
        mainCorpFields.add(Constants.ADDRESS2);
        mainCorpFields.add(Constants.ADDRESS3);
        mainCorpFields.add(Constants.CITY);
        mainCorpFields.add(Constants.STATE_CODE);
        mainCorpFields.add(Constants.POSTAL_CODE);
        mainCorpFields.add(Constants.PROVINCE);
        mainCorpFields.add(Constants.COUNTRY_CODE);
        mainCorpFields.add(Constants.PHONE_NUMBER);
        mainCorpFields.add(Constants.HANDLE);
        mainCorpFields.add(Constants.PASSWORD);
        mainCorpFields.add(Constants.PASSWORD_CONFIRM);
        mainCorpFields.add(Constants.SECRET_QUESTION);
        mainCorpFields.add(Constants.SECRET_QUESTION_RESPONSE);
        mainCorpFields.add(Constants.SECURITY_KEY);
        mainCorpFields.add(Constants.EMAIL);
        mainCorpFields.add(Constants.EMAIL_CONFIRM);
        mainCorpFields.add(Constants.TIMEZONE);
        mainCorpFields.add(Constants.TITLE);
        mainCorpFields.add(Constants.COMPANY_NAME);

        requiredMainCorpFields.add(Constants.GIVEN_NAME);
        requiredMainCorpFields.add(Constants.SURNAME);
        requiredMainCorpFields.add(Constants.ADDRESS1);
        requiredMainCorpFields.add(Constants.CITY);
        requiredMainCorpFields.add(Constants.COUNTRY_CODE);
        requiredMainCorpFields.add(Constants.PHONE_NUMBER);
        requiredMainCorpFields.add(Constants.HANDLE);
        requiredMainCorpFields.add(Constants.PASSWORD);
        requiredMainCorpFields.add(Constants.PASSWORD_CONFIRM);
        requiredMainCorpFields.add(Constants.SECRET_QUESTION);
        requiredMainCorpFields.add(Constants.SECRET_QUESTION_RESPONSE);
        requiredMainCorpFields.add(Constants.SECURITY_KEY);
        requiredMainCorpFields.add(Constants.EMAIL);
        requiredMainCorpFields.add(Constants.EMAIL_CONFIRM);
        requiredMainCorpFields.add(Constants.TIMEZONE);
        requiredMainCorpFields.add(Constants.TITLE);
        requiredMainCorpFields.add(Constants.COMPANY_NAME);

    }

    static {
        mainSoftwareFields.add(Constants.GIVEN_NAME);
        mainSoftwareFields.add(Constants.SURNAME);
        mainSoftwareFields.add(Constants.NAME_IN_ANOTHER_LANGUAGE);
        mainSoftwareFields.add(Constants.ADDRESS1);
        mainSoftwareFields.add(Constants.ADDRESS2);
        mainSoftwareFields.add(Constants.ADDRESS3);
        mainSoftwareFields.add(Constants.CITY);
        mainSoftwareFields.add(Constants.STATE_CODE);
        mainSoftwareFields.add(Constants.POSTAL_CODE);
        mainSoftwareFields.add(Constants.PROVINCE);
        mainSoftwareFields.add(Constants.COUNTRY_CODE);
        mainSoftwareFields.add(Constants.PHONE_NUMBER);
        mainSoftwareFields.add(Constants.HANDLE);
        mainSoftwareFields.add(Constants.PASSWORD);
        mainSoftwareFields.add(Constants.PASSWORD_CONFIRM);
        mainSoftwareFields.add(Constants.SECRET_QUESTION);
        mainSoftwareFields.add(Constants.SECRET_QUESTION_RESPONSE);
        mainSoftwareFields.add(Constants.SECURITY_KEY);
        mainSoftwareFields.add(Constants.EMAIL);
        mainSoftwareFields.add(Constants.EMAIL_CONFIRM);
        mainSoftwareFields.add(Constants.NOTIFICATION);
        mainSoftwareFields.add(Constants.TIMEZONE);
        mainSoftwareFields.add(Constants.TITLE);
        mainSoftwareFields.add(Constants.COMPANY_NAME);

        requiredMainSoftwareFields.add(Constants.GIVEN_NAME);
        requiredMainSoftwareFields.add(Constants.SURNAME);
        requiredMainSoftwareFields.add(Constants.ADDRESS1);
        requiredMainSoftwareFields.add(Constants.CITY);
        requiredMainSoftwareFields.add(Constants.COUNTRY_CODE);
        requiredMainSoftwareFields.add(Constants.PHONE_NUMBER);
        requiredMainSoftwareFields.add(Constants.HANDLE);
        requiredMainSoftwareFields.add(Constants.PASSWORD);
        requiredMainSoftwareFields.add(Constants.PASSWORD_CONFIRM);
        requiredMainSoftwareFields.add(Constants.SECRET_QUESTION);
        requiredMainSoftwareFields.add(Constants.SECRET_QUESTION_RESPONSE);
        requiredMainSoftwareFields.add(Constants.SECURITY_KEY);
        requiredMainSoftwareFields.add(Constants.EMAIL);
        requiredMainSoftwareFields.add(Constants.EMAIL_CONFIRM);
        requiredMainSoftwareFields.add(Constants.TIMEZONE);
        requiredMainSoftwareFields.add(Constants.TITLE);
        requiredMainSoftwareFields.add(Constants.COMPANY_NAME);

        secondarySoftwareFields.add(Constants.DEMOG_PREFIX);
    }

    static {
        mainMinFields.add(Constants.HANDLE);
        mainMinFields.add(Constants.PASSWORD);
        mainMinFields.add(Constants.PASSWORD_CONFIRM);
        mainMinFields.add(Constants.SECRET_QUESTION);
        mainMinFields.add(Constants.SECRET_QUESTION_RESPONSE);
        mainMinFields.add(Constants.SECURITY_KEY);
        mainMinFields.add(Constants.EMAIL);
        mainMinFields.add(Constants.EMAIL_CONFIRM);
        mainMinFields.add(Constants.TIMEZONE);

        //secondary page for min reg is empty
    }

    static {
        mainStudioFields.add(Constants.GIVEN_NAME);
        mainStudioFields.add(Constants.SURNAME);
        mainStudioFields.add(Constants.NAME_IN_ANOTHER_LANGUAGE);
        mainStudioFields.add(Constants.ADDRESS1);
        mainStudioFields.add(Constants.ADDRESS2);
        mainStudioFields.add(Constants.ADDRESS3);
        mainStudioFields.add(Constants.CITY);
        mainStudioFields.add(Constants.STATE_CODE);
        mainStudioFields.add(Constants.POSTAL_CODE);
        mainStudioFields.add(Constants.PROVINCE);
        mainStudioFields.add(Constants.COUNTRY_CODE);
        mainStudioFields.add(Constants.PHONE_NUMBER);
        mainStudioFields.add(Constants.HANDLE);
        mainStudioFields.add(Constants.PASSWORD);
        mainStudioFields.add(Constants.PASSWORD_CONFIRM);
        mainStudioFields.add(Constants.SECRET_QUESTION);
        mainStudioFields.add(Constants.SECRET_QUESTION_RESPONSE);
        mainStudioFields.add(Constants.SECURITY_KEY);
        mainStudioFields.add(Constants.EMAIL);
        mainStudioFields.add(Constants.EMAIL_CONFIRM);
        mainStudioFields.add(Constants.NOTIFICATION);
        mainStudioFields.add(Constants.COMP_COUNTRY_CODE);
        mainStudioFields.add(Constants.CODER_TYPE);
        mainStudioFields.add(Constants.TIMEZONE);

        requiredMainStudioFields.add(Constants.GIVEN_NAME);
        requiredMainStudioFields.add(Constants.SURNAME);
        requiredMainStudioFields.add(Constants.ADDRESS1);
        requiredMainStudioFields.add(Constants.CITY);
        requiredMainStudioFields.add(Constants.COUNTRY_CODE);
        requiredMainStudioFields.add(Constants.HANDLE);
        requiredMainStudioFields.add(Constants.PASSWORD);
        requiredMainStudioFields.add(Constants.PASSWORD_CONFIRM);
        requiredMainStudioFields.add(Constants.SECRET_QUESTION);
        requiredMainStudioFields.add(Constants.SECRET_QUESTION_RESPONSE);
        requiredMainStudioFields.add(Constants.EMAIL);
        requiredMainStudioFields.add(Constants.EMAIL_CONFIRM);
        requiredMainStudioFields.add(Constants.COMP_COUNTRY_CODE);
        requiredMainStudioFields.add(Constants.CODER_TYPE);
        requiredMainStudioFields.add(Constants.TIMEZONE);

        secondaryStudioStudentFields.add(Constants.DEMOG_PREFIX);
        secondaryStudioStudentFields.add(Constants.VISIBLE_SCHOOL);
        secondaryStudioStudentFields.add(Constants.SCHOOL_NAME);
        secondaryStudioStudentFields.add(Constants.SCHOOL_CITY);
        secondaryStudioStudentFields.add(Constants.SCHOOL_ID);
        secondaryStudioStudentFields.add(Constants.SCHOOL_PROVINCE);
        secondaryStudioStudentFields.add(Constants.SCHOOL_STATE);
        secondaryStudioStudentFields.add(Constants.SCHOOL_COUNTRY);
        secondaryStudioStudentFields.add(Constants.SCHOOL_TYPE);
        secondaryStudioStudentFields.add(Constants.REFERRAL);
        secondaryStudioStudentFields.add(Constants.REFERRAL_CODER);
        secondaryStudioStudentFields.add(Constants.REFERRAL_OTHER);


        requiredSecondaryStudioStudentFields.add(Constants.VISIBLE_SCHOOL);
        requiredSecondaryStudioStudentFields.add(Constants.SCHOOL_NAME);
        requiredSecondaryStudioStudentFields.add(Constants.SCHOOL_CITY);
        requiredSecondaryStudioStudentFields.add(Constants.SCHOOL_ID);
        requiredSecondaryStudioStudentFields.add(Constants.SCHOOL_COUNTRY);
        requiredSecondaryStudioStudentFields.add(Constants.SCHOOL_TYPE);
        requiredSecondaryStudioStudentFields.add(Constants.REFERRAL);

        secondaryStudioProFields.add(Constants.DEMOG_PREFIX);
        secondaryStudioProFields.add(Constants.TITLE);
        secondaryStudioProFields.add(Constants.COMPANY_NAME);
        secondaryStudioProFields.add(Constants.REFERRAL);
        secondaryStudioProFields.add(Constants.REFERRAL_CODER);
        secondaryStudioProFields.add(Constants.REFERRAL_OTHER);

        requiredSecondaryStudioProFields.add(Constants.TITLE);
        requiredSecondaryStudioProFields.add(Constants.COMPANY_NAME);
        requiredSecondaryStudioProFields.add(Constants.REFERRAL);


    }


    static {
        mainTeacherFields.add(Constants.GIVEN_NAME);
        mainTeacherFields.add(Constants.SURNAME);
        mainTeacherFields.add(Constants.ADDRESS1);
        mainTeacherFields.add(Constants.ADDRESS2);
        mainTeacherFields.add(Constants.ADDRESS3);
        mainTeacherFields.add(Constants.CITY);
        mainTeacherFields.add(Constants.STATE_CODE);
        mainTeacherFields.add(Constants.POSTAL_CODE);
        mainTeacherFields.add(Constants.PROVINCE);
        mainTeacherFields.add(Constants.COUNTRY_CODE);
        mainTeacherFields.add(Constants.PHONE_NUMBER);
        mainTeacherFields.add(Constants.HANDLE);
        mainTeacherFields.add(Constants.PASSWORD);
        mainTeacherFields.add(Constants.PASSWORD_CONFIRM);
        mainTeacherFields.add(Constants.SECRET_QUESTION);
        mainTeacherFields.add(Constants.SECRET_QUESTION_RESPONSE);
        mainTeacherFields.add(Constants.SECURITY_KEY);
        mainTeacherFields.add(Constants.EMAIL);
        mainTeacherFields.add(Constants.EMAIL_CONFIRM);
        mainTeacherFields.add(Constants.NOTIFICATION);
        mainTeacherFields.add(Constants.TIMEZONE);

        requiredMainTeacherFields.add(Constants.GIVEN_NAME);
        requiredMainTeacherFields.add(Constants.SURNAME);
        requiredMainTeacherFields.add(Constants.ADDRESS1);
        requiredMainTeacherFields.add(Constants.CITY);
        requiredMainTeacherFields.add(Constants.COUNTRY_CODE);
        requiredMainTeacherFields.add(Constants.PHONE_NUMBER);
        requiredMainTeacherFields.add(Constants.HANDLE);
        requiredMainTeacherFields.add(Constants.PASSWORD);
        requiredMainTeacherFields.add(Constants.PASSWORD_CONFIRM);
        requiredMainTeacherFields.add(Constants.SECRET_QUESTION);
        requiredMainTeacherFields.add(Constants.SECRET_QUESTION_RESPONSE);
        requiredMainTeacherFields.add(Constants.EMAIL);
        requiredMainTeacherFields.add(Constants.EMAIL_CONFIRM);
        requiredMainTeacherFields.add(Constants.TIMEZONE);


        secondaryTeacherFields.add(Constants.DEMOG_PREFIX);
        secondaryTeacherFields.add(Constants.SCHOOL_NAME);
        secondaryTeacherFields.add(Constants.SCHOOL_CITY);
        secondaryTeacherFields.add(Constants.SCHOOL_ID);
        secondaryTeacherFields.add(Constants.SCHOOL_PROVINCE);
        secondaryTeacherFields.add(Constants.SCHOOL_STATE);
        secondaryTeacherFields.add(Constants.SCHOOL_COUNTRY);
        secondaryTeacherFields.add(Constants.SCHOOL_TYPE);
        /*secondaryTeacherFields.add(Constants.REFERRAL);
        secondaryTeacherFields.add(Constants.REFERRAL_CODER);
        secondaryTeacherFields.add(Constants.REFERRAL_OTHER);
*/
        requiredSecondaryTeacherFields.add(Constants.SCHOOL_NAME);
        requiredSecondaryTeacherFields.add(Constants.SCHOOL_CITY);
        requiredSecondaryTeacherFields.add(Constants.SCHOOL_ID);
        requiredSecondaryTeacherFields.add(Constants.SCHOOL_COUNTRY);
        requiredSecondaryTeacherFields.add(Constants.SCHOOL_TYPE);
        //requiredSecondaryTeacherFields.add(Constants.REFERRAL);

    }


    static {
        mainOpenAIMFields.add(Constants.GIVEN_NAME);
        mainOpenAIMFields.add(Constants.SURNAME);
        mainOpenAIMFields.add(Constants.ADDRESS1);
        mainOpenAIMFields.add(Constants.ADDRESS2);
        mainOpenAIMFields.add(Constants.ADDRESS3);
        mainOpenAIMFields.add(Constants.CITY);
        mainOpenAIMFields.add(Constants.STATE_CODE);
        mainOpenAIMFields.add(Constants.POSTAL_CODE);
        mainOpenAIMFields.add(Constants.PROVINCE);
        mainOpenAIMFields.add(Constants.COUNTRY_CODE);
        mainOpenAIMFields.add(Constants.PHONE_NUMBER);
        mainOpenAIMFields.add(Constants.HANDLE);
        mainOpenAIMFields.add(Constants.PASSWORD);
        mainOpenAIMFields.add(Constants.PASSWORD_CONFIRM);
        mainOpenAIMFields.add(Constants.SECRET_QUESTION);
        mainOpenAIMFields.add(Constants.SECRET_QUESTION_RESPONSE);
        mainOpenAIMFields.add(Constants.SECURITY_KEY);
        mainOpenAIMFields.add(Constants.EMAIL);
        mainOpenAIMFields.add(Constants.EMAIL_CONFIRM);
        mainOpenAIMFields.add(Constants.NOTIFICATION);
        mainOpenAIMFields.add(Constants.COMP_COUNTRY_CODE);
        mainOpenAIMFields.add(Constants.CODER_TYPE);
        mainOpenAIMFields.add(Constants.TIMEZONE);

        requiredMainOpenAIMFields.add(Constants.GIVEN_NAME);
        requiredMainOpenAIMFields.add(Constants.SURNAME);
        requiredMainOpenAIMFields.add(Constants.ADDRESS1);
        requiredMainOpenAIMFields.add(Constants.CITY);
        requiredMainOpenAIMFields.add(Constants.COUNTRY_CODE);
        requiredMainOpenAIMFields.add(Constants.HANDLE);
        requiredMainOpenAIMFields.add(Constants.PASSWORD);
        requiredMainOpenAIMFields.add(Constants.PASSWORD_CONFIRM);
        requiredMainOpenAIMFields.add(Constants.SECRET_QUESTION);
        requiredMainOpenAIMFields.add(Constants.SECRET_QUESTION_RESPONSE);
        requiredMainOpenAIMFields.add(Constants.SECURITY_KEY);
        requiredMainOpenAIMFields.add(Constants.EMAIL);
        requiredMainOpenAIMFields.add(Constants.EMAIL_CONFIRM);
        requiredMainOpenAIMFields.add(Constants.COMP_COUNTRY_CODE);
        requiredMainOpenAIMFields.add(Constants.CODER_TYPE);
        requiredMainOpenAIMFields.add(Constants.TIMEZONE);

        secondaryOpenAIMStudentFields.add(Constants.DEMOG_PREFIX);
        secondaryOpenAIMStudentFields.add(Constants.VISIBLE_SCHOOL);
        secondaryOpenAIMStudentFields.add(Constants.SCHOOL_NAME);
        secondaryOpenAIMStudentFields.add(Constants.SCHOOL_CITY);
        secondaryOpenAIMStudentFields.add(Constants.SCHOOL_ID);
        secondaryOpenAIMStudentFields.add(Constants.SCHOOL_PROVINCE);
        secondaryOpenAIMStudentFields.add(Constants.SCHOOL_STATE);
        secondaryOpenAIMStudentFields.add(Constants.SCHOOL_COUNTRY);
        secondaryOpenAIMStudentFields.add(Constants.SCHOOL_TYPE);
        secondaryOpenAIMStudentFields.add(Constants.REFERRAL);
        secondaryOpenAIMStudentFields.add(Constants.REFERRAL_CODER);
        secondaryOpenAIMStudentFields.add(Constants.REFERRAL_OTHER);


        requiredSecondaryOpenAIMStudentFields.add(Constants.VISIBLE_SCHOOL);
        requiredSecondaryOpenAIMStudentFields.add(Constants.SCHOOL_NAME);
        requiredSecondaryOpenAIMStudentFields.add(Constants.SCHOOL_CITY);
        requiredSecondaryOpenAIMStudentFields.add(Constants.SCHOOL_ID);
        requiredSecondaryOpenAIMStudentFields.add(Constants.SCHOOL_COUNTRY);
        requiredSecondaryOpenAIMStudentFields.add(Constants.SCHOOL_TYPE);
        requiredSecondaryOpenAIMStudentFields.add(Constants.REFERRAL);

        secondaryOpenAIMProFields.add(Constants.DEMOG_PREFIX);
        secondaryOpenAIMProFields.add(Constants.TITLE);
        secondaryOpenAIMProFields.add(Constants.COMPANY_NAME);
        secondaryOpenAIMProFields.add(Constants.REFERRAL);
        secondaryOpenAIMProFields.add(Constants.REFERRAL_CODER);
        secondaryOpenAIMProFields.add(Constants.REFERRAL_OTHER);

        requiredSecondaryOpenAIMProFields.add(Constants.TITLE);
        requiredSecondaryOpenAIMProFields.add(Constants.COMPANY_NAME);
        requiredSecondaryOpenAIMProFields.add(Constants.REFERRAL);


    }

    static {
        mainTruveoFields.add(Constants.GIVEN_NAME);
        mainTruveoFields.add(Constants.SURNAME);
        mainTruveoFields.add(Constants.ADDRESS1);
        mainTruveoFields.add(Constants.ADDRESS2);
        mainTruveoFields.add(Constants.ADDRESS3);
        mainTruveoFields.add(Constants.CITY);
        mainTruveoFields.add(Constants.STATE_CODE);
        mainTruveoFields.add(Constants.POSTAL_CODE);
        mainTruveoFields.add(Constants.PROVINCE);
        mainTruveoFields.add(Constants.COUNTRY_CODE);
        mainTruveoFields.add(Constants.PHONE_NUMBER);
        mainTruveoFields.add(Constants.HANDLE);
        mainTruveoFields.add(Constants.PASSWORD);
        mainTruveoFields.add(Constants.PASSWORD_CONFIRM);
        mainTruveoFields.add(Constants.SECRET_QUESTION);
        mainTruveoFields.add(Constants.SECRET_QUESTION_RESPONSE);
        mainTruveoFields.add(Constants.SECURITY_KEY);
        mainTruveoFields.add(Constants.EMAIL);
        mainTruveoFields.add(Constants.EMAIL_CONFIRM);
        mainTruveoFields.add(Constants.NOTIFICATION);
        mainTruveoFields.add(Constants.COMP_COUNTRY_CODE);
        mainTruveoFields.add(Constants.CODER_TYPE);
        mainTruveoFields.add(Constants.TIMEZONE);

        requiredMainTruveoFields.add(Constants.GIVEN_NAME);
        requiredMainTruveoFields.add(Constants.SURNAME);
        requiredMainTruveoFields.add(Constants.ADDRESS1);
        requiredMainTruveoFields.add(Constants.CITY);
        requiredMainTruveoFields.add(Constants.COUNTRY_CODE);
        requiredMainTruveoFields.add(Constants.HANDLE);
        requiredMainTruveoFields.add(Constants.PASSWORD);
        requiredMainTruveoFields.add(Constants.PASSWORD_CONFIRM);
        requiredMainTruveoFields.add(Constants.SECRET_QUESTION);
        requiredMainTruveoFields.add(Constants.SECRET_QUESTION_RESPONSE);
        requiredMainTruveoFields.add(Constants.EMAIL);
        requiredMainTruveoFields.add(Constants.EMAIL_CONFIRM);
        requiredMainTruveoFields.add(Constants.COMP_COUNTRY_CODE);
        requiredMainTruveoFields.add(Constants.CODER_TYPE);
        requiredMainTruveoFields.add(Constants.TIMEZONE);

        secondaryTruveoStudentFields.add(Constants.DEMOG_PREFIX);
        secondaryTruveoStudentFields.add(Constants.VISIBLE_SCHOOL);
        secondaryTruveoStudentFields.add(Constants.SCHOOL_NAME);
        secondaryTruveoStudentFields.add(Constants.SCHOOL_CITY);
        secondaryTruveoStudentFields.add(Constants.SCHOOL_ID);
        secondaryTruveoStudentFields.add(Constants.SCHOOL_PROVINCE);
        secondaryTruveoStudentFields.add(Constants.SCHOOL_STATE);
        secondaryTruveoStudentFields.add(Constants.SCHOOL_COUNTRY);
        secondaryTruveoStudentFields.add(Constants.SCHOOL_TYPE);
        secondaryTruveoStudentFields.add(Constants.REFERRAL);
        secondaryTruveoStudentFields.add(Constants.REFERRAL_CODER);
        secondaryTruveoStudentFields.add(Constants.REFERRAL_OTHER);


        requiredSecondaryTruveoStudentFields.add(Constants.VISIBLE_SCHOOL);
        requiredSecondaryTruveoStudentFields.add(Constants.SCHOOL_NAME);
        requiredSecondaryTruveoStudentFields.add(Constants.SCHOOL_CITY);
        requiredSecondaryTruveoStudentFields.add(Constants.SCHOOL_ID);
        requiredSecondaryTruveoStudentFields.add(Constants.SCHOOL_COUNTRY);
        requiredSecondaryTruveoStudentFields.add(Constants.SCHOOL_TYPE);
        requiredSecondaryTruveoStudentFields.add(Constants.REFERRAL);

        secondaryTruveoProFields.add(Constants.DEMOG_PREFIX);
        secondaryTruveoProFields.add(Constants.TITLE);
        secondaryTruveoProFields.add(Constants.COMPANY_NAME);
        secondaryTruveoProFields.add(Constants.REFERRAL);
        secondaryTruveoProFields.add(Constants.REFERRAL_CODER);
        secondaryTruveoProFields.add(Constants.REFERRAL_OTHER);

        requiredSecondaryTruveoProFields.add(Constants.TITLE);
        requiredSecondaryTruveoProFields.add(Constants.COMPANY_NAME);
        requiredSecondaryTruveoProFields.add(Constants.REFERRAL);


    }


    /**
     * Figure out what registration fields are relevant for the given set of registration types
     * and whether or not they're updating information, or creating it.
     *
     * @param regTypes all the types the user is attempting to register/update for
     * @param user     the user attempting to register/update their information
     * @return all the fields that should be presented to the user on the "main" page of registration
     */
    public static Set getMainFieldSet(Set regTypes, User user) {
        return getMainFieldSet(regTypes, user, false);
    }


    /**
     * Figure out what registration fields are relevant for the given set of registration types
     * and whether or not they're updating information, or creating it.
     *
     * @param regTypes all the types the user is attempting to register/update for
     * @param user     the user attempting to register/update their information
     * @return all the fields that should be presented to the user on the "secondary" page of registration
     */
    public static Set getSecondaryFieldSet(Set regTypes, User user) {
        return getSecondaryFieldSet(regTypes, user, false);
    }


    public static Set getMainRequiredFieldSet(Set regTypes, User user) {
        return getMainFieldSet(regTypes, user, true);
    }


    public static Set getSecondaryRequiredFieldSet(Set regTypes, User user) {
        return getSecondaryFieldSet(regTypes, user, true);
    }


    /**
     * @param regTypes the reg types the user is registering for
     * @param user     the user
     * @param required whether or not the caller wants to return the list of required fields or the list of all fields
     * @return the fields
     */
    private static Set getMainFieldSet(Set regTypes, User user, boolean required) {
        log.debug("getMainFieldSet called with required: " + required);
        Set<String> ret = new HashSet<String>();

        Set currentTypes;
        if (user == null || user.getId() == null) {
            currentTypes = Collections.EMPTY_SET;
        } else {
            currentTypes = user.getRegistrationTypes();
        }

        RegistrationTypeDAO dao = DAOUtil.getFactory().getRegistrationTypeDAO();

        List<RegistrationType> allRegTypes = dao.getRegistrationTypes();
        for (RegistrationType curr : allRegTypes) {
            log.debug("working on type: " + curr.getName());
            if (regTypes.contains(curr) && currentTypes.contains(curr)) {
                //must be an update
                if (curr.getId().equals(RegistrationType.COMPETITION_ID)) {
                    if (required) {
                        ret.addAll(requiredMainCompFields);
                    } else {
                        ret.addAll(mainCompFields);
                        ret.add(Constants.PHOTO);
                    }
                } else if (curr.getId().equals(RegistrationType.CORPORATE_ID)) {
                    if (required) {
                        ret.addAll(requiredMainCorpFields);
                    } else {
                        ret.addAll(mainCorpFields);
                    }
                } else if (curr.getId().equals(RegistrationType.HIGH_SCHOOL_ID)) {
                    if (required) {
                        ret.addAll(requiredMainHSFields);
                    } else {
                        ret.addAll(mainHSFields);
                    }
                } else if (curr.getId().equals(RegistrationType.MINIMAL_ID)) {
                    if (required) {
                        ret.addAll(requiredMainMinFields);
                    } else {
                        ret.addAll(mainMinFields);
                    }
                } else if (curr.getId().equals(RegistrationType.SOFTWARE_ID)) {
                    if (required) {
                        ret.addAll(requiredMainSoftwareFields);
                    } else {
                        ret.addAll(mainSoftwareFields);
                    }
                } else if (curr.getId().equals(RegistrationType.STUDIO_ID)) {
                    if (required) {
                        ret.addAll(requiredMainStudioFields);
                    } else {
                        ret.addAll(mainStudioFields);
                        ret.add(Constants.PHOTO);
                    }
                } else if (curr.getId().equals(RegistrationType.TEACHER_ID)) {
                    if (required) {
                        ret.addAll(requiredMainTeacherFields);
                    } else {
                        ret.addAll(mainTeacherFields);
                        //ret.add(Constants.PHOTO);
                    }
                } else if (curr.getId().equals(RegistrationType.OPENAIM_ID)) {
                    if (required) {
                        ret.addAll(requiredMainOpenAIMFields);
                    } else {
                        ret.addAll(mainOpenAIMFields);
                        ret.add(Constants.PHOTO);
                    }
                } else if (curr.getId().equals(RegistrationType.TRUVEO_ID)) {
                    if (required) {
                        ret.addAll(requiredMainTruveoFields);
                    } else {
                        ret.addAll(mainTruveoFields);
                        ret.add(Constants.PHOTO);
                    }
                }
            } else if (regTypes.contains(curr) && !currentTypes.contains(curr)) {
                //the user creating a registration for the specified type
                if (curr.getId().equals(RegistrationType.COMPETITION_ID)) {
                    if (required) {
                        ret.addAll(requiredMainCompFields);
                    } else {
                        ret.addAll(mainCompFields);
                    }
                } else if (curr.getId().equals(RegistrationType.CORPORATE_ID)) {
                    if (required) {
                        ret.addAll(requiredMainCorpFields);
                    } else {
                        ret.addAll(mainCorpFields);
                    }
                } else if (curr.getId().equals(RegistrationType.HIGH_SCHOOL_ID)) {
                    if (required) {
                        ret.addAll(requiredMainHSFields);
                    } else {
                        ret.addAll(mainHSFields);
                    }
                    ret.add(Constants.HS_REG_QUESTIONS);
                } else if (curr.getId().equals(RegistrationType.MINIMAL_ID)) {
                    if (required) {
                        ret.addAll(requiredMainMinFields);
                    } else {
                        ret.addAll(mainMinFields);
                    }
                } else if (curr.getId().equals(RegistrationType.SOFTWARE_ID)) {
                    if (required) {
                        ret.addAll(requiredMainSoftwareFields);
                    } else {
                        ret.addAll(mainSoftwareFields);
                    }
                } else if (curr.getId().equals(RegistrationType.STUDIO_ID)) {
                    if (required) {
                        ret.addAll(requiredMainStudioFields);
                    } else {
                        ret.addAll(mainStudioFields);
                    }
                } else if (curr.getId().equals(RegistrationType.TEACHER_ID)) {
                    if (required) {
                        ret.addAll(requiredMainTeacherFields);
                    } else {
                        ret.addAll(mainTeacherFields);
                    }
                } else if (curr.getId().equals(RegistrationType.OPENAIM_ID)) {
                    if (required) {
                        ret.addAll(requiredMainOpenAIMFields);
                    } else {
                        ret.addAll(mainOpenAIMFields);
                    }
                } else if (curr.getId().equals(RegistrationType.TRUVEO_ID)) {
                    if (required) {
                        ret.addAll(requiredMainTruveoFields);
                    } else {
                        ret.addAll(mainTruveoFields);
                    }
                }
            }
        }
        if (!required) {
            RegistrationType hs = dao.getHighSchoolType();
            if (currentTypes.contains(hs) || regTypes.contains(hs)) {
                //high school people have to be students
                ret.remove(Constants.CODER_TYPE);
            }
        }
        return ret;
    }

    /**
     * @param regTypes the reg types the user is registering for
     * @param user     the user
     * @param required whether or not the call222er wants to return the list of required fields or the list of all fields
     * @return the fields
     */
    private static Set<String> getSecondaryFieldSet(Set regTypes, User user, boolean required) {
        Set<String> ret = new HashSet<String>();
        Set currentTypes = user.getRegistrationTypes();

        RegistrationTypeDAO dao = DAOUtil.getFactory().getRegistrationTypeDAO();

        List<RegistrationType> allRegTypes = dao.getRegistrationTypes();
        RegistrationType corp = dao.getCorporateType();
        RegistrationType tcs = dao.getSoftwareType();
        CoderType ct;
        for (RegistrationType curr : allRegTypes) {
            if (regTypes.contains(curr) && currentTypes.contains(curr)) {
                //must be an update
                if (curr.getId().equals(RegistrationType.COMPETITION_ID)) {
                    if (user.getCoder().getCoderType().equals(DAOUtil.getFactory().getCoderTypeDAO().find(CoderType.PROFESSIONAL))) {
                        if (required) {
                            ret.addAll(requiredSecondaryCompProFields);
                        } else {
                            ret.addAll(secondaryCompProFields);
                            //ret.add(Constants.PHOTO);
                        }
                        if (regTypes.contains(corp) || regTypes.contains(tcs)) {
                            //remove these because if they are registering for competitions as a pro
                            //and they are corporate, they answered these questions on the first page already
                            ret.remove(Constants.COMPANY_NAME);
                            ret.remove(Constants.TITLE);
                        }
                    } else
                    if (user.getCoder().getCoderType().equals(DAOUtil.getFactory().getCoderTypeDAO().find(CoderType.STUDENT))) {
                        if (required) {
                            ret.addAll(requiredSecondaryCompStudentFields);
                        } else {
                            ret.addAll(secondaryCompStudentFields);
                            //ret.add(Constants.PHOTO);
                        }
                    } else {
                        throw new RuntimeException("Invalid coder type " + user.getCoder().getCoderType().getId());
                    }
                } else if (curr.getId().equals(RegistrationType.CORPORATE_ID)) {
                    if (required) {
                        ret.addAll(requiredSecondaryCorpFields);
                    } else {
                        ret.addAll(secondaryCorpFields);
                    }
                } else if (curr.getId().equals(RegistrationType.HIGH_SCHOOL_ID)) {
                    if (required) {
                        ret.addAll(requiredSecondaryHSFields);
                    } else {
                        ret.addAll(secondaryHSFields);
                    }
                } else if (curr.getId().equals(RegistrationType.MINIMAL_ID)) {
                    if (required) {
                        ret.addAll(requiredSecondaryMinFields);
                    } else {
                        ret.addAll(secondaryMinFields);
                    }
                } else if (curr.getId().equals(RegistrationType.SOFTWARE_ID)) {
                    if (required) {
                        ret.addAll(requiredSecondarySoftwareFields);
                    } else {
                        ret.addAll(secondarySoftwareFields);
                    }
                } else if (curr.getId().equals(RegistrationType.STUDIO_ID)) {
                    if (user.getCoder().getCoderType().equals(DAOUtil.getFactory().getCoderTypeDAO().find(CoderType.PROFESSIONAL))) {
                        if (required) {
                            ret.addAll(requiredSecondaryStudioProFields);
                        } else {
                            ret.addAll(secondaryStudioProFields);
                        }
                        if (regTypes.contains(corp) || regTypes.contains(tcs)) {
                            //remove these because if they are registering for competitions as a pro
                            //and they are corporate, they answered these questions on the first page already
                            ret.remove(Constants.COMPANY_NAME);
                            ret.remove(Constants.TITLE);
                        }
                    } else
                    if (user.getCoder().getCoderType().equals(DAOUtil.getFactory().getCoderTypeDAO().find(CoderType.STUDENT))) {
                        if (required) {
                            ret.addAll(requiredSecondaryStudioStudentFields);
                        } else {
                            ret.addAll(secondaryStudioStudentFields);
                        }
                    } else {
                        throw new RuntimeException("Invalid coder type " + user.getCoder().getCoderType().getId());
                    }
                } else if (curr.getId().equals(RegistrationType.TEACHER_ID)) {
                    if (required) {
                        ret.addAll(requiredSecondaryTeacherFields);
                    } else {
                        ret.addAll(secondaryTeacherFields);
                    }
                } else if (curr.getId().equals(RegistrationType.OPENAIM_ID)) {
                    if (user.getCoder().getCoderType().equals(DAOUtil.getFactory().getCoderTypeDAO().find(CoderType.PROFESSIONAL))) {
                        if (required) {
                            ret.addAll(requiredSecondaryOpenAIMProFields);
                        } else {
                            ret.addAll(secondaryOpenAIMProFields);
                        }
                        if (regTypes.contains(corp) || regTypes.contains(tcs)) {
                            //remove these because if they are registering for competitions as a pro
                            //and they are corporate, they answered these questions on the first page already
                            ret.remove(Constants.COMPANY_NAME);
                            ret.remove(Constants.TITLE);
                        }
                    } else
                    if (user.getCoder().getCoderType().equals(DAOUtil.getFactory().getCoderTypeDAO().find(CoderType.STUDENT))) {
                        if (required) {
                            ret.addAll(requiredSecondaryOpenAIMStudentFields);
                        } else {
                            ret.addAll(secondaryOpenAIMStudentFields);
                        }
                    } else {
                        throw new RuntimeException("Invalid coder type " + user.getCoder().getCoderType().getId());
                    }
                }

            } else if (regTypes.contains(curr) && !currentTypes.contains(curr)) {
                //the user creating a registration for the specified type
                if (curr.getId().equals(RegistrationType.COMPETITION_ID)) {
                    ct = user.getCoder().getCoderType();
                    if (ct == null) {
                        throw new RuntimeException("User had no coder type");
                    } else {
                        if (ct.getId().equals(CoderType.PROFESSIONAL)) {
                            if (required) {
                                ret.addAll(requiredSecondaryCompProFields);
                            } else {
                                ret.addAll(secondaryCompProFields);
                            }
                            if (regTypes.contains(corp) || regTypes.contains(tcs)) {
                                //remove these because if they are registering for competitions as a pro
                                //and they are corporate, they answered these questions on the first page already
                                ret.remove(Constants.COMPANY_NAME);
                                ret.remove(Constants.TITLE);
                            }
                        } else if (ct.getId().equals(CoderType.STUDENT)) {
                            if (required) {
                                ret.addAll(requiredSecondaryCompStudentFields);
                            } else {
                                ret.addAll(secondaryCompStudentFields);
                            }
                        } else {
                            throw new RuntimeException("Invalid coder type " + ct.getId());
                        }
                    }
                } else if (curr.getId().equals(RegistrationType.CORPORATE_ID)) {
                    if (required) {
                        ret.addAll(requiredSecondaryCorpFields);
                    } else {
                        ret.addAll(secondaryCorpFields);
                    }
                } else if (curr.getId().equals(RegistrationType.HIGH_SCHOOL_ID)) {
                    if (required) {
                        ret.addAll(requiredSecondaryHSFields);
                    } else {
                        ret.addAll(secondaryHSFields);
                    }
                } else if (curr.getId().equals(RegistrationType.MINIMAL_ID)) {
                    if (required) {
                        ret.addAll(requiredSecondaryMinFields);
                    } else {
                        ret.addAll(secondaryMinFields);
                    }
                } else if (curr.getId().equals(RegistrationType.SOFTWARE_ID)) {
                    if (required) {
                        ret.addAll(requiredSecondarySoftwareFields);
                    } else {
                        ret.addAll(secondarySoftwareFields);
                    }
                } else if (curr.getId().equals(RegistrationType.STUDIO_ID)) {
                    ct = user.getCoder().getCoderType();
                    if (ct == null) {
                        throw new RuntimeException("User had no coder type");
                    } else {
                        if (ct.getId().equals(CoderType.PROFESSIONAL)) {
                            if (required) {
                                ret.addAll(requiredSecondaryStudioProFields);
                            } else {
                                ret.addAll(secondaryStudioProFields);
                            }
                            if (regTypes.contains(corp) || regTypes.contains(tcs)) {
                                //remove these because if they are registering for competitions as a pro
                                //and they are corporate, they answered these questions on the first page already
                                ret.remove(Constants.COMPANY_NAME);
                                ret.remove(Constants.TITLE);
                            }
                        } else if (ct.getId().equals(CoderType.STUDENT)) {
                            if (required) {
                                ret.addAll(requiredSecondaryStudioStudentFields);
                            } else {
                                ret.addAll(secondaryStudioStudentFields);
                            }
                        } else {
                            throw new RuntimeException("Invalid coder type " + ct.getId());
                        }
                    }

                } else if (curr.getId().equals(RegistrationType.TEACHER_ID)) {
                    if (required) {
                        ret.addAll(requiredSecondaryTeacherFields);
                    } else {
                        ret.addAll(secondaryTeacherFields);
                    }
                } else if (curr.getId().equals(RegistrationType.OPENAIM_ID)) {
                    ct = user.getCoder().getCoderType();
                    if (ct == null) {
                        throw new RuntimeException("User had no coder type");
                    } else {
                        if (ct.getId().equals(CoderType.PROFESSIONAL)) {
                            if (required) {
                                ret.addAll(requiredSecondaryOpenAIMProFields);
                            } else {
                                ret.addAll(secondaryOpenAIMProFields);
                            }
                            if (regTypes.contains(corp) || regTypes.contains(tcs)) {
                                //remove these because if they are registering for competitions as a pro
                                //and they are corporate, they answered these questions on the first page already
                                ret.remove(Constants.COMPANY_NAME);
                                ret.remove(Constants.TITLE);
                            }
                        } else if (ct.getId().equals(CoderType.STUDENT)) {
                            if (required) {
                                ret.addAll(requiredSecondaryOpenAIMStudentFields);
                            } else {
                                ret.addAll(secondaryOpenAIMStudentFields);
                            }
                        } else {
                            throw new RuntimeException("Invalid coder type " + ct.getId());
                        }
                    }

                } else if (curr.getId().equals(RegistrationType.TRUVEO_ID)) {
                    ct = user.getCoder().getCoderType();
                    if (ct == null) {
                        throw new RuntimeException("User had no coder type");
                    } else {
                        if (ct.getId().equals(CoderType.PROFESSIONAL)) {
                            if (required) {
                                ret.addAll(requiredSecondaryTruveoProFields);
                            } else {
                                ret.addAll(secondaryTruveoProFields);
                            }
                            if (regTypes.contains(corp) || regTypes.contains(tcs)) {
                                //remove these because if they are registering for competitions as a pro
                                //and they are corporate, they answered these questions on the first page already
                                ret.remove(Constants.COMPANY_NAME);
                                ret.remove(Constants.TITLE);
                            }
                        } else if (ct.getId().equals(CoderType.STUDENT)) {
                            if (required) {
                                ret.addAll(requiredSecondaryTruveoStudentFields);
                            } else {
                                ret.addAll(secondaryTruveoStudentFields);
                            }
                        } else {
                            throw new RuntimeException("Invalid coder type " + ct.getId());
                        }
                    }

                }
            }

        }
        if (!required) {
            RegistrationType hs = dao.getHighSchoolType();
            if (currentTypes.contains(hs) || regTypes.contains(hs)) {
                //high school people have to show their school
                ret.remove(Constants.VISIBLE_SCHOOL);
            }
        }
        if (user.getId() != null) {
            ret.remove(Constants.REFERRAL);
            ret.remove(Constants.REFERRAL_CODER);
            ret.remove(Constants.REFERRAL_OTHER);
        }
        log.debug("returning " + ret.size() + " items " + ret.toString());

        return ret;
    }

}