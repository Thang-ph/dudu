/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Category;
import model.Voucher;

/**
 *
 * @author Pham Thang
 */
public class VoucherDAO extends DBContext{
    public Voucher getVoucherByCode(String code) {
        String sql = "select * from Voucher where code =?";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, code);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Voucher v=new Voucher(rs.getInt("voucherID"), code, rs.getString("due"), rs.getDouble("discount"));
                return v;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public static void main(String[] args) {
        VoucherDAO vd=new VoucherDAO();
        System.out.println(vd.getVoucherByCode("thang").getDiscount());
    }
}
