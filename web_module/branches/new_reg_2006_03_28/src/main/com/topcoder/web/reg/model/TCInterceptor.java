package com.topcoder.web.reg.model;

import com.topcoder.shared.util.logging.Logger;
import org.hibernate.EmptyInterceptor;
import org.hibernate.type.Type;

import java.io.Serializable;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class TCInterceptor extends EmptyInterceptor {
    protected static final Logger log = Logger.getLogger(TCInterceptor.class);

    public Boolean isTransient(Object entity) {
        if (entity instanceof AlgoRating) {
            return Boolean.valueOf(((AlgoRating) entity).isNew());
        } else {
            return null;
        }
    }

    public boolean onLoad(Object entity,
                          Serializable id,
                          Object[] state,
                          String[] propertyNames,
                          Type[] types) {

        if (entity instanceof AlgoRating) {
            ((AlgoRating) entity).setNew(false);
        }
        return false;
    }

    public boolean onSave(Object entity,
                          Serializable id,
                          Object[] state,
                          String[] propertyNames,
                          Type[] types) {
        if (entity instanceof AlgoRating) {
            ((AlgoRating) entity).setNew(false);
        }
        return false;
    }

}
