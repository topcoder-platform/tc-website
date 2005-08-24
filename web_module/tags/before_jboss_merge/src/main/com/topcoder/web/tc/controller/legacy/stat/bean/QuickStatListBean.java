package com.topcoder.web.tc.controller.legacy.stat.bean;


/**
 * This class represents a bean container of QuickStatBeans.
 *
 *
 * @author tbone
 * @version $Revision$
 */
public final class QuickStatListBean extends java.util.Vector {
    public static final String BEAN_TOKEN = "QCKSTAT_LST";

    public QuickStatBean getQuickStat(int index) {
        return (QuickStatBean) this.get(index);
    }

    public void setQuickStat(int index, QuickStatBean qsb) {
        this.setElementAt(qsb, index);
    }

}
