/*
 * Copyright (C) 2011 - 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.hibernate;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.topcoder.commons.utils.LoggingWrapperUtility;
import com.topcoder.security.groups.model.BillingAccount;
import com.topcoder.security.groups.model.Client;
import com.topcoder.security.groups.services.BillingAccountService;
import com.topcoder.security.groups.services.EntityNotFoundException;
import com.topcoder.security.groups.services.SecurityGroupException;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;

/**
 * <p>
 * This is the implementation of interface defines the contract for the
 * retrieval of billing accounts
 * </p>
 * <p>
 * Thread Safety:Implementations are expected to be effectively thread-safe
 * </p>
 *
 * <p>
 * Version 1.1 (Release Assembly - TopCoder Security Groups Release 3) change notes:
 * <ol>
 *      <li>Modified method {@link #getBillingAccountsForClient(long)} to use the new query</li>
 * </ol>
 * </p>
 * 
 * <p>
 * Version 1.2 (Release Assembly - TopCoder Security Groups Release 4) change notes:
 * <ol>
 *      <li>Fix the bug of {@link #getBillingAccountsForClient(long)} of retrieving duplicated billing accounts.</li>
 * </ol>
 * </p>
 *
 * <p>
 * Version 1.3 (Release Assembly - TopCoder Security Groups Release 5) change notes:
 * <ol>
 *      <li>Updated {@link #getBillingAccountsForClient(long)} to sort the result.</li>
 * </ol>
 * </p>
 *
 * @author backstretlili, TCSASSEMBLER
 * 
 * @version 1.3
 * 
 */
public class HibernateBillingAccountService extends BaseGroupService implements BillingAccountService {

    /**
     * <p>
     * Represent the qualified name of this class.
     * </p>
     */
    private static final String CLASS_NAME = HibernateBillingAccountService.class.getName();

    /**
     * <p>
     * HQL to query billingAccount for a given id.
     * </p>
     */
    private static final String HQL_BILLING_ACCOUNT = "from BillingAccount ba where ba.id = :id and ba.deleted != true";

    /**
     * The DataAccess used to retrieve data from tcs_dw
     */
    private DataAccess dataAccess;

    /**
     * This method gets a billing account. If not found, returns null.
     * 
     * @param id
     *            the ID for the billing account to be retrieved
     * @return the requested BillingAccount
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    @SuppressWarnings("unchecked")
    public BillingAccount get(long id) throws SecurityGroupException {
        final String signature = CLASS_NAME + ".get(long id)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "id" }, new Object[] { id });

        BillingAccount result = null;
        try {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery(HQL_BILLING_ACCOUNT);
            query.setLong("id", id);
            List<BillingAccount> list = (List<BillingAccount>) query.list();
            if (list.size() > 0)
                result = list.get(0);
        } catch (HibernateException e) {
            wrapAndLogSecurityException(e, logger, signature);
        }

        LoggingWrapperUtility.logExit(logger, signature, new Object[] { result });

        return result;
    }

    /**
     * This method gets all billing accounts for the given client. If not found,
     * returns an empty list.
     * 
     * @param clientId
     *            the ID for the client
     * @return the billing accounts for the given client
     * @throws EntityNotFoundException
     *             If a client with the given ID was not found
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    public List<BillingAccount> getBillingAccountsForClient(long clientId) throws EntityNotFoundException,
            SecurityGroupException {
        final String signature = CLASS_NAME + ".getBillingAccountsForClient(long clientId)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "clientId" }, new Object[] { clientId });

        List<BillingAccount> result = new ArrayList<BillingAccount>();
        try {
            if (dataAccess == null)
                dataAccess = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
            Request request = new Request();
            ResultSetContainer resultContainer = null;
            request.setContentHandle("admin_client_billing_accounts_v2");
            resultContainer = dataAccess.getData(request).get("admin_client_billing_accounts_v2");
            Set<Long> ids = new HashSet<Long>();
            if (resultContainer != null) {
                for (ResultSetContainer.ResultSetRow row : resultContainer) {
                    if (clientId == row.getLongItem("client_id")
                        && !ids.contains(row.getLongItem("billing_account_id"))) {
                        BillingAccount dto = new BillingAccount();
                        Client client = new Client();
                        client.setId(row.getLongItem("client_id"));
                        client.setName(row.getStringItem("client_name"));
                        dto.setClient(client);
                        dto.setId(row.getLongItem("billing_account_id"));
                        dto.setName(row.getStringItem("billing_account_name"));
                        result.add(dto);
                        ids.add(row.getLongItem("billing_account_id"));
                    }
                }
            }
            Collections.sort(result, new Comparator<BillingAccount>() {
                public int compare(BillingAccount o1, BillingAccount o2) {
                    return o1.getName().compareToIgnoreCase(o2.getName());
                }
            });
        } catch (Exception e) {
            wrapAndLogSecurityException(e, logger, signature);
        }

        LoggingWrapperUtility.logExit(logger, signature, new Object[] { result });

        return result;
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
