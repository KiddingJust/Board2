package org.kidding.service;

import java.util.List;

import org.kidding.domain.BoardVO;
import org.kidding.domain.PageParam;

public interface BoardService {

	public List<BoardVO> getList(PageParam param);
	
	public int getTotal();
}
