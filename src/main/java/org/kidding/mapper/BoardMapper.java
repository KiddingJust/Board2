package org.kidding.mapper;

import java.util.List;

import org.kidding.domain.BoardVO;
import org.kidding.domain.PageParam;

public interface BoardMapper {

	
	public List<BoardVO> getList(PageParam param);
	
	public int getTotal();
}
