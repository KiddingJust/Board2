package org.kidding.service;

import java.util.List;

import org.kidding.domain.BoardAttachVO;
import org.kidding.domain.BoardVO;
import org.kidding.domain.ChartVO;
import org.kidding.domain.PageParam;

public interface BoardService {

	public List<BoardVO> getList(PageParam param);
	
	public BoardVO getRead(PageParam param);

	public int getTotal(PageParam param);
	
	public int register(BoardVO vo);
	
	public int modify(BoardVO vo);
	
	public int delete(PageParam param);
	
	public List<BoardAttachVO> getAttachList(int bno);
	
	public boolean deleteAll(PageParam param);
	
	public List<ChartVO> getChart();
	
}
