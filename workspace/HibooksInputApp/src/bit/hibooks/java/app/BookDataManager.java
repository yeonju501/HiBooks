package bit.hibooks.java.app;

public interface BookDataManager {
	void insertItemInfo(String url, int pageNum, long cate);
	void closeCon();
}
