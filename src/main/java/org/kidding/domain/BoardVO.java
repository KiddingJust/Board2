package org.kidding.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {

	private Integer bno, likenum, hatenum, readnum;
	private String title, content, writer, deleted;
	private Date regdate, updatedate;
	
	private List<BoardAttachVO> attachList;
}
