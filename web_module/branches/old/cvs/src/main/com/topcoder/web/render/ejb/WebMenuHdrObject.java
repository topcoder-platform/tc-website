package	com.topcoder.web.render.ejb;

import	java.sql.Date;
import	java.io.Serializable;

public class WebMenuHdrObject 
  implements Serializable {
	public Integer	menu_hdr_id;
	public String	country_code;
	public String	language_cd;
	public Integer	style_id;
	public Integer	menu_type_id;
	public String	menu_hdr_name;
	public String	menu_hdr_desc;
	public Date	created;
	public Integer	modify_by;
	public Date	modify_date;
}
