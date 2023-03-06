package com.spring.board.controller;

public class PageHandler {
	private int totalCnt; // �� �Խù� ����
	private int page; // ���� ������
	private int pageSize; // ������ ũ��
	private int totalPageCnt; // ��ü ������ ����
	private int naviSize = 10; // ������̼� ũ��
	private int beginPage; // ������̼� ���۹�ȣ
	private int endPage; // ������̼� ����ȣ
	private boolean showPrev; // [����������] ������ ������ ����
	private boolean showNext; // [����������] ������ ������ ����
	
	public PageHandler() {}
	
	public PageHandler(int totalCnt, int page, int pageSize) {
		this.totalCnt = totalCnt;
		this.page = page;
		this.pageSize = pageSize;
        this.totalPageCnt = (totalCnt - 1) / pageSize + 1;
        this.beginPage = (page - 1) / pageSize * pageSize + 1;
        this.endPage = Math.min(totalPageCnt, beginPage + 9);
        this.showPrev = !(beginPage == 1);
        this.showNext = !(endPage == totalPageCnt);
	}
	
	public void printNavi() {
        System.out.print(showPrev ? "[����������] " : "");
        for (int i = beginPage; i <= endPage; i++) {
            System.out.print(i + " ");
        }
        System.out.print(showNext ? "[����������]" : "");
    }

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPageCnt() {
		return totalPageCnt;
	}

	public void setTotalPageCnt(int totalPageCnt) {
		this.totalPageCnt = totalPageCnt;
	}

	public int getNaviSize() {
		return naviSize;
	}

	public void setNaviSize(int naviSize) {
		this.naviSize = naviSize;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isShowPrev() {
		return showPrev;
	}

	public void setShowPrev(boolean showPrev) {
		this.showPrev = showPrev;
	}

	public boolean isShowNext() {
		return showNext;
	}

	public void setShowNext(boolean showNext) {
		this.showNext = showNext;
	}

	@Override
	public String toString() {
		return "PageHandler [totalCnt=" + totalCnt + ", page=" + page + ", pageSize=" + pageSize + ", totalPageCnt="
				+ totalPageCnt + ", naviSize=" + naviSize + ", beginPage=" + beginPage + ", endPage=" + endPage
				+ ", showPrev=" + showPrev + ", showNext=" + showNext + "]";
	}
	
}
