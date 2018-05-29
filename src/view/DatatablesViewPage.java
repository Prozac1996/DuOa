package view;

import java.util.List;

public class DatatablesViewPage<T> {

    private List<T> mData;
    private int iTotalDisplayRecords;
    private int iTotalRecords;

    public DatatablesViewPage() {

    }

    public List<T> getmData() {
        return mData;
    }

    public void setmData(List<T> mData) {
        this.mData = mData;
    }

    public int getiTotalDisplayRecords() {
        return iTotalDisplayRecords;
    }

    public void setiTotalDisplayRecords(int iTotalDisplayRecords) {
        this.iTotalDisplayRecords = iTotalDisplayRecords;
    }

    public int getiTotalRecords() {
        return iTotalRecords;
    }

    public void setiTotalRecords(int iTotalRecords) {
        this.iTotalRecords = iTotalRecords;
    }
}
