package org.kidding.service;

import java.util.List;

import org.kidding.domain.ReplyPageDTO;
import org.kidding.domain.ReplyVO;

public interface ReplyService {

	public int register(ReplyVO vo);
	
	public ReplyVO getReplyList(int rno);
	
	public int modify(ReplyVO vo);
	public int remove(int rno);
	
	public List<ReplyVO> getListWithPaging(ReplyPageDTO dto);
	
	public int getTotal(int bno);

}
