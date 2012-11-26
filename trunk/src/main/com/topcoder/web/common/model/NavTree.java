package com.topcoder.web.common.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Oct 20, 2005
 */
public class NavTree implements Serializable {

    private List roots = null;

    public NavTree() {
        this.roots = new ArrayList(5);
    }

    public NavTree(List roots) {
        this.roots = roots;
    }

    public void addRoot(NavNode root) {
        this.roots.add(root);
    }

    public Iterator getRoots() {
        return this.roots.iterator();
    }

    public NavNode search(String key) {
        NavNode node;
        NavNode ret = null;
        for (Iterator it = roots.iterator(); it.hasNext() && ret == null;) {
            node = (NavNode) it.next();
            ret = node.search(key);
        }
        return ret;
    }

}
