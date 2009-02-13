package com.topcoder.web.reg;

import com.topcoder.web.reg.model.CoderType;
import com.topcoder.web.reg.model.RegistrationType;
import com.topcoder.web.reg.model.User;
import com.topcoder.web.reg.dao.RegistrationTypeDAO;
import com.topcoder.web.reg.dao.Util;
import com.topcoder.shared.util.logging.Logger;

import java.util.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 28, 2006
 */
public class RegFieldHelper {

    protected static Logger log = Logger.getLogger(RegFieldHelper.class);
    private static Set mainHSFields = new HashSet();
    private static Set mainCompFields = new HashSet();
    private static Set mainCorpFields = new HashSet();
    private static Set mainMinFields = new HashSet();
    private static Set mainSoftwareFields = new HashSet();

    private static Set secondaryHSFields = new HashSet();
    private static Set secondaryCompStudentFields = new HashSet();
    private static Set secondaryCompProFields = new HashSet();
    private static Set secondaryCorpFields = new HashSet();
    private static Set secondaryMinFields = new HashSet();
    private static Set secondarySoftwareFields = new HashSet();

    static {
        mainCompFields.add(Constants.GIVEN_NAME);
        mainCompFields.add(Constants.SURNAME);
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
        mainCompFields.add(Constants.EMAIL);
        mainCompFields.add(Constants.EMAIL_CONFIRM);
        mainCompFields.add(Constants.QUOTE);
        mainCompFields.add(Constants.NOTIFICATION);
        mainCompFields.add(Constants.COMP_COUNTRY_CODE);
        mainCompFields.add(Constants.CODER_TYPE);
        mainCompFields.add(Constants.TIMEZONE);

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

        secondaryCompProFields.add(Constants.DEMOG_PREFIX);
        secondaryCompProFields.add(Constants.RESUME);
        secondaryCompProFields.add(Constants.REFERRAL);
        secondaryCompProFields.add(Constants.REFERRAL_CODER);
        secondaryCompProFields.add(Constants.REFERRAL_OTHER);
    }


    static {
        mainHSFields.add(Constants.GIVEN_NAME);
        mainHSFields.add(Constants.SURNAME);
        mainHSFields.add(Constants.CITY);
        mainHSFields.add(Constants.STATE_CODE);
        mainHSFields.add(Constants.COUNTRY_CODE);
        mainHSFields.add(Constants.HANDLE);
        mainHSFields.add(Constants.PASSWORD);
        mainHSFields.add(Constants.PASSWORD_CONFIRM);
        mainHSFields.add(Constants.EMAIL);
        mainHSFields.add(Constants.EMAIL_CONFIRM);
        mainHSFields.add(Constants.QUOTE);
        mainHSFields.add(Constants.NOTIFICATION);
        mainHSFields.add(Constants.TIMEZONE);
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
    }

    static {
        mainCorpFields.add(Constants.GIVEN_NAME);
        mainCorpFields.add(Constants.SURNAME);
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
        mainCorpFields.add(Constants.EMAIL);
        mainCorpFields.add(Constants.EMAIL_CONFIRM);
        mainCorpFields.add(Constants.TIMEZONE);
        mainCorpFields.add(Constants.TITLE);
        mainCorpFields.add(Constants.COMPANY_NAME);

        secondaryCorpFields.add(Constants.DEMOG_PREFIX);
    }

    static {
        mainSoftwareFields.add(Constants.GIVEN_NAME);
        mainSoftwareFields.add(Constants.SURNAME);
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
        mainSoftwareFields.add(Constants.EMAIL);
        mainSoftwareFields.add(Constants.EMAIL_CONFIRM);
        mainSoftwareFields.add(Constants.NOTIFICATION);
        mainSoftwareFields.add(Constants.TIMEZONE);
        mainSoftwareFields.add(Constants.TITLE);
        mainSoftwareFields.add(Constants.COMPANY_NAME);


        secondarySoftwareFields.add(Constants.DEMOG_PREFIX);
    }

    static {
        mainMinFields.add(Constants.HANDLE);
        mainMinFields.add(Constants.PASSWORD);
        mainMinFields.add(Constants.PASSWORD_CONFIRM);
        mainMinFields.add(Constants.EMAIL);
        mainMinFields.add(Constants.EMAIL_CONFIRM);
        mainMinFields.add(Constants.TIMEZONE);

        //secondary page for min reg is empty
    }

    /**
     * Figure out what registration fields are relevant for the given set of registration types
     * and whether or not they're updating information, or creating it.
     * @param regTypes all the types the user is attempting to register/update for
     * @param user the user attempting to register/update their information
     * @return all the fields that should be presented to the user on the "main" page of registration
     */
    public static Set getMainFieldSet(Set regTypes, User user) {
        Set ret = new HashSet();

        Set currentTypes;
        if (user==null || user.isNew()) {
            currentTypes = Collections.EMPTY_SET;
        } else {
            currentTypes =user.getRegistrationTypes();
        }

        RegistrationTypeDAO dao = Util.getFactory().getRegistrationTypeDAO();

        List allRegTypes = dao.getRegistrationTypes();
        RegistrationType curr;
        for (Iterator it = allRegTypes.iterator(); it.hasNext();) {
            curr = (RegistrationType)it.next();
            log.debug("curr reg type: " + curr.getName());
            if (regTypes.contains(curr)&&currentTypes.contains(curr)) {
                //must be an update
                if (curr.getId().equals(RegistrationType.COMPETITION_ID)) {
                    log.debug("update: adding the competition ones");
                    ret.addAll(mainCompFields);
                    ret.add(Constants.PHOTO);
                } else if (curr.getId().equals(RegistrationType.CORPORATE_ID)) {
                    ret.addAll(mainCorpFields);
                } else if (curr.getId().equals(RegistrationType.HIGH_SCHOOL_ID)) {
                    log.debug("update: adding the hs ones");
                    ret.addAll(mainHSFields);
                } else if (curr.getId().equals(RegistrationType.MINIMAL_ID)) {
                    ret.addAll(mainMinFields);
                } else if (curr.getId().equals(RegistrationType.SOFTWARE_ID)) {
                    ret.addAll(mainSoftwareFields);
                }
            } else if (regTypes.contains(curr)&&!currentTypes.contains(curr)) {
                //the user creating a registration for the specified type
                if (curr.getId().equals(RegistrationType.COMPETITION_ID)) {
                    log.debug("insert: adding the competition ones");
                    ret.addAll(mainCompFields);
                } else if (curr.getId().equals(RegistrationType.CORPORATE_ID)) {
                    ret.addAll(mainCorpFields);
                } else if (curr.getId().equals(RegistrationType.HIGH_SCHOOL_ID)) {
                    log.debug("insert: adding the hs ones");
                    ret.addAll(mainHSFields);
                } else if (curr.getId().equals(RegistrationType.MINIMAL_ID)) {
                    ret.addAll(mainMinFields);
                } else if (curr.getId().equals(RegistrationType.SOFTWARE_ID)) {
                    ret.addAll(mainSoftwareFields);
                }
            }
        }
        RegistrationType hs = dao.getHighSchoolType();
        if (currentTypes.contains(hs)||regTypes.contains(hs)) {
            //high school people have to be students
            ret.remove(Constants.CODER_TYPE);
        }
        return ret;
    }

    public static Set getSecondaryFieldSet(Set regTypes, User user) {
        Set ret = new HashSet();
        Set currentTypes = user.getRegistrationTypes();

        RegistrationTypeDAO dao = Util.getFactory().getRegistrationTypeDAO();

        List allRegTypes = dao.getRegistrationTypes();
        RegistrationType curr;
        CoderType ct;
        for (Iterator it = allRegTypes.iterator(); it.hasNext();) {
            curr = (RegistrationType)it.next();
            if (regTypes.contains(curr)&&currentTypes.contains(curr)) {
                //must be an update
                if (curr.getId().equals(RegistrationType.COMPETITION_ID)) {
                    if (user.getCoder().getCoderType().equals(Util.getFactory().getCoderTypeDAO().find(CoderType.PROFESSIONAL))) {
                        ret.addAll(secondaryCompProFields);
                        ret.add(Constants.PHOTO);
                        ret.remove(Constants.REFERRAL);
                        ret.remove(Constants.REFERRAL_CODER);
                        ret.remove(Constants.REFERRAL_OTHER);
                    } else if (user.getCoder().getCoderType().equals(Util.getFactory().getCoderTypeDAO().find(CoderType.STUDENT))) {
                        ret.addAll(secondaryCompStudentFields);
                        ret.add(Constants.PHOTO);
                        ret.remove(Constants.REFERRAL);
                        ret.remove(Constants.REFERRAL_CODER);
                        ret.remove(Constants.REFERRAL_OTHER);

                    } else {
                        throw new RuntimeException("Invalid coder type " + user.getCoder().getCoderType().getId());
                    }
                } else if (curr.getId().equals(RegistrationType.CORPORATE_ID)) {
                    ret.addAll(secondaryCorpFields);
                } else if (curr.getId().equals(RegistrationType.HIGH_SCHOOL_ID)) {
                    ret.addAll(secondaryHSFields);
                } else if (curr.getId().equals(RegistrationType.MINIMAL_ID)) {
                    ret.addAll(secondaryMinFields);
                } else if (curr.getId().equals(RegistrationType.SOFTWARE_ID)) {
                    ret.addAll(secondarySoftwareFields);
                }

            } else if (regTypes.contains(curr)&&!currentTypes.contains(curr)) {
                //the user creating a registration for the specified type
                if (curr.getId().equals(RegistrationType.COMPETITION_ID)) {
                    ct = user.getCoder().getCoderType();
                    if (ct==null) {
                        throw new RuntimeException("User had no coder type");
                    } else {
                        if (ct.getId().equals(CoderType.PROFESSIONAL)) {
                            ret.addAll(secondaryCompProFields);
                        } else if (ct.getId().equals(CoderType.STUDENT)) {
                            ret.addAll(secondaryCompStudentFields);
                        } else {
                            throw new RuntimeException("Invalid coder type " + ct.getId());
                        }
                    }
                } else if (curr.getId().equals(RegistrationType.CORPORATE_ID)) {
                    ret.addAll(secondaryCorpFields);
                } else if (curr.getId().equals(RegistrationType.HIGH_SCHOOL_ID)) {
                    ret.addAll(secondaryHSFields);
                } else if (curr.getId().equals(RegistrationType.MINIMAL_ID)) {
                    ret.addAll(secondaryMinFields);
                } else if (curr.getId().equals(RegistrationType.SOFTWARE_ID)) {
                    ret.addAll(secondarySoftwareFields);
                }
            }
        }
        RegistrationType hs = dao.getHighSchoolType();
        if (currentTypes.contains(hs)||regTypes.contains(hs)) {
            //high school people have to show their school
            ret.remove(Constants.VISIBLE_SCHOOL);
        }

        return ret;
    }


}
