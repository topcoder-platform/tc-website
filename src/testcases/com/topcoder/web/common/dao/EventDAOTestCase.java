package com.topcoder.web.common.dao;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
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
 * @version $Revision: 57327 $ Date: 2005/01/01 00:00:00
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
        assertFalse("new survey entry not created", new1.getSurvey() == null);
        assertFalse("new question entries not created", new1.getSurvey().getQuestions() == null);
        assertTrue("new question entries size missmatch. Expected 4, got " + new1.getSurvey().getQuestions().size(), 
                new1.getSurvey().getQuestions().size() == 4);
        for (Iterator it = new1.getSurvey().getQuestions().iterator(); it.hasNext();) {
            Question q = (Question) it.next();
            if (q.getText().equals("Question 1") || q.getText().equals("Question 2")) {
                assertTrue("new answer entries size missmatch. Expected 3, got " + q.getAnswers().size(), 
                        q.getAnswers().size() == 3);
            } else {
                assertTrue("answer entries should be empty for " + q.getText() + " but returned " + 
                        q.getAnswers().size() + " elements.", q.getAnswers().size() == 0);  
            }
        }
    }

    public void testFindShortDescription() {
        Event event = DAOUtil.getFactory().getEventDAO().find("tstvnt");

        assertFalse("Event could not be retrieved using short description", event == null);
    }
    
    public void testFindAll() {
        List events = DAOUtil.getFactory().getEventDAO().getEvents();

        assertFalse("Events could not be retrieved", events == null || events.size() <= 0);
    }
    
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