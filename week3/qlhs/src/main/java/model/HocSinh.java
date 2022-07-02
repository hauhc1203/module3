package model;

public class HocSinh {
    private int id;
    private String tenHS;
    private String ngaySinh;
    private String diachi;
    private String sdt;
    private String email;
    private int malop;

    public HocSinh(int id,String tenHS, String ngaySinh, String diaChi, String sdt, String email, int maLop) {
        this.id=id;
        this.tenHS = tenHS;
        this.ngaySinh = ngaySinh;
        this.diachi = diaChi;
        this.sdt = sdt;
        this.email = email;
        this.malop = maLop;
    }
    public HocSinh(String tenHS, String ngaySinh, String diaChi, String sdt, String email, int maLop) {
        this.tenHS = tenHS;
        this.ngaySinh = ngaySinh;
        this.diachi = diaChi;
        this.sdt = sdt;
        this.email = email;
        this.malop = maLop;
    }


    public String getTenHS() {
        return tenHS;
    }

    public void setTenHS(String tenHS) {
        this.tenHS = tenHS;
    }

    public String getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(String ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getDiaChi() {
        return this.diachi;
    }

    public void setDiaChi(String diaChi) {
        this.diachi = diaChi;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getMalop() {
        return this.malop;
    }

    public void setMalop(int malop) {
        this.malop = malop;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
