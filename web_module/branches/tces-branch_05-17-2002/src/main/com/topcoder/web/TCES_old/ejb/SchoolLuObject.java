package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the school_lu table.
 * @see com.topcoder.web.TCES.ejb.SchoolLu
 * @author Phil Selby, May 22nd, 2002
 */

public class SchoolLuObject 
  implements Serializable {
	public Integer	school_id;
	public String	name;
	public String	location;
	public Long	profile_id;
}
