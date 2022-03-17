using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HungHaStore.Models;

namespace HungHaStore.Helper
{
    public class CartHelper
    {
        public static Model1 db = new Model1();
        //Thêm sản phẩm vào giỏ hàng.
        public static List<Cart> Add(san_pham sanPham,int? soluong)
        {
            List<Cart> list = CartHelper.getList();
            var cart = new Cart();
            cart.id_san_pham = sanPham.id;
            cart.hinh_anh = sanPham.hinh_anh;
            cart.ten = sanPham.ten;
            cart.giam_gia = sanPham.giam_gia;
            cart.gia_tien = CalculatorHelper.priceSale(cart.giam_gia,sanPham.gia_tien);
            if(soluong == null)
            {
                cart.so_luong = 1;
            }
            else
            {
                cart.so_luong = (int)soluong;
            }
            cart.tong = cart.so_luong * CalculatorHelper.priceSale(sanPham.giam_gia, sanPham.gia_tien);

            Cart model = CartHelper.isExist(cart, list); //Kiểm tra sản phẩm tồn tại trong giỏ hàng.
            if (model != null)
            {
                if(soluong == null)
                {
                    model.so_luong = model.so_luong + 1;
                }
                else
                {
                    model.so_luong = (int)(model.so_luong + soluong);
                }
                model.tong = model.so_luong * CalculatorHelper.priceSale(model.giam_gia, model.gia_tien);
                CartHelper.updateOne(model, list);
            }
            else
            {
                list.Add(cart);
            }
            CartHelper.setList(list);
            return list;
        }

        internal static List<Cart> Add(san_pham sanPham)
        {
            throw new NotImplementedException();
        }

        // Kiểm tra sản phẩm đã có ở trong giỏ hàng.
        public static Cart isExist(Cart cart,List<Cart> list)
        {
            try
            {
                if (list == null)
                {
                    return null;
                }
                foreach (Cart item in list)
                {
                    if (item.id_san_pham == cart.id_san_pham)
                    {
                        return item;
                    }
                }
            }
            catch { }
            return null;
        }

        //Tạo session cho giỏ hàng.
        public static void setList(List<Cart> list)
        {
            HttpContext.Current.Session["cartSession"] = list;
        }


        //Tính tổng tiền các sản phẩm trong giỏ hàng trong giỏ hàng.
        public static int sumMoney() 
        {
            int total = 0;
            try
            {
                List<Cart> list = CartHelper.getList();
                if (list == null) { return 0; }
                foreach (Cart item in list)
                {
                    total = total + item.tong;
                }
            }
            catch { }
            return total;
        }

        //Lấy ra list các sản phẩm trong giỏ hàng.
        public static List<Cart> getList()
        {
            List<Cart> list = new List<Cart>();
            try
            {
                if (HttpContext.Current.Session["cartSession"] != null)
                {
                    list = (List<Cart>)HttpContext.Current.Session["cartSession"];
                }
            }
            catch {
                list = null;
            }
            return list;
        }

        //Cập nhập số lượng sản phẩm trong giỏ hàng.
        public static void updateOne(Cart cart, List<Cart> list = null)
        {
            foreach (Cart item in list)
            {
                if (item.id_san_pham == cart.id_san_pham)
                {
                    item.so_luong = cart.so_luong;
                    item.tong = cart.tong;
                }
            }
        }
    }

    public class Cart{
        public int id_san_pham { get; set; }
        public int so_luong { get; set; }
        public int tong { get; set; }
        public string ten { get; set; }
        public int giam_gia { get; set; }
        public int gia_tien { get; set; }
        public string hinh_anh { get; set; }
    }
}