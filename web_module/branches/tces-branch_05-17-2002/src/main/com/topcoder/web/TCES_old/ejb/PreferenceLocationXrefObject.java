package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the preference_location_xref table.
 * @see com.topcoder.web.TCES.ejb.PreferenceLocationXref
 * @author Phil Selby, May 22nd, 2002
 */

public class PreferenceLocationXrefObject 
  implements Serializable {
	public Long	profile_id;
	public Integer	location_id;
}
