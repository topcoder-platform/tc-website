package com.topcoder.web.common.model;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.IdGeneratorClient;
import com.topcoder.web.common.StringUtils;
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
 * @version $Revision: 59197 $ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 31, 2006
 */
public class IdGenerator implements IdentifierGenerator, Configurable {
    protected static final Logger log = Logger.getLogger(IdGenerator.class);
    public String SEQUENCE_NAME = "sequence_name";
    public String RETURN_CLASS = "return_class";

    private String seqName = null;
    private Class returnClass = null;

    public void configure(Type type, Properties params, Dialect d) {
        seqName = (String) params.get(SEQUENCE_NAME);
        String className = (String) params.get(RETURN_CLASS);
        if ("".equals(StringUtils.checkNull(className))) {
            returnClass = Long.class;
        } else {
            try {
                returnClass = Class.forName(className);
            } catch (ClassNotFoundException e) {
                //if the user screwed up the config, just use Long
                log.warn("ClassNotFound: " + params.get(RETURN_CLASS) + ", using Long instead");
                returnClass = Long.class;
            }
        }
    }

    public Serializable generate(SessionImplementor session, Object object) throws HibernateException {
        if (seqName == null) {
            throw new HibernateException("Sequence Name not specified in configuration.");
        }
        try {
            if (log.isDebugEnabled()) {
                log.debug("our return class will be " + returnClass.getName());
            }
            long id = IdGeneratorClient.getSeqId(seqName);
            return (Number)returnClass.getConstructor(new Class[]{String.class}).newInstance(new String[]{String.valueOf(id)});
        } catch (Exception e) {
            throw new HibernateException(e);
        }


    }
}

