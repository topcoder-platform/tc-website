package com.topcoder.web.TCES.common;

import java.util.*;
import	java.io.Serializable;

public class Lookup implements Serializable {

    private ArrayList list;


    public Lookup() {
        list = new ArrayList();
    }

    public void addPair(String value, String label) {
        list.add(new Pair(value, label));
    }

    public int getSize() {
        return list.size();
    }

    public String getValue(int i) {
        if (list.size() > i) {
            return ((Pair)(list.get(i))).getValue();
        }
        return null;
    }

    public String getLabel(int i) {
        if (list.size() > i) {
            return ((Pair)(list.get(i))).getLabel();
        }
        return null;
    }

    public String getSelectBox(String selectedValue, String name, String Xclass, String onChange) {
        StringBuffer r = new StringBuffer();
        r.append("<select ");
        if (name != null && !name.equals("")) {
            r.append("name=\"" + name + "\" ");
        }
        if (Xclass != null && !Xclass.equals("")) {
            r.append("class=\"" + Xclass + "\" ");
        }
        if (onChange != null && !onChange.equals("")) {
            r.append("onChange=\"" + onChange + "\" ");
        }
        r.append(">\n");
        for (int i = 0; i < list.size(); i++) {
            Pair p = (Pair)list.get(i);
            String v = p.getValue();
            String l = p.getLabel();
            String selectedString;
            if (v.equals(selectedValue)) {
                selectedString = "selected=\"selected\"";
            } else {
                selectedString = "";
            }
          
            r.append("    <option ");
            if (v != null && !v.equals("")) {
                r.append("value=\"" + v + "\" ");
            }
            r.append(selectedString + ">");
            r.append(l + "</option>\n");
        }
        r.append("</select>\n");
        return r.toString();
    }


    class Pair implements Serializable {


        private String value;
        private String label;

        Pair(String v, String l) {
            this.value = v;
            this.label = l;
        }   
        Pair() {
            value = "";
            label = "";
        }
        String getValue() {
            return value;
        }
        String getLabel() {
            return label;
        }
        void setLabel(String l) {
            label = l;
        }
        void setValue(String v) {
            value = v;
        }
    }

    public static void main(String[] arg) {
        Lookup look = new Lookup();
        look.addPair("1", "test1");
        look.addPair("2", "test2");
        System.out.println(look.getSelectBox("", "", "", ""));
        System.out.println(look.getLabel(0) + look.getValue(0));
    }
}
