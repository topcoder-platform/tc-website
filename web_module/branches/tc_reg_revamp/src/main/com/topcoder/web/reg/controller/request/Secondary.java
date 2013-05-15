package com.topcoder.web.reg.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.HSRegistrationHelper;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.*;
import com.topcoder.web.reg.Constants;
import com.topcoder.web.reg.RegFieldHelper;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author dok
 * @version $Revision: 79551 $ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public class Secondary extends Base {

    protected void registrationProcessing() throws Exception {
        User u = getRegUser();
        if (u == null) {
            throw new NavigationException("Sorry, your session has expired.", "http://www.topcoder.com/reg/?" + Constants.NEW_REG + "=" + String.valueOf(true));
        } else {

            Set fields = RegFieldHelper.getMainFieldSet(getRequestedTypes(), u);
            if ("POST".equals(getRequest().getMethod())) {
                if (isNewRegistration() || userLoggedIn()) {
                    Map params = getMainUserInput();
                    checkMainFields(params);

                    HSRegistrationHelper rh = new HSRegistrationHelper(getRequest());

                    boolean registeringHS = hasRequestedType(RegistrationType.HIGH_SCHOOL_ID) && !isCurrentlyRegistered(u, RegistrationType.HIGH_SCHOOL_ID);

                    if (registeringHS) {
                        checkHSRegistrationQuestions(rh);
                    }

                    if (hasErrors()) {
                        if (registeringHS) {
                            setDefaults(rh);
                        }
                        reloadMain(params, u, fields);
                    } else {
                        if (registeringHS) {
                            // put the responses in session so that they're saved in the db when submitting
                            getRequest().getSession().setAttribute(Constants.HS_RESPONSES, rh.getResponsesMap());

                            log.info("user " + u.getId() + " is " + ((!rh.isEligibleHS()) ? "not" : "") + " eligible. ");

                            log.info("Inactivate flag: " + getRequest().getSession().getAttribute(Constants.INACTIVATE_HS));

                            if (!rh.isEligibleHS() || getRequest().getSession().getAttribute(Constants.INACTIVATE_HS) != null) {

                                if (isNewRegistration()) {
                                    // setup in session so that the user is inactivated for hs when submitting.
                                    getRequest().getSession().setAttribute(Constants.INACTIVATE_HS, Boolean.TRUE);
                                } else {
                                    rh.inactivateUser(u);
                                    markForCommit();
                                }

                                getRequest().getSession().setAttribute("params", params);
                                getRequest().setAttribute("registeredComp", isCurrentlyRegistered(u, RegistrationType.COMPETITION_ID));
                                getRequest().setAttribute("requestedComp", hasRequestedType(RegistrationType.COMPETITION_ID));

                                setNextPage("/hsIneligible.jsp");
                                setIsNextPageInContext(true);
                                return;
                            }
                        }

                        loadFieldsIntoUserObject(fields, params);
                        getRequest().getSession().setAttribute("password", (String) params.get(Constants.PASSWORD));

                        Set secondaryFields = RegFieldHelper.getSecondaryFieldSet(getRequestedTypes(), u);
                        log.debug("we have " + secondaryFields.size() + " secondary fields");
                        if (secondaryFields.isEmpty()) {
                            getRequest().setAttribute(Constants.FIELDS, fields);
                            setNextPage("/confirm.jsp");
                            HashSet h = new HashSet();
                            for (Iterator it = getRequestedTypes().iterator(); it.hasNext();) {
                                h.add(((RegistrationType) it.next()).getId());
                            }
                            getRequest().setAttribute(Constants.REG_TYPES, h);
                            setIsNextPageInContext(true);
                        } else {
                            //set the fields in the user object
                            getRequest().setAttribute("demographicAssignments", getAssignments(u));
                            getRequest().setAttribute("referrals", getReferrals(u));
                            setSecondaryDefaults(u);
                            getRequest().setAttribute(Constants.FIELDS, secondaryFields);
                            getRequest().setAttribute(Constants.REQUIRED_FIELDS,
                                    RegFieldHelper.getSecondaryRequiredFieldSet(getRequestedTypes(), u));
                            setNextPage("/secondary.jsp");
                            setIsNextPageInContext(true);
                        }


                    }
                } else {
                    throw new PermissionException(getUser(), new ClassResource(this.getClass()));
                }
            } else {
                Set secondaryFields = RegFieldHelper.getSecondaryFieldSet(getRequestedTypes(), u);
                if (secondaryFields.isEmpty()) {
                    getRequest().setAttribute(Constants.FIELDS, fields);
                    setNextPage("/confirm.jsp");
                    setIsNextPageInContext(true);
                } else {
                    getRequest().setAttribute("demographicAssignments", getAssignments(u));
                    getRequest().setAttribute("referrals", getReferrals(u));
                    setSecondaryDefaults(u);
                    getRequest().setAttribute(Constants.FIELDS, secondaryFields);
                    getRequest().setAttribute(Constants.REQUIRED_FIELDS,
                            RegFieldHelper.getSecondaryRequiredFieldSet(getRequestedTypes(), u));
                    setNextPage("/secondary.jsp");
                    setIsNextPageInContext(true);
                }
            }
        }
    }

    private void setDefaults(HSRegistrationHelper rh) {
        List<Object[]> defaults = rh.getDefaults();
        for (Object[] d : defaults) {
            setDefault((String) d[0], d[1]);
        }
    }

    private void checkHSRegistrationQuestions(HSRegistrationHelper rh) {
        List<String[]> valResults = rh.validateQuestions();
        for (String[] result : valResults) {
            addError(result[0], result[1]);
        }
    }


    private void loadFieldsIntoUserObject(Set fields, Map params) throws TCWebException {
        User u = getRegUser();
        Address a = u.getHomeAddress();
        //we'll consider address1 to be the indicator as to whether or not we're getting an address
        if (fields.contains(Constants.ADDRESS1) || fields.contains(Constants.ADDRESS2) || fields.contains(Constants.ADDRESS3)
                || fields.contains(Constants.CITY) || fields.contains(Constants.POSTAL_CODE) || fields.contains(Constants.COUNTRY_CODE) ||
                fields.contains(Constants.STATE_CODE) || fields.contains(Constants.PROVINCE)) {
            if (a == null) {
                a = new Address();
                u.addAddress(a);
            }
            a.setAddressTypeId(Address.HOME_TYPE_ID);
            a.setAddress1((String) params.get(Constants.ADDRESS1));
        }
        if (fields.contains(Constants.ADDRESS2)) {
            a.setAddress2((String) params.get(Constants.ADDRESS2));
        }
        if (fields.contains(Constants.ADDRESS3)) {
            a.setAddress3((String) params.get(Constants.ADDRESS3));
        }
        if (fields.contains(Constants.CITY)) {
            a.setCity((String) params.get(Constants.CITY));
        }
        if (fields.contains(Constants.POSTAL_CODE)) {
            a.setPostalCode((String) params.get(Constants.POSTAL_CODE));
        }

        if (fields.contains(Constants.COUNTRY_CODE)) {
            a.setCountry(getFactory().getCountryDAO().find((String) params.get(Constants.COUNTRY_CODE)));
        }

        if (getFactory().getCountryDAO().getUS().equals(a.getCountry())) {
            a.setProvince(null);
            if (fields.contains(Constants.STATE_CODE)) {
                a.setState(getFactory().getStateDAO().find((String) params.get(Constants.STATE_CODE)));
            }
        } else {
            a.setState(null);
            if (fields.contains(Constants.PROVINCE)) {
                a.setProvince((String) params.get(Constants.PROVINCE));
            }
        }

        if (isNewRegistration() || !getFactory().getPaymentDAO().hasPayments(getRegUser().getId())) {
            if (fields.contains(Constants.GIVEN_NAME)) {
                u.setFirstName((String) params.get(Constants.GIVEN_NAME));
            }
            if (fields.contains(Constants.SURNAME)) {
                u.setLastName((String) params.get(Constants.SURNAME));
            }
            if (fields.contains(Constants.MIDDLE_NAME)) {
                u.setMiddleName((String) params.get(Constants.MIDDLE_NAME));
            }
        }

        if (fields.contains(Constants.NAME_IN_ANOTHER_LANGUAGE) && (u.getNameInAnotherLanguage() == null || u.getNameInAnotherLanguage().trim().length() == 0)) {
            // only update when the name is not set.
            u.setNameInAnotherLanguage((String) params.get(Constants.NAME_IN_ANOTHER_LANGUAGE));
        }

        if (fields.contains(Constants.SECRET_QUESTION) || fields.contains(Constants.SECRET_QUESTION_RESPONSE)) {
            SecretQuestion sc = u.getSecretQuestion();
            if (sc == null) {
                sc = new SecretQuestion();
                sc.setUser(u);
                u.setSecretQuestion(sc);
            }

            if (fields.contains(Constants.SECRET_QUESTION)) {
                sc.setQuestion((String) params.get(Constants.SECRET_QUESTION));
            }

            if (fields.contains(Constants.SECRET_QUESTION_RESPONSE)) {
                sc.setResponse((String) params.get(Constants.SECRET_QUESTION_RESPONSE));
            }
        }

        if (fields.contains(Constants.SECURITY_KEY)) {
        	UserSecurityKey sk = u.getUserSecurityKey();
        	if (sk == null) {
        		sk = new UserSecurityKey();
        		sk.setUser(u);
        		u.setUserSecurityKey(sk);
        	}
        	sk.setSecurityKey((String) params.get(Constants.SECURITY_KEY));
        	sk.setSecurityKeyTypeId(1);
        }

        if (fields.contains(Constants.COMPANY_NAME)) {
            String name = (String) params.get(Constants.COMPANY_NAME);

            //we can assume the user's contact object is not null because it should have been
            //created by the Main processor when they selected a reg type that requires it.
            if (u.getContact().getId() == null) {
                //it's a new contact we're creating
                Company c = new Company();
                c.setName(name);
                c.setPrimaryContact(u.getContact());
                u.getContact().setCompany(c);
            } else {
                if (u.getContact().getCompany() == null) {
                    throw new TCWebException("Invalid state, user " + u.getId() + " missing company");
                } else {
                    //if they're changing their company, create a new company record
                    if (!u.getContact().getCompany().getName().equals(name)) {
                        Company c = new Company();
                        c.setName(name);
                        c.setPrimaryContact(u.getContact());
                        u.getContact().setCompany(c);
                    }
                }
            }
        }

        if (fields.contains(Constants.TITLE)) {
            u.getContact().setTitle((String) params.get(Constants.TITLE));
        }

        if (fields.contains(Constants.QUOTE)) {
            u.getCoder().setQuote((String) params.get(Constants.QUOTE));
        }

        if (fields.contains(Constants.EMAIL)) {
            Email e = u.getPrimaryEmailAddress();
            if (e == null) {
                e = new Email();
                e.setPrimary(Boolean.TRUE);
                e.setEmailTypeId(Email.TYPE_ID_PRIMARY);
                e.setStatusId(Email.STATUS_ID_UNACTIVE);
                e.setUser(u);
                u.addEmailAddress(e);
            }
            e.setAddress((String) params.get(Constants.EMAIL));
        }

        //we don't allow updates, so no need to set it here.
        if (isNewRegistration()) {
            if (fields.contains(Constants.HANDLE)) {
                //yeah...100% chance they'll contain it, but i'll be consistent with the code anyway
                u.setHandle((String) params.get(Constants.HANDLE));
            }
        }

        if (fields.contains(Constants.PHONE_NUMBER)) {
            //yeah...100% chance they'll contain it, but i'll be consistent with the code anyway
            Phone p = u.getPrimaryPhoneNumber();
            if (p == null) {
                p = new Phone();
                p.setPhoneTypeId(Phone.PHONE_TYPE_HOME);
                p.setPrimary(Boolean.TRUE);
                p.setUser(u);
                u.addPhoneNumber(p);
            }
            p.setNumber((String) params.get(Constants.PHONE_NUMBER));
        }

        if (fields.contains(Constants.NOTIFICATION)) {
            u.setNotifications(new HashSet((List) params.get(Constants.NOTIFICATION)));
        }

        if (fields.contains(Constants.MEMBER_CONTACT)) {
            UserPreference up = u.getUserPreference(Preference.MEMBER_CONTACT_PREFERENCE_ID);
            String value = StringUtils.checkNull(String.valueOf(params.get(Constants.MEMBER_CONTACT)));
            if (up == null) {
                up = new UserPreference();
                Preference p = getFactory().getPreferenceDAO().find(Preference.MEMBER_CONTACT_PREFERENCE_ID);
                up.setId(new UserPreference.Identifier(u, p));
                up.setValue(value);
                u.addUserPreference(up);
            } else {
                up.setValue(value);
            }
        }

        if (fields.contains(Constants.SHOW_EARNINGS)) {
            UserPreference up = u.getUserPreference(Preference.SHOW_EARNINGS_PREFERENCE_ID);
            String value = StringUtils.checkNull(String.valueOf(params.get(Constants.SHOW_EARNINGS)));
            if (up == null) {
                up = new UserPreference();
                Preference p = getFactory().getPreferenceDAO().find(Preference.SHOW_EARNINGS_PREFERENCE_ID);
                up.setId(new UserPreference.Identifier(u, p));
                up.setValue(value);
                u.addUserPreference(up);
            } else {
                up.setValue(value);
            }
        }

        if (fields.contains(Constants.COMP_COUNTRY_CODE)) {
            u.getCoder().setCompCountry(getFactory().getCountryDAO().find((String) params.get(Constants.COMP_COUNTRY_CODE)));
        }


        if (fields.contains(Constants.CODER_TYPE)) {
            CoderType ct =
                    getFactory().getCoderTypeDAO().find(new Integer((String) params.get(Constants.CODER_TYPE)));
            u.getCoder().setCoderType(ct);
        }

        if (fields.contains(Constants.TIMEZONE)) {
            TimeZone tz =
                    getFactory().getTimeZoneDAO().find(new Integer((String) params.get(Constants.TIMEZONE)));
            u.setTimeZone(tz);
        }

        if (getRequestedTypes().contains(getFactory().getRegistrationTypeDAO().getHighSchoolType()) &&
                !u.getCoder().hasHSRating()) {
            AlgoRatingType hs = getFactory().getAlgoRatingTypeDAO().find(AlgoRatingType.HIGH_SCHOOL);
            AlgoRating hsRating = new AlgoRating();
            hsRating.setType(hs);
            hsRating.setCoder(u.getCoder());
            hsRating.getId().setCoder(u.getCoder());
            hsRating.getId().setType(hs);
            u.getCoder().addRating(hsRating);

        }

        if (getRequestedTypes().contains(getFactory().getRegistrationTypeDAO().getCompetitionType()) &&
                !u.getCoder().hasTCRating()) {
            AlgoRatingType tc = getFactory().getAlgoRatingTypeDAO().find(AlgoRatingType.TC);
            AlgoRating tcRating = new AlgoRating();
            tcRating.setType(tc);
            tcRating.setCoder(u.getCoder());
            tcRating.getId().setCoder(u.getCoder());
            tcRating.getId().setType(tc);
            u.getCoder().addRating(tcRating);
        }

        u.addTerms(getFactory().getTermsOfUse().find(new Integer(Constants.REG_TERMS_ID)));
        setRegUser(u);
    }
}
