package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.model.RegistrationType;
import com.topcoder.web.reg.model.User;

import java.util.List;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 13, 2006
 */
public class RegistrationTypeDAO extends Base {
    public List getRegistrationTypes() {
        return findAll(RegistrationType.class, "active", new Integer(1));
    }

    public RegistrationType find(Long id) {
        return (RegistrationType)find(RegistrationType.class, id);
    }

    public Set getRegistrationTypes(User u) {

        /*
        select rt.*
          from registration_type_lu rt, user_group_xref x
           where tr.security_group_id = x.group_id
             and x.user_id = ?

             from RegistrationType 
        */
    }
}
