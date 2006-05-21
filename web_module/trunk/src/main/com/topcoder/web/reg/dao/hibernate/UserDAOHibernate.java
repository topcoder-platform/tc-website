package com.topcoder.web.reg.dao.hibernate;

import com.topcoder.web.reg.dao.UserDAO;
import com.topcoder.web.reg.model.DemographicQuestion;
import com.topcoder.web.reg.model.DemographicResponse;
import com.topcoder.web.reg.model.User;
import org.hibernate.Session;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class UserDAOHibernate extends Base implements UserDAO {

    public UserDAOHibernate() {
        super();
    }

    public UserDAOHibernate(Session session) {
        super(session);
    }

    public User find(Long id) {
        return (User) super.find(User.class, id);
    }

    public User find(String userName, boolean ignoreCase) {
        if (ignoreCase) {
            return (User) findOne(User.class, "handle_lower", userName.toLowerCase());
        } else {
            return (User) findOne(User.class, "handle", userName);
        }
    }

    public void saveOrUpdate(User u) {
//        boolean isNew = u.isNew();

/*
        DemographicResponse temp;
        for (Iterator it = u.getTransientResponses().iterator(); it.hasNext();) {
            temp = ((DemographicResponse) it.next());
            temp.setUser(u);
        }
*/

        if (u.isNew()) {
            log.debug("newbie");
            DemographicResponse tr;
            DemographicResponse dr;
            for (Iterator it = u.getTransientResponses().iterator(); it.hasNext();) {
                tr = (DemographicResponse) it.next();
                log.debug("adding response:" + tr.getQuestion().getId() + " " + tr.getAnswer().getId() + " " + tr.getResponse());
                dr = new DemographicResponse();
                dr.setAnswer(tr.getAnswer());
                dr.setQuestion(tr.getQuestion());
                dr.setResponse(tr.getResponse());
                dr.setUser(u);
                dr.getId().setAnswer(tr.getAnswer());
                dr.getId().setQuestion(tr.getQuestion());
                dr.getId().setUser(u);
                u.addDemographicResponse(dr);
                //super.saveOrUpdate(dr);
            }
            super.saveOrUpdate(u);

        } else {
            //todo consider putting all this logic in the POJO instead of here.


/*
            DemographicResponse t;
            for (Iterator it = u.getTransientResponses().iterator(); it.hasNext();) {
                t = (DemographicResponse)it.next();
                log.debug("q " + t.getQuestion().getId() + " a " + t.getAnswer().getId() + " " + t.hashCode());
            }

            10574855 15 5 Cash Prizes code: 1120434658
            10574855 15 5  code: 1166044876

*/

            //don't need to worry about anything that is already in the db.
            DemographicResponse temp;
            //log.debug("trans size b4" + u.getTransientResponses().size());
            for (Iterator it = u.getDemographicResponses().iterator(); it.hasNext();) {
                temp = (DemographicResponse)it.next();
                if (temp.getQuestion().isFreeForm()||temp.getQuestion().isSingleSelect()) {
                    u.removeTransientResponse(temp);
                    //log.debug("remove trans response " + temp.getQuestion().getId() + " " + temp.getAnswer().getId() + " " + temp.hashCode());
                }

            }
            //log.debug("trans size after" + u.getTransientResponses().size());

            DemographicResponse dr;
            DemographicResponse badResponse;
            HashSet processedQuestions = new HashSet();
            DemographicResponse goodResponse;
            for (Iterator it = u.getTransientResponses().iterator(); it.hasNext();) {
                dr = (DemographicResponse) it.next();
                log.debug("process:" + dr.getQuestion().getId() + " " + dr.getAnswer().getId() + " " + dr.getResponse());
                if (dr.getQuestion().isSingleSelect()) {
                    log.debug("single: " + dr.getQuestion().getId());
                    badResponse = findResponse(u.getDemographicResponses(), dr.getQuestion());
                    if (badResponse != null) {
                        log.debug("remove " + badResponse.getQuestion().getId() + " " + badResponse.getAnswer().getId() + " size:" + u.getDemographicResponses().size());
                        u.removeDemographicResponse(badResponse);
                        log.debug("size after remove " + u.getDemographicResponses().size());
                        badResponse.setUser(null);
                    }
                    dr.setUser(u);
                    dr.getId().setUser(u);
                    dr.getId().setQuestion(dr.getQuestion());
                    dr.getId().setAnswer(dr.getAnswer());
                    log.debug("adding response:" + dr.getQuestion().getId() + " " + dr.getAnswer().getId() + " " + dr.getResponse());
                    u.addDemographicResponse(dr);

                } else if (dr.getQuestion().isFreeForm()) {
                    log.debug("free form: " + dr.getQuestion().getId());
                    badResponse = findResponse(u.getDemographicResponses(), dr.getQuestion());
                    if (badResponse == null) {
                        log.debug("add " + dr.getQuestion().getId() + " " + dr.getAnswer().getId() + " " + dr.getResponse());
                        dr.setUser(u);
                        dr.getId().setUser(u);
                        dr.getId().setQuestion(dr.getQuestion());
                        dr.getId().setAnswer(dr.getAnswer());
                        u.addDemographicResponse(dr);
                    } else {
                        log.debug("set " + badResponse.getQuestion().getId() + " " + badResponse.getAnswer().getId() + " to " + dr.getResponse());
                        badResponse.setResponse(dr.getResponse());
                    }
                } else if (!processedQuestions.contains(dr.getQuestion())) {
                    log.debug("multiple");

                    Set currResponses = findResponses(u.getDemographicResponses(), dr.getQuestion());
                    Set newResponses = findResponses(u.getTransientResponses(), dr.getQuestion());
                    //remove any responses from the database that the user hasn't chosen
                    for (Iterator itr = currResponses.iterator(); itr.hasNext();) {
                        badResponse = (DemographicResponse) itr.next();
                        if (!newResponses.contains(badResponse)) {
                            u.removeDemographicResponse(badResponse);
                            badResponse.setUser(null);
                        }
                    }
                    //add any responses to the db that the user has chosen that are not current there
                    for (Iterator itr = newResponses.iterator(); itr.hasNext();) {
                        goodResponse = (DemographicResponse) itr.next();
                        if (!currResponses.contains(goodResponse)) {
                            goodResponse.setUser(u);
                            goodResponse.getId().setUser(u);
                            goodResponse.getId().setQuestion(goodResponse.getQuestion());
                            goodResponse.getId().setAnswer(goodResponse.getAnswer());
                            u.addDemographicResponse(goodResponse);
                        }
                    }
                    processedQuestions.add(dr.getQuestion());
                }
            }
            super.saveOrUpdate(u);
        }
    }

    private DemographicResponse findResponse(Set responses, DemographicQuestion q) {
        boolean found = false;
        DemographicResponse ret = null;
        for (Iterator it = responses.iterator(); it.hasNext() && !found;) {
            ret = (DemographicResponse) it.next();
            found = ret.getQuestion().equals(q);
        }
        if (found) {
            return ret;
        } else {
            return null;
        }
    }

    private Set findResponses(Set responses, DemographicQuestion q) {
        HashSet ret = new HashSet();
        DemographicResponse response;
        for (Iterator it = responses.iterator(); it.hasNext();) {
            response = (DemographicResponse) it.next();
            if (response.getQuestion().equals(q)) {
                ret.add(response);
            }
        }
        log.debug("found " + ret.size() + " responses for " + q.getId());
        return ret;
    }
}
