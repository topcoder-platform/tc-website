package com.topcoder.web.common.security;

import com.topcoder.security.*;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.web.common.SecurityHelper;

import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import java.rmi.RemoteException;
import java.util.Collection;
import java.util.Hashtable;

public class PrincipalMgr {
    private InitialContext context;
    private PrincipalMgrRemoteHome home;

    public PrincipalMgr() throws PrincipalMgrException {
        try {
            Hashtable env = new Hashtable();
            env.put(InitialContext.INITIAL_CONTEXT_FACTORY,
                    ApplicationServer.SECURITY_CONTEXT_FACTORY);
            env.put(InitialContext.PROVIDER_URL,
                    ApplicationServer.SECURITY_PROVIDER_URL);
            context = new InitialContext(env);

            home = (PrincipalMgrRemoteHome)
                    PortableRemoteObject.narrow(context.lookup(
                            PrincipalMgrRemoteHome.EJB_REF_NAME),
                            PrincipalMgrRemoteHome.class);
        } catch (NamingException e) {
            throw new PrincipalMgrException("Problem creating Home", e);
        }
    }

    public void addUserToGroup(GroupPrincipal group,
                               UserPrincipal user,
                               TCSubject requestor)
            throws PrincipalMgrException {
        try {
            PrincipalMgrRemote mgr = home.create();
            mgr.addUserToGroup(group, user, requestor);

        } catch (CreateException e) {
            throw new PrincipalMgrException("Could not obtain PrincipalMgr", e);
        } catch (GeneralSecurityException e) {
            throw new PrincipalMgrException("Error performing task", e);

        } catch (RemoteException e) {
            throw new PrincipalMgrException("System Error", e);
        }
    }

    public void assignRole(GroupPrincipal group,
                           RolePrincipal role,
                           TCSubject requestor)
            throws PrincipalMgrException {
        try {
            PrincipalMgrRemote mgr = home.create();
            mgr.assignRole(group, role, requestor);

        } catch (CreateException e) {
            throw new PrincipalMgrException("Could not obtain PrincipalMgr", e);
        } catch (GeneralSecurityException e) {
            throw new PrincipalMgrException("Error performing task", e);

        } catch (RemoteException e) {
            throw new PrincipalMgrException("System Error", e);
        }
    }

    public void assignRole(UserPrincipal user,
                           RolePrincipal role,
                           TCSubject requestor)
            throws PrincipalMgrException {
        try {
            PrincipalMgrRemote mgr = home.create();
            mgr.assignRole(user, role, requestor);

        } catch (CreateException e) {
            throw new PrincipalMgrException("Could not obtain PrincipalMgr", e);
        } catch (GeneralSecurityException e) {
            throw new PrincipalMgrException("Error performing task", e);

        } catch (RemoteException e) {
            throw new PrincipalMgrException("System Error", e);
        }
    }

    public GroupPrincipal createGroup(String groupname, TCSubject requestor)
            throws PrincipalMgrException {
        try {
            PrincipalMgrRemote mgr = home.create();
            return mgr.createGroup(groupname, requestor);

        } catch (CreateException e) {
            throw new PrincipalMgrException("Could not obtain PrincipalMgr", e);
        } catch (GeneralSecurityException e) {
            throw new PrincipalMgrException("Error performing task", e);

        } catch (RemoteException e) {
            throw new PrincipalMgrException("System Error", e);
        }
    }

    public RolePrincipal createRole(String name, TCSubject requestor)
            throws PrincipalMgrException {
        try {
            PrincipalMgrRemote mgr = home.create();
            return mgr.createRole(name, requestor);

        } catch (CreateException e) {
            throw new PrincipalMgrException("Could not obtain PrincipalMgr", e);
        } catch (GeneralSecurityException e) {
            throw new PrincipalMgrException("Error performing task", e);

        } catch (RemoteException e) {
            throw new PrincipalMgrException("System Error", e);
        }
    }

    public UserPrincipal createUser(String username,
                                    String password,
                                    TCSubject requestor)
            throws PrincipalMgrException {
        try {
            PrincipalMgrRemote mgr = home.create();
            return mgr.createUser(username, password, requestor);

        } catch (CreateException e) {
            throw new PrincipalMgrException("Could not obtain PrincipalMgr", e);
        } catch (GeneralSecurityException e) {
            throw new PrincipalMgrException("Error performing task", e);

        } catch (RemoteException e) {
            throw new PrincipalMgrException("System Error", e);
        }
    }

    public UserPrincipal editPassword(UserPrincipal user,
                                      String password,
                                      TCSubject requestor)
            throws PrincipalMgrException {
        try {
            PrincipalMgrRemote mgr = home.create();
            return mgr.editPassword(user, password, requestor);

        } catch (CreateException e) {
            throw new PrincipalMgrException("Could not obtain PrincipalMgr", e);
        } catch (GeneralSecurityException e) {
            throw new PrincipalMgrException("Error performing task", e);

        } catch (RemoteException e) {
            throw new PrincipalMgrException("System Error", e);
        }
    }

    public GroupPrincipal getGroup(long id)
            throws PrincipalMgrException {
        try {
            PrincipalMgrRemote mgr = home.create();
            return mgr.getGroup(id);

        } catch (CreateException e) {
            throw new PrincipalMgrException("Could not obtain PrincipalMgr", e);
        } catch (GeneralSecurityException e) {
            throw new PrincipalMgrException("Error performing task", e);

        } catch (RemoteException e) {
            throw new PrincipalMgrException("System Error", e);
        }
    }

    public Collection getGroups(TCSubject requestor)
            throws PrincipalMgrException {
        try {
            PrincipalMgrRemote mgr = home.create();
            return mgr.getGroups(requestor);

        } catch (CreateException e) {
            throw new PrincipalMgrException("Could not obtain PrincipalMgr", e);
        } catch (GeneralSecurityException e) {
            throw new PrincipalMgrException("Error performing task", e);

        } catch (RemoteException e) {
            throw new PrincipalMgrException("System Error", e);
        }
    }

    public String getPassword(long id)
            throws PrincipalMgrException {
        try {
            PrincipalMgrRemote mgr = home.create();
            return mgr.getPassword(id);

        } catch (CreateException e) {
            throw new PrincipalMgrException("Could not obtain PrincipalMgr", e);
        } catch (GeneralSecurityException e) {
            throw new PrincipalMgrException("Error performing task", e);

        } catch (RemoteException e) {
            throw new PrincipalMgrException("System Error", e);
        }
    }

    public RolePrincipal getRole(long id)
            throws PrincipalMgrException {
        try {
            PrincipalMgrRemote mgr = home.create();
            return mgr.getRole(id);

        } catch (CreateException e) {
            throw new PrincipalMgrException("Could not obtain PrincipalMgr", e);
        } catch (GeneralSecurityException e) {
            throw new PrincipalMgrException("Error performing task", e);

        } catch (RemoteException e) {
            throw new PrincipalMgrException("System Error", e);
        }
    }

    public Collection getRoles(TCSubject requestor)
            throws PrincipalMgrException {
        try {
            PrincipalMgrRemote mgr = home.create();
            return mgr.getRoles(requestor);

        } catch (CreateException e) {
            throw new PrincipalMgrException("Could not obtain PrincipalMgr", e);
        } catch (GeneralSecurityException e) {
            throw new PrincipalMgrException("Error performing task", e);

        } catch (RemoteException e) {
            throw new PrincipalMgrException("System Error", e);
        }
    }

    public UserPrincipal getUser(long id)
            throws PrincipalMgrException {
        try {
            PrincipalMgrRemote mgr = home.create();
            return mgr.getUser(id);

        } catch (CreateException e) {
            throw new PrincipalMgrException("Could not obtain PrincipalMgr", e);
        } catch (GeneralSecurityException e) {
            throw new PrincipalMgrException("Error performing task", e);

        } catch (RemoteException e) {
            throw new PrincipalMgrException("System Error", e);
        }
    }

    public UserPrincipal getUser(String username)
            throws PrincipalMgrException {
        try {
            PrincipalMgrRemote mgr = home.create();
            return mgr.getUser(username);

        } catch (CreateException e) {
            throw new PrincipalMgrException("Could not obtain PrincipalMgr", e);
        } catch (GeneralSecurityException e) {
            throw new PrincipalMgrException("Error performing task", e);

        } catch (RemoteException e) {
            throw new PrincipalMgrException("System Error", e);
        }
    }

    public Collection getUsers(TCSubject requestor)
            throws PrincipalMgrException {
        try {
            PrincipalMgrRemote mgr = home.create();
            return mgr.getUsers(requestor);

        } catch (CreateException e) {
            throw new PrincipalMgrException("Could not obtain PrincipalMgr", e);
        } catch (GeneralSecurityException e) {
            throw new PrincipalMgrException("Error performing task", e);

        } catch (RemoteException e) {
            throw new PrincipalMgrException("System Error", e);
        }
    }

    public TCSubject getUserSubject(long userId)
            throws PrincipalMgrException {
        try {
            return SecurityHelper.getUserSubject(userId);
        } catch (Exception e) {
            throw new PrincipalMgrException(e);
        }
    }

    public void removeGroup(GroupPrincipal group, TCSubject requestor)
            throws PrincipalMgrException {
        try {
            PrincipalMgrRemote mgr = home.create();
            mgr.removeGroup(group, requestor);

        } catch (CreateException e) {
            throw new PrincipalMgrException("Could not obtain PrincipalMgr", e);
        } catch (GeneralSecurityException e) {
            throw new PrincipalMgrException("Error performing task", e);

        } catch (RemoteException e) {
            throw new PrincipalMgrException("System Error", e);
        }
    }

    public void removeRole(RolePrincipal role, TCSubject requestor)
            throws PrincipalMgrException {
        try {
            PrincipalMgrRemote mgr = home.create();
            mgr.removeRole(role, requestor);

        } catch (CreateException e) {
            throw new PrincipalMgrException("Could not obtain PrincipalMgr", e);
        } catch (GeneralSecurityException e) {
            throw new PrincipalMgrException("Error performing task", e);

        } catch (RemoteException e) {
            throw new PrincipalMgrException("System Error", e);
        }
    }

    public void removeUser(UserPrincipal user, TCSubject requestor)
            throws PrincipalMgrException {
        try {
            PrincipalMgrRemote mgr = home.create();
            mgr.removeUser(user, requestor);

        } catch (CreateException e) {
            throw new PrincipalMgrException("Could not obtain PrincipalMgr", e);
        } catch (GeneralSecurityException e) {
            throw new PrincipalMgrException("Error performing task", e);

        } catch (RemoteException e) {
            throw new PrincipalMgrException("System Error", e);
        }
    }

    public void removeUserFromGroup(GroupPrincipal group,
                                    UserPrincipal user,
                                    TCSubject requestor)
            throws PrincipalMgrException {
        try {
            PrincipalMgrRemote mgr = home.create();
            mgr.removeUserFromGroup(group, user, requestor);

        } catch (CreateException e) {
            throw new PrincipalMgrException("Could not obtain PrincipalMgr", e);
        } catch (GeneralSecurityException e) {
            throw new PrincipalMgrException("Error performing task", e);

        } catch (RemoteException e) {
            throw new PrincipalMgrException("System Error", e);
        }
    }

    public void unAssignRole(GroupPrincipal group,
                             RolePrincipal role,
                             TCSubject requestor)
            throws PrincipalMgrException {
        try {
            PrincipalMgrRemote mgr = home.create();
            mgr.unAssignRole(group, role, requestor);

        } catch (CreateException e) {
            throw new PrincipalMgrException("Could not obtain PrincipalMgr", e);
        } catch (GeneralSecurityException e) {
            throw new PrincipalMgrException("Error performing task", e);

        } catch (RemoteException e) {
            throw new PrincipalMgrException("System Error", e);
        }
    }

    public void unAssignRole(UserPrincipal user,
                             RolePrincipal role,
                             TCSubject requestor)
            throws PrincipalMgrException {
        try {
            PrincipalMgrRemote mgr = home.create();
            mgr.unAssignRole(user, role, requestor);

        } catch (CreateException e) {
            throw new PrincipalMgrException("Could not obtain PrincipalMgr", e);
        } catch (GeneralSecurityException e) {
            throw new PrincipalMgrException("Error performing task", e);

        } catch (RemoteException e) {
            throw new PrincipalMgrException("System Error", e);
        }
    }
}
