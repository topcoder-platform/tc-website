package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the pref_location table.
 * @see com.topcoder.web.TCES.ejb.PrefLocation
 * @author Phil Selby, May 22nd, 2002
 */

public class PrefLocationObject 
  implements Serializable {
	public Integer	profile_id;
	public Integer	location_id;
}
