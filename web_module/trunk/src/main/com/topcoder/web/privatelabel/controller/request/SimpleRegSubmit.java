package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.security.UserPrincipal;
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

/**
 *
 * @author gpaul 06.26.2003
 */
public class SimpleRegSubmit extends SimpleRegBase {

/*
    private static final String ANON_GROUP = "Anonymous";
    private static final String SOFTWARE_GROUP = "Users";
*/
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

/*
            PrincipalMgrRemote mgr = getPrincipalManager();
            if (regInfo.isNew()) {
                log.debug("RYAN NEW");
                newUser = mgr.createUser(regInfo.getHandle(), regInfo.getPassword(), CREATE_USER);
            } else {
                log.debug("RYAN OLD");
                newUser = mgr.getUser(regInfo.getHandle());
            }
*/
            store(regInfo);
            Transaction.commit(tx);
        } catch (Exception e) {
//            Exception ex = null;
            try {
                if (tx != null) {
                    Transaction.rollback(tx);
                }
            } catch (Exception x) {
                throw new TCWebException(e);
            }
/*
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
*/
            throw new TCWebException(e);
        }
        return newUser;
    }

    public long storeWithoutCoder(SimpleRegInfo regInfo) throws Exception {
        User user = (User) createEJB(getInitialContext(), User.class);
        Address address = (Address) createEJB(getInitialContext(), Address.class);
        Email email = (Email) createEJB(getInitialContext(), Email.class);
        UserAddress userAddress = (UserAddress) createEJB(getInitialContext(), UserAddress.class);
/*
        Coder coder = (Coder) createEJB(getInitialContext(), Coder.class);
        Rating rating = (Rating) createEJB(getInitialContext(), Rating.class);
*/

//        PrincipalMgrRemote mgr = getPrincipalManager();

        //add user to groups
/*
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
*/

        //create user

        long userId = user.createNewUser(regInfo.getHandle(), getNewUserStatus(), transDb);
        user.setFirstName(userId, regInfo.getFirstName(), transDb);
        user.setMiddleName(userId, regInfo.getMiddleName(), transDb);
        user.setLastName(userId, regInfo.getLastName(), transDb);
        user.setActivationCode(userId, StringUtils.getActivationCode(userId), transDb);

        //create address
        long addressId = 0;
        if (regInfo.isNew()) {
            addressId = address.createAddress(transDb, db);
            userAddress.createUserAddress(userId, addressId, transDb);
        } else {
            ResultSetContainer rsc = userAddress.getUserAddresses(userId, transDb);
            if (rsc.isEmpty()) {
                addressId = address.createAddress(transDb, db);
                userAddress.createUserAddress(userId, addressId, transDb);
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
            emailId = email.createEmail(userId, transDb, db);
            email.setStatusId(emailId, 1, transDb);
        } else {
            emailId = email.getPrimaryEmailId(userId, transDb);
        }
        email.setAddress(emailId, regInfo.getEmail(), transDb);
        email.setEmailTypeId(emailId, EMAIL_TYPE, transDb);
        email.setPrimaryEmailId(userId, emailId, transDb);

        return userId;
    }

    /**
     * Store all teh data in the database.  This method is called within a transaction by the commit
     * method.  Everything that is transactional should be done in here.
     * @param regInfo
     * @return
     * @throws Exception
     */
    protected long store(SimpleRegInfo regInfo) throws Exception {
        long userId = this.storeWithoutCoder(regInfo);
        Coder coder = (Coder) createEJB(getInitialContext(), Coder.class);
        Rating rating = (Rating) createEJB(getInitialContext(), Rating.class);

//        PrincipalMgrRemote mgr = getPrincipalManager();

        //create coder
        if (!coder.exists(userId, transDb)) { // check if the user exists in registration database already as a coder
            coder.createCoder(userId, transDb);
            rating.createRating(userId, transDb);
        }
        coder.setEditorId(userId, DEFAULT_EDITOR, transDb);
        coder.setLanguageId(userId, DEFAULT_LANGUAGE, transDb);

        return userId;

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
