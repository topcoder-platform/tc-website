package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.ejb.user.UserAddress;
import com.topcoder.web.ejb.address.Address;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.shared.util.Transaction;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.GroupPrincipal;

import javax.transaction.UserTransaction;
import javax.naming.InitialContext;
import java.util.Collection;
import java.util.Iterator;

/**
 *
 * @author gpaul 06.26.2003
 */
public class SimpleRegSubmit extends SimpleRegBase {

    private static final String ANON_GROUP = "Anonymous";
    private static final String SOFTWARE_GROUP = "Users";
    private static final long ADDRESS_TYPE = 2; //2 is home address
    private static final long EMAIL_TYPE = 1; //1 is "primary"

    protected void registrationProcessing() throws TCWebException {

        checkRegInfo(regInfo);

        if (hasErrors()) {
            setNextPage(Constants.SIMPLE_REG_PAGE);
            setDefaults(regInfo);
        } else {
            commit(regInfo);
            clearRegInfo();
            setNextPage(Constants.SIMPLE_REG_SUCCESS_PAGE);
        }
        setIsNextPageInContext(true);
    }

    private void commit(SimpleRegInfo regInfo) throws TCWebException {
        UserTransaction tx = null;

        UserPrincipal newUser = null;
        try {
            tx = Transaction.get();
            Transaction.begin(tx);
            newUser = store(regInfo);
            Transaction.commit(tx);
        } catch (Exception e) {
            try {
                if (tx!=null) {
                    Transaction.rollback(tx);
                }
            } catch (Exception ex) {
                throw new TCWebException(ex);
            }
            InitialContext securityCtx = null;
            try {
                //since we don't have a transaction spanning the security
                //stuff, attempt to remove this newly created user manually
                securityCtx = (InitialContext) TCContext.getContext(
                                    ApplicationServer.SECURITY_CONTEXT_FACTORY,
                                    ApplicationServer.SECURITY_PROVIDER_URL);
                PrincipalMgrRemoteHome rHome = (PrincipalMgrRemoteHome)
                                    securityCtx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);

                PrincipalMgrRemote mgr = rHome.create();
                mgr.removeUser(newUser, CREATE_USER);
            } catch (Exception ex) {
                throw new TCWebException(ex);
            } finally {
                close(securityCtx);
            }
        }
    }

    private UserPrincipal store(SimpleRegInfo regInfo) throws Exception {
        InitialContext ctx = null;
        InitialContext securityCtx = null;
        try {
            ctx = new InitialContext();
            User user = (User)createEJB(ctx, User.class);
            Address address = (Address)createEJB(ctx, Address.class);
            Email email = (Email)createEJB(ctx, Email.class);
            UserAddress userAddress = (UserAddress)createEJB(ctx, UserAddress.class);


            securityCtx = (InitialContext) TCContext.getContext(
                                ApplicationServer.SECURITY_CONTEXT_FACTORY,
                                ApplicationServer.SECURITY_PROVIDER_URL);
            PrincipalMgrRemoteHome rHome = (PrincipalMgrRemoteHome)
                                securityCtx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);

            PrincipalMgrRemote mgr = rHome.create();

            UserPrincipal newUser = mgr.createUser(regInfo.getHandle(), regInfo.getPassword(), CREATE_USER);

            //add user to groups
            Collection groups = mgr.getGroups(CREATE_USER);
            GroupPrincipal anonGroup = null;
            GroupPrincipal userGroup = null;
            GroupPrincipal group = null;
            for (Iterator it = groups.iterator(); it.hasNext() && (anonGroup==null || userGroup==null);) {
                group = (GroupPrincipal) it.next();
                if (group.getName().equals(ANON_GROUP)) {
                    anonGroup = (GroupPrincipal) it.next();
                } else if (group.getName().equals(SOFTWARE_GROUP)) {
                    userGroup = (GroupPrincipal) it.next();
                }
            }

            mgr.addUserToGroup(anonGroup, newUser, CREATE_USER);
            mgr.addUserToGroup(userGroup, newUser, CREATE_USER);

            if (anonGroup == null) {
                throw new Exception("Can't find anonymous group '" + ANON_GROUP + "'");
            } else if (userGroup == null) {
                throw new Exception("Can't find software user group '" + SOFTWARE_GROUP + "'");
            }

            //create user
            //TODO determine create status based on company
            user.createUser(newUser.getId(), regInfo.getHandle(), 'U');
            user.setFirstName(newUser.getId(), regInfo.getFirstName());
            user.setLastName(newUser.getId(), regInfo.getLastName());

            //create address
            long addressId = address.createAddress();
            address.setAddress1(addressId, regInfo.getAddress1());
            address.setAddress2(addressId, regInfo.getAddress2());
            address.setAddressTypeId(addressId, ADDRESS_TYPE);
            address.setCity(addressId, regInfo.getCity());
            address.setCountryCode(addressId, regInfo.getCountryCode());
            address.setStateCode(addressId, regInfo.getStateCode());
            address.setZip(addressId, regInfo.getZip());

            //associate address with user
            userAddress.createUserAddress(newUser.getId(), addressId);

            //create email
            long emailId = email.createEmail(newUser.getId());
            email.setAddress(emailId, regInfo.getEmail());
            email.setEmailTypeId(emailId, EMAIL_TYPE);
            email.setPrimaryEmailId(newUser.getId(), emailId);

            //create coder
            //TODO

            return newUser;
        } finally {
            close(ctx);
            close(securityCtx);
        }

    }

}
