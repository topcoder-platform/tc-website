/*
 * Copyright (C) 2001 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao.hibernate;

import java.util.List;
import java.util.ArrayList;

import org.hibernate.Query;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.studio.dao.SubmissionDAO;
import com.topcoder.web.studio.dto.Submission;
import com.topcoder.web.studio.dto.Upload;

/**
 * <p>Hibernate implementation for the <code>Submission</code> DAO interface.</p>
 * 
 * <p>
 *   Version 1.1 (Re-platforming Studio Release 3 Assembly) Changes notes:
 *   <ol>
 *     <li>Logic to use contests hosted in <code>tcs_catalog</code> database instead of
 *     <code>studio_oltp</code> database.</li>
 *   </ol>
 * </p>
 *
 * @author dok, pvmagacho
 * @version 1.1
 */
public class SubmissionDAOHibernate extends Base implements SubmissionDAO {    
    /**
     * <p>Find by ID the <code>Submission</code> instance from persistence.</p>
     *
     * @param id the unique identifier for the <code>Submission</code> instance
     * @return the found <code>Submission</code> instance. <code>null</code> if not found.
     */    
    public Submission find(Integer id) {
        return (Submission) super.find(Submission.class, id);
    }

    /**
     * <p>Creates or updates the <code>Submission</code> instance in the persistence.</p>
     *
     * <p>When creating, an unique identifier is created by the database.</p>
     *
     * @param submission the <code>Submission</code> instance to be saved or updated
     * @since 1.1
     */    
    public void saveOrUpdate(Submission submission) {
        super.saveOrUpdate(submission);    
    }

    /**
     * <p>Gets the maximum user rank for all submission uploads.</p>
     *
     * @param uploads the list of submission uploads used to find the maximum rank
     * @return the maximum submission's user rank
     * @since 1.1
     */  
    public Integer getMaxRank(List<Upload> uploads) {
        if (uploads != null && uploads.size() > 0) {
            Query q = session.createQuery("select max(s.rank) from com.topcoder.web.studio.dto.Submission s " +
                "where s.upload in (:uploads)");
            q.setParameterList("uploads", uploads);

            return (Integer) q.uniqueResult();
        }
        
        return null;        
    }
    
    /**
     * <p>Changes the user rank for a given submission.</p>
     *
     * <p>Affects all submissions above or below, depending if the new rank is increasing or decreasing.</p>
     *
     * @param newRank the new user rank
     * @param s the <code>Submission</code> instance to be updated
     * @param uploads the list of submission uploads to use to find submission will be reordered
     * @since 1.1
     */    
    public void changeRank(Integer newRank, Submission s, List<Upload> uploads) {
        if (log.isDebugEnabled()) {
            log.debug("SubmissionDAO#changeRank: newRank = " + newRank + ", oldRank = " + s.getRank());
        }

        StringBuffer buf = new StringBuffer(100);
        buf.append("update com.topcoder.web.studio.dto.Submission s set rank = ");
        if (newRank == null && s.getRank() == null) {
            //do nothing, we're good
        } else if (newRank == null) {
            buf.append("rank-1 ");
            buf.append("where s.upload in (:uploads) and rank > :minrank and s.typeId = :typeId");

            Query q = session.createQuery(buf.toString());
            q.setParameterList("uploads", uploads);
            q.setInteger("minrank", s.getRank());
            q.setInteger("typeId", s.getTypeId());
            q.executeUpdate();

            s.setRank(newRank);
            saveOrUpdate(s);
            session.flush();
        } else if (s.getRank() == null) {
            buf.append("rank+1 ");
            buf.append("where s.upload in (:uploads) and rank between :minrank and :maxrank and " 
                    + " s.typeId = :typeId");

            Query q = session.createQuery(buf.toString());
            q.setParameterList("uploads", uploads);
            q.setInteger("minrank", newRank);
            q.setInteger("maxrank", Integer.MAX_VALUE);
            q.setInteger("typeId", s.getTypeId());
            q.executeUpdate();

            s.setRank(newRank);
            saveOrUpdate(s);
            session.flush();
        } else if (newRank.compareTo(s.getRank()) < 0) {
            //they's bumping it up, making it's rank better
            buf.append("rank+1 ");
            buf.append("where s.upload in (:uploads) and rank between :minrank and :maxrank and " 
                    + " s.typeId = :typeId");

            Query q = session.createQuery(buf.toString());
            q.setParameterList("uploads", uploads);
            q.setInteger("minrank", newRank);
            q.setInteger("maxrank", s.getRank() - 1);
            q.setInteger("typeId", s.getTypeId());
            q.executeUpdate();

            s.setRank(newRank);
            saveOrUpdate(s);
            session.flush();
        } else if (newRank.compareTo(s.getRank()) > 0) {
            //they're dropping it down, making it's rank worse
            buf.append("rank-1 ");
            buf.append("where s.upload in (:uploads) and rank between :minrank and :maxrank and " 
                    + " s.typeId = :typeId");
            
            Query q = session.createQuery(buf.toString());
            q.setParameterList("uploads", uploads);
            q.setInteger("minrank", s.getRank() + 1);
            q.setInteger("maxrank", newRank);
            q.setInteger("typeId", s.getTypeId());
            q.executeUpdate();

            s.setRank(newRank);
            saveOrUpdate(s);
            session.flush();
        }
    }

    /**
     * <p>Finds a list of <code>Submission</code> instances from persistence.</p>
     *
     * @param uploads the list of submission uploads used to find the submission
     * @param submissionTypeIds the  ids of submission type
     * @param submissionStatusIds the ids of submission status
     * @return a list with <code>Submission</code> instance or <code>null</code> if none is found.
     */
    @SuppressWarnings("unchecked")
    public List<Submission> getSubmissions(List<Upload> uploads, List<Integer> submissionTypeIds, List<Integer> submissionStatusIds) {
        Query q = session.createQuery("from com.topcoder.web.studio.dto.Submission s " +
                "where s.upload in (:uploads) " +
                "and s.typeId in (:typeId) " +
                "and s.statusId in (:statusId) " +
                "order by typeId, case when s.rank is null then 10000 else s.rank end asc");
        q.setParameterList("uploads", uploads);
        q.setParameterList("typeId", submissionTypeIds);
        q.setParameterList("statusId", submissionStatusIds);
        return q.list();
    }
    
    /**
     * <p>Finds a list of <code>Submission</code> instances from persistence.</p>
     *
     * @param uploads the list of submission uploads used to find the submission
     * @param submissionTypeId the submission type identifier
     * @param submissionStatusId the ids of submission status
     * @return a list with <code>Submission</code> instance or <code>null</code> if none is found.
     */
    @SuppressWarnings("unchecked")
    public List<Submission> getSubmissions(List<Upload> uploads, Integer submissionTypeId, Integer submissionStatusId) {
        List<Integer> statusIds = new ArrayList<Integer>();
        statusIds.add(submissionStatusId);
        
        List<Integer> typeIds = new ArrayList<Integer>();
        return getSubmissions(uploads, typeIds, statusIds);
    }
}
