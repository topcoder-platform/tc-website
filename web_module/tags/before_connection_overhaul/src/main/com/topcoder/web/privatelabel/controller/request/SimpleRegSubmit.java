package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.security.GroupPrincipal;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.shared.util.Transaction;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.ejb.address.Address;
import com.topcoder.web.ejb.coder.Coder;
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
    private static final int DEFAULT_EDITOR = 0;  //standard editor
    private static final int DEFAULT_LANGUAGE = 1;  //java
    private static final String US = "840";

    protected void registrationProcessing() throws TCWebException {

        checkRegInfo(regInfo);

        if (hasErrors()) {
            getRequest().setAttribute("countryList", getCountryList());
            getRequest().setAttribute("stateList", getStateList());
            setDefaults(regInfo);
        } else {
            commit(regInfo);
            clearRegInfo();
        }
        setNextPage();
    }

    protected void setNextPage() {
        if (hasErrors()) {
            setNextPage(Constants.SIMPLE_REG_PAGE);
        } else {
            setNextPage(Constants.SIMPLE_REG_SUCCESS_PAGE);
        }
        setIsNextPageInContext(true);
    }

    protected UserPrincipal commit(SimpleRegInfo regInfo) throws TCWebException {
        UserTransaction tx = null;

        UserPrincipal newUser = null;
        try {
            tx = Transaction.get();
            Transaction.begin(tx);
            PrincipalMgrRemote mgr = getPrincipalManager();
            if (regInfo.isNew()) {
                newUser = mgr.createUser(regInfo.getHandle(), regInfo.getPassword(), CREATE_USER);
            } else {
                newUser = mgr.getUser(regInfo.getHandle());
            }
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
                if (newUser != null && newUser.getId() > 0 && regInfo.isNew()) {
                    PrincipalMgrRemote mgr = getPrincipalManager();
                    mgr.removeUser(newUser, CREATE_USER);
                }
            } catch (Exception x) {
                if (ex==null) ex = x;
                throw new TCWebException(x);
            }
            throw new TCWebException(e);
        }
        return newUser;
    }

    protected UserPrincipal store(SimpleRegInfo regInfo, UserPrincipal newUser) throws Exception {
        User user = (User) createEJB(getInitialContext(), User.class);
        Address address = (Address) createEJB(getInitialContext(), Address.class);
        Email email = (Email) createEJB(getInitialContext(), Email.class);
        UserAddress userAddress = (UserAddress) createEJB(getInitialContext(), UserAddress.class);
        Coder coder = (Coder) createEJB(getInitialContext(), Coder.class);
        Rating rating = (Rating) createEJB(getInitialContext(), Rating.class);

        PrincipalMgrRemote mgr = getPrincipalManager();

        //add user to groups
        if (regInfo.isNew()) {
            Collection groups = mgr.getGroups(CREATE_USER);
            GroupPrincipal group = null;
            boolean anonFound = false;
            boolean userFound = false;
            for (Iterator it = groups.iterator(); it.hasNext() && !(anonFound && userFound);) {
                group = (GroupPrincipal) it.next();
                if (group.getName().equals(ANON_GROUP)) {
                    mgr.addUserToGroup(group, newUser, CREATE_USER);
                    anonFound = true;
                } else if (group.getName().equals(SOFTWARE_GROUP)) {
                    mgr.addUserToGroup(group, newUser, CREATE_USER);
                    userFound = true;
                }
            }


            if (!anonFound) {
                throw new Exception("Can't find anonymous group '" + ANON_GROUP + "'");
            } else if (!userFound) {
                throw new Exception("Can't find software user group '" + SOFTWARE_GROUP + "'");
            }
        }

        //create user
        if (!user.userExists(newUser.getId(), transDb)) {
            user.createUser(newUser.getId(), regInfo.getHandle(), getNewUserStatus(), transDb);
        }
        user.setFirstName(newUser.getId(), regInfo.getFirstName(), transDb);
        user.setMiddleName(newUser.getId(), regInfo.getMiddleName(), transDb);
        user.setLastName(newUser.getId(), regInfo.getLastName(), transDb);
        user.setActivationCode(newUser.getId(), StringUtils.getActivationCode(newUser.getId()), transDb);

        //create address
        long addressId = 0;
        if (regInfo.isNew()) {
            addressId = address.createAddress(transDb, db);
            userAddress.createUserAddress(newUser.getId(), addressId, transDb);
        } else {
            ResultSetContainer rsc = userAddress.getUserAddresses(newUser.getId(), transDb);
            if (rsc.isEmpty()) {
                addressId = address.createAddress(transDb, db);
                userAddress.createUserAddress(newUser.getId(), addressId, transDb);
            } else {
                addressId = rsc.getLongItem(0, "address_id");
            }
        }
        address.setAddress1(addressId, regInfo.getAddress1(), transDb);
        address.setAddress2(addressId, regInfo.getAddress2(), transDb);
        address.setAddress3(addressId, regInfo.getAddress3(), transDb);
        address.setAddressTypeId(addressId, ADDRESS_TYPE, transDb);
        address.setCity(addressId, regInfo.getCity(), transDb);
        address.setCountryCode(addressId, regInfo.getCountryCode(), transDb);
        address.setProvince(addressId, regInfo.getProvince(), transDb);
        if (regInfo.getCountryCode().equals(US)) {
            address.setStateCode(addressId, regInfo.getStateCode(), transDb);
        }
        address.setZip(addressId, regInfo.getZip(), transDb);


        //create email
        long emailId = 0;
        if (regInfo.isNew()) {
            emailId = email.createEmail(newUser.getId(), transDb, db);
        } else {
            emailId = email.getPrimaryEmailId(newUser.getId(), transDb);
        }
        email.setAddress(emailId, regInfo.getEmail(), transDb);
        email.setEmailTypeId(emailId, EMAIL_TYPE, transDb);
        email.setPrimaryEmailId(newUser.getId(), emailId, transDb);


        //create coder
        if (!coder.exists(newUser.getId(), transDb)) { // check if the user exists in registration database already as a coder
            coder.createCoder(newUser.getId(), transDb);
            rating.createRating(newUser.getId(), transDb);
        }
        coder.setEditorId(newUser.getId(), DEFAULT_EDITOR, transDb);
        coder.setLanguageId(newUser.getId(), DEFAULT_LANGUAGE, transDb);

        return newUser;

    }

    /**
     *
     * @return
     * @throws Exception if the status isn't present in the db, or some other error
     */
    protected char getNewUserStatus() throws Exception {
        ResultSetContainer rsc = getConfigInfo();
        if (rsc.getRow(0).getItem("status").getResultData()==null)
            throw new Exception ("Missing new user status for company: " +
                    regInfo.getCompanyId() + " event_id " + regInfo.getEventId());
        else return rsc.getStringItem(0, "status").charAt(0);
    }

    /**
     * get the job id they implicitly applied to by registering for the event
     * if it doesn't exist, return -1
     * @return
     * @throws Exception
     */
    protected long getJobId() throws Exception {
        ResultSetContainer rsc = getConfigInfo();
        if (rsc.getRow(0).getItem("job_id").getResultData()==null)
            return -1;
        else return rsc.getLongItem(0, "job_id");
    }

    /**
     *
     * @return
     * @throws Exception if the data is not in the db, or some other problem
     */
    protected ResultSetContainer getConfigInfo() throws Exception {
        Request r = new Request();
        r.setContentHandle("config_info");
        r.setProperty("eid", String.valueOf(regInfo.getEventId()));
        r.setProperty("cm", String.valueOf(regInfo.getCompanyId()));
        ResultSetContainer ret = (ResultSetContainer)getDataAccess(transDb, true).getData(r).get("config_info");
        if (ret==null || ret.isEmpty())
            throw new Exception ("Missing config info for company: " +
                    regInfo.getCompanyId() + " event_id " + regInfo.getEventId());
        return ret;
    }


}
