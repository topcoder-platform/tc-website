package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the pref_co_size table.
 * @see com.topcoder.web.TCES.ejb.PrefCoSize
 * @author Phil Selby, May 22nd, 2002
 */

public class PrefCoSizeObject 
  implements Serializable {
	public Integer	profile_id;
	public Integer	co_size_id;
}
