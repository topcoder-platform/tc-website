package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.security.GroupPrincipal;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.shared.util.Transaction;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.address.Address;
import com.topcoder.web.ejb.coder.Coder;
import com.topcoder.web.ejb.company.Company;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.rating.Rating;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.ejb.user.UserAddress;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;

import javax.transaction.UserTransaction;
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
    private static final String US = "840";

    protected void registrationProcessing() throws TCWebException {

        checkRegInfo(regInfo);

        if (hasErrors()) {
            getRequest().setAttribute("countryList", getCountryList());
            getRequest().setAttribute("stateList", getStateList());
            setNextPage(Constants.SIMPLE_REG_PAGE);
            setDefaults(regInfo);
        } else {
            commit(regInfo);
            clearRegInfo();
            setNextPage(Constants.SIMPLE_REG_SUCCESS_PAGE);
        }
        setIsNextPageInContext(true);
    }

    protected void commit(SimpleRegInfo regInfo) throws TCWebException {
        UserTransaction tx = null;

        UserPrincipal newUser = null;
        try {
            tx = Transaction.get();
            Transaction.begin(tx);
            PrincipalMgrRemote mgr = getPrincipalManager();
            newUser = mgr.createUser(regInfo.getHandle(), regInfo.getPassword(), CREATE_USER);
            store(regInfo, newUser);
            Transaction.commit(tx);
        } catch (Exception e) {
            Exception ex = null;
            try {
                if (tx != null) {
                    Transaction.rollback(tx);
                }
            } catch (Exception x) {
                ex = x;
            }
            try {
                //since we don't have a transaction spanning the security
                //stuff, attempt to remove this newly created user manually
                if (newUser != null && newUser.getId() > 0) {
                    PrincipalMgrRemote mgr = getPrincipalManager();
                    mgr.removeUser(newUser, CREATE_USER);
                }
            } catch (Exception x) {
                if (ex==null) ex = x;
                throw new TCWebException(x);
            }
            throw new TCWebException(e);
        }
    }

    protected UserPrincipal store(SimpleRegInfo regInfo, UserPrincipal newUser) throws Exception {
        User user = (User) createEJB(getInitialContext(), User.class, "main:");
        Address address = (Address) createEJB(getInitialContext(), Address.class);
        Email email = (Email) createEJB(getInitialContext(), Email.class, "main:");
        UserAddress userAddress = (UserAddress) createEJB(getInitialContext(), UserAddress.class, "main:");
        Company company = (Company) createEJB(getInitialContext(), Company.class);
        Coder coder = (Coder) createEJB(getInitialContext(), Coder.class);
        Rating rating = (Rating) createEJB(getInitialContext(), Rating.class);

        PrincipalMgrRemote mgr = getPrincipalManager();

        //add user to groups
        Collection groups = mgr.getGroups(CREATE_USER);
        GroupPrincipal anonGroup = null;
        GroupPrincipal userGroup = null;
        GroupPrincipal group = null;
        for (Iterator it = groups.iterator(); it.hasNext() && (anonGroup == null || userGroup == null);) {
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
        user.createUser(newUser.getId(), regInfo.getHandle(),
                company.getNewUserStatus(regInfo.getCompanyId()).charAt(0));
        user.setFirstName(newUser.getId(), regInfo.getMiddleName());
        user.setMiddleName(newUser.getId(), regInfo.getFirstName());
        user.setLastName(newUser.getId(), regInfo.getLastName());


        //create address
        long addressId = address.createAddress();
        address.setAddress1(addressId, regInfo.getAddress1());
        address.setAddress2(addressId, regInfo.getAddress2());
        address.setAddress3(addressId, regInfo.getAddress3());
        address.setAddressTypeId(addressId, ADDRESS_TYPE);
        address.setCity(addressId, regInfo.getCity());
        address.setCountryCode(addressId, regInfo.getCountryCode());
        address.setProvince(addressId, regInfo.getProvince());
        if (regInfo.getCountryCode().equals(US)) {
            address.setStateCode(addressId, regInfo.getStateCode());
        }
        address.setZip(addressId, regInfo.getZip());

        //associate address with user
        userAddress.createUserAddress(newUser.getId(), addressId);

        //create email
        long emailId = email.createEmail(newUser.getId());
        email.setAddress(emailId, regInfo.getEmail());
        email.setEmailTypeId(emailId, EMAIL_TYPE);
        email.setPrimaryEmailId(newUser.getId(), emailId);

        //create coder
        coder.createCoder(newUser.getId(), db);

        //create rating
        rating.createRating(newUser.getId(), db);

        return newUser;

    }

}
