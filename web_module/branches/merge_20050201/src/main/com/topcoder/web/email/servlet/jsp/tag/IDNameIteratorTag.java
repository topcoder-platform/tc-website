package com.topcoder.web.email.servlet.jsp.tag;


import com.topcoder.web.email.bean.IDName;

import javax.servlet.jsp.JspException;
import java.util.*;


/**

 * Abstract class that iterates through a list

 * of IDName objects.

 *

 * @author	James Lee (jameslee@cs.stanford.edu)

 * @version	1.0

 *

 */


public abstract class IDNameIteratorTag

        extends IteratorTag {

    // map from Integer id -> String name

    protected Map idToNameMap;


    abstract Map getIdToNameMap() throws JspException;


    /**

     * Sorts ID's based on the elements they map to in idToNameMap.

     * Override this method to provide custom sorting behavior.

     *

     * @param ids	Object[] containing ID's that map to names

     */


    void sortIDs(Object[] ids) {

        Arrays.sort(ids, new Comparator() {

            public int compare(Object o1, Object o2) {

                return ((Comparable) idToNameMap.get(o1)).compareTo(idToNameMap.get(o2));

            }

        });

    }


    public int doStartTag()

            throws JspException {

        idToNameMap = getIdToNameMap();

        setCollection(idToNameMap.keySet());

        sortIDs(elementArray);


        return super.doStartTag();

    }


    Object getElementAt(int index) {

        Object element = super.getElementAt(index);

        if (element != null) {

            IDName idName = new IDName();


            String id = String.valueOf(element);

            String name = (String) idToNameMap.get(new Integer(id));


            idName.setId(id);

            idName.setName(name);


            return idName;

        } else {

            return null;

        }

    }


    public void release() {

        super.release();

        idToNameMap = null;

    }

}