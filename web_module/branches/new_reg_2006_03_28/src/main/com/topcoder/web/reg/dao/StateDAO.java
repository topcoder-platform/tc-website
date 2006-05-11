package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.model.State;
import org.hibernate.Session;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class StateDAO extends Base {
    public StateDAO() {
        super();
    }

    public StateDAO(Session session) {
        super(session);
    }

    public List getStates() {
        return findAll(State.class);
    }

    public State find(String code) {
        return (State) find(State.class, code);
    }
}
