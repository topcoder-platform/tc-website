package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the profile_status_lu table.
 * @see com.topcoder.web.TCES.ejb.ProfileStatusLu
 * @author Phil Selby, May 22nd, 2002
 */

public class ProfileStatusLuObject 
  implements Serializable {
	public Integer	profile_status_id;
	public String	profile_status_desc;
}
