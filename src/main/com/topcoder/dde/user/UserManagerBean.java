package com.topcoder.dde.user;

import java.io.*;
import java.rmi.RemoteException;
import java.sql.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.rmi.PortableRemoteObject;
import javax.sql.*;
import java.util.*;
import javax.ejb.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.xml.transform.*;
import javax.xml.transform.stream.*;

import com.topcoder.apps.review.projecttracker.ProjectTracker;
import com.topcoder.apps.review.projecttracker.ProjectTrackerHome;
import com.topcoder.dde.DDEException;
import com.topcoder.dde.catalog.ComponentVersionInfo;
import com.topcoder.dde.persistencelayer.interfaces.*;
import com.topcoder.file.render.ValueTag;
import com.topcoder.file.render.XMLDocument;
import com.topcoder.message.email.EmailEngine;
import com.topcoder.message.email.TCSEmailMessage;
import com.topcoder.security.*;
import com.topcoder.security.admin.*;
import com.topcoder.security.login.*;
import com.topcoder.util.TCException;
import com.topcoder.util.config.*;

import com.topcoder.util.idgenerator.bean.*;
import com.topcoder.util.idgenerator.sql.SimpleDB;


import org.apache.log4j.Logger;

/**
 * Use this beans to register users, add customer information to an existing
 * user, update users, and remove users.  As part of the DDE component,
 * this interacts with the persistance layer to update user information
 * in the database and with the Security Manager to create users.
 *
 * @author Heather Van Aelst
 * @version 1.0
 */
public class UserManagerBean implements SessionBean, ConfigManagerInterface {
    private SessionContext ejbContext;

    private static final String PROPERTIES_NAMESPACE="com.topcoder.dde.user.UserManagerBean";
    private static final String PROPERTIES_FORMAT=ConfigManager.CONFIG_PROPERTIES_FORMAT;
    private static final String EMAILENGINE_PROPERTIES_NAMESPACE="com.topcoder.message.email.EmailEngine";
    private static final String EMAILENGINE_PROPERTIES_FORMAT=ConfigManager.CONFIG_XML_FORMAT;
    private static final Logger logger = Logger.getLogger(UserManagerBean.class);

    /*
     * This group (which all new users are put into) is assumed to be in the
     * database.  If it's not there, an exception will be thrown.
     */
    private static final String groupName = "Users";
    private static final long groupId = 2;

    public void ejbCreate(){}
    public void ejbRemove(){}
    public void ejbActivate(){}
    public void ejbPassivate(){}
    public void setSessionContext(javax.ejb.SessionContext cntx) {
        this.ejbContext = cntx;
    }

    /**
     * Register a user.  Creates basic information about a user in
     * the database through the persistence layer.  Creates a user
     * using the Security Manager and adds that user to the 'Users' group.
     * Sets this user's status to PENDINGACTIVATION
     * and sends the new user an email with an activation code that can be
     * used to activate the user.
     *
     * @param info A RegistrationInfo object contain basic user information
     * @return True if registration is successful, false otherwise
     */
    public User register(RegistrationInfo info) throws DDEException, DuplicateUsernameException, InvalidRegistrationException,
            EJBException {
        return register(info, true);
    }

    /**
     * Register a user.  Creates basic information about a user in
     * the database through the persistence layer.  Creates a user
     * using the Security Manager and adds that user to the 'Users' group.
     * Sets this user's status to PENDINGACTIVATION
     * and sends the new user an email with an activation code that can be
     * used to activate the user.
     *
     * @param info A RegistrationInfo object contain basic user information
     * @return True if registration is successful, false otherwise
     */
    public User register(RegistrationInfo info, boolean sendActivationCode)
        throws DDEException, DuplicateUsernameException,
               InvalidRegistrationException, EJBException {

        logger.debug("UserManagerBean.register");

        if (info == null) {
            throw new InvalidRegistrationException("Can not register null RegistrationInfo");
        }

        //check that info is complete and valid
        if (!info.isValid()) {
            throw new InvalidRegistrationException();
        }

        Timestamp lastLoginTime = new Timestamp(System.currentTimeMillis());
        int numLogins = 0;

        try {
            Context context = new InitialContext();
    /*
            Hashtable principalMgrEnvironment=new Hashtable();
            principalMgrEnvironment.put(Context.INITIAL_CONTEXT_FACTORY, "org.jnp.interfaces.NamingContextFactory");
            //Object url = contexts.getObject(key);
            principalMgrEnvironment.put(Context.PROVIDER_URL, getProperty("securitymanagerip"));
            Context principalContext  = new InitialContext(principalMgrEnvironment);
      */

            PrincipalMgrRemoteHome principalMgrHome = (PrincipalMgrRemoteHome) context.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            PrincipalMgrRemote principalMgr = principalMgrHome.create();


            TCSubject tcs = new TCSubject(0);

            //make sure username isn't taken
            try {
                UserPrincipal up = principalMgr.getUser(info.getUsername());
                if (up != null) {
                    throw new DuplicateUsernameException(info.getUsername() + " already exists");
                }
            } catch (com.topcoder.security.NoSuchUserException ignore) {}
            String activationCode = generateActivationCode();

            UserPrincipal up = principalMgr.createUser(info.getUsername(), info.getPassword(), tcs);
            //GroupPrincipal gp = new GroupPrincipal(groupName, groupId);
            //principalMgr.addUserToGroup(gp, up, tcs);

            Collection groups = principalMgr.getGroups(tcs);
            GroupPrincipal anonGroup = null;
            GroupPrincipal userGroup = null;
            for (Iterator iterator = groups.iterator(); iterator.hasNext();) {
                anonGroup = (GroupPrincipal) iterator.next();
                if (anonGroup.getName().equals("Anonymous")) {
                    break;
                }
            }
            for (Iterator iterator = groups.iterator(); iterator.hasNext();) {
                userGroup = (GroupPrincipal) iterator.next();
                if (userGroup.getName().equals("Users")) {
                    break;
                }
            }
            principalMgr.addUserToGroup(anonGroup, up, tcs);
            principalMgr.addUserToGroup(userGroup, up, tcs);


            long userId = up.getId();
            logger.debug("up: " + up);
            LocalDDEUserMasterHome userMasterHome = (LocalDDEUserMasterHome) context.lookup(LocalDDEUserMasterHome.EJB_REF_NAME);
            LocalDDEUserMaster userMaster = userMasterHome.create(userId, lastLoginTime, numLogins);
            logger.debug("userMaster");

            LocalDDECountryCodesHome countryCodesHome = (LocalDDECountryCodesHome) context.lookup(LocalDDECountryCodesHome.EJB_REF_NAME);
            logger.debug("countries2");
            LocalDDECountryCodes countryCodes = countryCodesHome.findByPrimaryKey(new Long(info.getCountryCode()));
            logger.debug("countries");
            //logger.debug("countryCodes");
            //LocalDDECompanySizeHome companySizeHome = (LocalDDECompanySizeHome) context.lookup(LocalDDECompanySizeHome.EJB_REF_NAME);
            //LocalDDECompanySize companySize = companySizeHome.findByPrimaryKey(new Long(info.getCompanySize()));
            //logger.debug("companySize");
            //LocalDDEPriceTiersHome priceTiersHome = (LocalDDEPriceTiersHome) context.lookup(LocalDDEPriceTiersHome.EJB_REF_NAME);
            //LocalDDEPriceTiers priceTiers = priceTiersHome.findByPrimaryKey(new Long(info.getPricingTier().getId()));
            //logger.debug("priceTiers");
            //logger.debug(info.getPhoneArea());


/*
            LocalDDEUserCustomerHome userCustomerHome = (LocalDDEUserCustomerHome) context.lookup(LocalDDEUserCustomerHome.EJB_REF_NAME);
            userCustomerHome.create(info.getFirstName(), info.getLastName(), info.getCompany(),
                                                                        info.getAddress(), info.getCity(), info.getPostalcode(),
                                                                        info.getPhoneCountry(), info.getPhoneArea(),
                                                                        info.getPhoneNumber(), info.getUseComponents(),
                                                                        info.getUseConsultants(), info.getReceiveNews(),
                                                                        info.getNewsInHtml(), activationCode, info.getEmail(), userMaster, countryCodes,
                                                                        companySize, priceTiers);
                                                                        */
        Connection conn = null;
        PreparedStatement ps  = null;
        PreparedStatement ps1  = null;
        PreparedStatement ps2  = null;
        PreparedStatement ps3  = null;
        PreparedStatement ps4  = null;
        PreparedStatement ps5  = null;
        PreparedStatement ps6  = null;
        try {
logger.debug("get ds");
            DataSource datasource = (DataSource) context.lookup("java:comp/env/jdbc/DefaultDS");
logger.debug("got ds");
            conn = datasource.getConnection();
            logger.debug("id gen");
            //LocalIdGenHome localIdGenHome=(LocalIdGenHome) context.lookup("local/LocalIdGenEJB");
            logger.debug("id gen a");
            //LocalIdGen localIdGen=localIdGenHome.create();

            IdGenHome idGenHome=(IdGenHome) context.lookup("idgenerator/IdGenEJB");
            IdGen localIdGen=idGenHome.create();
            /*
            if (!IdGenerator.isInitialized()) {
                IdGenerator.init(
                        new SimpleDB(),
                        datasource,
                        "sequence_object",
                        "name",
                        "current_value",
                        9999999999L,
                        1,
                        false
                );
            }
            */
            logger.debug("user");
            String query = " INSERT INTO  common_oltp:user (user_id,handle,status, first_name, last_name, activation_code)" +
                           " VALUES (?,?,?,?,?,?)";
            ps = conn.prepareStatement(query);
            ps.setLong(1, userId);
            ps.setString(2, info.getUsername());
            ps.setString(3, "U");
            ps.setString(4, info.getFirstName());
            ps.setString(5, info.getLastName());
            ps.setString(6, activationCode);
            ps.execute();

            logger.debug("user done");

            long emailId =  localIdGen.nextId("EMAIL_SEQ");

            logger.debug("getting email id HERE 2");
            String emailQuery = " INSERT INTO  common_oltp:email (email_id, user_id, address, primary_ind, email_type_id)" +
                           " VALUES (?,?,?,?,?)";
            ps1 = conn.prepareStatement(emailQuery);
            ps1.setLong(1, emailId);
            ps1.setLong(2, userId);
            ps1.setString(3, info.getEmail());
            ps1.setLong(4, 1L);
            ps1.setLong(5, 1L);
            ps1.execute();
            logger.debug("email done");


            long addressId = localIdGen.nextId("ADDRESS_SEQ");
            String addressQuery = " INSERT INTO common_oltp:address (address_id, address_type_id, address1, address2, city, state_code, zip, country_code)" +
                           " VALUES (?,?, ?,?, ?, ?,?,?)";
            ps2 = conn.prepareStatement(addressQuery);
            ps2.setLong(1, addressId);
            ps2.setLong(2, 1L);
            ps2.setString(3, info.getAddress());
            ps2.setString(4, info.getAddress2());
            ps2.setString(5, info.getCity());
            ps2.setString(6, info.getState());
            ps2.setString(7, info.getPostalcode());
            ps2.setLong(8, info.getCountryCode());

            ps2.execute();
            logger.debug("address done");

            String addressXref = "INSERT INTO common_oltp:user_address_xref (user_id, address_id) VALUES (?,?)";
            ps3 = conn.prepareStatement(addressXref);
            ps3.setLong(1, userId);
            ps3.setLong(2, addressId);
            ps3.execute();
            logger.debug("address xref done");

            long phoneId = localIdGen.nextId("PHONE_SEQ");
            String phoneQuery = "INSERT INTO common_oltp:phone (user_id, phone_id, phone_number, primary_ind) VALUES(?,?,?,1)";
            ps4 = conn.prepareStatement(phoneQuery);
            ps4.setLong(1, userId);
            ps4.setLong(2, phoneId);
            ps4.setString(3, info.getPhoneCountry()+ info.getPhoneArea() +info.getPhoneNumber());
            ps4.execute();
            logger.debug("phone done");



            long companyId = localIdGen.nextId("COMPANY_SEQ");
            ps5 = conn.prepareStatement("INSERT INTO common_oltp:company (company_id, primary_contact_id, company_name) " +
                    "VALUES (?,?,?)");
            ps5.setLong(1, companyId);
            ps5.setLong(2, userId);
            ps5.setString(3, info.getCompany());
            ps5.execute();
            logger.debug("company done");

            ps6 = conn.prepareStatement("INSERT INTO common_oltp:contact (company_id, contact_id) " +
                    "VALUES (?,?)");
            ps6.setLong(1, companyId);
            ps6.setLong(2, userId);
            ps6.execute();


            conn.close();
            logger.debug("close done");

        } catch (SQLException sqle) {
            throw new DDEException("" + sqle);
        } catch (IdGenException sqle) {
            throw new DDEException("could not generate id" + sqle);
        } catch (NamingException e) {
            throw new EJBException("" + e);
        } finally {
            if (ps != null) try { ps.close(); } catch(SQLException sqle) {} finally { ps = null; }
            if (ps1 != null) try { ps1.close(); } catch(SQLException sqle) {} finally { ps1 = null; }
            if (ps2 != null) try { ps2.close(); } catch(SQLException sqle) {} finally { ps2 = null; }
            if (ps3 != null) try { ps3.close(); } catch(SQLException sqle) {} finally { ps3 = null; }
            if (ps4 != null) try { ps4.close(); } catch(SQLException sqle) {} finally { ps4 = null; }
            if (ps5 != null) try { ps5.close(); } catch(SQLException sqle) {} finally { ps5 = null; }
            if (ps6 != null) try { ps6.close(); } catch(SQLException sqle) {} finally { ps6 = null; }
            if (conn != null) try { conn.close(); } catch(SQLException sqle) {} finally { conn = null; }
        }

            //LocalDDEUserTechnologiesHome userTechnologiesHome = (LocalDDEUserTechnologiesHome) context.lookup(LocalDDEUserTechnologiesHome.EJB_REF_NAME);
            //LocalDDETechnologyTypesHome technologyTypesHome = (LocalDDETechnologyTypesHome) context.lookup(LocalDDETechnologyTypesHome.EJB_REF_NAME);

            //Collection technologies = info.getTechnologies();
            //Iterator iterator = technologies.iterator();
            /*
            while (iterator.hasNext()) {
                UserTechnology tech = (UserTechnology) iterator.next();
                LocalDDETechnologyTypes technologyTypes = technologyTypesHome.findByPrimaryKey(new Long(tech.getTechnologyId()));
                LocalDDEUserTechnologies userTechnologies = userTechnologiesHome.create(tech.getRating(), tech.getMonths(),
                                                                                        userMaster, technologyTypes);
                userTechnologiesHome.findByPrimaryKey((Long) userTechnologies.getPrimaryKey());
            }*/


            //logger.debug("UserTechnologies");
            User user = new User(userId);

            user.setLastLogonTime(lastLoginTime);
            user.setNumLogins(numLogins);
            user.setStatus(UserStatus.PENDINGACTIVATION);
            user.setRegInfo(info);
            //logger.debug("user updates");

            if (sendActivationCode) {
                sendActivationEmail(info.getEmail(), activationCode);
            }

            return user;
        } catch (RemoteException e) {
            throw new EJBException("" + e);
        } catch (NamingException e) {
            throw new EJBException("" + e);
        } catch (FinderException e) {
            throw new DDEException("" + e);
        } catch (CreateException e) {
            throw new DDEException("" + e);
        } catch (GeneralSecurityException e) {
            throw new DDEException("" + e);
        }
    }


    /**
     * Activate a user.  Looks up the user associated with the given
     * activation code and changes that user's status to ACTIVE.
     *
     * @param activationCode
     * @return the user
     */
    public User activate(String activationCode)
        throws DDEException, NoSuchUserException, EJBException {

        final String sqlSelect = "select c.*" +
                                  " from user_customer c" +
                                 " where c.activation_code = ?";

        final String sqlUpdate = "update common_oltp:user " +
                                   " set status = 'A'" +
                                 " where user_id = ?";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        long loginId = 0;
        try {
            Context context = new InitialContext();
            DataSource datasource = (DataSource) context.lookup("java:comp/env/jdbc/DefaultDS");
            context.close();

            conn = datasource.getConnection();

            ps = conn.prepareStatement(sqlSelect);
            ps.setString(1, activationCode);
            rs = ps.executeQuery();
            if (!rs.next()) {
                throw new NoSuchUserException("No user exists with activationCode: " + activationCode);
            }
            loginId = rs.getLong("login_id");
            rs.close();
            ps.close();

            ps = conn.prepareStatement(sqlUpdate);
            ps.setLong(1, loginId);
            ps.execute();
            ps.close();

            return getUser(loginId);
        } catch (SQLException sqle) {
            throw new DDEException("" + sqle);
        } catch (NamingException e) {
            throw new EJBException("" + e);
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException sqle) {} finally { rs = null; }
            if (ps != null) try { ps.close(); } catch(SQLException sqle) {} finally { ps = null; }
            if (conn != null) try { conn.close(); } catch(SQLException sqle) {} finally { conn = null; }
        }
    }

    /**
     * Updates a user's information.  This information is updated in the
     * database through the persistance layer.
     *
     * @param user The user to update.  Any and every User field other than id
     *             may be different.  Looks at user.id and makes sure that every
     *             other field is up to date.
     */
    public void updateUser(User user) throws DDEException, NoSuchUserException,
                                             EJBException, InvalidRegistrationException {
            throw new DDEException("method is not implemented");
    }

    /**
     * Remove this user.  For the DDE component this means setting this
     * user's status to 'deleted'.  The user (and other connected data, i.e.
     * forum posts) remains in the database.  Does not call the Security Manger's
     * removeUser methods.
     *
     * @param user The user to remove
     */
    public void removeUser(User user) throws DDEException, NoSuchUserException,
                                             EJBException {
        throw new DDEException("Method not implemented");
    }

    /**
     * Remove this user.  For the DDE component this means setting this
     * user's status to 'deleted'.  The user (and other connected data, i.e.
     * forum posts) remains in the database.  Does not call the Security Manger's
     * removeUser methods.
     *
     * @param username The username of the user to be removed.
     */
    public void removeUser(String username)
        throws DDEException, NoSuchUserException, EJBException  {
        throw new DDEException("Method not implemented");
    }

    /**
     * Get the User object representing the user with this username.  Use
     * the persistance layer to get this user's current information from the
     * database and create a User object from this data.
     *
     * @param username The username of the user to return.
     * @return A User object
     */
    public User getUser(String username) throws DDEException, NoSuchUserException,
                                                EJBException {

        if (username==null) {
            throw new NoSuchUserException("There can not be any user's with null usernames");
        }
        try {
            Context context = new InitialContext();
            PrincipalMgrRemoteHome principalMgrHome = (PrincipalMgrRemoteHome) context.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            PrincipalMgrRemote principalMgr = principalMgrHome.create();
            context.close();

            UserPrincipal up = principalMgr.getUser(username);
            return getUser(up.getId());
        } catch (com.topcoder.security.NoSuchUserException e) {
            throw new NoSuchUserException("" + e);
        } catch (GeneralSecurityException e) {
            throw new DDEException("" + e);
        } catch (RemoteException e) {
            throw new EJBException("" + e);
        } catch (NamingException e) {
            throw new EJBException("" + e);
        } catch (CreateException e) {
            throw new DDEException("" + e);
        }
    }

    /**
     * Get the User object representing the user with this userId.  Use
     * the persistance layer to get this user's current information from the
     * database and create a User object from this data.
     *
     * @param userId The userId of the user to return.
     * @return A User object
     */
    public User getUser(long userId) throws DDEException, NoSuchUserException,
                                            EJBException {
        User user = new User(userId);
        logger.debug("getting user: " + userId);
        RegistrationInfo ri = new RegistrationInfo();
        //when user_customer CMP is done, fill in ri

        try {
            Context context = new InitialContext();
            LocalDDEUserMasterHome userMasterHome = (LocalDDEUserMasterHome) context.lookup(LocalDDEUserMasterHome.EJB_REF_NAME);
            LocalDDEUserMaster userMaster = userMasterHome.findByPrimaryKey(new Long(userId));
            //logger.debug("userMaster");
            LocalDDEUserCustomerHome userCustomerHome = (LocalDDEUserCustomerHome) context.lookup(LocalDDEUserCustomerHome.EJB_REF_NAME);
            LocalDDEUserCustomer userCustomer = userCustomerHome.findByLoginId(userId);
            //logger.debug("userCustomer");
            /*
            Hashtable principalMgrEnvironment=new Hashtable();
            principalMgrEnvironment.put(Context.INITIAL_CONTEXT_FACTORY, "org.jnp.interfaces.NamingContextFactory");
            //Object url = contexts.getObject(key);
            principalMgrEnvironment.put(Context.PROVIDER_URL, getProperty("securitymanagerip"));
            Context principalContext  = new InitialContext(principalMgrEnvironment);
            */
            PrincipalMgrRemoteHome principalMgrHome = (PrincipalMgrRemoteHome) context.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            PrincipalMgrRemote principalMgr = principalMgrHome.create();
            //logger.debug("principalMgr");
            //LocalDDEUserTechnologiesHome userTechnologiesHome = (LocalDDEUserTechnologiesHome) context.lookup(LocalDDEUserTechnologiesHome.EJB_REF_NAME);
            context.close();
            //logger.debug("userTechHome");
            /* This shouldn't be a made up TCSubject, but should really be the TCSubject
             * of the logged in user
             */
            //TCSubject requestor = null;
            UserPrincipal up = principalMgr.getUser(userId);
            //logger.debug("up");
            ri.setUsername(up.getName());
            ri.setPassword(principalMgr.getPassword(userId));
            //logger.debug("email: " + userCustomer.getEmailAddress());
            ri.setEmail(userCustomer.getEmailAddress());
            ri.setFirstName(userCustomer.getFirstName());
            ri.setLastName(userCustomer.getLastName());
            ri.setCompany(userCustomer.getCompany());
            ri.setAddress(userCustomer.getAddress());
            ri.setCity(userCustomer.getCity());
            ri.setPostalcode(userCustomer.getPostalCode());
            ri.setPhoneCountry(userCustomer.getTelephoneCountry());
            ri.setPhoneArea(userCustomer.getTelephoneArea());
            ri.setPhoneNumber(userCustomer.getTelephoneNbr());
            ri.setUseComponents(userCustomer.getUseComponents());
            ri.setUseConsultants(userCustomer.getUseConsultants());


            ri.setReceiveNews(userCustomer.getReceiveTcsnews());
            ri.setNewsInHtml(userCustomer.getReceiveNewshtml());
            //logger.debug("newsInHtml: " + userCustomer.getReceiveNewshtml());
            LocalDDECompanySize companySize = userCustomer.getCompanySize();
            //logger.debug("companySize: " + companySize);
            ri.setCompanySize(((Long) companySize.getPrimaryKey()).longValue());
            //logger.debug("setCompanySize");
            LocalDDEPriceTiers priceTiers = userCustomer.getPriceTiers();
            PricingTier pricingTier = new PricingTier(((Long) priceTiers.getPrimaryKey()).longValue(),
                                                      priceTiers.getDiscountPercent());
            ri.setPricingTier(pricingTier);

            LocalDDECountryCodes countryCode = userCustomer.getCountryCodes();
            ri.setCountryCode(((Long) countryCode.getPrimaryKey()).longValue());

            //logger.debug("pricingTier");
            //Collection c = userTechnologiesHome.findByLoginId(userId);
            //Vector v = new Vector();
            //Iterator iterator = c.iterator();
            //logger.debug("c.iterator");
            /*
            while (iterator.hasNext()) {
                LocalDDEUserTechnologies userTechnologies = (LocalDDEUserTechnologies) iterator.next();
                //logger.debug("userTechnologies");
                LocalDDETechnologyTypes technologyTypes = userTechnologies.getTechnologyTypes();
                //logger.debug("technologyTypes");
                v.add(new UserTechnology(((Long) technologyTypes.getPrimaryKey()).longValue(),
                                         userTechnologies.getRating(), userTechnologies.getMonths()));
                //logger.debug("v.add");
            }
            ri.setTechnologies(v);
            */
            //logger.debug("ri.setTech");

            user.setNumLogins(userMaster.getNumLogins());
            user.setLastLogonTime(userMaster.getLastLoginTime());
            user.setRegInfo(ri);
        } catch (ObjectNotFoundException e) {
            throw new NoSuchUserException("" + userId);
        } catch (com.topcoder.security.NoSuchUserException e) {
            throw new NoSuchUserException("" + e);
        } catch (RemoteException e) {
            throw new EJBException("" + e);
        } catch (NamingException e) {
            throw new EJBException("" + e);
        } catch (FinderException e) {
            throw new DDEException("" + e);
        } catch (CreateException e) {
            throw new DDEException("" + e);
        } catch (GeneralSecurityException e) {
            throw new DDEException("" + e);
        }

        return user;
    }

    /**
     * Get a collection of all PricingTiers
     *
     * @return a Collection of PricingTier objects
     */
    public Collection getPricingTiers() throws DDEException, EJBException {

        logger.debug("UserManager.getPricingTiers");
        Vector v = new Vector();
        try {
            Context context = new InitialContext();
            LocalDDEPriceTiersHome priceTiersHome = (LocalDDEPriceTiersHome) context.lookup(LocalDDEPriceTiersHome.EJB_REF_NAME);
            Collection c = priceTiersHome.findAll();

            Iterator i = c.iterator();
            while (i.hasNext()) {
                LocalDDEPriceTiers priceTiers = (LocalDDEPriceTiers) i.next();
                long id = ((Long) priceTiers.getPrimaryKey()).longValue();
                double discount = priceTiers.getDiscountPercent();
                PricingTier pt = new PricingTier(id, discount);
                logger.debug("new PricingTier");
                v.add(pt);
            }

            context.close();
            return v;
        } catch (NamingException e) {
            throw new EJBException("" + e);
        } catch (FinderException e) {
            throw new DDEException("" + e);
        }
    }

    /**
     * Login in a user by calling Security Manager's login method.  Also
     * updates the user's number of logins and last login time.
     *
     * @param username
     * @param password
     * @return a TCSubject object
     */
    public TCSubject login(String username, String password)
        throws AuthenticationException, DDEException, EJBException {

        logger.debug("test");
        if (username==null || password==null) {
            throw new AuthenticationException("Users with null username or password can not exist and therefor can not be logged in");
        }
        try {

            Context context  = new InitialContext();

            LoginRemoteHome loginHome = (LoginRemoteHome) context.lookup(LoginRemoteHome.EJB_REF_NAME);
            LoginRemote login = loginHome.create();
            logger.debug("gettinguser");
            TCSubject user = login.login(username, password);

            long userId = user.getUserId();
            logger.debug("got user" + userId);
            LocalDDEUserMasterHome userMasterHome = (LocalDDEUserMasterHome) context.lookup(LocalDDEUserMasterHome.EJB_REF_NAME);
            logger.debug("got master" );
            LocalDDEUserMaster userMaster = null;
            try{
               userMaster = userMasterHome.findByPrimaryKey(new Long(userId));
            }
            catch(ObjectNotFoundException onfe)
            {
                Timestamp lastLoginTime = new Timestamp(System.currentTimeMillis());
                userMaster = userMasterHome.create(userId, lastLoginTime, 1);
            }
            logger.debug("got master i");

            String sqlSelect = "select u.status" +
                                      " from common_oltp:user u" +
                                     " where u.user_id = ?";


            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            String statusId = "";
            try {

                DataSource datasource = (DataSource) context.lookup("java:comp/env/jdbc/DefaultDS");


                conn = datasource.getConnection();

                ps = conn.prepareStatement(sqlSelect);
                ps.setLong(1, userId);
                rs = ps.executeQuery();
                if (!rs.next()) {
                    throw new NoSuchUserException("No user exists with this id: " + userId);
                }
                statusId = rs.getString("status");
                rs.close();
                ps.close();

                ps.close();


            } catch (SQLException sqle) {
                throw new DDEException("" + sqle);
            } catch (NamingException e) {
                throw new EJBException("" + e);
            } finally {
                if (rs != null) try { rs.close(); } catch(SQLException sqle) {} finally { rs = null; }
                if (ps != null) try { ps.close(); } catch(SQLException sqle) {} finally { ps = null; }
                if (conn != null) try { conn.close(); } catch(SQLException sqle) {} finally { conn = null; }
            }





            logger.debug("Status for user " + userId + " is " + statusId);
            if (statusId.equals("U")) {
                throw new UserNotActivatedException("Need to activate a user before it can log in");
            } else if (!statusId.equals("A")) {
                throw new AuthenticationException("Can not login an inactive user");
            } else {
                userMaster.setNumLogins(userMaster.getNumLogins() + 1);
                userMaster.setLastLoginTime(new Timestamp(new Date().getTime()));
            }
            return user;
        } catch (AuthenticationException e) {
            logger.error(e);
            throw e;
        } catch (GeneralSecurityException e) {
            logger.error(e);
            throw new DDEException("" + e);
        } catch (RemoteException e) {
            logger.error(e);
            throw new EJBException("" + e);

        } catch (NamingException e) {
            logger.error(e);
            throw new EJBException("" + e);
        } catch (FinderException e) {
            logger.error(e);
            throw new DDEException("" + e);
        } catch (CreateException e) {
            logger.error(e);
            throw new DDEException("" + e);
        }

    }





    /**
     * Part of <code>ConfigManagerInterface</code>
     *
     * @return current namespace
     */
    public String getNamespace(){
        return PROPERTIES_NAMESPACE;
    }

    /**
     * art of <code>ConfigManagerInterface</code>
     *
     * @return all known property keys in this namespace
     */
    public Enumeration getConfigPropNames()
    {
        Vector propNames=new Vector();
        propNames.add("from");
        propNames.add("subject");
        propNames.add("url");
        propNames.add("message");
        propNames.add("passwordsubject");
        propNames.add("passwordmessage");
        return propNames.elements();
    }
    /**
     * Generate a pseudo random activation code.  This code is a 32 character
     * string that consists of a randomly generated alpha numeric string
     * (a-z, A-Z, 1-9), a '0', and then the current time in milliseconds.
     *
     * @return An activation code as a String of digits and letters.
     */
    private String generateActivationCode() {
        String s = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ123456789";
        int sLength = s.length();
        int rLength = 32;
        Date date = new Date();
        String dateString = "0" + date.getTime();
        int dLength = dateString.length();
        Random random = new Random();
        String activationCode = "";
        for (int i = dLength; i < rLength; i++) {
            activationCode += s.charAt(random.nextInt(sLength));
        }
        activationCode += dateString;
        return activationCode;
    }

    /**
     * Send an email to the newly created user that contains an activation
     * code that can be used to activate their account.
     *
     * @param email
     * @param activationCode
     */
    private void sendActivationEmail(String email, String activationCode)
        throws DDEException {

        logger.debug("sendActivationEmail to: " + email);
        String from = getProperty("from");
        String subject = getProperty("subject");
        String body = generateMessage(activationCode);

        TCSEmailMessage msg = new TCSEmailMessage();
        try {
            msg.setFromAddress(from);
            msg.setSubject(subject);
            msg.setToAddress(email, TCSEmailMessage.TO);
            msg.setBody(body);
            EmailEngine.send(msg);
            logger.debug("sent msg");
        } catch (Exception e) { //those methods throw plain java.lang.Exceptions
            throw new DDEException("" + e);
        }
    }

    /**
     * Uses the document generator to generate the body of the ActivationEmail.
     *
     * @param activationCode
     */
    private String generateMessage(String activationCode)
        throws DDEException {

        String path = getProperty("message");
        logger.debug(path);
        String url = getProperty("url") + activationCode;
        XMLDocument xmldoc = new XMLDocument("activationEmail");
        ValueTag tag = new ValueTag("url", url);
        xmldoc.addTag(tag);
        String xml = xmldoc.getXML();
        Source xmlSource = new StreamSource(new StringReader(xml));
        Source xslSource = new StreamSource(new File(path));
        StringWriter msg = new StringWriter();

        try {
            TransformerFactory tFactory = TransformerFactory.newInstance();
            Transformer transformer = tFactory.newTransformer(xslSource);
            transformer.transform(xmlSource, new StreamResult(msg));
            return msg.toString();
        } catch (TransformerException e) {
            throw new DDEException("" + e);
        }
    }

    /**
     * Send an email to a user with thier username and password
     *
     * @param username
     */
    public void sendPasswordEmail(String username)
        throws DDEException, NoSuchUserException {

        TCSEmailMessage msg = new TCSEmailMessage();
        try {
            logger.debug("sendPasswordEmail to: " + username);

            User user = getUser(username);
            RegistrationInfo info = user.getRegInfo();

            XMLDocument xmldoc = new XMLDocument("passwordEmail");
            ValueTag tagName = new ValueTag("firstname", info.getFirstName());
            ValueTag tagUsername = new ValueTag("username", username);
            ValueTag tagPassword = new ValueTag("password", info.getPassword());
            xmldoc.addTag(tagName);
            xmldoc.addTag(tagUsername);
            xmldoc.addTag(tagPassword);

            Source xmlSource = new StreamSource(new StringReader(xmldoc.getXML()));
            Source xslSource = new StreamSource(new File(getProperty("passwordmessage")));
            StringWriter body = new StringWriter();
            TransformerFactory tFactory = TransformerFactory.newInstance();
            Transformer transformer = tFactory.newTransformer(xslSource);
            transformer.transform(xmlSource, new StreamResult(body));

            msg.setFromAddress(getProperty("from"));
            msg.setSubject(getProperty("passwordsubject"));
            msg.setToAddress(info.getEmail(), TCSEmailMessage.TO);
            msg.setBody(body.toString());
            EmailEngine.send(msg);
            logger.debug("sent msg");

        } catch (NoSuchUserException nsue) {
            nsue.fillInStackTrace();
            throw nsue;

        } catch (Exception e) { //those methods throw plain java.lang.Exceptions
            throw new DDEException("" + e);
        }
    }


    private ConfigManager getConfigManager() throws ConfigManagerException {
        ConfigManager cm = ConfigManager.getInstance();
        try {
            if (cm.existsNamespace(PROPERTIES_NAMESPACE)) {
            } else {
                cm.add(PROPERTIES_NAMESPACE, PROPERTIES_FORMAT);
            }
            if (cm.existsNamespace(EMAILENGINE_PROPERTIES_NAMESPACE)) {
            } else {
                cm.add(EMAILENGINE_PROPERTIES_NAMESPACE, EMAILENGINE_PROPERTIES_FORMAT);
            }
        } catch (ConfigManagerException e) {
            e.fillInStackTrace();
            throw e;
        }
        return cm;
    }

    private String getProperty(String property) throws DDEException {

        try {
            ConfigManager cm = getConfigManager();
            String prop = (String)
            cm.getProperty(PROPERTIES_NAMESPACE, property);
            return prop;
        } catch (ConfigManagerException e) {
            throw new DDEException("" + e);
        }
    }


    public void registerInquiry(long userId, long componentId, long rating, long tcUserId,
                                String comments, boolean agreeToTerms, long phase, long version, long projectId)
        throws RemoteException, DDEException, NoSuchUserException,
                EJBException {
        try{
            Context context = new InitialContext();
            LocalDDEComponentInquiryHome componentInquiryHome = (LocalDDEComponentInquiryHome) context.lookup(LocalDDEComponentInquiryHome.EJB_REF_NAME);
            logger.debug("AgreeToTerms: " + agreeToTerms);
            componentInquiryHome.create(componentId, userId, rating, comments, agreeToTerms, phase, tcUserId, version, projectId);


            Context homeBindings = new InitialContext();
            ProjectTrackerHome ptHome = (ProjectTrackerHome) PortableRemoteObject.narrow(
                    homeBindings.lookup(ProjectTrackerHome.EJB_REF_NAME),
                    ProjectTrackerHome.class);
            ProjectTracker pt = ptHome.create();
            logger.debug("ProjectTracker created");

            pt.userInquiry(userId, projectId);
            logger.debug("ProjectTracker.userInquiry called");
        }
        catch(CreateException ce){
            ejbContext.setRollbackOnly();
            throw new DDEException("Could not create Component Inquiry: " + ce.getMessage());
        }
        catch(NamingException ne){
            ejbContext.setRollbackOnly();
            throw new DDEException("Could not create context: " + ne.getMessage());
        } catch (TCException e) {
            ejbContext.setRollbackOnly();
            throw new DDEException("Could create online review user inquiry!" +
                    e.getMessage());
        }

    }


/*
    public long getRatingForInquiry(long userId, long version, long componentId)
        throws RemoteException, DDEException, NoSuchUserException,
                EJBException {
        long rating = 0;
        final String sqlSelect = "select max(rating) rating" +
                                  " from component_inquiry" +
                                 " where user_id = ?" +
                                 "   and version = ?" +
                                 "   and component_id = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try{
            Context context = new InitialContext();
            DataSource datasource = (DataSource) context.lookup("java:comp/env/jdbc/DefaultDS");
            context.close();

            conn = datasource.getConnection();

            ps = conn.prepareStatement(sqlSelect);
            ps.setLong(1, userId);
            ps.setLong(2, version);
            ps.setLong(3, componentId);
            rs = ps.executeQuery();

            if (!rs.next()) {
                throw new NoSuchUserException("No user is registered: " + userId);
            }
            rating = rs.getLong("rating");
            rs.close();
            ps.close();

        } catch (SQLException sqle) {
            throw new DDEException("" + sqle);
        } catch (NamingException ne) {
            throw new DDEException("Could not create context: " + ne.getMessage());
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException sqle) {} finally { rs = null; }
            if (ps != null) try { ps.close(); } catch(SQLException sqle) {} finally { ps = null; }
            if (conn != null) try { conn.close(); } catch(SQLException sqle) {} finally { conn = null; }
        }
        return rating;
    }
*/


    public boolean sampleInquiry(String firstName, String lastName,
                          String emailAddress, String catalog, int countryId, int contactMe)
        throws RemoteException, EJBException{

            boolean success = true;
            try{
                Context context = new InitialContext();
                LocalDDESampleDownloadHome sampleDownloadHome = (LocalDDESampleDownloadHome) context.lookup(LocalDDESampleDownloadHome.EJB_REF_NAME);
                LocalDDESampleDownload sampleDownload = sampleDownloadHome.create(catalog, firstName, lastName, emailAddress, countryId, contactMe);
            }
            catch(CreateException ce){
                success = false;
                logger.error("sample Inquiry:" + ce);
            }
            catch(NamingException ne){
                success = false;
                logger.error("sample Inquiry:" + ne);
            }
            return success;

    }

}

