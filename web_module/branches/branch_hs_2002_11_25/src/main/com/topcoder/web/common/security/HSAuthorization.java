package com.topcoder.web.common.security;

import java.util.Hashtable;
import javax.naming.*;
import com.topcoder.security.TCSubject;
import com.topcoder.security.admin.*;
import com.topcoder.security.policy.*;
import com.topcoder.shared.security.*;

/**
 * This will be using the TopCoder Software security component to determine
 * if a particular user has access to a particular resource.  
 * This can be done using com.topcoder.security.policy and passing it
 * the TCSubject associated with this object and a TCPermission object
 * that can be created using the Resource object passed in to the 
 * hasPermission() method.
 *
 * @author Greg Paul, Ambrose Feinstein
 */
public class HSAuthorization implements Authorization {

    private TCSubject user;
    PolicyRemote policy;

    /** Construct an instance which can be used to check access for the given user. */
    public HSAuthorization(TCSubject user) {

        this.user = user;

        try {
            Hashtable env = new Hashtable();
            env.put(Context.INITIAL_CONTEXT_FACTORY, "org.jnp.interfaces.NamingContextFactory");
            env.put(Context.PROVIDER_URL, "172.16.20.40:1099");
            InitialContext context = new InitialContext(env);
            PolicyRemoteHome policyHome = (PolicyRemoteHome)context.lookup(PolicyRemoteHome.EJB_REF_NAME);
            policy = policyHome.create();

        } catch(Exception e) {
            throw new RuntimeException(e.getMessage());  //@@@ use authexception?
        }
    }

    /** Constructor which takes a userid and fetches the TCSubject for that user. */
    public HSAuthorization(long userid) {

        try {
            Hashtable env = new Hashtable();
            env.put(Context.INITIAL_CONTEXT_FACTORY, "org.jnp.interfaces.NamingContextFactory");
            env.put(Context.PROVIDER_URL, "172.16.20.40:1099");
            InitialContext context = new InitialContext(env);
            PolicyRemoteHome policyHome = (PolicyRemoteHome)context.lookup(PolicyRemoteHome.EJB_REF_NAME);
            policy = policyHome.create();

            PrincipalMgrRemoteHome pmgrHome = (PrincipalMgrRemoteHome)context.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            PrincipalMgrRemote pmgr = pmgrHome.create();
            this.user = pmgr.getUserSubject(userid);

        } catch(Exception e) {
            throw new RuntimeException(e.getMessage());  //@@@ use authexception?
        }
    }

    /* Query the security component to determine whether the user can access this resource. */
    public boolean hasPermission(Resource r) {

        try {
            TCPermission perm = new GenericPermission(r.getName());
            return policy.checkPermission(user, perm);

        } catch(Exception e) {
            return false;
        }
    }
}
