package com.example.demo;

import java.util.Date;

public class KH {
    private String name;
    private String birthday;
    private String address;
    private String imageURL;

    public KH() {
    }

    public KH(String name, String birthday, String address, String imageURL) {
        this.name = name;
        this.birthday = birthday;
        this.address = address;
        this.imageURL = imageURL;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    @Override
    public String toString() {
        return "KH{" +
                "name='" + name + '\'' +
                ", birthday=" + birthday +
                ", address='" + address + '\'' +
                ", imageURL='" + imageURL + '\'' +
                '}';
    }
}
