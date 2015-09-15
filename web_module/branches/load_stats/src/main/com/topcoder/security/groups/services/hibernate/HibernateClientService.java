/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.hibernate;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.topcoder.commons.utils.LoggingWrapperUtility;
import com.topcoder.security.groups.model.Client;
import com.topcoder.security.groups.services.ClientService;
import com.topcoder.security.groups.services.SecurityGroupException;
import com.topcoder.security.groups.services.dto.ClientSearchCriteria;
import com.topcoder.security.groups.services.dto.PagedResult;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;

/**
 * <p>
 * This is the implementation of interface defines the contract for the retrieval of clients
 * </p>
 * <p>
 * Thread Safety:Implementations are expected to be effectively thread-safe
 * </p>
 * 
 * @author backstretlili
 * 
 * @version 1.0
 * 
 */
public class HibernateClientService extends BaseGroupService implements ClientService {

    /**
     * <p>
     * Represent the qualified name of this class.
     * </p>
     */
    private static final String CLASS_NAME = HibernateClientService.class.getName();

    /**
     * <p>
     * HQL to query billingAccount for a given id.
     * </p>
     */
    private static final String HQL_SEARCH_CLIENTS = "from Client c where c.deleted is null OR c.deleted != true";

    /**
     * <p>
     * HQL to query client for a given id.
     * </p>
     */
    private static final String HQL_GET_CLIENT = "from Client c where c.id = :id and (c.deleted is null or c.deleted != true)";

    /**
     * The DataAccess used to retrieve data from corporate_oltp
     */
    private DataAccess dataAccess;

    /**
     * This method gets all clients. If not found, returns an empty list.
     * 
     * @return the Clients
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    @SuppressWarnings("unchecked")
    public List<Client> getAllClients() throws SecurityGroupException {
        final String signature = CLASS_NAME + ".getAllClients()";
        LoggingWrapperUtility.logEntrance(logger, signature, null, null);

        List<Client> result = new ArrayList<Client>();
        try {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery(HQL_SEARCH_CLIENTS);
            List<Client> list = (List<Client>) query.list();
            result = list;
        } catch (HibernateException e) {
            wrapAndLogSecurityException(e, logger, signature);
        }

        LoggingWrapperUtility.logExit(logger, signature, new Object[] { result });

        return result;
    }

    /**
     * This method gets a client. If not found, returns null.
     * 
     * @param id
     *            the ID fo the client to be retrieved
     * @return the requested Client
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    @SuppressWarnings("unchecked")
    public Client get(long id) throws SecurityGroupException {
        final String signature = CLASS_NAME + ".get(long id)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "id" }, new Object[] { id });

        Client result = null;
        try {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery(HQL_GET_CLIENT);
            query.setLong("id", id);
            List<Client> list = (List<Client>) query.list();
            if (list.size() > 0)
                result = list.get(0);
        } catch (HibernateException e) {
            wrapAndLogSecurityException(e, logger, signature);
        }

        LoggingWrapperUtility.logExit(logger, signature, new Object[] { result });

        return result;
    }

    /**
     * This method retrieves the list of Clients for the given search criteria and paging requirements. The result will
     * not be null, and the inner list will also never be null.
     * 
     * @param criteria
     *            the filter with the search criteria: if null, assume no filtering
     * @param pageSize
     *            the size of the page to return. Will be a positive number, but ignored if page=0
     * @param page
     *            the 1-based number of the page to return. If 0, then all pages are returned
     * @return A result object with the list of applicable clients and the page and total data
     * @throws IllegalArgumentException
     *             If page < 0, or If pageSize < 1 unless page = 0
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    @SuppressWarnings("unchecked")
    public PagedResult<Client> search(ClientSearchCriteria criteria, int pageSize, int page)
                    throws IllegalArgumentException, SecurityGroupException {
        final String signature = CLASS_NAME + ".search(ClientSearchCriteria criteria, int pageSize, int page)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "criteria", "pageSize", "page" },
                        new Object[] { criteria, pageSize, page });

        if (page < 0 || (pageSize < 1 && page != 0)) {
            wrapAndLogIllegalArgumentException(new IllegalArgumentException("error page or pageSize"), logger,
                            signature);
        }

        PagedResult<Client> result = new PagedResult<Client>();
        result.setValues(new ArrayList<Client>());
        result.setTotal(0);
        result.setPage(page);
        try {
            StringBuilder hql = new StringBuilder(HQL_SEARCH_CLIENTS);
            // get projectId
            Long projectId = null;
            if (criteria.getProjectName() != null && criteria.getProjectName().length() > 0) {
                if (dataAccess == null)
                    dataAccess = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
                Request request = new Request();
                ResultSetContainer resultContainer = null;
                request.setContentHandle("project_id");
                request.setProperty("pname", criteria.getProjectName());
                resultContainer = dataAccess.getData(request).get("project_id");
                if (resultContainer != null) {
                    if (resultContainer.size() > 0) {
                        ResultSetContainer.ResultSetRow row = resultContainer.get(0);
                        projectId = row.getLongItem("project_id");
                    }
                }
                if (projectId == null) {
                    return result;
                }
            }

            if (projectId != null || criteria.getBillingAccountName() != null) {
                StringBuilder sb = new StringBuilder();
                if (projectId != null) {
                    sb.append(" ba.id = :projectId ");
                }
                if (criteria.getBillingAccountName() != null) {
                    if (sb.length() > 0)
                        sb.append(" and ");
                    sb.append(" ba.name = :billingAccountName ");
                }
                hql.append(" and c.id in(select ba.client.id from BillingAccount ba where " + sb.toString() + " ) ");
            }
            if (criteria.getClientName() != null) {
                hql.append(" and c.name = :clientName ");
            }
            Session session = sessionFactory.getCurrentSession();
            int row = 0, size = 0;
            if (page != 0) {
                row = (page - 1) * pageSize;
                size = pageSize;
            }
            Query query = session.createQuery(hql.toString());
            setCriterai(projectId, criteria, query);
            query.setFirstResult(row).setFetchSize(size);
            List<Client> list = (List<Client>) query.list();
            result.setValues(list);
            // set count 
            if (page != 0) {
                query = session.createQuery("select count(*) " + hql.toString());
                setCriterai(projectId, criteria, query);
                result.setTotal(Integer.valueOf(query.list().iterator().next().toString()).intValue());
            } else {
                result.setTotal(result.getValues().size());
            }
        } catch (Exception e) {
            wrapAndLogSecurityException(e, logger, signature);
        }

        if (result.getValues() == null)
            result.setValues(new ArrayList<Client>());

        LoggingWrapperUtility.logExit(logger, signature, new Object[] { result });

        return result;
    }

    /**
     * Set criteria to query
     * 
     * @param projectId
     *            the parameter projectId
     * @param criteria
     *            the criteria
     * @param query
     *            the query to set
     */
    private void setCriterai(Long projectId, ClientSearchCriteria criteria, Query query) {
        if (projectId != null)
            query.setLong("projectId", projectId);
        if (criteria.getBillingAccountName() != null)
            query.setString("billingAccountName", criteria.getBillingAccountName());
        if (criteria.getClientName() != null)
            query.setString("clientName", criteria.getClientName());
    }

    /**
     * The setter of dataAccess
     * 
     * @param dataAccess
     *            the dataAccess to set
     */
    public void setDataAccess(DataAccess dataAccess) {
        this.dataAccess = dataAccess;
    }
}
