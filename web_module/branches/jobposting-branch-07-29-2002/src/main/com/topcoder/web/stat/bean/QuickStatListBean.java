package com.topcoder.web.stat.bean;

import java.util.*;

/**
 * This class represents a bean container of QuickStatBeans.
 * 
 *
 * @version $Revision$
 * @internal Log of Changes:
 *           $Log$
 *           Revision 1.1.1.1.4.2  2002/07/09 14:42:49  gpaul
 *           no message
 *
 *           Revision 1.1.1.1  2002/04/02 17:20:38  steveb
 *           initial web load into cvs
 *
 *           Revision 1.1.2.1  2002/03/16 20:18:09  gpaul
 *           moving these over from the member dev area.
 *
 *           Revision 1.1  2002/02/26 04:46:53  tbone
 *           committed
 *
 *
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