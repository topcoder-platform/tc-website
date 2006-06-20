package com.topcoder.web.reg;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.reg.dao.RegistrationTypeDAO;
import com.topcoder.web.reg.dao.Util;
import com.topcoder.web.reg.model.CoderType;
import com.topcoder.web.reg.model.RegistrationType;
import com.topcoder.web.reg.model.User;

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

    private static Set requiredMainHSFields = new HashSet();
    private static Set requiredMainCompFields = new HashSet();
    private static Set requiredMainCorpFields = new HashSet();
    private static Set requiredMainMinFields = new HashSet();
    private static Set requiredMainSoftwareFields = new HashSet();

    private static Set requiredSecondaryHSFields = new HashSet();
    private static Set requiredSecondaryCompStudentFields = new HashSet();
    private static Set requiredSecondaryCompProFields = new HashSet();
    private static Set requiredSecondaryCorpFields = new HashSet();
    private static Set requiredSecondaryMinFields = new HashSet();
    private static Set requiredSecondarySoftwareFields = new HashSet();


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

        requiredMainCompFields.add(Constants.GIVEN_NAME);
        requiredMainCompFields.add(Constants.SURNAME);
        requiredMainCompFields.add(Constants.ADDRESS1);
        requiredMainCompFields.add(Constants.CITY);
        requiredMainCompFields.add(Constants.COUNTRY_CODE);
        requiredMainCompFields.add(Constants.HANDLE);
        requiredMainCompFields.add(Constants.PASSWORD);
        requiredMainCompFields.add(Constants.PASSWORD_CONFIRM);
        requiredMainCompFields.add(Constants.EMAIL);
        requiredMainCompFields.add(Constants.EMAIL_CONFIRM);
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

        requiredSecondaryCompStudentFields.add(Constants.GPA);
        requiredSecondaryCompStudentFields.add(Constants.GPA_SCALE);
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

        requiredMainHSFields.add(Constants.GIVEN_NAME);
        requiredMainHSFields.add(Constants.SURNAME);
        requiredMainHSFields.add(Constants.CITY);
        requiredMainHSFields.add(Constants.COUNTRY_CODE);
        requiredMainHSFields.add(Constants.HANDLE);
        requiredMainHSFields.add(Constants.PASSWORD);
        requiredMainHSFields.add(Constants.PASSWORD_CONFIRM);
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

        requiredMainCorpFields.add(Constants.GIVEN_NAME);
        requiredMainCorpFields.add(Constants.SURNAME);
        requiredMainCorpFields.add(Constants.ADDRESS1);
        requiredMainCorpFields.add(Constants.CITY);
        requiredMainCorpFields.add(Constants.COUNTRY_CODE);
        requiredMainCorpFields.add(Constants.PHONE_NUMBER);
        requiredMainCorpFields.add(Constants.HANDLE);
        requiredMainCorpFields.add(Constants.PASSWORD);
        requiredMainCorpFields.add(Constants.PASSWORD_CONFIRM);
        requiredMainCorpFields.add(Constants.EMAIL);
        requiredMainCorpFields.add(Constants.EMAIL_CONFIRM);
        requiredMainCorpFields.add(Constants.TIMEZONE);
        requiredMainCorpFields.add(Constants.TITLE);
        requiredMainCorpFields.add(Constants.COMPANY_NAME);

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

        requiredMainSoftwareFields.add(Constants.GIVEN_NAME);
        requiredMainSoftwareFields.add(Constants.SURNAME);
        requiredMainSoftwareFields.add(Constants.ADDRESS1);
        requiredMainSoftwareFields.add(Constants.CITY);
        requiredMainSoftwareFields.add(Constants.COUNTRY_CODE);
        requiredMainSoftwareFields.add(Constants.PHONE_NUMBER);
        requiredMainSoftwareFields.add(Constants.HANDLE);
        requiredMainSoftwareFields.add(Constants.PASSWORD);
        requiredMainSoftwareFields.add(Constants.PASSWORD_CONFIRM);
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
        mainMinFields.add(Constants.EMAIL);
        mainMinFields.add(Constants.EMAIL_CONFIRM);
        mainMinFields.add(Constants.TIMEZONE);

        //secondary page for min reg is empty
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
        Set ret = new HashSet();

        Set currentTypes;
        if (user == null || user.isNew()) {
            currentTypes = Collections.EMPTY_SET;
        } else {
            currentTypes = user.getRegistrationTypes();
        }

        RegistrationTypeDAO dao = Util.getFactory().getRegistrationTypeDAO();

        List allRegTypes = dao.getRegistrationTypes();
        RegistrationType curr;
        for (Iterator it = allRegTypes.iterator(); it.hasNext();) {
            curr = (RegistrationType) it.next();
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
     * @param required whether or not the caller wants to return the list of required fields or the list of all fields
     * @return the fields
     */
    private static Set getSecondaryFieldSet(Set regTypes, User user, boolean required) {
        Set ret = new HashSet();
        Set currentTypes = user.getRegistrationTypes();

        RegistrationTypeDAO dao = Util.getFactory().getRegistrationTypeDAO();

        List allRegTypes = dao.getRegistrationTypes();
        RegistrationType corp = dao.getCorporateType();
        RegistrationType tcs = dao.getSoftwareType();
        RegistrationType curr;
        CoderType ct;
        for (Iterator it = allRegTypes.iterator(); it.hasNext();) {
            curr = (RegistrationType) it.next();
            if (regTypes.contains(curr) && currentTypes.contains(curr)) {
                //must be an update
                if (curr.getId().equals(RegistrationType.COMPETITION_ID)) {
                    if (user.getCoder().getCoderType().equals(Util.getFactory().getCoderTypeDAO().find(CoderType.PROFESSIONAL)))
                    {
                        if (required) {
                            ret.addAll(secondaryCompProFields);
                            ret.remove(Constants.REFERRAL);
                        } else {
                            ret.addAll(secondaryCompProFields);
                            ret.add(Constants.PHOTO);
                            ret.remove(Constants.REFERRAL);
                            ret.remove(Constants.REFERRAL_CODER);
                            ret.remove(Constants.REFERRAL_OTHER);
                        }
                        if (regTypes.contains(corp) || regTypes.contains(tcs)) {
                            //remove these because if they are registering for competitions as a pro
                            //and they are corporate, they answered these questions on the first page already
                            ret.remove(Constants.COMPANY_NAME);
                            ret.remove(Constants.TITLE);
                        }
                    } else
                    if (user.getCoder().getCoderType().equals(Util.getFactory().getCoderTypeDAO().find(CoderType.STUDENT)))
                    {
                        if (required) {
                            ret.addAll(secondaryCompStudentFields);
                            ret.remove(Constants.REFERRAL);
                        } else {
                            ret.addAll(secondaryCompStudentFields);
                            ret.add(Constants.PHOTO);
                            ret.remove(Constants.REFERRAL);
                            ret.remove(Constants.REFERRAL_CODER);
                            ret.remove(Constants.REFERRAL_OTHER);
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
        log.debug("returning " + ret.size() + " items " + ret.toString());

        return ret;
    }

}