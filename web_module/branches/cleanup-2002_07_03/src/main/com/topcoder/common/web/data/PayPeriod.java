package com.topcoder.common.web.data;

import java.io.Serializable;
import com.topcoder.shared.docGen.xml.*;


public class PayPeriod implements Serializable, TagRenderer {

  private int PayPeriodId;
  private String PayPeriodDesc;

  public PayPeriod() {
    PayPeriodId = 0;
    PayPeriodDesc = "";
  }

  //Set
  public void setPayPeriodId(int PayPeriodId) {
    this.PayPeriodId = PayPeriodId;
  }

  public void setPayPeriodDesc(String PayPeriodDesc) {
    this.PayPeriodDesc = PayPeriodDesc;
  }

  // Get
  public int getPayPeriodId() {
    return PayPeriodId;
  }

  public String getPayPeriodDesc() {
    return PayPeriodDesc;
  }

  public RecordTag getXML() throws Exception {
    RecordTag result = null;
    try {
      result = new RecordTag("PayPeriod");
      result.addTag( new ValueTag("PayPeriodId", PayPeriodId) );
      result.addTag( new ValueTag("PayPeriodDesc", PayPeriodDesc) );
    } catch (Exception e)  {
      throw new Exception("common.web.data.PayPeriod:getXML:ERROR:\n"+e);
    }
    return result;
  }

}
