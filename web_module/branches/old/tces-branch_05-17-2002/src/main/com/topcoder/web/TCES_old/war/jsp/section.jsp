<%
	class Section {
		String pageName;
		String labelName;
		int sectionState;
		
		public Section(String pageNameIn, String labelNameIn, int sectionStateIn) {
			pageName = pageNameIn;
			labelName = labelNameIn;
			sectionState = sectionStateIn;
		}
		public String getPageName() { return pageName; }
		public String getLabelName() { return labelName; }
		public int getSectionState() { return sectionState; }
		public String getSectionStateName() {
			switch (sectionState) {
				case 0:
					return "incomplete";
				case 1:
					return "completed";
				case 2:
					return "error";
				default:
					return "none";
			}
		}
		
		public void setSectionState(int stateIn) {
			sectionState = stateIn;
		}
	}
	
	Section arrSection[] = new Section[5];
	arrSection[0] = new Section("contact", "Contact Info", 1);
	arrSection[1] = new Section("skill", "Skills", 1);
	arrSection[2] = new Section("education", "Education", 1);
	arrSection[3] = new Section("work", "Work Experience", 2);
	arrSection[4] = new Section("prefs", "Work Preferences", 0);
	
	Hashtable hashSection = new Hashtable();
	for (int i=0; i < arrSection.length; i++) {
		hashSection.put(arrSection[i].getPageName(), "" + i);
	}
%>
