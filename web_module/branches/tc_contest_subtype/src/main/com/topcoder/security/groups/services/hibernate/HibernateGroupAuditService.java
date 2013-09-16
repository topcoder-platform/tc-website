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
import com.topcoder.security.groups.model.GroupAuditRecord;
import com.topcoder.security.groups.services.GroupAuditService;
import com.topcoder.security.groups.services.SecurityGroupException;
import com.topcoder.security.groups.services.dto.PagedResult;

/**
 * <p>
 * This interface defines the contract for the creation and searching of audits
 * </p>
 * 
 * <p>
 * Thread Safety:Implementations are expected to be effectively thread-safe
 * </p>
 * 
 * @author backstretlili
 * 
 * @version 1.0
 */
public class HibernateGroupAuditService extends BaseGroupService implements GroupAuditService {

    /**
     * <p>
     * Represent the qualified name of this class.
     * </p>
     */
    private static final String CLASS_NAME = HibernateGroupAuditService.class.getName();

    /**
     * <p>
     * HQL to search AuditRecord .
     * </p>
     */
    private static final String HQL_SEARCH_AUDIT_RECORD = "from GroupAuditRecord gar ";

    /**
     * This method creates a new group audit record, and returns its ID.
     * 
     * @param record
     *            the GroupAuditRecord to create
     * @return the ID of the created Group
     * @throws IllegalArgumentException
     *             If group is null
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     * 
     */
    public long add(GroupAuditRecord record) throws IllegalArgumentException, SecurityGroupException {
        final String signature = CLASS_NAME + ".add(GroupAuditRecord record)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "record" }, new Object[] { record });

        if (record == null) {
            wrapAndLogIllegalArgumentException(new IllegalArgumentException("record is null"), logger, signature);
        }

        try {
            Session session = sessionFactory.getCurrentSession();
            session.persist(record);
        } catch (HibernateException e) {
            wrapAndLogSecurityException(e, logger, signature);
        }

        LoggingWrapperUtility.logExit(logger, signature, new Object[] { record.getId() });

        return record.getId();
    }

    /**
     * This method retrieves the list of audit records for the given paging requirements. The result will not be null,
     * and the inner list will also never be null.
     * 
     * @param page
     *            the 1-based number of the page to return. If 0, then all pages are returned
     * @param pageSize
     *            the size of the page to return. Will be a positive number, but ignored if page=0
     * @return A result object with the list of applicable audit records and the page and total data
     * @throws IllegalArgumentException
     *             If page < 0 or If pageSize < 1 unless page = 0
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     * 
     */
    @SuppressWarnings("unchecked")
    public PagedResult<GroupAuditRecord> searchAuditRecords(int pageSize, int page) throws IllegalArgumentException,
                    SecurityGroupException {
        final String signature = CLASS_NAME + ".searchAuditRecords(int pageSize, int page)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "pageSize", "page" }, new Object[] {
                        pageSize, page });

        if (page < 0 || (pageSize < 1 && page != 0)) {
            wrapAndLogIllegalArgumentException(new IllegalArgumentException("error page or pageSize"), logger,
                            signature);
        }

        PagedResult<GroupAuditRecord> result = new PagedResult<GroupAuditRecord>();
        result.setValues(new ArrayList<GroupAuditRecord>());
        result.setTotal(0);
        result.setPage(page);
        try {
            Session session = sessionFactory.getCurrentSession();
            int row = 0, size = 0;
            if (page != 0) {
                row = (page - 1) * pageSize;
                size = pageSize;
            }
            Query query = session.createQuery(HQL_SEARCH_AUDIT_RECORD);
            query.setFirstResult(row).setFetchSize(size);
            List<GroupAuditRecord> list = (List<GroupAuditRecord>) query.list();
            result.setValues(list);
            // set count
            if (page != 0) {
                query = session.createQuery("select count(*) " + HQL_SEARCH_AUDIT_RECORD);
                result.setTotal(Integer.valueOf(query.list().iterator().next().toString()).intValue());
            } else {
                result.setTotal(result.getValues().size());
            }
        } catch (Exception e) {
            wrapAndLogSecurityException(e, logger, signature);
        }

        if (result.getValues() == null)
            result.setValues(new ArrayList<GroupAuditRecord>());

        LoggingWrapperUtility.logExit(logger, signature, new Object[] { result });

        return result;
    }
}
