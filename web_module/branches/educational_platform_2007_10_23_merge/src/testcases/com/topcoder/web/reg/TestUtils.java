package com.topcoder.web.reg;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.*;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 25, 2006
 */
public class TestUtils {
    public static Coder makeCoder() {
        Coder ret = null;

        ret = new Coder();
        ret.setCompCountry(DAOUtil.getFactory().getCountryDAO().find("840"));
        ret.setMemberSince(new Timestamp(System.currentTimeMillis()));
        ret.setCoderType(DAOUtil.getFactory().getCoderTypeDAO().find(CoderType.STUDENT));


        School s = new School();
        s.setName("some school");
        s.setShortName("ss");
        s.setType(DAOUtil.getFactory().getSchoolTypeDAO().find(SchoolType.COLLEGE));

        Address a = new Address();
        a.setCity("mycity");
        a.setCountry(DAOUtil.getFactory().getCountryDAO().find("840"));
        a.setState(DAOUtil.getFactory().getStateDAO().find("CO"));
        a.setProvince("myprovince");
        s.setAddress(a);

        CurrentSchool cs = new CurrentSchool();
        cs.setCoder(ret);
        cs.setGPA(new Float(3));
        cs.setGPAScale(new Float(5));
        cs.setSchool(s);
        cs.setViewable(Boolean.TRUE);
        ret.setCurrentSchool(cs);

        Team t = new Team();
        t.setName(s.getName());
        t.setSchool(s);
        t.setType(DAOUtil.getFactory().getTeamTypeDAO().find(TeamType.HIGH_SCHOOL_TYPE));

        ret.addTeam(t);


        AlgoRating hs = new AlgoRating();
        hs.setType(DAOUtil.getFactory().getAlgoRatingTypeDAO().find(AlgoRatingType.HIGH_SCHOOL));
        hs.setCoder(ret);
        hs.getId().setCoder(ret);
        hs.getId().setType(hs.getType());
        ret.addRating(hs);

        AlgoRating tc = new AlgoRating();
        tc.setType(DAOUtil.getFactory().getAlgoRatingTypeDAO().find(AlgoRatingType.TC));
        tc.setCoder(ret);
        tc.getId().setCoder(ret);
        tc.getId().setType(tc.getType());
        ret.addRating(tc);


        return ret;
    }


    public static User makeUser() {
        User ret = null;
        String handle = "f" + System.currentTimeMillis();

        ret = new User();
        ret.setActivationCode("active");
        ret.setFirstName("first name");
        ret.setLastName("last_name");
        ret.setHandle(handle);
        ret.setMiddleName("middle name");
        ret.setPassword("password");

        Coder c = makeCoder();
        c.setUser(ret);
        ret.setCoder(c);

        ret.addCreatedSchool(c.getCurrentSchool().getSchool());

        Address a = new Address();
        a.setAddress1("address1");
        a.setAddress2("address2");
        a.setAddress3("address3");
        a.setAddressTypeId(Address.HOME_TYPE_ID);
        a.setCity("city");
        a.setState(DAOUtil.getFactory().getStateDAO().find("CO"));
        a.setCountry(DAOUtil.getFactory().getCountryDAO().find("840"));
        a.setProvince("province");
        a.setPostalCode("zip");
        ret.addAddress(a);

        Email e = new Email();
        e.setAddress("dok@topcoder.com");
        e.setEmailTypeId(Email.TYPE_ID_PRIMARY);
        e.setPrimary(Boolean.TRUE);
        e.setStatusId(Email.STATUS_ID_UNACTIVE);
        ret.addEmailAddress(e);

        Phone p = new Phone();
        p.setNumber("6666666666");
        p.setPhoneTypeId(Phone.PHONE_TYPE_HOME);
        p.setPrimary(Boolean.TRUE);
        ret.addPhoneNumber(p);

        for (Iterator it = DAOUtil.getFactory().getNotificationDAO().findAll().iterator(); it.hasNext();) {
            ret.addNotification((Notification) it.next());
        }

        ret.setTimeZone(DAOUtil.getFactory().getTimeZoneDAO().find(java.util.TimeZone.getDefault()));


        UserSchool us = new UserSchool();
        us.setSchool(c.getCurrentSchool().getSchool());
        us.setPrimary(true);
        us.setAssociationType(DAOUtil.getFactory().getSchoolAssociationTypeDAO().find(SchoolAssociationType.STUDENT));
        ret.addSchool(us);


        HashSet regTypes = new HashSet();
        regTypes.add(DAOUtil.getFactory().getRegistrationTypeDAO().find(new Integer(1)));
        List assignments = DAOUtil.getFactory().getDemographicAssignmentDAO().getAssignments(
                DAOUtil.getFactory().getCoderTypeDAO().find(new Integer(1)), ret.getHomeAddress().getState(), regTypes);
        DemographicAssignment da;
        DemographicResponse dr;
        ArrayList responses = new ArrayList();
        for (Iterator it = assignments.iterator(); it.hasNext();) {
            da = (DemographicAssignment) it.next();
            if (da.getQuestion().isMultipleSelect()) {
                for (Iterator it1 = da.getQuestion().getAnswers().iterator(); it1.hasNext();) {
                    dr = new DemographicResponse();
                    dr.setUser(ret);
                    dr.setQuestion(da.getQuestion());
                    dr.setAnswer((DemographicAnswer) it1.next());
                    //dr.setId(new DemographicResponse.Identifier(ret.getId(), dr.getQuestion().getId(), dr.getAnswer().getId()));
                    responses.add(dr);
                }
            } else if (da.getQuestion().isSingleSelect()) {
                dr = new DemographicResponse();
                dr.setUser(ret);
                dr.setQuestion(da.getQuestion());
                Iterator it1 = da.getQuestion().getAnswers().iterator();
                dr.setAnswer((DemographicAnswer) it1.next());
                //dr.setId(new DemographicResponse.Identifier(ret.getId(), dr.getQuestion().getId(), dr.getAnswer().getId()));
                responses.add(dr);
            } else if (da.getQuestion().isFreeForm()) {
                dr = new DemographicResponse();
                dr.setUser(ret);
                dr.setQuestion(da.getQuestion());
                dr.setAnswer(DAOUtil.getFactory().getDemographicAnswerDAO().findFreeForm(da.getQuestion()));
                dr.setResponse("hell");
                //dr.setId(new DemographicResponse.Identifier(ret.getId(), dr.getQuestion().getId(), dr.getAnswer().getId()));
                responses.add(dr);
            }
        }
        ret.setTransientResponses(responses);

        return ret;
    }

    public static User makeUser(String handle) {
        User ret = makeUser();
        ret.setHandle(handle);
        return ret;
    }


}