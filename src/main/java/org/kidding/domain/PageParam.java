package org.kidding.domain;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@Log4j
@Data
public class PageParam {
	
	private static final double PER = 10.0;
	private int page;
	private int display;

	private int total, start, end, bno;
	private boolean prev, next;

	private String[] types;
	private String type;
	private String keyword;
	
	private boolean extend;
	
	
	// 생성자. display를 기본으로 10개로 주는 것. 그리고 page는 기본적으로 1페이지로 가야 함.
	public PageParam() {
		this.page = 1;
		this.display = 10;
	}
	
	//total을 파라미터로 받아서 페이지 및 prev, next 조정
	public void setTotal(int total) {
		this.total = total;
		this.end = (int) Math.ceil(this.page/PER) * 10;
		this.start = this.end - 9;
		
		//this.end는 10, 20, 30 상태. 여기에 10을 곱한 게 전체 총 갯수보다 크면 end를 수정해주어야 함.
		if( (this.end*10) > total) {
			this.end =(int) (Math.ceil(total / PER));
			this.next = false;
		}else {
			this.next = true;
		}
		this.prev = (this.start == 1) ? false: true;
	}
	
	public int getSkip() {
		return (this.page - 1) * 10;
	}
	
	//test
	public static void main(String[] args) {
		PageParam param = new PageParam();
		param.setPage(1);
		param.setTotal(111);
		
		System.out.println(param);
	}
	
}
