package com.topcoder.web.common.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Oct 20, 2005
 */
public class NavNode implements Serializable {

    private List children = null;
    private boolean leaf = true;
    private String contents = null;
    private String key = null;
    private NavNode parent = null;
    private String href = null;
    private boolean isLink = false;
    private String onClick = null;

    public NavNode() {
        this.children = null;
        this.leaf = true;
    }

    public NavNode(String contents, String key) {
        this();
        this.contents = contents;
        this.key = key;
    }

    public NavNode(String href, String contents, String key) {
        this();
        this.href = href;
        this.contents = contents;
        this.key = key;
        this.isLink = true;
    }

    public NavNode(String href, String onClick, String contents, String key) {
        this();
        this.href = href;
        this.contents = contents;
        this.key = key;
        this.isLink = true;
        this.onClick = onClick;
    }

    public NavNode[] getChildren() {
        return (NavNode[]) children.toArray(new NavNode[0]);
    }

    public void setChildren(NavNode[] children) {
        this.children = new ArrayList(children.length);
        for (int i = 0; i < children.length; i++) {
            children[i].parent = (this);
            this.children.add(children[i]);
        }
    }

    public NavNode getChildAt(int index) {
        return (NavNode) children.get(index);
    }

    public int getChildCount() {
        if (children != null) {
            return children.size();
        } else {
            return 0;
        }
    }

    public void addChild(NavNode child) {
        child.parent = this;
        if (children == null) {
            children = new ArrayList(5);
            children.add(child);
            this.leaf = false;
        } else {
            children.add(child);
        }
    }

    public boolean isLeaf() {
        return leaf;
    }

    public String getContents() {
        return contents;
    }

    public String getKey() {
        return key;
    }

    public NavNode search(String key) {
        NavNode ret = null;
        if (getKey().equals(key)) {
            ret = this;
        } else {
            for (int i = 0; i < getChildCount() && ret == null; i++) {
                ret = search(getChildAt(i), key);
            }
        }
        return ret;
    }

    private NavNode search(NavNode node, String key) {
        NavNode ret = null;
        if (node.getKey().equals(key)) {
            ret = node;
        } else {
            for (int i = 0; i < node.getChildCount() && ret == null; i++) {
                ret = search(node.getChildAt(i), key);
            }
        }
        return ret;
    }


    public String getHref() {
        return href;
    }

    public boolean isLink() {
        return isLink;
    }

    public NavNode getParent() {
        return parent;
    }

    public String getOnClick() {
        return onClick;
    }

    public boolean equals(Object o) {
        if (o == null) {
            return false;
        }

        try {
            NavNode other = (NavNode) o;
            return other.getKey().equals(key);
        } catch (ClassCastException e) {
            return false;
        }
    }
}
