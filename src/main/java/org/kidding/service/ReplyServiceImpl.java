package org.kidding.service;

import java.util.List;

import org.kidding.domain.ReplyPageDTO;
import org.kidding.domain.ReplyVO;
import org.kidding.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_= @Autowired)
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO vo) {
		log.info("register..........." + vo);
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO getReplyList(int rno) {
		log.info("get.........." + rno);
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		log.info("modify.........." + vo);
		return mapper.update(vo);
	}

	@Override
	public int remove(int rno) {
		log.info("remove..........." + rno);
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getListWithPaging(ReplyPageDTO dto) {
		log.info("get Reply List of a Board " + dto);
		return mapper.getListWithPaging(dto);
	}

	@Override
	public int getTotal(int bno) {
		// TODO Auto-generated method stub
		return mapper.getTotal(bno);
	}

}
