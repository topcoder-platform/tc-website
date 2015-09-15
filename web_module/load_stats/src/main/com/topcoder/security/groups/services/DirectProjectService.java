/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services;

import java.util.List;

import com.topcoder.security.groups.model.BillingAccount;
import com.topcoder.security.groups.services.dto.ProjectDTO;

/**
 * <p>
 * This interface defines the contract for the retrieval of projects
 * </p>
 * <p>
 * Thread Safety:Implementations are expected to be effectively thread-safe
 * </p>
 * 
 * <p>
 * Version 1.1 (TopCoder Security Groups - Direct Permission Mechanism Update) change notes:
 * <ol>
 *      <li>Added {@link #getProjectsByBillingAccounts(List)} to get projects from billing accounts.</li>
 * </ol>
 * </p>
 * 
 * @author TCSASSEMBLER, notpad
 * 
 * @version 1.1
 * 
 */
public interface DirectProjectService {

    /**
     * This method gets a project. If not found, returns null.
     * 
     * @param id
     *            the ID for the project to be retrieved
     * @return the requested ProjectDTO
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    public ProjectDTO get(long id) throws SecurityGroupException;

    /**
     * This method gets all projects of the given client. If not found, returns
     * an empty list.
     * 
     * @param id
     *            the ID for the client
     * @return the projects of the given client
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    public List<ProjectDTO> getProjectsByClientId(long id) throws  SecurityGroupException;
    
    /**
     * This method gets all projects associated to the given billing accounts. If not found, returns
     * an empty list.
     * 
     * @param id
     *            the billing accounts
     * @return the projects associated to the given billing accounts
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    public List<ProjectDTO> getProjectsByBillingAccounts(List<BillingAccount> billingAccounts) throws SecurityGroupException;
}
