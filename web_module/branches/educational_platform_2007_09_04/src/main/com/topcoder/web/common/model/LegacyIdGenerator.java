package com.topcoder.web.common.model;

import java.io.Serializable;
import java.util.Properties;

import org.hibernate.HibernateException;
import org.hibernate.dialect.Dialect;
import org.hibernate.engine.SessionImplementor;
import org.hibernate.id.Configurable;
import org.hibernate.id.IdentifierGenerator;
import org.hibernate.type.Type;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.StringUtils;

/**
 * This is a IdentifierGenerator implementation for old sequences such as Contest, Rounds, etc.
 * 
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 31, 2006
 */
public class LegacyIdGenerator implements IdentifierGenerator, Configurable {
    protected static final Logger log = Logger.getLogger(LegacyIdGenerator.class);
    public String SEQUENCE = "sequence";
    public String RETURN_CLASS = "return_class";

    private int sequence = -1;
    private Class returnClass = null;

    public void configure(Type type, Properties params, Dialect d) {
        sequence = Integer.parseInt((String)params.get(SEQUENCE));
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
        if (sequence == -1) {
            throw new HibernateException("Sequence not specified in configuration.");
        }
        try {
            if (log.isDebugEnabled()) {
                log.debug("our return class will be " + returnClass.getName());
            }
            int id = DBMS.getSeqId(sequence);
            return (Number)returnClass.getConstructor(new Class[]{String.class}).newInstance(new String[]{String.valueOf(id)});
        } catch (Exception e) {
            throw new HibernateException(e);
        }
    }
}

