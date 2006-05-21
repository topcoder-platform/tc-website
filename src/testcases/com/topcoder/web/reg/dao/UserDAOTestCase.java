package com.topcoder.web.reg.dao;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.reg.TCHibernateTestCase;
import com.topcoder.web.reg.model.*;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 25, 2006
 */
public class UserDAOTestCase extends TCHibernateTestCase {
    protected static final Logger log = Logger.getLogger(UserDAOTestCase.class);




    public void testTransientDemogUpdate() {
        User u = Util.getFactory().getUserDAO().find("Petr", true);

        HashSet h = new HashSet();
        h.add(Util.getFactory().getRegistrationTypeDAO().getCompetitionType());
        List assignments = Util.getFactory().getDemographicAssignmentDAO().getAssignments(Util.getFactory().getCoderTypeDAO().find(CoderType.STUDENT),
                u.getHomeAddress().getState(), h);
        DemographicAssignment da;
        DemographicResponse dr;
        HashSet responses = new HashSet();
        log.debug("found " + assignments.size() + " assignments");
        for (Iterator it = assignments.iterator(); it.hasNext();) {
            da = (DemographicAssignment)it.next();
            if (da.getQuestion().isMultipleSelect()) {
                for (Iterator it1 = da.getQuestion().getAnswers().iterator(); it1.hasNext();) {
                    dr = new DemographicResponse();
                    dr.setUser(u);
                    dr.setQuestion(da.getQuestion());
                    dr.setAnswer((DemographicAnswer)it1.next());
                    //dr.setId(new DemographicResponse.Identifier(ret.getId(), dr.getQuestion().getId(), dr.getAnswer().getId()));
                    log.debug("add multiselect " + dr.getQuestion().getId() + " " + dr.getAnswer().getId());
                    responses.add(dr);
                }
            } else if (da.getQuestion().isSingleSelect()) {
                dr = new DemographicResponse();
                dr.setUser(u);
                dr.setQuestion(da.getQuestion());
                Iterator it1 = da.getQuestion().getAnswers().iterator();
                dr.setAnswer((DemographicAnswer)it1.next());
                //dr.setId(new DemographicResponse.Identifier(ret.getId(), dr.getQuestion().getId(), dr.getAnswer().getId()));
                log.debug("add singleselect " + dr.getQuestion().getId() + " " + dr.getAnswer().getId());
                responses.add(dr);
            } else if (da.getQuestion().isFreeForm()) {
                dr = new DemographicResponse();
                dr.setUser(u);
                dr.setQuestion(da.getQuestion());
                dr.setAnswer(Util.getFactory().getDemographicAnswerDAO().findFreeForm(da.getQuestion()));
                dr.setResponse("hell");
                //dr.setId(new DemographicResponse.Identifier(ret.getId(), dr.getQuestion().getId(), dr.getAnswer().getId()));
                log.debug("add free form " + dr.getQuestion().getId() + " " + dr.getResponse());
                responses.add(dr);
            }
        }
        u.setTransientResponses(responses);

        Util.getFactory().getUserDAO().saveOrUpdate(u);
        assertTrue("couldn't make demographic change", true);

    }



/*

    public void testDemogUpdate() {
        User u = Util.getFactory().getUserDAO().find("dok");
        DemographicResponse r = new DemographicResponse();
        r.setAnswer(Util.getFactory().getDemographicAnswerDAO().find(new Long(183)));
        r.setQuestion(Util.getFactory().getDemographicQuestionDAO().find(new Long(26)));
        r.setUser(u);
        r.getId().setUser(u);
        r.getId().setAnswer(r.getAnswer());
        r.getId().setQuestion(r.getQuestion());
        u.addDemographicResponse(r);
        Util.getFactory().getUserDAO().saveOrUpdate(u);
        assertTrue("couldn't make demographic change", true);

    }
*/




/*
        public void testSaveOrUpdate() {
            User u = TestUtils.makeUser();
            Util.getFactory().getUserDAO().saveOrUpdate(u);
            User u1 = Util.getFactory().getUserDAO().find(u.getId());
            assertTrue("new coder does not exist", u1 != null);

        }

    public void testFindWithImage() {
        User tomek = Util.getFactory().getUserDAO().find(new Long(144400));
        assertFalse("could not find any images for tomek's", tomek.getCoder().getMemberPhoto()==null);
    }

        public void testSaveOrUpdateResponses() {
            User u = TestUtils.makeUser();
            Util.getFactory().getUserDAO().saveOrUpdate(u);

            User u1 = Util.getFactory().getUserDAO().find(u.getId());
            assertFalse("new responses do not exist", u1.getDemographicResponses().isEmpty());

        }


        public void testFind() {
            User tomek = Util.getFactory().getUserDAO().find(new Long(144400));
            assertTrue("could not load tomek", tomek != null && "tomek".equals(tomek.getHandle()));
        }

        public void testSecurityGroupsLoaded() {
            User dok = Util.getFactory().getUserDAO().find(new Long(132456));
            assertTrue("did not load groups for dok", !dok.getSecurityGroups().isEmpty());
        }

        public void testAddressesLoaded() {
            User dok = Util.getFactory().getUserDAO().find(new Long(132456));
            assertTrue("did not load addresses for dok", !dok.getAddresses().isEmpty());
        }

        public void testNotificationsLoaded() {
            User dok = Util.getFactory().getUserDAO().find(new Long(132456));
            assertTrue("did not load notifications for dok", !dok.getNotifications().isEmpty());
        }

        public void testFindByUserName() {
            User dok = Util.getFactory().getUserDAO().find("dok");
            assertTrue("did not load dok", dok != null);
        }

        public void testFailureFindByUserName() {
            User dok = Util.getFactory().getUserDAO().find("dokd9d898df333");
            assertTrue("loaded dokd9d898df333", dok == null);
        }

        public void testSaveUpdateWithCoder() {
            User u = TestUtils.makeUser();
            Coder c = new Coder();
            c.setCompCountry(Util.getFactory().getCountryDAO().find("840"));
            c.setMemberSince(new Timestamp(System.currentTimeMillis()));
            c.setCoderType(Util.getFactory().getCoderTypeDAO().find(CoderType.STUDENT));

            u.setCoder(c);
            c.setUser(u);
            Util.getFactory().getUserDAO().saveOrUpdate(u);
            User u1 = Util.getFactory().getUserDAO().find(u.getId());
            assertTrue("new coder does not exist", u1 != null);
        }


        public void testSaveUpdateWithOutContact() {
            User u = TestUtils.makeUser();
            Util.getFactory().getUserDAO().saveOrUpdate(u);
            User u1 = Util.getFactory().getUserDAO().find(u.getId());
            assertTrue("contactexists and should not", u1.getContact() == null);
        }

        public void testSaveUpdateWithContact() {
            User u = TestUtils.makeUser();
            Contact c = new Contact();
            c.setCompany(Util.getFactory().getCompanyDAO().find(new Long(1)));
            c.setTitle("the man!");
            u.setContact(c);
            c.setUser(u);
            Util.getFactory().getUserDAO().saveOrUpdate(u);
            User u1 = Util.getFactory().getUserDAO().find(u.getId());
            assertTrue("new coder does not exist", u1 != null);

        }

        public void testFindWithContactAndCoder() {
            User dok = Util.getFactory().getUserDAO().find("dok");
            assertTrue("couldn't find dok's contact information", dok.getContact() != null);
            assertTrue("couldn't find dok's coder information", dok.getCoder() != null);
        }

    */
/*
    public void testFindWithDemographicInfo() {
        User dok = Util.getFactory().getUserDAO().find("duner");
        Set s = dok.getDemographicResponses();
        DemographicResponse dr;
        assertFalse("couldn't find demographic responses", dok.getDemographicResponses().isEmpty());
        for(Iterator it = s.iterator(); it.hasNext();) {
            dr = (DemographicResponse)it.next();
            assertFalse("found a null question", dr.getQuestion()==null);
            assertFalse("found a null answer", dr.getAnswer()==null);
            if (dr.getQuestion().isFreeForm()) {
                assertFalse("found a null free form response", dr.getResponse()==null);
            }

        }
    }
*/



}
