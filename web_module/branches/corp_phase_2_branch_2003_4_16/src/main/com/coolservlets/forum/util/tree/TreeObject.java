
/**
 *  TreeObject.java
 */

package com.coolservlets.forum.util.tree;

public abstract class TreeObject {

    private int type;

    public TreeObject(int type) {
        this.type = type;
    }
    public int getType() {
        return type;
    }
} 