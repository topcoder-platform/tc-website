package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the language table.
 * @see com.topcoder.web.TCES.ejb.Language
 * @author Phil Selby, May 22nd, 2002
 */

public class LanguageObject 
  implements Serializable {
	public Integer	language_id;
	public String	language_name;
	public String	status;
	public String	language_desc;
}
