package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the industry table.
 * @see com.topcoder.web.TCES.ejb.Industry
 * @author Phil Selby, May 22nd, 2002
 */

public class IndustryObject 
  implements Serializable {
	public Integer	industry_id;
	public String	description;
}
