package model;

public class Lop {
    private int maLop;
    private String tenLop;

    private int soLuong;

    public Lop(int maLop, String tenLop,int soLuong) {
        this.maLop = maLop;
        this.tenLop = tenLop;
        this.soLuong=soLuong;
    }

    public int getMaLop() {
        return this.maLop;
    }

    public void setMaLop(int maLop) {
        this.maLop = maLop;
    }

    public String getTenLop() {
        return this.tenLop;
    }

    public void setTenLop(String tenLop) {
        this.tenLop = tenLop;
    }

    public  int getSoLuong() {
        return soLuong;
    }

    public  void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }


}
