package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the technology table.
 * @see com.topcoder.web.TCES.ejb.Technology
 * @author Phil Selby, May 22nd, 2002
 */

public class TechnologyObject 
  implements Serializable {
	public Integer	technology_id;
	public String	description;
}
