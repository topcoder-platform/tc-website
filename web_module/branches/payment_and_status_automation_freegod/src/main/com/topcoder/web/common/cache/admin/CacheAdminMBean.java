package com.topcoder.web.common.cache.admin;

import java.util.Set;

import org.jboss.system.ServiceMBean;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 2, 2007
 */
public interface CacheAdminMBean extends ServiceMBean {
    void clearAll();

    void clear(String fqn);

    String removelike(String s);
    
    String listLike(String s);

    String removelike(Set<String> s);

    int size();

    int size(String fqn);

    String sizeOverview();

}
