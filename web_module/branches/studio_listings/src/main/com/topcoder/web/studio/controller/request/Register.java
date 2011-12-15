/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.dao.TermsOfUseDAO;
import com.topcoder.web.common.model.TermsOfUse;
import com.topcoder.web.common.model.User;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.DAOFactory;
import com.topcoder.web.studio.dao.DAOUtil;
import com.topcoder.web.studio.dto.Project;
import com.topcoder.web.studio.dto.Resource;
import com.topcoder.web.studio.dto.ResourceInfo;
import com.topcoder.web.studio.dto.ResourceRole;

/**
 * <p>This class will process a contest registration request.</p>
 *
 * <p>
 *   Version 1.1 (Configurable Contest Terms-Studio Release Assembly v1.0) Change notes:
 *   <ol>
 *     <li>Added new terms of use processing.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.2 (Re-platforming Studio Release 2 Assembly) Change notes:
 *   <ol>
 *     <li>Updated {@link #dbProcessing()} method to perform registration over contests hosted in
 *     <code>tcs_catalog</code> instead of <code>studio_oltp</code> database.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.3 (Replatforming Studio Release 5) change notes:
 *   <ol>
 *     <li>Using the dto classes in com.topcoder.web.studio.dto package instead of in com.topcoder.web.common.model.comp package.</li>
 *   </ol>
 * </p>
 * 
 * @author dok, pulky, isv, TCSASSEMBER
 * @version 1.3
 */
public class Register extends ShortHibernateProcessor {

    /**
     * <p>Constructs new <code>Register</code> instance. This implementation does nothing.</p>
     * 
     * @since 1.2
     */
    public Register() {
    }

    /**
     * This method executes the actual business logic for this processor.
     *
     * @throws Exception if any error occurs
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    protected void dbProcessing() throws Exception {
        TCRequest request = getRequest();
        
        if (userLoggedIn()) {
            if ("POST".equals(request.getMethod())) {
                Long contestId;
                try {
                    contestId = new Long(request.getParameter(Constants.CONTEST_ID));
                } catch (NumberFormatException e) {
                    throw new NavigationException("Invalid Contest Specified");
                }

                DAOFactory factory = DAOUtil.getFactory();
                TermsOfUseDAO termsOfUse = factory.getTermsOfUse();
                
                Project c = factory.getProjectDAO().find(contestId.intValue());
                long userId = getUser().getId();
                User u = factory.getUserDAO().find(userId);

                boolean bother = true;

                // only bother if the user is not a professional (tccc)
                // comment this line if not needed
//                bother = !CoderType.PROFESSIONAL.equals(u.getCoder().getCoderType().getId());
  //              log.debug("Coder type: " + u.getCoder().getCoderType().getDescription());
                log.debug("Bother: " + bother);

                if (RegistrationHelper.getSubmitterResource(c, u.getId()) == null) {
                    String termsOfUseId = StringUtils.checkNull(request.getParameter(Constants.TERMS_OF_USE_ID));
                    if (!"".equals(termsOfUseId)) {
                        if ("on".equals(request.getParameter(Constants.TERMS_AGREE))) {
                            log.debug("agreed to terms");
                            // add user terms of use record
                            TermsOfUse tou = termsOfUse.find(Integer.parseInt(termsOfUseId));
                            u.addTerms(tou);
                        } else {
                            addError(Constants.TERMS_AGREE, "You must agree to the terms in order to continue.");
                        }

                        // process terms of use
                        RegistrationHelper.processTermsOfUse(request, c.getId().longValue(), u, 
                                                             RegistrationHelper.REGISTRANT_ROLE_IDS);
                        backToTermsResponse(request, c);
                        return;
                    } else {
                        // make sure user don't have pending terms of use (he could get here faking the URL)
                        if (RegistrationHelper.processTermsOfUse(request, c.getId().longValue(), u, 
                                                                 RegistrationHelper.REGISTRANT_ROLE_IDS)) {
                            backToTermsResponse(request, c);
                            return;
                        }

                        //if contest is part of an event, and user is registered for the event, and
                        //they are overriding the warning then allow them to register
                        boolean isApproved = false;
                        if (bother && c.getEventId() != null) {
                            log.debug("event not null");
                            if (factory.getEventRegistrationDAO().find(userId, c.getEventId()) == null) {
                                log.debug("user not registered");
                                if (String.valueOf(true).equals(request.getParameter(Constants.REG_CONFIRM))) {
                                    log.debug("user confirmed");
                                    isApproved = true;
                                }
                            } else {
                                log.debug("user registered");
                                isApproved = true;
                            }
                        } else {
                            log.debug("no event");
                            isApproved = true;
                        }

                        if (isApproved) {
                            createSubmitterResource(factory, c, userId);
                            factory.getNotificationDAO().setTimelineNotification(c.getId(), userId);
                        } else {
                            addError(Constants.REG_CONFIRM, "");
                            setDefault(Constants.CONTEST_ID, c.getId());
                            setDefault(Constants.REG_CONFIRM, String.valueOf(true));
                            setNextPage("/eventConfirm.jsp");
                            setIsNextPageInContext(true);
                        }
                    }
                }

                if (!hasErrors()) {
                    StringBuffer buf = new StringBuffer(50);
                    buf.append(getSessionInfo().getServletPath());
                    buf.append("?" + Constants.MODULE_KEY + "=ViewContestDetails&");
                    buf.append(Constants.CONTEST_ID + "=").append(contestId);
                    setNextPage(buf.toString());
                    setIsNextPageInContext(false);
                }
            } else {
                throw new NavigationException("Invalid request type.");
            }

        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

    }

    /**
     * Private helper method to prepare request to go back to the terms page
     *
     * @param request the request being processed
     * @param contest the inquired contest
     * @since 1.1
     */
    private void backToTermsResponse(TCRequest request, Project contest) {
        setDefault(Constants.CONTEST_ID, contest.getId().toString());
        request.setAttribute("contest", contest);
        setNextPage("/contestReg.jsp");
        setIsNextPageInContext(true);
    }

    /**
     * <p>Creates new resource of <code>Submitter</code> role for specified user in context of specified project.</p>
     * 
     * @param factory a <code>DAOFactory</code> providing the DAO factory. 
     * @param project a <code>Project</code>  
     * @param userId a <code>long</code> providing the user ID.
     */
    private void createSubmitterResource(DAOFactory factory, Project project, long userId) {

        Date now = new Date();
        Resource resource = new Resource();
        resource.setProjectId(project.getId().longValue());
        ResourceRole role = new ResourceRole();
        role.setId(ResourceRole.SUBMITTER_RESOURCE_ROLE_ID.intValue());
        resource.setRole(role);
        resource.setCreateUser(String.valueOf(userId));
        resource.setCreateDate(now);
        resource.setModifyUser(String.valueOf(userId));
        resource.setModifyDate(now);

        ResourceInfo userIdResourceInfo = new ResourceInfo();
        userIdResourceInfo.setId(new ResourceInfo.Identifier(resource, 1L));
        userIdResourceInfo.setValue(String.valueOf(userId));
        userIdResourceInfo.setCreateUser(String.valueOf(userId));
        userIdResourceInfo.setCreateDate(now);
        userIdResourceInfo.setModifyUser(String.valueOf(userId));
        userIdResourceInfo.setModifyDate(now);

        ResourceInfo userNameResourceInfo = new ResourceInfo();
        userNameResourceInfo.setId(new ResourceInfo.Identifier(resource, 2L));
        userNameResourceInfo.setValue(getLoggedInUser().getUserName());
        userNameResourceInfo.setCreateUser(String.valueOf(userId));
        userNameResourceInfo.setCreateDate(now);
        userNameResourceInfo.setModifyUser(String.valueOf(userId));
        userNameResourceInfo.setModifyDate(now);

        DateFormat df = new SimpleDateFormat("MM.dd.yyyy hh:mm aa");
        ResourceInfo regDateResourceInfo = new ResourceInfo();
        regDateResourceInfo.setId(new ResourceInfo.Identifier(resource, 6L));
        regDateResourceInfo.setValue(df.format(now));
        regDateResourceInfo.setCreateUser(String.valueOf(userId));
        regDateResourceInfo.setCreateDate(now);
        regDateResourceInfo.setModifyUser(String.valueOf(userId));
        regDateResourceInfo.setModifyDate(now);

        ResourceInfo paymentStatusResourceInfo = new ResourceInfo();
        paymentStatusResourceInfo.setId(new ResourceInfo.Identifier(resource, 8L));
        paymentStatusResourceInfo.setValue("N/A");
        paymentStatusResourceInfo.setCreateUser(String.valueOf(userId));
        paymentStatusResourceInfo.setCreateDate(now);
        paymentStatusResourceInfo.setModifyUser(String.valueOf(userId));
        paymentStatusResourceInfo.setModifyDate(now);

        Set<ResourceInfo> infos = new HashSet<ResourceInfo>();
        infos.add(userIdResourceInfo);
        infos.add(userNameResourceInfo);
        infos.add(regDateResourceInfo);
        infos.add(paymentStatusResourceInfo);
        resource.setInfo(infos);

        factory.getResourceDAO().createResource(resource);
    }
}
