package org.kidding.service;

import java.util.List;

import org.kidding.domain.BoardVO;
import org.kidding.domain.PageParam;
import org.kidding.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_=@Autowired)
	private BoardMapper mapper;
	
	@Override
	public List<BoardVO> getList(PageParam param) {
		return mapper.getList(param);
	}
	@Override
	public BoardVO getRead(PageParam param) {
		return mapper.getRead(param);
	}
	
	@Override
	public int getTotal(PageParam param) {
		return mapper.getTotal(param);
	}

	@Override
	public int register(BoardVO vo) {
		return mapper.register(vo);
	}
	
	@Override
	public int modify(BoardVO vo) {
		return mapper.modify(vo);
	}
	@Override
	public int delete(PageParam param) {
		return mapper.delete(param);
	}




	
}
