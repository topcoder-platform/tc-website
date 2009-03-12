package com.topcoder.common.web.data;

public interface Modifiable {

    public void setModified(String Modified);

    public String getModified();

    public void setAllModifiedStable() throws Exception;

}
