/**
 * AdminBean.java
 * July, 2000
 */

package com.coolservlets.forum.util.admin;

import com.coolservlets.forum.Authorization;
import com.coolservlets.forum.util.tree.Tree;

import java.util.Hashtable;

/**
 * The AdminBean is designed to be used in the Jive admin tool as a way
 * to keep state in various elements of the tool.
 */
public class AdminBean {

    private Authorization authToken;
    private Hashtable trees;

    public AdminBean() {
        trees = new Hashtable();
    }

    public Authorization getAuthToken() {
        return this.authToken;
    }

    public void setAuthToken(Authorization authToken) {
        this.authToken = authToken;
    }

    public void resetAuthToken() {
        this.authToken = null;
    }

    public Tree getTree(String name) {
        return (Tree) trees.get(name);
    }

    public void addTree(String name, Tree tree) {
        this.trees.put(name, tree);
    }

    public void removeTree(String name) {
        this.trees.remove(name);
    }

}
