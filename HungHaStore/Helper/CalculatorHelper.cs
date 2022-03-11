using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HungHaStore.Helper
{
    public class CalculatorHelper
    {


        //Tính giá sale của các sản phẩm
        public static int priceSale(int sale,int old_price)
        {
            int newPrice = old_price - (old_price * sale) / 100;
            return newPrice;
        }
    }
}