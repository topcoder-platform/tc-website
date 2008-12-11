package com.topcoder.web.reg;

import com.topcoder.shared.util.logging.Logger;
import org.hibernate.event.SaveOrUpdateEventListener;

/**
 * @author dok
 * @version $Revision: 45940 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 3, 2006
 */
public class SaveListener implements SaveOrUpdateEventListener {
    protected static final Logger log = Logger.getLogger(SaveListener.class);

    public void onSaveOrUpdate(org.hibernate.event.SaveOrUpdateEvent saveOrUpdateEvent) throws org.hibernate.HibernateException {
        log.debug("name: " + saveOrUpdateEvent.getEntityName());
        Thread.dumpStack();
    }

}
