package com.topcoder.web.common.dao;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.topcoder.web.common.model.Answer;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventType;
import com.topcoder.web.common.model.Question;
import com.topcoder.web.common.model.Survey;
import com.topcoder.web.common.model.TermsOfUse;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public class EventDAOTestCase extends TCHibernateTestCase {

    public void testSave() {

        Event e = new Event();
        e.setDescription("test event");
        e.setRegistrationStart(new Timestamp(new Date().getTime()));
        e.setRegistrationEnd(new Timestamp(e.getRegistrationStart().getTime() + 1000 * 60 * 60));
        e.setShortDescription("tstvnt");
        e.setSurvey(createSurvey());
        e.setTerms(createTerms());
        e.setType(createType());
        e.setUsers(createUsers());
        DAOUtil.getFactory().getEventDAO().saveOrUpdate(e);

        tearDown();
        setUp();

        Event new1 = DAOUtil.getFactory().getEventDAO().find(e.getId());
        assertFalse("new event entry not created", new1 == null);
    }

/*    public void testFind() {
        Contest c = new Contest();
        c.setName("gp contest " + System.currentTimeMillis());
        c.setStartTime(new Timestamp(new Date().getTime()));
        c.setEndTime(new Timestamp(c.getStartTime().getTime() + 1000 * 60 * 60));
        c.setStatus(StudioDAOUtil.getFactory().getContestStatusDAO().find(ContestStatus.UNACTIVE));
        StudioDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);
        User dok = DAOUtil.getFactory().getUserDAO().find(new Long(132456));
        ContestRegistration cr = new ContestRegistration();
        cr.setContest(c);
        cr.setUser(dok);
        cr.setTerms(DAOUtil.getFactory().getTermsOfUse().find(new Integer(Constants.CONTEST_TERMS_OF_USE_ID)));
        cr.getId().setContest(c);
        cr.getId().setUser(dok);

        StudioDAOUtil.getFactory().getContestRegistrationDAO().saveOrUpdate(cr);

        ContestRegistration new1 = StudioDAOUtil.getFactory().getContestRegistrationDAO().find(c, dok);
        assertFalse("new contest reg entry not created", new1 == null);
    }


    public void testFind() {

        Event test = DAOUtil.getFactory().getEventDAO().find(new Long(1));
        assertTrue("could not load test", test != null);

    }*/


    private Set createUsers() {
        Set ret = new HashSet();
        ret.add(DAOUtil.getFactory().getUserDAO().find("cucu", true));
        ret.add(DAOUtil.getFactory().getUserDAO().find("dok", true));
        ret.add(DAOUtil.getFactory().getUserDAO().find("pulky", true));
        return ret;
    }

    private EventType createType() {
        return DAOUtil.getFactory().getEventTypeDAO().find(new Integer(4));
    }

    private TermsOfUse createTerms() {
        return DAOUtil.getFactory().getTermsOfUse().find(new Integer(1));
    }

    private Survey createSurvey() {
        Survey ret = new Survey();
        ret.setName("test survey");
        ret.setText("this is a test survey");
        ret.setStart(new Timestamp(new Date().getTime()));
        ret.setEnd(new Timestamp(ret.getStart().getTime() + 1000 * 60 * 60));
        ret.setResultsViewable(true);
        ret.setStatusId(new Integer(83));
        ret.setQuestions(createQuestions(ret));
        return ret;
    }

    private Set createQuestions(Survey s) {
        Set ret = new HashSet();

        for (int i = 1; i <= 4; i++) {
            Question q = new Question();
         
            q.setText("Question " + i);
            q.setType(DAOUtil.getFactory().getQuestionTypeDAO().find(new Integer(1)));
            q.setStyle(DAOUtil.getFactory().getQuestionStyleDAO().find(new Integer(i)));
            q.setImagePath("/path" + i + "/");
            q.setKeyword("key" + i);
            q.setLink("link" + i);
            q.setRequired(i < 3);
            q.setStatusId(1);
            q.setAnswers(i < 3 ? createAnswers(q) : null);

            ret.add(q);
        }
        return ret;
    }

    private Set createAnswers(Question q) {
        Set ret = new HashSet();

        for (int i = 1; i <= 3; i++) {
            Answer a = new Answer();
         
            a.setText("answer" + i);
            a.setSort(i);
            a.setCorrect(new Boolean(i == 1));
            a.setQuestion(q);
            ret.add(a);
        }
        return ret;
    }



}