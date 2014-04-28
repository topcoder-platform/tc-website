/*
* Copyright (C) 2014 TopCoder Inc., All Rights Reserved.
*/
package com.topcoder.web.common.dao.hibernate;

import org.hibernate.criterion.Restrictions;

import com.topcoder.web.common.dao.DocuSignEnvelopeDAO;
import com.topcoder.web.common.model.DocuSignEnvelope;
/**
 * It is the DAO of DocuSignEnvelope.
 *
 * Thread-safety.
 * The handler implementation should be effectively thread-safe.
 *
 * @author vangavroche, gonia_119
 * @version 1.0
 */
public class DocuSignEnvelopeDAOHibernate extends GenericBase<DocuSignEnvelope, String> implements DocuSignEnvelopeDAO {
    /**
     * An empty constructor.
     */
    public DocuSignEnvelopeDAOHibernate() {
        //empty constructor
    }
    /**
     * Find the complete envelope given the user ID and template ID.
     * Return null if not found.
     * @param templateId The template ID to be used to find the envelope.
     * @param userId The user ID to be used to find the envelope.
     * @return The found envelope, or null if not found.
     */
   public DocuSignEnvelope findCompletedEnvelope(String templateId, long userId) {
       return (DocuSignEnvelope) getSession().createCriteria(DocuSignEnvelope.class)
               .add(Restrictions.eq("templateId", templateId)).add(Restrictions.eq("userId", userId))
               .add(Restrictions.eq("completed", true)).uniqueResult();
   }
    /**
     * Create a new envelope (not completed), save it and return it.
     * @param templateId The template ID to be used to create the envelope.
     * @param userId The user ID to be used to create the envelope.
     * @param envelopeId The ID of the envelope. 
     * @return The new envelope.
     */
   public DocuSignEnvelope newEnvelope(String templateId, long userId, String envelopeId) {
       DocuSignEnvelope envelope = new DocuSignEnvelope();
       envelope.setEnvelopeId(envelopeId);
       envelope.setTemplateId(templateId);
       envelope.setUserId(userId);
       envelope.setCompleted(false);
       
       getSession().saveOrUpdate(envelope);
       
       return envelope;
   }
    /**
     * Complete the given envelope and return it.
     * @param envelopeId The ID of the envelope, state of which is to be updated as "completed".
     * @return The updated envelope.
     */
   public DocuSignEnvelope completeEnvelope(String envelopeId) {
       DocuSignEnvelope envelope = (DocuSignEnvelope) getSession().get(DocuSignEnvelope.class, envelopeId);
       if (envelope != null) {
           envelope.setCompleted(true);
           getSession().saveOrUpdate(envelope);
       }
       return envelope;
   }
}
