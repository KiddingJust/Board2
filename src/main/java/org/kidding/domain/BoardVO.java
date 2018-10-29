package org.kidding.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

	private Integer bno, mno, likenum, hatenum, readnum;
	private String title, content, writer, deleted;
	private Date regdate, updatedate;
}
