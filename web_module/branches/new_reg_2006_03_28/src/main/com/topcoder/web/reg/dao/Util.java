package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.model.Country;
import com.topcoder.web.reg.model.State;
import com.topcoder.web.reg.model.Notification;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class Util extends Base {

    public List getCountries() {
        return findAll(Country.class);
    }

    public Country getCountry(String code) {
        return (Country)find(Country.class, code);
    }

    public List getStates() {
        return findAll(State.class);
    }

    public State getState(String code) {
        return (State)find(State.class, code);
    }

    public List getNotifications() {
        return findAll(Notification.class);
    }

    public Notification getNotification(Long id) {
        return (Notification)find(Notification.class, id);
    }
}
