package com.topcoder.common.web.data;

import java.io.Serializable;


public class TreeNode implements Serializable {

    private TreeNode[] children = null;
    private boolean isLeaf = true;
    private Object contents = null;

    public TreeNode() {
        this.children = null;
        this.isLeaf = true;
        this.contents = new Object();
    }

    public TreeNode(Object contents) {
        this.children = null;
        this.isLeaf = true;
        this.contents = contents;
    }

    public TreeNode[] getChildren() {
        return children;
    }

    public void setChildren(TreeNode[] children) {
        this.children = children;
    }

    public TreeNode getChildAt(int index) {
        return children[index];
    }

    public int getChildCount() {
        if (children != null)
            return children.length;
        else
            return 0;
    }

    public void addChild(TreeNode child) {
        if (children == null) {
            children = new TreeNode[1];
            children[0] = child;
            this.isLeaf = false;
        } else {
            TreeNode[] newChildren = new TreeNode[children.length + 1];
            for (int i = 0; i < children.length; i++) {
                newChildren[i] = children[i];
            }
            newChildren[newChildren.length - 1] = child;
            children = newChildren;
        }
    }

    public boolean isLeaf() {
        return isLeaf;
    }

    public Object getContents() {
        return contents;
    }

}

