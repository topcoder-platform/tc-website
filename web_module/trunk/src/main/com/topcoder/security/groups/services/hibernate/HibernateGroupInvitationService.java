/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.hibernate;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.topcoder.commons.utils.LoggingWrapperUtility;
import com.topcoder.commons.utils.ValidationUtility;
import com.topcoder.configuration.ConfigurationObject;
import com.topcoder.configuration.persistence.ConfigurationFileManager;
import com.topcoder.message.email.EmailEngine;
import com.topcoder.message.email.TCSEmailMessage;
import com.topcoder.security.groups.model.GroupInvitation;
import com.topcoder.security.groups.services.AuthorizationService;
import com.topcoder.security.groups.services.EntityNotFoundException;
import com.topcoder.security.groups.services.GroupInvitationService;
import com.topcoder.security.groups.services.SecurityGroupConfigurationException;
import com.topcoder.security.groups.services.SecurityGroupException;
import com.topcoder.security.groups.services.UserService;
import com.topcoder.security.groups.services.dto.InvitationSearchCriteria;
import com.topcoder.security.groups.services.dto.PagedResult;
import com.topcoder.security.groups.services.dto.UserDTO;
import com.topcoder.util.file.DocumentGenerator;
import com.topcoder.util.file.DocumentGeneratorFactory;
import com.topcoder.util.file.Template;

/**
 * <p>
 * This is the implementation of interface defines the contract for the creation and management of invitations
 * </p>
 * 
 * <p>
 * Thread Safety:Implementations are expected to be effectively thread-safe
 * </p>
 * 
 * <p>
 * Version 1.1 (Release Assembly - TopCoder Security Groups Frontend - Invitations Approvals) change notes:
 * <ol>
 *   <li>Updated method {@link #search(InvitationSearchCriteria, long, int, int)} to support
 *   view invitation page and pending approval page.</li>
 * </ol>
 * </p>
 *
 * @author backstretlili, TCSASSEMBLER
 * @version 1.1
 */
public class HibernateGroupInvitationService extends BaseGroupService implements GroupInvitationService {

    /**
     * <p>
     * Represent the qualified name of this class.
     * </p>
     */
    private static final String CLASS_NAME = HibernateGroupInvitationService.class.getName();

    /**
     * The path of default configuration file, should not change.
     */
    private static String CONFIGURATION_FILE = "com/topcoder/util/config/ConfigManager.properties";

    /**
     * The namespace of document generator.
     */
    private static String DOCUMENT_NAMESPACE = "com.topcoder.util.file";

    /**
     * A instance of AuthorizationService used to check permissions,it'll be injected by Spring
     */
    private AuthorizationService authorizationService;

    /**
     * A instance of UserService used to get user
     */
    private UserService userService;

    /**
     * The subject of the email
     */
    private String emailSubject;

    /**
     * The source id of the email template
     */
    private String emailBodyTemplateSourceId;

    /**
     * The template name of the email
     */
    private String emailBodyTemplateName;

    /**
     * The sender of the email
     */
    private String emailSender;

    /**
     * This method creates a new invitation record, and returns its ID.
     * 
     * @param invitation
     *            the Invitation to create
     * @return the ID of the created Invitation
     * @throws IllegalArgumentException
     *             If invitation is null
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     * 
     */
    public long addInvitation(GroupInvitation invitation) throws IllegalArgumentException, SecurityGroupException {
        final String signature = CLASS_NAME + ".addInvitation(GroupInvitation invitation)";
        LoggingWrapperUtility
                        .logEntrance(logger, signature, new String[] { "invitation" }, new Object[] { invitation });

        if (invitation == null) {
            wrapAndLogIllegalArgumentException(new IllegalArgumentException("invitation is null"), logger, signature);
        }

        try {
            Session session = sessionFactory.getCurrentSession();
            session.persist(invitation);
        } catch (HibernateException e) {
            wrapAndLogSecurityException(e, logger, signature);
        }

        LoggingWrapperUtility.logExit(logger, signature, new Object[] { invitation.getId() });

        return invitation.getId();
    }

    /**
     * This method updates an existing group invitation
     * 
     * @param invitation
     *            the GroupInvitation to update
     * 
     * @throws IllegalArgumentException
     *             If invitation is null
     * @throws EntityNotFoundException
     *             If the invitation with the given ID was not found
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     * 
     */
    public void updateInvitation(GroupInvitation invitation) throws IllegalArgumentException, EntityNotFoundException,
                    SecurityGroupException {
        final String signature = CLASS_NAME + ".updateInvitation(GroupInvitation invitation)";
        LoggingWrapperUtility
                        .logEntrance(logger, signature, new String[] { "invitation" }, new Object[] { invitation });

        if (invitation == null) {
            wrapAndLogIllegalArgumentException(new IllegalArgumentException("invitation is null when update"), logger,
                            signature);
        }

        try {
            Session session = sessionFactory.getCurrentSession();
            GroupInvitation existing = (GroupInvitation) session.get(GroupInvitation.class,
                            Long.valueOf(invitation.getId()));

            if (existing == null) {
                wrapAndLogEntityNotFoundException(new EntityNotFoundException("invitation not found when update"),
                                logger, signature);
            }

            session.clear();
            session.update(invitation);
        } catch (HibernateException e) {
            wrapAndLogSecurityException(e, logger, signature);
        }

        LoggingWrapperUtility.logExit(logger, signature, new Object[] { invitation });
    }

    /**
     * This method gets an existing group invitation
     * 
     * @param id
     *            the id of the GroupInvitation
     * @return the GroupInvitation,null if not found
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     * 
     */
    public GroupInvitation getInvitation(long id) throws SecurityGroupException {
        final String signature = CLASS_NAME + ".get(long id)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "id" }, new Object[] { id });

        GroupInvitation result = null;
        try {
            Session session = sessionFactory.getCurrentSession();
            result = (GroupInvitation) session.get(GroupInvitation.class, Long.valueOf(id));
        } catch (HibernateException e) {
            wrapAndLogSecurityException(e, logger, signature);
        }

        LoggingWrapperUtility.logExit(logger, signature, new Object[] { result });

        return result;
    }

    /**
     * This method retrieves the list of GroupInvitations for the given search criteria and paging requirements. The
     * result will not be null, and the inner list will also never be null.
     * 
     * @param criteria
     *            the filter with the search criteria: if null, assume no filtering
     * @param clientId
     *            the id of the group's client
     * @param page
     *            the 1-based number of the page to return. If 0, then all pages are returned
     * @param pageSize
     *            the size of the page to return. Will be a positive number, but ignored if page=0
     * @return A result object with the list of applicable invitations and the page and total data
     * @throws IllegalArgumentException
     *             If page < 0 or If pageSize < 1 unless page = 0
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     * 
     */
    @SuppressWarnings("unchecked")
    public PagedResult<GroupInvitation> search(InvitationSearchCriteria criteria, long clientId, int pageSize, int page)
                    throws IllegalArgumentException, SecurityGroupException {
        final String signature = CLASS_NAME
                        + ".search(InvitationSearchCriteria criteria, long clientId, int pageSize, int page)";
        LoggingWrapperUtility.logEntrance(logger, signature,
                        new String[] { "criteria", "clientId", "pageSize", "page" }, new Object[] { criteria, clientId,
                                        pageSize, page });

        if (page < 0 || (pageSize < 1 && page != 0)) {
            wrapAndLogIllegalArgumentException(new IllegalArgumentException("error page or pageSize"), logger,
                            signature);
        }

        PagedResult<GroupInvitation> result = new PagedResult<GroupInvitation>();
        result.setPage(page);
        result.setTotal(0);
        result.setValues(new ArrayList<GroupInvitation>());
        try {
            StringBuilder con = new StringBuilder();
            
            // unassignedOn should be null
            con.append(" where gi.groupMember.unassignedOn is null ");
            
            // check client id
            if (clientId > 0) {
                con.append(" and gi.groupMember.group.client.id = :clientId");
            }
            
            // check invitee email and invitee handle
            if (criteria.getInviteeEmail() != null || criteria.getInviteeHandle() != null) {
                con.append(" and gi.groupMember.userId in (:inviteeUserIds) ");
            }
            
            // check other parameters
            if (criteria != null) {
                if (criteria.getOwnedUserId() != null) {
                    con.append(" and gi.groupMember.userId = :ownedUserId ");
                }
                if (criteria.getGroupName() != null) {
                    con.append(" and LOWER(gi.groupMember.group.name) like LOWER(:groupName) ");
                }
                if (criteria.getPermissions() != null) {
                    con.append(" and (gi.groupMember.useGroupDefault = true and gi.groupMember.group.defaultPermission in (:permissions) ");
                    con.append(" or gi.groupMember.useGroupDefault = false and gi.groupMember.specificPermission in (:permissions)) ");
                }
                if (criteria.getSentDateFrom() != null) {
                    con.append(" and gi.sentOn >= :sentDateFrom ");
                }
                if (criteria.getSentDateTo() != null) {
                    con.append(" and gi.sentOn <= :sentDateTo ");
                }
                if (criteria.getAcceptedDateFrom() != null) {
                    con.append(" and gi.acceptedOrRejectedOn >= :acceptedDateFrom ");
                }
                if (criteria.getAcceptedDateTo() != null) {
                    con.append(" and gi.acceptedOrRejectedOn <= :acceptedDateTo ");
                }
                if (criteria.getStatus() != null) {
                    con.append(" and gi.status = :status ");
                }
                if (criteria.getMasterUserId() != null) {
                    if (!authorizationService.isAdministrator(criteria.getMasterUserId())) {
                        String clientHql = " gi.groupMember.group.client.id in (select ca.client.id from CustomerAdministrator ca where ca.userId = :masterUserId) ";
                        String groupHql = " gi.groupMember.group.id in (SELECT gm.group.id FROM GroupMember gm WHERE ((gm.useGroupDefault = false AND gm.specificPermission = 'FULL') "
                                        + " OR (gm.useGroupDefault = true AND gm.group.defaultPermission = 'FULL')) "
                                        + " AND gm.active = true AND gm.userId = :masterUserId) ";
                        con.append(" and ((").append(clientHql).append(") or (").append(groupHql).append(")) ");
                    } else {
                        // ignore it when for administrator
                        criteria.setMasterUserId(null);
                    }
                }
            }
            String from = " from GroupInvitation gi ";
            // set page
            int row = 0, size = 0;
            if (page != 0) {
                row = (page - 1) * pageSize;
                size = pageSize;
            }
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery(from + con.toString());
            boolean paramOk = setCriteria(criteria, clientId, query);
            if (!paramOk) {
                result.setTotal(0);
                result.setValues(null);
            } else {
                query.setFirstResult(row);
                if (size > 0)query.setFetchSize(size).setMaxResults(size);
                List<GroupInvitation> list = (List<GroupInvitation>) query.list();
                result.setValues(list);
                // set count
                if (page != 0) {
                    query = session.createQuery("select count(*) " + from + con.toString());
                    setCriteria(criteria, clientId, query);
                    result.setTotal(Integer.valueOf(query.list().iterator().next().toString()).intValue());
                } else {
                    result.setTotal(result.getValues().size());
                }
            }
        } catch (Exception e) {
            wrapAndLogSecurityException(e, logger, signature);
        }

        if (result.getValues() == null)
            result.setValues(new ArrayList<GroupInvitation>());

        LoggingWrapperUtility.logExit(logger, signature, new Object[] { result });

        return result;
    }

    /**
     * Set criteria to query
     * 
     * @param criteria
     *            the criteria
     * @param clientId
     *            the id of the client
     * @param query
     *            the query to set
     * @throws SecurityGroupException if any error occurred
     * @return return true if no error occurred, false otherwise 
     */
    private boolean setCriteria(InvitationSearchCriteria criteria, long clientId, Query query)
        throws SecurityGroupException {
        if (clientId > 0) {
            query.setLong("clientId", clientId);
        }
        if (criteria != null) {
            if (criteria.getInviteeEmail() != null || criteria.getInviteeHandle() != null) {
                List<Long> inviteeUserIds = new ArrayList<Long>();
                List<UserDTO> users = userService.search(criteria.getInviteeHandle(), criteria.getInviteeEmail());
                if (users.size() == 0) {
                    return false;
                }
                for (UserDTO user : users) {
                    inviteeUserIds.add(user.getUserId());
                }
                query.setParameterList("inviteeUserIds", inviteeUserIds);
            }
            if (criteria.getOwnedUserId() != null) {
                query.setLong("ownedUserId", criteria.getOwnedUserId());
            }
            if (criteria.getMasterUserId() != null) {
                query.setLong("masterUserId", criteria.getMasterUserId());
            }
            if (criteria.getGroupName() != null) {
                query.setString("groupName", '%' + criteria.getGroupName().replaceAll("\\%", "") + '%');
            }
            if (criteria.getPermissions() != null) {
                query.setParameterList("permissions", criteria.getPermissions());
            }
            if (criteria.getSentDateFrom() != null) {
                query.setDate("sentDateFrom", criteria.getSentDateFrom());
            }
            if (criteria.getSentDateTo() != null) {
                query.setDate("sentDateTo", criteria.getSentDateTo());
            }
            if (criteria.getAcceptedDateFrom() != null) {
                query.setDate("acceptedDateFrom", criteria.getAcceptedDateFrom());
            }
            if (criteria.getAcceptedDateTo() != null) {
                query.setDate("acceptedDateTo", criteria.getAcceptedDateTo());
            }
            if (criteria.getStatus() != null) {
                query.setString("status", criteria.getStatus().name());
            }
        }
        return true;
    }

    /**
     * This method sends the given invitation, and provides the URLS to use for registering, accepting, or rejecting the
     * invitation.
     * 
     * @param invitation
     *            the GroupInvitation with the invitation data
     * @param registrationUrl
     *            the URL for the invitee to use to register before deciding on the invitation (if they are not a member
     *            yet)
     * @param acceptanceUrl
     *            the URL for the invitee to use to accept the invitation
     * @param rejectionUrl
     *            the URL for the invitee to use to reject the invitation
     * @throws IllegalArgumentException
     *             If invitation is null, and any of the URL parameters is null/empty
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     * 
     */
    public void sendInvitation(GroupInvitation invitation, String registrationUrl, String acceptanceUrl,
                    String rejectionUrl) throws IllegalArgumentException, SecurityGroupException {
        final String signature = CLASS_NAME
                        + ".sendInvitation(GroupInvitation invitation, String registrationUrl, String acceptanceUrl,String rejectionUrl)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "invitation", "registrationUrl",
                        "acceptanceUrl", "rejectionUrl" }, new Object[] { invitation, registrationUrl, acceptanceUrl,
                        rejectionUrl });

        checkSendParam(invitation, registrationUrl, acceptanceUrl, rejectionUrl, signature);

        try {
            StringBuilder data = new StringBuilder();
            data.append("<DATA>\n");
            UserDTO userDTO = userService.get(invitation.getGroupMember().getUserId());
            data.append("<USERNAME>").append(processString(userDTO.getHandle())).append("</USERNAME>\n");
            data.append("<GROUP_NAME>").append(processString(invitation.getGroupMember().getGroup().getName()))
                            .append("</GROUP_NAME>\n");
            data.append("<REGISTRATION_URL>").append(processString(registrationUrl)).append("</REGISTRATION_URL>\n");
            data.append("<ACCEPTANCE_URL>").append(processString(acceptanceUrl)).append("</ACCEPTANCE_URL>\n");
            data.append("<REJECTION_URL>").append(processString(rejectionUrl)).append("</REJECTION_URL>\n");
            data.append("</DATA>\n");
            ConfigurationObject configurationObject = new ConfigurationFileManager(CONFIGURATION_FILE)
                            .getConfiguration(DOCUMENT_NAMESPACE).getChild(DOCUMENT_NAMESPACE);
            Template template = null;
            DocumentGenerator documentGenerator = DocumentGeneratorFactory.getDocumentGenerator(configurationObject);
            if (emailBodyTemplateSourceId != null) {
                template = documentGenerator.getTemplate(emailBodyTemplateName);
            } else {
                template = documentGenerator.getTemplate(emailBodyTemplateSourceId, emailBodyTemplateName);
            }
            String emailBody = documentGenerator.applyTemplate(template, data.toString());
            // Send email
            TCSEmailMessage message = new TCSEmailMessage();
            message.setFromAddress(emailSender);
            message.setToAddress(userDTO.getEmailAddress(), TCSEmailMessage.TO);
            message.setSubject(emailSubject);
            message.setBody(emailBody);
            EmailEngine.send(message);
        } catch (Exception e) {
            wrapAndLogSecurityException(e, logger, signature);
        }
    }

    /**
     * Check the params which can not be null
     * 
     * @param invitation
     *            the GroupInvitation with the invitation data
     * @param registrationUrl
     *            the URL for the invitee to use to register before deciding on the invitation (if they are not a member
     *            yet)
     * @param acceptanceUrl
     *            the URL for the invitee to use to accept the invitation
     * @param rejectionUrl
     *            the URL for the invitee to use to reject the invitation
     * @param signature
     *            the signature of the calling method
     */
    private void checkSendParam(GroupInvitation invitation, String registrationUrl, String acceptanceUrl,
                    String rejectionUrl, String signature) {
        if (invitation == null) {
            wrapAndLogIllegalArgumentException(new IllegalArgumentException("invitation is null"), logger, signature);
        }
        if (registrationUrl == null) {
            wrapAndLogIllegalArgumentException(new IllegalArgumentException("registrationUrl is null"), logger,
                            signature);
        }
        if (acceptanceUrl == null) {
            wrapAndLogIllegalArgumentException(new IllegalArgumentException("acceptanceUrl is null"), logger, signature);
        }
        if (rejectionUrl == null) {
            wrapAndLogIllegalArgumentException(new IllegalArgumentException("rejectionUrl is null"), logger, signature);
        }
    }

    /**
     * Handles escaping of characters that could be interpreted as XML markup.
     * <p>
     * The specification defines the following character conversions to be applied:
     * <table rules="all" frame="border">
     * <tr>
     * <th>Character</th>
     * <th>Character Entity Code</th>
     * </tr>
     * <tr>
     * <td>&lt;</td>
     * <td>&amp;lt;</td>
     * </tr>
     * <tr>
     * <td>&gt;</td>
     * <td>&amp;gt;</td>
     * </tr>
     * <tr>
     * <td>&amp;</td>
     * <td>&amp;amp;</td>
     * </tr>
     * <tr>
     * <td>&#039;</td>
     * <td>&amp;#039;</td>
     * </tr>
     * <tr>
     * <td>&#034;</td>
     * <td>&amp;#034;</td>
     * </tr>
     * </table>
     * 
     * @param str
     *            the string needs escaping
     * @return the escaped string
     */
    private String processString(String str) {
        if (str == null) {
            return "";
        }
        return str.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("'", "&#039;")
                        .replaceAll("\"", "&#034;");
    }

    /**
     * <p>
     * This method mainly checks if the IOC operations succeeds. It's supposed to be invoked immediately after IOC
     * completes. Generally, you need to specify its name at init-method property of spring bean definition.
     * </p>
     * 
     * @throws SecurityGroupConfigurationException
     */
    public void afterPropertiesSet() throws SecurityGroupConfigurationException {
        super.afterPropertiesSet();
        ValidationUtility.checkNotNull(authorizationService, "authorizationService",
                        SecurityGroupConfigurationException.class);
        ValidationUtility.checkNotNull(userService, "userService", SecurityGroupConfigurationException.class);
        ValidationUtility.checkNotNull(emailBodyTemplateSourceId, "emailBodyTemplateSourceId",
                        SecurityGroupConfigurationException.class);
        ValidationUtility.checkNotNull(emailBodyTemplateName, "emailBodyTemplateName",
                        SecurityGroupConfigurationException.class);
        ValidationUtility.checkNotNull(emailSender, "emailSender", SecurityGroupConfigurationException.class);
    }

    /**
     * The setter of authorizationService
     * 
     * @param authorizationService
     *            the authorizationService to set
     */
    public void setAuthorizationService(AuthorizationService authorizationService) {
        this.authorizationService = authorizationService;
    }

    /**
     * The setter of userService
     * 
     * @param userService
     *            the userService to set
     */
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    /**
     * The setter of authorizationService
     * 
     * @param emailSubject
     *            emailSubject to set
     */
    public void setEmailSubject(String emailSubject) {
        this.emailSubject = emailSubject;
    }

    /**
     * The setter of emailBodyTemplateSourceId
     * 
     * @param emailBodyTemplateSourceId
     *            emailBodyTemplateSourceId to set
     */
    public void setEmailBodyTemplateSourceId(String emailBodyTemplateSourceId) {
        this.emailBodyTemplateSourceId = emailBodyTemplateSourceId;
    }

    /**
     * The setter of emailBodyTemplateName
     * 
     * @param emailBodyTemplateName
     *            emailBodyTemplateName to set
     */
    public void setEmailBodyTemplateName(String emailBodyTemplateName) {
        this.emailBodyTemplateName = emailBodyTemplateName;
    }

    /**
     * The setter of emailSender
     * 
     * @param emailSender
     *            emailSender to set
     */
    public void setEmailSender(String emailSender) {
        this.emailSender = emailSender;
    }

}
