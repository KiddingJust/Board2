package org.kidding.mapper;

import java.util.List;

import org.kidding.domain.ReplyPageDTO;
import org.kidding.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo);

	public ReplyVO read(int bno);
	
	public int delete(int bno);
	
	public int update(ReplyVO reply);
	
	public List<ReplyVO> getListWithPaging(ReplyPageDTO dto);

	public int getTotal(int bno);

}
