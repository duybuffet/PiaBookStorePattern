/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity.user;

/**
 *
 * @author Tcat
 */
public class Address {
    private String houseNo;
    private String town;
    private String district;
    private String city;

    public Address(String houseNo, String town, String district, String city) {
        this.houseNo = houseNo;
        this.town = town;
        this.district = district;
        this.city = city;
    }

    public Address() {
    }

    public String getHouseNo() {
        return houseNo;
    }

    public void setHouseNo(String houseNo) {
        this.houseNo = houseNo;
    }

    public String getTown() {
        return town;
    }

    public void setTown(String town) {
        this.town = town;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
    
}
