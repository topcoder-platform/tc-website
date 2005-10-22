package com.topcoder.web.common.model;

import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Oct 20, 2005
 */
public class NavTree {

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
        NavNode ret=null;
        for (Iterator it = roots.iterator(); it.hasNext()&&ret==null;) {
            node = (NavNode)it.next();
            ret = search(node, key);
        }
        return ret;
    }

    private NavNode search(NavNode node, String key) {
        NavNode ret = null;
        if (node.getKey().equals(key)) {
            ret = node;
        } else {
            for (int i=0; i<node.getChildCount()&&ret==null; i++) {
                ret = search(node.getChildAt(i), key);
            }
        }
        return ret;
    }
}
