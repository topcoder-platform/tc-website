package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.StateDAO;
import com.topcoder.web.common.model.State;
import org.hibernate.Session;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class StateDAOHibernate extends Base implements StateDAO {
    public StateDAOHibernate() {
        super();
    }

    public StateDAOHibernate(Session session) {
        super(session);
    }

    public List getStates() {
        return findAll(State.class);
    }

    public State find(String code) {
        return (State) find(State.class, code.toUpperCase());
    }

}
