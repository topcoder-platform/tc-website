/**
 *  Tree.java
 */

package com.coolservlets.forum.util.tree;

import java.util.Vector;

public class Tree implements TreeInterface {

    private Vector children;
    private int selected;
    private String name;

    public static int NODE = 0;
    public static int LEAF = 1;

    public Tree() {
        children = new Vector();
    }

    public Tree(String name) {
        this.name = name;
        children = new Vector();
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSelected() {
        return this.selected;
    }

    public void setSelected(int selected) {
        this.selected = selected;
    }

    public void addChild(TreeObject child) {
        children.addElement(child);
    }

    public TreeObject getChild(int index) {
        return (TreeObject) children.elementAt(index);
    }

    public int size() {
        return children.size();
    }
}
