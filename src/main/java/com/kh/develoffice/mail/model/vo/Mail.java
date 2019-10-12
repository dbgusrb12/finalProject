package com.kh.develoffice.mail.model.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Mail {
	
	private int mailNum;
	private int empId;
	private String mailFrom;
	private String mailTo;
	private String mailTitle;
	private String mailContent;
	private Date mailDate;
	private int mailImportent;
	private String mailStatus;
	

}
