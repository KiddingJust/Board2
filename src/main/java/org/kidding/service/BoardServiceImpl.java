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
	public int getTotal() {
		return mapper.getTotal();
	}

	
}
