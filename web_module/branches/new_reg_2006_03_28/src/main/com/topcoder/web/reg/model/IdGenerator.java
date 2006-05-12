package com.topcoder.web.reg.model;

import com.topcoder.web.common.IdGeneratorClient;
import com.topcoder.shared.util.logging.Logger;
import org.hibernate.HibernateException;
import org.hibernate.dialect.Dialect;
import org.hibernate.engine.SessionImplementor;
import org.hibernate.id.Configurable;
import org.hibernate.id.IdentifierGenerator;
import org.hibernate.type.Type;

import java.io.Serializable;
import java.util.Properties;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 31, 2006
 */
public class IdGenerator implements IdentifierGenerator, Configurable {
    protected static final Logger log = Logger.getLogger(IdGenerator.class);
    public String SEQUENCE_NAME = "sequence_name";

    private String seqName = null;

    public void configure(Type type, Properties params, Dialect d) {
        seqName = (String)params.get(SEQUENCE_NAME);
    }

    public Serializable generate(SessionImplementor session, Object object) throws HibernateException {
        if (seqName==null) {
            throw new HibernateException("Sequence Name not specified in configuration.");
        }

        try {
            long id = IdGeneratorClient.getSeqId(seqName);
            //log.debug("returning " + id);
            return new Long(id);
        } catch (Exception e) {
            throw new HibernateException(e);
        }


    }
}

