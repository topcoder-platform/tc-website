package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the industry_lu table.
 * @see com.topcoder.web.TCES.ejb.IndustryLu
 * @author Phil Selby, May 22nd, 2002
 */

public class IndustryLuObject 
  implements Serializable {
	public Integer	industry_id;
	public String	industry_desc;
}
