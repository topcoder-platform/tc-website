package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the pref_technology table.
 * @see com.topcoder.web.TCES.ejb.PrefTechnology
 * @author Phil Selby, May 22nd, 2002
 */

public class PrefTechnologyObject 
  implements Serializable {
	public Integer	profile_id;
	public Integer	technology_id;
}
