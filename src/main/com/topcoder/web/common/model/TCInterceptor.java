package com.topcoder.web.common.model;

import com.topcoder.shared.util.logging.Logger;
import org.hibernate.EmptyInterceptor;
import org.hibernate.type.Type;

import java.io.Serializable;

/**
 * We'll use this to set the isNew flag on our data objects.
 *
 * @author dok
 * @version $Revision: 66662 $ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class TCInterceptor extends EmptyInterceptor {
    protected static final Logger log = Logger.getLogger(TCInterceptor.class);

    public Boolean isTransient(Object entity) {
        if (entity instanceof Base) {
            return Boolean.valueOf(((Base) entity).isNew());
        } else {
            return null;
        }
    }

    public String onPrepareStatement(String string) {
        //log.debug("sql: " + string);
        return super.onPrepareStatement(string);
    }

    public boolean onLoad(Object entity,
                          Serializable id,
                          Object[] state,
                          String[] propertyNames,
                          Type[] types) {

        if (entity instanceof Base) {
            ((Base) entity).setNew(false);
        }
        return false;
    }

    public boolean onSave(Object entity,
                          Serializable id,
                          Object[] state,
                          String[] propertyNames,
                          Type[] types) {
        if (entity instanceof Base) {
            ((Base) entity).setNew(false);
        }
        return false;
    }

}
