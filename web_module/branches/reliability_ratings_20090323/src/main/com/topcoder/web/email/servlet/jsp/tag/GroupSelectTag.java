package com.topcoder.web.email.servlet.jsp.tag;


import javax.servlet.jsp.JspException;
import java.util.*;


/**

 * Creates comboboxes from a Map of id's to group names.

 *

 * @author	James Lee (jameslee@cs.stanford.edu)

 * @version	1.0

 *

 */


public class GroupSelectTag

        extends Select {

    Map groupMap;


    String getOptionValue(Object o) {

        return o.toString();

    }


    String getOptionText(Object o) {

        return (String) groupMap.get(o);

    }


    void sortIDs(List idList) {

        Collections.sort(idList, new Comparator() {

            public int compare(Object o1, Object o2) {

                Comparable c1 = (Comparable) groupMap.get(o1);

                Comparable c2 = (Comparable) groupMap.get(o2);


                return c1.compareTo(c2);

            }

        });

    }


    public void setGroupMap(Map groupMap) {

        this.groupMap = groupMap;

    }


    ArrayList getSelectOptions()

            throws JspException {

        ArrayList idList = new ArrayList();

        for (Iterator i = groupMap.keySet().iterator(); i.hasNext();) {

            idList.add(i.next());

        }

        sortIDs(idList);


        return idList;

    }

}