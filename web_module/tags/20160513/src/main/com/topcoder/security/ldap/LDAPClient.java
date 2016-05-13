/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.ldap;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.net.ldap.sdkinterface.Entry;
import com.topcoder.util.net.ldap.sdkinterface.LDAPSDK;
import com.topcoder.util.net.ldap.sdkinterface.LDAPSDKAccessDeniedException;
import com.topcoder.util.net.ldap.sdkinterface.LDAPSDKConnection;
import com.topcoder.util.net.ldap.sdkinterface.LDAPSDKNoSuchObjectException;
import com.topcoder.util.net.ldap.sdkinterface.LDAPSDKException;
import com.topcoder.util.net.ldap.sdkinterface.Update;
import com.topcoder.util.net.ldap.sdkinterface.Values;

import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import static com.topcoder.security.ldap.LDAPConstants.MEMBER_PROFILE_PROPERTY_HANDLE;
import static com.topcoder.security.ldap.LDAPConstants.MEMBER_PROFILE_PROPERTY_PASSWORD;
import static com.topcoder.security.ldap.LDAPConstants.MEMBER_PROFILE_PROPERTY_USERID;
import static com.topcoder.security.ldap.LDAPConstants.MEMBER_PROFILE_PROPERTY_STATUS;
import static com.topcoder.security.ldap.LDAPConstants.TOPCODER_MEMBER_BASE_DN;
import static com.topcoder.security.ldap.LDAPConstants.HOST;
import static com.topcoder.security.ldap.LDAPConstants.PORT;
import static com.topcoder.security.ldap.LDAPConstants.BIND_DN;
import static com.topcoder.security.ldap.LDAPConstants.BIND_PASSWORD;
import static com.topcoder.security.ldap.LDAPConstants.CONNECTION_FACTORY;
import static com.topcoder.security.ldap.LDAPConstants.TOPCODER_MEMBER_STATUS_ACTIVE;
import static com.topcoder.util.net.ldap.sdkinterface.LDAPSDKConnection.SCOPE_ONE;

/**
 * <p>A <code>LDAP</code> client to be used for accessing the <code>LDAP</code> directory and manipulating with
 * <code>LDAP</code> entries. The usage cycle should like follows:</p>
 *
 * <pre>
 *     LDAPClient client = new LDAPClient();
 *     client.connect();
 *     try {
 *         // Do the work
 *     } finally {
 *         client.disconnect();
 *     }
 * </pre>
 *
 * <p><b>Thread safety:</b> This class is not thread-safe. Each thread must use separate instance of this class.</p>
 *
 *
 * <p>
 * Version 1.1 (Impersonation Login Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Added {@link #authenticateTopCoderMember(String)} method.</li>
 *   </ol>
 * </p>
 *
 * @author isv
 * @version 1.1 (LDAP Authentication Release Assembly v1.0)
 */
public class LDAPClient {

    /**
     * <p>A <code>Set</code> of names for <code>LDAP</code> attributes which are allowed to be set for member profile
     * entries.</p>
     */
    private static final Set<String> MEMBER_PROFILE_ATTRIBUTES = new HashSet<String>(
            Arrays.asList(MEMBER_PROFILE_PROPERTY_HANDLE, MEMBER_PROFILE_PROPERTY_PASSWORD,
                          MEMBER_PROFILE_PROPERTY_STATUS, MEMBER_PROFILE_PROPERTY_USERID)
    );

    /**
     * <p>A <code>Set</code> of names for <code>LDAP</code> attributes which are required to be set for member profile
     * entries.</p>
     */
    private static final Set<String> REQUIRED_MEMBER_PROFILE_ATTRIBUTES = new HashSet<String>(
            Arrays.asList(MEMBER_PROFILE_PROPERTY_HANDLE, MEMBER_PROFILE_PROPERTY_PASSWORD,
                          MEMBER_PROFILE_PROPERTY_STATUS, MEMBER_PROFILE_PROPERTY_USERID)
    );

    /**
     * <p>A <code>Set</code> of names for <code>LDAP</code> attributes which are allowed to be exposed to client code
     * when reading member profile entries from <code>LDAP</code> directory.</p>
     */
    private static final Set<String> EXPORTED_MEMBER_PROFILE_ATTRIBUTES = new HashSet<String>(
            Arrays.asList(MEMBER_PROFILE_PROPERTY_HANDLE, MEMBER_PROFILE_PROPERTY_STATUS,
                          MEMBER_PROFILE_PROPERTY_USERID)
    );

    /**
     * <p>A <code>Set</code> of names for <code>LDAP</code> attributes of member profile entries which are required to
     * be of <code>String</code> type.</p>
     */
    private static final Set<String> STRING_MEMBER_PROFILE_ATTRIBUTES = new HashSet<String>(
            Arrays.asList(MEMBER_PROFILE_PROPERTY_HANDLE, MEMBER_PROFILE_PROPERTY_PASSWORD,
                          MEMBER_PROFILE_PROPERTY_STATUS)
    );

    /**
     * <p>A <code>Set</code> of names for <code>LDAP</code> attributes of member profile entries which are required to
     * be of <code>LONG</code> type.</p>
     */
    private static final Set<String> LONG_MEMBER_PROFILE_ATTRIBUTES = new HashSet<String>(
            Arrays.asList(MEMBER_PROFILE_PROPERTY_USERID)
    );

    /**
     * <p>A <code>String</code> referencing the <code>Active</code> status of <code>TopCoder</code> member account.</p>
     */
    private static final String USER_STATUS_ACTIVE = "A";

    /**
     * <p>A <code>String</code> providing the error code which may be returned by <code>LDAP</code> server in case
     * user could not be authenticated to server due to invalid credentials provided.</p>
     */
    private static final String LDAP_RESPONSE_CODE_INVALID_CREDENTIALS = "49";

    /**
     * <p>A <code>Logger</code> to be used for logging the events.</p>
     */
    private static final Logger log = Logger.getLogger(LDAPClient.class);

    /**
     * <p>A <code>LDAPSDKConnection</code> providing connection to target <code>LDAP</code> server.</p>
     */
    private LDAPSDKConnection ldapConnection;

    /**
     * <p>Constructs new <code>LDAPClient</code> instance. This implementation does nothing.</p>
     */
    public LDAPClient() {
    }

    /**
     * <p>Authenticates <code>TopCoder</code> member to <code>LDAP</code> server using the specified credentials. If
     * authentication is successful then member profile ID is returned otherwise an exception is raised.</p>
     *
     * @param handle a <code>String</code> providing the <code>TopCoder</code> member handle to be used for
     *        authentication.
     * @param password a <code>String</code> providing the password to be used for authentication.
     * @return a <code>long</code> providing the ID for authenticated <code>TopCoder</code> member profile. 
     * @throws LDAPClientException if an error occurs while establishing connection to target <code>LDAP</code> server
     *         or authenticating to <code>LDAP</code> server or if provided credentials are invalid or if specified
     *         user account is authenticated successfully but account is not of <code>Active</code> status.
     */
    public static long authenticateTopCoderMember(String handle, String password) throws LDAPClientException {

        LDAPSDKConnection ldapConnection = null;
        try {
            final LDAPClient client = new LDAPClient();
            client.connect();
            String userEntryDN;
            Entry userEntry;
            try {
                userEntry = client.findTopCoderMemberEntryByUserHandle(handle);
                userEntryDN = userEntry.getDn();
            } finally {
                client.disconnect();
            }

            LDAPSDK sdk = new LDAPSDK(CONNECTION_FACTORY);
            ldapConnection = sdk.createSSLConnection();
            ldapConnection.connect(HOST, PORT);
            ldapConnection.authenticate(userEntryDN, password);
            String userStatus = getStatus(userEntry);
            if (USER_STATUS_ACTIVE.equals(userStatus)) {
                log.info("Authenticated user " + handle + " against LDAP server successfully");
                return getUserID(userEntry);
            } else {
                log.debug("Rejected successful authentication against LDAP server for user " + handle
                          + " due to not Active user account status");
                throw LDAPClientException.createUserNotActiveException(handle);
            }
        } catch (ClassNotFoundException e) {
            log.error("Failed to instantiate the LDAPSDKFactory instance", e);
            throw LDAPClientException.createUnexpectedErrorException(e);
        } catch (LDAPSDKAccessDeniedException e) {
            if (LDAP_RESPONSE_CODE_INVALID_CREDENTIALS.equals(e.getErrorCode())) {
                log.debug("User " + handle + " failed to pass authentication against LDAP server", e);
                throw LDAPClientException.createInvalidCredentialsException(handle);
            } else {
                log.error("Failed to authenticate user " + handle + " due to unexpected error", e);
                throw LDAPClientException.createUnexpectedErrorException(e);
            }
        } catch (LDAPSDKException e) {
            log.error("Failed to authenticate user " + handle + " due to unexpected error", e);
            throw LDAPClientException.createUnexpectedErrorException(e);
        } finally {
            if (ldapConnection != null) {
                try {
                    ldapConnection.disconnect();
                } catch (LDAPSDKException e) {
                    log.warn("Failed to disconnect from LDAP server successfully", e);
                }
            }
        }
    }

    /**
     * <p>Authenticates <code>TopCoder</code> member to <code>LDAP</code> server using the specified username only. If
     * authentication is successful then member profile ID is returned otherwise an exception is raised.</p>
     *
     * @param handle a <code>String</code> providing the <code>TopCoder</code> member handle to be used for
     *        authentication.
     * @return a <code>long</code> providing the ID for authenticated <code>TopCoder</code> member profile.
     * @throws LDAPClientException if an error occurs while establishing connection to target <code>LDAP</code> server
     *         or authenticating to <code>LDAP</code> server or if provided credentials are invalid or if specified
     *         user account is authenticated successfully but account is not of <code>Active</code> status.
     * @since 1.1
     */
    public static long authenticateTopCoderMember(String handle) throws LDAPClientException {
        LDAPSDKConnection ldapConnection = null;
        try {
            final LDAPClient client = new LDAPClient();
            client.connect();
            Entry userEntry;
            try {
                userEntry = client.findTopCoderMemberEntryByUserHandle(handle);
            } finally {
                client.disconnect();
            }

            String userStatus = getStatus(userEntry);
            if (USER_STATUS_ACTIVE.equals(userStatus)) {
                log.info("Authenticated user " + handle + " based on just a username against LDAP server successfully");
                return getUserID(userEntry);
            } else {
                log.debug("Rejected successful authentication just by username against LDAP server for user " + handle
                          + " due to not Active user account status");
                throw LDAPClientException.createUserNotActiveException(handle);
            }
        } finally {
            if (ldapConnection != null) {
                try {
                    ldapConnection.disconnect();
                } catch (LDAPSDKException e) {
                    log.warn("Failed to disconnect from LDAP server successfully", e);
                }
            }
        }
    }

    /**
     * <p>Establishes authenticated connection to target <code>LDAP</code> server.</p>
     *
     * @throws LDAPClientException if an error occurs while establishing connection to target <code>LDAP</code> server
     *         or authenticating to <code>LDAP</code> server.
     */
    public void connect() throws LDAPClientException {
        try {
            LDAPSDK sdk = new LDAPSDK(CONNECTION_FACTORY);
            LDAPSDKConnection ldapConnection = sdk.createSSLConnection();
            ldapConnection.connect(HOST, PORT);
            ldapConnection.authenticate(BIND_DN, BIND_PASSWORD);
            this.ldapConnection = ldapConnection;
        } catch (ClassNotFoundException e) {
            log.error("Failed to instantiate the LDAPSDKFactory instance", e);
            throw LDAPClientException.createUnexpectedErrorException(e);
        } catch (LDAPSDKException e) {
            log.error("Failed to connect to LDAP server due to unexpected error : "+ e);
            throw LDAPClientException.createUnexpectedErrorException(e);
        }
    }

    /**
     * <p>Checks if this client is connected to <code>LDAP</code> server. Note that this method does not verify
     * whether the connection to <code>LDAP</code> server is active or not (e.g. timed-out). It just ensures that
     * {@link #connect()} have been called recently on this client instance.</p>
     *
     * @return <code>true</code> if this client is connected to <code>LDAP</code> server; <code>false</code> otherwise.
     */
    public boolean isConnected() {
        return this.ldapConnection != null;
    }

    /**
     * <p>Disconnects from target <code>LDAP</code> server.</p>
     *
     * @throws LDAPClientException if an unexpected error occurs while disconnecting from server.
     * @throws IllegalStateException if this client is not connected to <code>LDAP</code> server yet.
     */
    public void disconnect() throws LDAPClientException {
        checkConnection();
        try {
            this.ldapConnection.disconnect();
        } catch (LDAPSDKException e) {
            log.warn("Failed to disconnect from LDAP server successfully");
            throw LDAPClientException.createUnexpectedErrorException(e);
        }
    }

    /**
     * <p>Adds new <code>LDAP</code> entry for <code>TopCoder</code> member profile with specified properties.</p>
     *
     * @param userId a <code>long</code> providing the unique ID for <code>TopCoder</code> member profile.
     * @param handle a <code>String</code> providing the unique handle for <code>TopCoder</code> member profile.
     * @param password a <code>String</code> providing the password for <code>TopCoder</code> member profile.
     * @param status a <code>String</code> providing the status for <code>TopCoder</code> member profile. 
     * @throws LDAPClientException if an unexpected error occurs while adding new <code>LDAP</code> entry for specified
     *         member profile.
     * @throws IllegalStateException if this client is not connected to <code>LDAP</code> server yet.
     */
    public void addTopCoderMemberProfile(long userId, String handle, String password, String status)
        throws LDAPClientException {

        checkConnection();

        Map<String, Object> profile = new HashMap<String, Object>();
        profile.put(MEMBER_PROFILE_PROPERTY_USERID, userId);
        profile.put(MEMBER_PROFILE_PROPERTY_HANDLE, handle);
        profile.put(MEMBER_PROFILE_PROPERTY_PASSWORD, password);
        profile.put(MEMBER_PROFILE_PROPERTY_STATUS, status);
        validateTopCoderMemberProfile(profile);

        // Create the LDAP entry matching the profile
        Entry ldapEntry = new Entry(buildTopCoderMemberEntryDN(userId));
        ldapEntry.setAttribute("objectClass", new Values("top"));
        ldapEntry.setAttribute("objectClass", new Values("tc-member"));
        ldapEntry.setAttribute(MEMBER_PROFILE_PROPERTY_HANDLE, new Values(handle));
        ldapEntry.setAttribute(MEMBER_PROFILE_PROPERTY_STATUS, new Values(status));
        ldapEntry.setAttribute(MEMBER_PROFILE_PROPERTY_USERID, new Values(String.valueOf(userId)));
        ldapEntry.setAttribute(MEMBER_PROFILE_PROPERTY_PASSWORD, new Values(password));

        // Add entry to LDAP directory
        try {
            this.ldapConnection.addEntry(ldapEntry);
            changeTopCoderMemberProfilePassword(userId, password);
            log.info("Created new LDAP entry: " + ldapEntry.getDn());
        } catch (LDAPSDKException e) {
            log.error("Failed to add LDAP entry for user " + handle + " due to unexpected error");
            throw LDAPClientException.createUnexpectedErrorException(e);
        }
    }

    /**
     * <p>Deletes existing <code>LDAP</code> entry for <code>TopCoder</code> member profile from LDAP directory.</p>
     *
     * @param userId a <code>long</code> providing the unique ID for <code>TopCoder</code> member profile to be deleted
     *        from LDAP directory.
     * @throws LDAPClientException if an unexpected error occurs while deleting <code>LDAP</code> entry for specified
     *         member profile.
     * @throws IllegalStateException if this client is not connected to <code>LDAP</code> server yet.
     */
    public void deleteTopCoderMemberProfile(long userId) throws LDAPClientException {
        checkConnection();
        try {
            String entryDN = buildTopCoderMemberEntryDN(userId);
            this.ldapConnection.deleteEntry(entryDN);
            log.info("Deleted LDAP entry: " + entryDN);
        } catch (LDAPSDKNoSuchObjectException e) {
            log.warn("LDAP entry not found for deletion: " + userId);
            // Ignore this exception.
        } catch (LDAPSDKException e) {
            log.error("Failed to delete LDAP entry for user " + userId + " due to unexpected error");
            throw LDAPClientException.createUnexpectedErrorException(e);
        }
    }

    /**
     * <p>Changes the password for specified <code>TopCoder</code> member account.</p>
     *
     * @param userId a <code>long</code> providing the ID of a user to change the <code>password</code> attribute for.
     * @param newPassword a <code>String</code> providing new password to be set for user.
     * @throws LDAPClientException if an unexpected error occurs while communicating to <code>LDAP</code> server or
     *         updating the entry in <code>LDAP</code> directory.
     * @throws IllegalStateException if this client is not connected to <code>LDAP</code> server yet.
     */
    public void changeTopCoderMemberProfilePassword(long userId, String newPassword) throws LDAPClientException {
        checkConnection();
        String userLDAPEntryDN = buildTopCoderMemberEntryDN(userId);
        try {
            JLDAPConnection jldapConnection = (JLDAPConnection) this.ldapConnection;
            jldapConnection.changePassword(userLDAPEntryDN, newPassword);
            log.info("Successfully changed password for LDAP entry " + userLDAPEntryDN);
        } catch (LDAPSDKException e) {
            log.error("Failed to change password for LDAP entry " + userLDAPEntryDN + " due to unexpected error");
            throw LDAPClientException.createUnexpectedErrorException(e);
        }
    }

    /**
     * <p>Sets the value of <code>handle</code> attribute for <code>LDAP</code> entry matching the specified
     * <code>TopCoder</code> member profile ID with specified new status.</p>
     *
     * @param userId a <code>long</code> providing the ID of a user to change the <code>handle</code> attribute for.
     * @param newHandle a <code>String</code> providing the new value for <code>handle</code> attribute.
     * @throws LDAPClientException if an unexpected error occurs.
     */
    public void setTopCoderMemberProfileHandle(long userId, String newHandle) throws LDAPClientException {
        checkConnection();
        String userLDAPEntryDN = buildTopCoderMemberEntryDN(userId);
        Update update = new Update();
        update.replace(MEMBER_PROFILE_PROPERTY_HANDLE, new Values(newHandle));
        try {
            this.ldapConnection.updateEntry(userLDAPEntryDN, update);
            log.info("Successfully changed handle for LDAP entry " + userLDAPEntryDN + " to " + newHandle);
        } catch (LDAPSDKException e) {
            log.error("Failed to change handle for LDAP entry " + userLDAPEntryDN + " due to unexpected error");
            throw LDAPClientException.createUnexpectedErrorException(e);
        }
    }

    /**
     * <p>Sets the value of <code>status</code> attribute for <code>LDAP</code> entry matching the specified
     * <code>TopCoder</code> member profile ID with value corresponding to <code>Active</code> profile status.</p>
     *
     * @param userId a <code>long</code> providing the ID of a user to change the <code>status</code> attribute for.
     * @throws LDAPClientException if an unexpected error occurs.
     */
    public void activateTopCoderMemberProfile(long userId) throws LDAPClientException {
        checkConnection();
        String userLDAPEntryDN = buildTopCoderMemberEntryDN(userId);
        Update update = new Update();
        update.replace(MEMBER_PROFILE_PROPERTY_STATUS, new Values(TOPCODER_MEMBER_STATUS_ACTIVE));
        try {
            this.ldapConnection.updateEntry(userLDAPEntryDN, update);
            log.info("Successfully changed status for LDAP entry " + userLDAPEntryDN + " to "
                     + TOPCODER_MEMBER_STATUS_ACTIVE);
        } catch (LDAPSDKException e) {
            log.error("Failed to change status for LDAP entry " + userLDAPEntryDN + " due to unexpected error");
            throw LDAPClientException.createUnexpectedErrorException(e);
        }
    }

    /**
     * <p>Sets the value of <code>status</code> attribute for <code>LDAP</code> entry matching the specified
     * <code>TopCoder</code> member profile ID with specified new status.</p>
     *
     * @param userId a <code>long</code> providing the ID of a user to change the <code>status</code> attribute for.
     * @param newStatus a <code>String</code> providing the new value for <code>status</code> attribute.
     * @throws LDAPClientException if an unexpected error occurs.
     */
    public void setTopCoderMemberProfileStatus(long userId, String newStatus) throws LDAPClientException {
        checkConnection();
        String userLDAPEntryDN = buildTopCoderMemberEntryDN(userId);
        Update update = new Update();
        update.replace(MEMBER_PROFILE_PROPERTY_STATUS, new Values(newStatus));
        try {
            this.ldapConnection.updateEntry(userLDAPEntryDN, update);
            log.info("Successfully changed status for LDAP entry " + userLDAPEntryDN + " to " + newStatus);
        } catch (LDAPSDKException e) {
            log.error("Failed to change status for LDAP entry " + userLDAPEntryDN + " due to unexpected error");
            throw LDAPClientException.createUnexpectedErrorException(e);
        }
    }

    /**
     * <p>Finds the <code>LDAP</code> entry for <code>TopCoder</code> member profile matching the specified handle.</p>
     *
     * @param handle a <code>String</code> providing the handle for the <code>TopCoder</code> member account to find the
     *        matching <code>LDAP</code> entry for.
     * @return an <code>Entry</code> providing the data for <code>LDAP</code> entry matching the specified
     *         <code>TopCoder</code> member profile ID.
     * @throws LDAPClientException if an unexpected error occurs or respective <code>LDAP</code> entry is not found.
     */
    private Entry findTopCoderMemberEntryByUserHandle(String handle)
        throws LDAPClientException {

        Iterator iterator = null;
        try {
            String[] returnAttributes
                = EXPORTED_MEMBER_PROFILE_ATTRIBUTES.toArray(new String[EXPORTED_MEMBER_PROFILE_ATTRIBUTES.size()]);

            iterator = this.ldapConnection.search(TOPCODER_MEMBER_BASE_DN, SCOPE_ONE,
                                                  MEMBER_PROFILE_PROPERTY_HANDLE + "=" + escapeLDAPSearchFilter(handle),
                                                  returnAttributes);
            if (iterator.hasNext()) {
                Entry userEntry = (Entry) iterator.next();
                return userEntry;
            } else {
                throw LDAPClientException.createUserHandleNotFoundException(handle);
            }
        } catch (LDAPSDKException e) {
            throw LDAPClientException.createUnexpectedErrorException(e);
        }
    }

    /**
     * <p>Verifies that this client is connected to <code>LDAP</code> server.</p>
     *
     * @throws IllegalStateException if this client is not connected to <code>LDAP</code> server yet.
     */
    private void checkConnection() {
        if (this.ldapConnection == null) {
            throw new IllegalStateException("Not connected to LDAP server yet");
        }
    }

    /**
     * <p>Validates the <code>TopCoder</code> member profile data.</p>
     *
     * @param profile a <code>Map</code> mapping the profile attribute names to profile attribute values.
     * @throws IllegalArgumentException if specified <code>profile</code> is <code>null</code> or does not contain valid
     *         profile attributes set. 
     */
    private void validateTopCoderMemberProfile(Map<String, Object> profile) {
        if (profile == null) {
            throw new IllegalArgumentException("The parameter [profile] is NULL");
        }
        for (String profileAttributeName : profile.keySet()) {
            if (!MEMBER_PROFILE_ATTRIBUTES.contains(profileAttributeName)) {
                throw new IllegalArgumentException("Profile has illegal attribute: " + profileAttributeName);
            }
        }
        for (String requiredAttributeName : REQUIRED_MEMBER_PROFILE_ATTRIBUTES) {
            if (!profile.containsKey(requiredAttributeName) || (profile.get(requiredAttributeName) == null)) {
                throw new IllegalArgumentException("Profile does not have required attribute: "
                                                   + requiredAttributeName);
            }
        }
        for (String attributeName : STRING_MEMBER_PROFILE_ATTRIBUTES) {
            Object value = profile.get(attributeName);
            if (value != null) {
                if (!(value instanceof String)) {
                    throw new IllegalArgumentException("Profile attribute " + attributeName + " is not of "
                        + "java.lang.String type: " + value.getClass().getName());
                }
            }
        }
        for (String attributeName : LONG_MEMBER_PROFILE_ATTRIBUTES) {
            Object value = profile.get(attributeName);
            if (value != null) {
                if (!(value instanceof Long)) {
                    throw new IllegalArgumentException("Profile attribute " + attributeName + " is not of "
                        + "java.lang.Long type: " + value.getClass().getName());
                }
            }
        }
    }

    /**
     * <p>Gets the value of <code>status</code> attribute from the specified <code>LDAP</code> entry.</p>
     *
     * @param userLDAPEntry an <code>Entry</code> providing the data for <code>LDAP</code> entry.
     * @return a <code>String</code> providing the value of <code>status</code> attribute from the specified
     *         <code>LDAP</code> entry.
     */
    private static String getStatus(Entry userLDAPEntry) {
        return (String) userLDAPEntry.getValues(MEMBER_PROFILE_PROPERTY_STATUS).getTextValues().get(0);
    }

    /**
     * <p>Gets the value of <code>handle</code> attribute from the specified <code>LDAP</code> entry.</p>
     *
     * @param userLDAPEntry an <code>Entry</code> providing the data for <code>LDAP</code> entry.
     * @return a <code>String</code> providing the value of <code>handle</code> attribute from the specified
     *         <code>LDAP</code> entry.
     */
    private static String getHandle(Entry userLDAPEntry) {
        return (String) userLDAPEntry.getValues(MEMBER_PROFILE_PROPERTY_HANDLE).getTextValues().get(0);
    }

    /**
     * <p>Gets the value of <code>uid</code> attribute from the specified <code>LDAP</code> entry.</p>
     *
     * @param userLDAPEntry an <code>Entry</code> providing the data for <code>LDAP</code> entry.
     * @return a <code>Long</code> providing the value of <code>UID</code> attribute from the specified
     *         <code>LDAP</code> entry.
     */
    private static Long getUserID(Entry userLDAPEntry) {
        return new Long((String) userLDAPEntry.getValues(MEMBER_PROFILE_PROPERTY_USERID).getTextValues().get(0));
    }

    /**
     * <p>Builds the DN for LDAP entry for the specified user.</p>
     *
     * @param userId a <code>long</code> providing the user ID.
     * @return a <code>String</code> providing the DN for LDAP entry for specified user.
     */
    private String buildTopCoderMemberEntryDN(long userId) {
        return MEMBER_PROFILE_PROPERTY_USERID + "=" + userId + "," + TOPCODER_MEMBER_BASE_DN;
    }

    /**
     * <p>Escapes the specified value of LDAP search filter.</p>
     *
     * @param value a <code>String</code> providing the value of LDAP search filter to be escaped.
     * @return a <code>String</code> providing the escaped value.
     */
    private static String escapeLDAPSearchFilter(String value) {
        StringBuilder b = new StringBuilder();
        for (int i = 0; i < value.length(); i++) {
            char ch = value.charAt(i);
            switch (ch) {
                case '\\':
                    b.append("\\5c");
                    break;
                case '*':
                    b.append("\\2a");
                    break;
                case '(':
                    b.append("\\28");
                    break;
                case ')':
                    b.append("\\29");
                    break;
                case '\u0000':
                    b.append("\\00");
                    break;
                default:
                    b.append(ch);
            }
        }
        return b.toString();
    }
}
