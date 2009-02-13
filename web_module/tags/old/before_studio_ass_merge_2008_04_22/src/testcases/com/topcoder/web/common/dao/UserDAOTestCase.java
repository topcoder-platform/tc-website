package com.topcoder.web.common.dao;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.model.*;
import com.topcoder.web.reg.TCHibernateTestCase;
import com.topcoder.web.reg.TestUtils;

import java.sql.Timestamp;
import java.util.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 25, 2006
 */
public class UserDAOTestCase extends TCHibernateTestCase {
    protected static final Logger log = Logger.getLogger(UserDAOTestCase.class);

    public void testTransisetSchoolUpdate() {
        User u = DAOUtil.getFactory().getUserDAO().find("Petr", true);
        School s = new School();
        String newName = "name" + System.currentTimeMillis();
        s.setName(newName);

        s.setAddress(u.getCoder().getCurrentSchool().getSchool().getAddress());

        s.setType(DAOUtil.getFactory().getSchoolTypeDAO().find(SchoolType.COLLEGE));

        u.addCreatedSchool(s);



        UserSchool us = new UserSchool();
        us.setSchool(s);
        us.setPrimary(true);
        us.setAssociationType(DAOUtil.getFactory().getSchoolAssociationTypeDAO().find(SchoolAssociationType.STUDENT));

        u.addSchool(us);

        DAOUtil.getFactory().getUserDAO().saveOrUpdate(u);

        tearDown();
        setUp();
        User u1 = DAOUtil.getFactory().getUserDAO().find(u.getId());
        boolean found = false;
        for (UserSchool s1 : u1.getSchools()) {
            if (s1.getSchool().getName().equals(newName)) {
                found=true;
            }
        }
        assertTrue("new school not associated", found);

    }

    public void testExistingSchoolUpdate() {
        User u = DAOUtil.getFactory().getUserDAO().find("Petr", true);


        UserSchool us = new UserSchool();
        us.setSchool(u.getCoder().getCurrentSchool().getSchool());
        us.setPrimary(true);
        us.setAssociationType(DAOUtil.getFactory().getSchoolAssociationTypeDAO().find(SchoolAssociationType.STUDENT));

        u.addSchool(us);

        DAOUtil.getFactory().getUserDAO().saveOrUpdate(u);

        tearDown();
        setUp();
        User u1 = DAOUtil.getFactory().getUserDAO().find(u.getId());
        boolean found = false;
        for (UserSchool s1 : u1.getSchools()) {
            if (s1.getSchool().getName().equals(u.getCoder().getCurrentSchool().getSchool().getName())) {
                found=true;
            }
        }
        assertTrue("new school not associated", found);

    }



    public void testTransientDemogUpdate() {
        User u = DAOUtil.getFactory().getUserDAO().find("Petr", true);

        HashSet h = new HashSet();
        h.add(DAOUtil.getFactory().getRegistrationTypeDAO().getCompetitionType());
        List assignments = DAOUtil.getFactory().getDemographicAssignmentDAO().getAssignments(DAOUtil.getFactory().getCoderTypeDAO().find(CoderType.STUDENT),
                u.getHomeAddress().getState(), h);
        DemographicAssignment da;
        DemographicResponse dr;
        ArrayList responses = new ArrayList();
        log.debug("found " + assignments.size() + " assignments");
        for (Iterator it = assignments.iterator(); it.hasNext();) {
            da = (DemographicAssignment) it.next();
            if (da.getQuestion().isMultipleSelect()) {
                for (Iterator it1 = da.getQuestion().getAnswers().iterator(); it1.hasNext();) {
                    dr = new DemographicResponse();
                    dr.setUser(u);
                    dr.setQuestion(da.getQuestion());
                    dr.setAnswer((DemographicAnswer) it1.next());
                    //dr.setId(new DemographicResponse.Identifier(ret.getId(), dr.getQuestion().getId(), dr.getAnswer().getId()));
                    log.debug("add multiselect " + dr.getQuestion().getId() + " " + dr.getAnswer().getId());
                    responses.add(dr);
                }
            } else if (da.getQuestion().isSingleSelect()) {
                dr = new DemographicResponse();
                dr.setUser(u);
                dr.setQuestion(da.getQuestion());
                Iterator it1 = da.getQuestion().getAnswers().iterator();
                dr.setAnswer((DemographicAnswer) it1.next());
                //dr.setId(new DemographicResponse.Identifier(ret.getId(), dr.getQuestion().getId(), dr.getAnswer().getId()));
                log.debug("add singleselect " + dr.getQuestion().getId() + " " + dr.getAnswer().getId());
                responses.add(dr);
            } else if (da.getQuestion().isFreeForm()) {
                dr = new DemographicResponse();
                dr.setUser(u);
                dr.setQuestion(da.getQuestion());
                dr.setAnswer(DAOUtil.getFactory().getDemographicAnswerDAO().findFreeForm(da.getQuestion()));
                dr.setResponse("hell");
                //dr.setId(new DemographicResponse.Identifier(ret.getId(), dr.getQuestion().getId(), dr.getAnswer().getId()));
                log.debug("add free form " + dr.getQuestion().getId() + " " + dr.getResponse());
                responses.add(dr);
            }
        }
        u.setTransientResponses(responses);

        DAOUtil.getFactory().getUserDAO().saveOrUpdate(u);
        assertTrue("couldn't make demographic change", true);

    }


    public void testDemogUpdate() {
        User u = DAOUtil.getFactory().getUserDAO().find("dok", true);
        DemographicResponse r = new DemographicResponse();
        r.setAnswer(DAOUtil.getFactory().getDemographicAnswerDAO().find(new Long(183)));
        r.setQuestion(DAOUtil.getFactory().getDemographicQuestionDAO().find(new Long(26)));
        r.setUser(u);
        r.getId().setUser(u);
        r.getId().setAnswer(r.getAnswer());
        r.getId().setQuestion(r.getQuestion());
        u.addDemographicResponse(r);
        DAOUtil.getFactory().getUserDAO().saveOrUpdate(u);
        assertTrue("couldn't make demographic change", true);

    }


    public void testSaveOrUpdate() {
        User u = TestUtils.makeUser();
        DAOUtil.getFactory().getUserDAO().saveOrUpdate(u);
        User u1 = DAOUtil.getFactory().getUserDAO().find(u.getId());
        assertTrue("new coder does not exist", u1 != null);

    }

    public void testFindWithTerms() {
        User tomek = DAOUtil.getFactory().getUserDAO().find(new Long(144400));
        assertFalse("could not find any terms for tomek", tomek.getTerms().isEmpty());
    }

    public void testFindWithImage() {
        User tomek = DAOUtil.getFactory().getUserDAO().find(new Long(144400));
        assertFalse("could not find any images for tomek's", tomek.getCoder().getMemberPhoto() == null);
    }

    public void testSaveOrUpdateResponses() {
        User u = TestUtils.makeUser();
        DAOUtil.getFactory().getUserDAO().saveOrUpdate(u);

        User u1 = DAOUtil.getFactory().getUserDAO().find(u.getId());
        assertFalse("new responses do not exist", u1.getDemographicResponses().isEmpty());

    }


    public void testFind() {
        User tomek = DAOUtil.getFactory().getUserDAO().find(new Long(144400));
        assertTrue("could not load tomek", tomek != null && "tomek".equals(tomek.getHandle()));
    }

    public void testSecurityGroupsLoaded() {
        User dok = DAOUtil.getFactory().getUserDAO().find(new Long(132456));
        assertTrue("did not load groups for dok", !dok.getSecurityGroups().isEmpty());
    }

    public void testAddressesLoaded() {
        User dok = DAOUtil.getFactory().getUserDAO().find(new Long(132456));
        assertTrue("did not load addresses for dok", !dok.getAddresses().isEmpty());
    }

    public void testNotificationsLoaded() {
        User pulky = DAOUtil.getFactory().getUserDAO().find("pulky", true);
        assertTrue("did not load notifications for pulky", !pulky.getNotifications().isEmpty());
    }

    public void testFindByUserName() {
        User dok = DAOUtil.getFactory().getUserDAO().find("dok", true);
        assertTrue("did not load dok", dok != null);
    }

    public void testFailureFindByUserName() {
        User dok = DAOUtil.getFactory().getUserDAO().find("dokd9d898df333", true);
        assertTrue("loaded dokd9d898df333", dok == null);
    }

    public void testSaveUpdateWithCoder() {
        User u = TestUtils.makeUser();
        Coder c = new Coder();
        c.setCompCountry(DAOUtil.getFactory().getCountryDAO().find("840"));
        c.setMemberSince(new Timestamp(System.currentTimeMillis()));
        c.setCoderType(DAOUtil.getFactory().getCoderTypeDAO().find(CoderType.STUDENT));

        u.setCoder(c);
        c.setUser(u);
        DAOUtil.getFactory().getUserDAO().saveOrUpdate(u);
        tearDown();
        setUp();
        User u1 = DAOUtil.getFactory().getUserDAO().find(u.getId());
        assertTrue("new coder does not exist", u1 != null);

        assertFalse("new user schools not persisted", u1.getSchools().isEmpty());
    }


    public void testSaveUpdateWithOutContact() {
        User u = TestUtils.makeUser();
        DAOUtil.getFactory().getUserDAO().saveOrUpdate(u);
        User u1 = DAOUtil.getFactory().getUserDAO().find(u.getId());
        assertTrue("contactexists and should not", u1.getContact() == null);
    }

    public void testSaveUpdateWithContact() {
        User u = TestUtils.makeUser();
        Contact c = new Contact();
        c.setCompany(DAOUtil.getFactory().getCompanyDAO().find(new Long(1)));
        c.setTitle("the man!");
        u.setContact(c);
        c.setUser(u);
        DAOUtil.getFactory().getUserDAO().saveOrUpdate(u);
        User u1 = DAOUtil.getFactory().getUserDAO().find(u.getId());
        assertTrue("new coder does not exist", u1 != null);

    }

    public void testFindWithContactAndCoder() {
        User dok = DAOUtil.getFactory().getUserDAO().find("dok", true);
        assertTrue("couldn't find dok's contact information", dok.getContact() != null);
        assertTrue("couldn't find dok's coder information", dok.getCoder() != null);
    }


    public void testFindWithDemographicInfo() {
        User dok = DAOUtil.getFactory().getUserDAO().find("duner", true);
        Set s = dok.getDemographicResponses();
        DemographicResponse dr;
        assertFalse("couldn't find demographic responses", dok.getDemographicResponses().isEmpty());
        for (Iterator it = s.iterator(); it.hasNext();) {
            dr = (DemographicResponse) it.next();
            assertFalse("found a null question", dr.getQuestion() == null);
            assertFalse("found a null answer", dr.getAnswer() == null);
            if (dr.getQuestion().isFreeForm()) {
                assertFalse("found a null free form response", dr.getResponse() == null);
            }

        }
    }

    public void testFindWithSchool() {
        User dok = DAOUtil.getFactory().getUserDAO().find("tomek", true);
        assertFalse("did not load tomek's school", dok.getCoder().getCurrentSchool() == null);
    }

    public void testCreateUserWithUserSchool() {
        User u = TestUtils.makeUser();
        UserSchool us = new UserSchool();
        us.setPrimary(true);
        us.setAssociationType(DAOUtil.getFactory().getSchoolAssociationTypeDAO().find(SchoolAssociationType.TEACHER));
        u.addSchool(us);
        us.setSchool(DAOUtil.getFactory().getUserDAO().find("tomek", true).getCoder().getCurrentSchool().getSchool());
        DAOUtil.getFactory().getUserDAO().saveOrUpdate(u);
        User u1 = DAOUtil.getFactory().getUserDAO().find(u.getId());
        assertTrue("new user does not exist", u1 != null);
        assertTrue("new user does not have school association", u1.getSchools().size() > 0);
    }


    public void testEventRegistration() {
        User pulky = DAOUtil.getFactory().getUserDAO().find("pulky", true);
        assertFalse("did not load pulky user", pulky == null);

        List events = DAOUtil.getFactory().getEventDAO().getEvents();

        // get the latest test event
        Event latestEvent = null;
        boolean foundTestEvent = false;
        Long lastId = new Long(0);
        for (Iterator it = events.iterator(); it.hasNext();) {
            Event e = (Event) it.next();
            if (e.getShortDescription() != null && e.getShortDescription().equals("tstvnt")) {
                if (lastId.compareTo(e.getId()) < 0) {
                    foundTestEvent = true;
                    lastId = e.getId();
                    latestEvent = e;
                }
            }
        }
        assertTrue("Test event not found, EventDAOTestCase must be run to create it", foundTestEvent);

        // register pulky to the event

        EventRegistration er = new EventRegistration();
        er.getId().setUser(pulky);
        er.getId().setEvent(latestEvent);
        er.setEligible(new Boolean(true));

        pulky.addEventRegistration(er);
        pulky.addTerms(latestEvent.getTerms());
        pulky.addResponse(createResponses(latestEvent.getSurvey().getQuestions(), pulky));

        DAOUtil.getFactory().getUserDAO().saveOrUpdate(pulky);

        tearDown();
        setUp();

        User pulky2 = DAOUtil.getFactory().getUserDAO().find("pulky", true);
        assertFalse("did not load pulky user", pulky2 == null);

        // check registration
        Set registrations = pulky2.getEventRegistrations();
        boolean foundRegistration = false;
        EventRegistration er2 = null;
        for (Iterator it = registrations.iterator(); it.hasNext() && !foundRegistration;) {
            er2 = (EventRegistration) it.next();
            if (er2.getId().equals(er.getId())) {
                foundRegistration = true;
            }
        }

        assertTrue("Event registration not found", foundRegistration);
        assertTrue("Wrong associated event: " + er2.getId().getEvent().getId() + " expected: " +
                latestEvent.getId(), er2.getId().getEvent().getId().equals(latestEvent.getId()));
        assertTrue("Wrong associated user: " + er2.getId().getUser().getId() + " expected: " +
                pulky.getId(), er2.getId().getUser().getId().equals(pulky.getId()));

        // check terms
        Set terms = pulky2.getTerms();
        boolean foundTerms = false;
        for (Iterator it = terms.iterator(); it.hasNext() && !foundTerms;) {
            TermsOfUse t = (TermsOfUse) it.next();
            if (t.getId().equals(latestEvent.getTerms().getId())) {
                foundTerms = true;
            }
        }

        assertTrue("Event terms not found", foundTerms);

        // check responses

        Set responses = pulky2.getResponses();
        for (Iterator it = responses.iterator(); it.hasNext();) {
            Response r = (Response) it.next();

            if (findQuestion(latestEvent.getSurvey().getQuestions(), r.getQuestion().getId()) != null) {
                if (r.getQuestion().isFreeForm()) {
                    assertTrue("Response not found (1)", r.getText().equals("test response"));
                } else {
                    assertFalse("Response not found (2)", r.getAnswer() == null);
                }
            }
        }
    }

    private Question findQuestion(Set questions, long questionId) {
        Question q = null;
        boolean found = false;
        for (Iterator it = questions.iterator(); it.hasNext() && !found;) {
            q = (Question) it.next();
            found = (q.getId() == questionId);
        }
        return found ? q : null;
    }

    private List createResponses(Set questions, User u) {
        List ret = new ArrayList();

        for (Iterator it = questions.iterator(); it.hasNext();) {
            Response r = new Response();
            Question q = (Question) it.next();
            if (q.isFreeForm()) {
                r.setText("test response");
            } else {
                r.setAnswer((Answer) q.getAnswers().iterator().next());
            }
            r.setQuestion(q);
            r.setUser(u);

            ret.add(r);
        }

        return ret;
    }

}
