package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.dao.UserSchoolDAO;
import com.topcoder.web.common.model.DemographicQuestion;
import com.topcoder.web.common.model.DemographicResponse;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.UserSchool;
import com.topcoder.web.reg.Constants;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * @author dok
 * @version $Revision: 66662 $ Date: 2005/01/01 00:00:00
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
        return find(userName, ignoreCase, false);
    }

    public User find(String userName, boolean ignoreCase, boolean activeRequired) {
        StringBuffer query = new StringBuffer(100);
        query.append("FROM User WHERE ");
        if (ignoreCase) {
            query.append("handle_lower ");
        } else {
            query.append("handle ");
        }
        query.append(" = ? ");
        if (activeRequired) {
            query.append(" AND status = ?");
        }
        Query q = session.createQuery(query.toString());
        if (ignoreCase) {
            q.setString(0, userName.toLowerCase());
        } else {
            q.setString(0, userName);
        }
        if (activeRequired) {
            q.setString(1, String.valueOf(Constants.ACTIVE_STATI[1]));
        }
        return (User) q.uniqueResult();

    }

    public List find(String handle, String firstName, String lastName, String email) {
        Criteria crit = session.createCriteria(User.class);
        if (handle != null && handle.length() > 0) {
            crit.add(Restrictions.sqlRestriction("lower({alias}.handle)=lower(?)", handle, Hibernate.STRING));
        }

        if (email != null && email.length() > 0) {
            crit.createCriteria("emailAddresses")
                    .add(Restrictions.sqlRestriction("lower({alias}.address)=lower(?)", email, Hibernate.STRING))
                    .add(Restrictions.eq("primary", Boolean.TRUE));
        }

        if (firstName != null && firstName.length() > 0) {
            crit.add(Restrictions.sqlRestriction("lower({alias}.first_name)=lower(?)", firstName, Hibernate.STRING));
        }

        if (lastName != null && lastName.length() > 0) {
            crit.add(Restrictions.sqlRestriction("lower({alias}.last_name)=lower(?)", lastName, Hibernate.STRING));
        }

        return crit.list();
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

        UserSchoolDAO usd = DAOUtil.getFactory().getUserSchoolDAO();
        if (u.getId() == null) {
            log.debug("newbie");
            DemographicResponse tr;
            DemographicResponse dr;
            for (Iterator it = u.getTransientResponses().iterator(); it.hasNext();) {
                tr = (DemographicResponse) it.next();
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
            //can't figure out how to map this so that the changes get propegated through user, so doing it explicitly
            for (UserSchool us : u.getSchools()) {
                usd.saveOrUpdate(us);
            }


        } else {
            log.debug("update user");
            //todo consider putting all this logic in the POJO instead of here.

            //don't need to worry about anything that is already in the db.
            DemographicResponse temp;
            //log.debug("trans size b4" + u.getTransientResponses().size());
            for (Iterator it = u.getDemographicResponses().iterator(); it.hasNext();) {
                temp = (DemographicResponse) it.next();
                if (temp.getQuestion().isFreeForm() || temp.getQuestion().isSingleSelect()) {
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
                //log.debug("process:" + dr.getQuestion().getId() + " " + dr.getAnswer().getId() + " " + dr.getResponse());
                if (dr.getQuestion().isSingleSelect()) {
                    //log.debug("single: " + dr.getQuestion().getId());
                    badResponse = findResponse(u.getDemographicResponses(), dr.getQuestion());
                    if (badResponse != null) {
                        //log.debug("remove " + badResponse.getQuestion().getId() + " " + badResponse.getAnswer().getId() + " size:" + u.getDemographicResponses().size());
                        u.removeDemographicResponse(badResponse);
                        //log.debug("size after remove " + u.getDemographicResponses().size());
                        badResponse.setUser(null);
                    }
                    dr.setUser(u);
                    dr.getId().setUser(u);
                    dr.getId().setQuestion(dr.getQuestion());
                    dr.getId().setAnswer(dr.getAnswer());
                    //log.debug("adding response:" + dr.getQuestion().getId() + " " + dr.getAnswer().getId() + " " + dr.getResponse());
                    u.addDemographicResponse(dr);

                } else if (dr.getQuestion().isFreeForm()) {
                    //log.debug("free form: " + dr.getQuestion().getId());
                    badResponse = findResponse(u.getDemographicResponses(), dr.getQuestion());
                    if (badResponse == null) {
                        //log.debug("add " + dr.getQuestion().getId() + " " + dr.getAnswer().getId() + " " + dr.getResponse());
                        dr.setUser(u);
                        dr.getId().setUser(u);
                        dr.getId().setQuestion(dr.getQuestion());
                        dr.getId().setAnswer(dr.getAnswer());
                        u.addDemographicResponse(dr);
                    } else {
                        //log.debug("set " + badResponse.getQuestion().getId() + " " + badResponse.getAnswer().getId() + " to " + dr.getResponse());
                        badResponse.setResponse(dr.getResponse());
                    }
                } else if (!processedQuestions.contains(dr.getQuestion())) {
                    //log.debug("multiple");

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
            //can't figure out how to map this so that the changes get propegated through user, so doing it explicitly
            for (UserSchool us : u.getSchools()) {
                usd.saveOrUpdate(us);
            }

        }
    }

    private DemographicResponse findResponse(Collection responses, DemographicQuestion q) {
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

    private Set findResponses(Collection responses, DemographicQuestion q) {
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
