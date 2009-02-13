package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the preference_organization_size_xref table.
 * @see com.topcoder.web.TCES.ejb.PreferenceOrganizationSizeXref
 * @author Phil Selby, May 22nd, 2002
 */

public class PreferenceOrganizationSizeXrefObject 
  implements Serializable {
	public Long	profile_id;
	public Integer	organization_size_id;
}
