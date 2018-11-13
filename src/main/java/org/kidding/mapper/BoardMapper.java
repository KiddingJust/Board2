package org.kidding.mapper;

import java.util.List;

import org.kidding.domain.BoardAttachVO;
import org.kidding.domain.BoardVO;
import org.kidding.domain.PageParam;

public interface BoardMapper {

	//board 불러오기
	public List<BoardVO> getList(PageParam param);

	//게시물 읽기(조회). page도 받아야 하므로 파라미터는 PageParam으로. 
	public BoardVO getRead(PageParam param);
	
	//게시물 총 갯수 불러오기
	public int getTotal(PageParam param);
	
	//등록하기 (insert)
	public int register(BoardVO vo);
	
	//수정하기 (modify)
	public int modify(BoardVO vo);
	
	//삭제하기 (delete)
	public int delete(PageParam param);

	//첨부파일 넣기
	public void insert(BoardAttachVO vo);
	
	//첨부파일 삭제
	public void deleteFile(String uuid);
	
	//첨부파일 불러오기
	public List<BoardAttachVO> findByBno(int bno);
	
	public void deleteAll(int bno);
	
}
